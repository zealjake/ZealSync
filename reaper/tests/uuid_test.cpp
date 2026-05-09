#include <cassert>
#include <cstdio>
#include <string>
#include <unordered_set>

#include "net/uuid.h"

using zealsync::net::uuid_v4_hex;

int main() {
    constexpr int kN = 1000;
    std::unordered_set<std::string> seen;

    for (int i = 0; i < kN; ++i) {
        const auto u = uuid_v4_hex();
        assert(u.size() == 32);
        for (char c : u) {
            assert((c >= '0' && c <= '9') || (c >= 'a' && c <= 'f'));
        }
        assert(u[12] == '4');
        const char v = u[16];
        assert(v == '8' || v == '9' || v == 'a' || v == 'b');
        const auto [_, inserted] = seen.insert(u);
        assert(inserted && "uuid collision in 1000 samples");
    }

    std::printf("ok: 1000 uuids, all 32-char hex, version 4, variant 10xx, unique.\n");
    return 0;
}
