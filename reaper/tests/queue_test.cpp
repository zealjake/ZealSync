// Standalone test for MainThreadQueue.
//
// Thread-affinity is not asserted here — the queue makes no thread guarantees
// of its own (see header). We exercise: enqueue-from-worker, deferred-execution
// (no closure runs before drain), FIFO order, re-entrant enqueue from inside a
// drained closure.

#include <atomic>
#include <cassert>
#include <chrono>
#include <cstdio>
#include <thread>
#include <vector>

#include "net/main_thread_queue.h"

using zealsync::net::MainThreadQueue;
using zealsync::net::main_thread_queue;
using zealsync::net::run_on_main_thread;

namespace {

void test_enqueue_from_worker_then_drain() {
    MainThreadQueue q;
    std::atomic<bool> ran{false};

    std::thread worker([&] { q.enqueue([&] { ran.store(true); }); });
    worker.join();

    assert(!ran.load() && "closure must not run before drain()");
    q.drain();
    assert(ran.load() && "closure must run during drain()");
    std::printf("ok: enqueue-from-worker-then-drain\n");
}

void test_fifo_order() {
    MainThreadQueue q;
    std::vector<int> order;
    for (int i = 0; i < 16; ++i) {
        q.enqueue([&order, i] { order.push_back(i); });
    }
    q.drain();
    assert(order.size() == 16);
    for (int i = 0; i < 16; ++i) assert(order[i] == i);
    std::printf("ok: fifo-order\n");
}

void test_concurrent_producers() {
    MainThreadQueue q;
    constexpr int kProducers = 4;
    constexpr int kPerProducer = 250;
    std::atomic<int> counter{0};

    std::vector<std::thread> producers;
    for (int p = 0; p < kProducers; ++p) {
        producers.emplace_back([&] {
            for (int i = 0; i < kPerProducer; ++i) {
                q.enqueue([&counter] { counter.fetch_add(1); });
            }
        });
    }
    for (auto &t : producers) t.join();

    assert(counter.load() == 0 && "no closure runs before drain");
    q.drain();
    assert(counter.load() == kProducers * kPerProducer);
    std::printf("ok: concurrent-producers (%d closures)\n",
                kProducers * kPerProducer);
}

void test_reentrant_enqueue_runs_on_next_drain() {
    MainThreadQueue q;
    std::atomic<int> outer{0};
    std::atomic<int> inner{0};

    q.enqueue([&] {
        outer.fetch_add(1);
        q.enqueue([&] { inner.fetch_add(1); });
    });

    q.drain();
    assert(outer.load() == 1);
    assert(inner.load() == 0 && "re-enqueued closure waits for next drain");
    q.drain();
    assert(inner.load() == 1);
    std::printf("ok: reentrant-enqueue\n");
}

void test_singleton_accessor() {
    auto &a = main_thread_queue();
    auto &b = main_thread_queue();
    assert(&a == &b && "singleton must return same instance");

    std::atomic<bool> ran{false};
    run_on_main_thread([&] { ran.store(true); });
    main_thread_queue().drain();
    assert(ran.load());
    std::printf("ok: singleton-accessor\n");
}

}

int main() {
    test_enqueue_from_worker_then_drain();
    test_fifo_order();
    test_concurrent_producers();
    test_reentrant_enqueue_runs_on_next_drain();
    test_singleton_accessor();
    std::printf("all queue tests passed.\n");
    return 0;
}
