#ifndef ZEALSYNC_SYNC_INFO_H
#define ZEALSYNC_SYNC_INFO_H

#include "../net/dispatcher.h"

namespace zealsync::sync {

void register_info_handler(net::Dispatcher &dispatcher);

}

#endif
