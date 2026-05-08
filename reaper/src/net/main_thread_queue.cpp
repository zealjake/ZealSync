#include "main_thread_queue.h"

namespace zealsync::net {

void MainThreadQueue::enqueue(std::function<void()> task) {
    std::lock_guard<std::mutex> lock(mu_);
    tasks_.push_back(std::move(task));
}

void MainThreadQueue::drain() {
    std::deque<std::function<void()>> snapshot;
    {
        std::lock_guard<std::mutex> lock(mu_);
        snapshot.swap(tasks_);
    }
    for (auto &task : snapshot) {
        task();
    }
}

MainThreadQueue &main_thread_queue() {
    static MainThreadQueue instance;
    return instance;
}

}
