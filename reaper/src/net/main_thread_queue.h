#ifndef ZEALSYNC_NET_MAIN_THREAD_QUEUE_H
#define ZEALSYNC_NET_MAIN_THREAD_QUEUE_H

// MPSC closure queue. Producers (listener thread, transport handlers later)
// enqueue; the consumer drains on the main thread.
//
// Thread-affinity guarantee comes from WHERE drain() is called, not from this
// class. In the REAPER plugin build, main.cpp wires drain() to a "timer"
// plugin_register callback, which REAPER guarantees fires on the main thread.
// In the standalone test build, the test calls drain() explicitly. The queue
// itself does not assert any thread identity — it just serialises producers
// and runs closures FIFO when drained.

#include <deque>
#include <functional>
#include <mutex>

namespace zealsync::net {

class MainThreadQueue {
public:
    void enqueue(std::function<void()> task);

    // Drain everything queued at the time of the call. New enqueues that arrive
    // mid-drain are picked up by the next drain — we snapshot under the lock,
    // then run tasks unlocked so closures can re-enqueue without deadlocking.
    void drain();

private:
    std::mutex mu_;
    std::deque<std::function<void()>> tasks_;
};

// Meyers-singleton accessor. File-scope globals in REAPER plugins have init-
// order problems; function-local statics don't.
MainThreadQueue &main_thread_queue();

// Ergonomic shorthand for callers who don't care about the queue object.
inline void run_on_main_thread(std::function<void()> task) {
    main_thread_queue().enqueue(std::move(task));
}

}

#endif
