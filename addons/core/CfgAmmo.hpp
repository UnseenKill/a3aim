class CfgAmmo {
    class Default;
    class ShellCore;
    class SubmunitionCore;

    // Bombs
    class BombCore : Default {
        GVAR(canIntercept) = 1;
        GVAR(vehicleClass) = QGVAR(Projectile_Large);
    };

    // Mortars, Artillery
    class ShellBase : ShellCore {
        GVAR(canIntercept) = 1;
        GVAR(vehicleClass) = QGVAR(Projectile_Small);
    };

    // MLRS
    class SubmunitionBase : SubmunitionCore {
        GVAR(canIntercept) = 1;
        GVAR(vehicleClass) = QGVAR(Projectile_Large);
    };

    // A-10 GAU cannon; cannot intercept
    class SubmunitionBullet : SubmunitionBase {
        GVAR(canIntercept) = 0;
    };
};
