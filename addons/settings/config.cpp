#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = CSTRING(component);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { QUOTE(MAIN_ADDON) };
        author = ECSTRING(main,Author);
        authors[] = {"gor3Splatter"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
