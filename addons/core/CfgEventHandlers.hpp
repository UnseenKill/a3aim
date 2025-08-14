class Extended_InitPost_EventHandlers {
    class GVAR(Land_Radar_Small_Base_F) {
        class ADDON {
            serverInit = QUOTE(call FUNC(onRadarInitServer));
        };
    };
};

class Extended_FiredBIS_EventHandlers {
    class LandVehicle {
        class ADDON {
            firedBIS = QUOTE(call FUNC(onFiredEH));
        };
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_SCRIPT(XEH_postInitClient));
        serverInit = QUOTE(call COMPILE_SCRIPT(XEH_postInitServer));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
        serverInit = QUOTE(call COMPILE_SCRIPT(XEH_preInitServer));
    };
};
