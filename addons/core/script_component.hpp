#define COMPONENT core
#define COMPONENT_BEAUTIFIED Core
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_CORE
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_CORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CORE
#endif

#include "..\main\script_macros.hpp"