class Extended_FiredBIS_EventHandlers {
    class Air {
        class ADDON {
            firedBIS = QUOTE(call FUNC(onFiredEH));
        };
    };

    class LandVehicle {
        class ADDON {
            firedBIS = QUOTE(call FUNC(onFiredEH));
        };
    };

    class Ship {
        class ADDON {
            firedBIS = QUOTE(call FUNC(onFiredEH));
        };
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
        serverInit = QUOTE(call COMPILE_SCRIPT(XEH_preInitServer));
    };
};
