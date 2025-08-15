class CfgAmmo {
    class Default;
    class MissileBase;
    class ShellCore;
    class SubmunitionCore;

    // Cruise Missile
    class ammo_Missile_CruiseBase : MissileBase {
        GVAR(canIntercept) = 1;
        GVAR(vehicleClass) = QGVAR(Projectile_Large);
    };

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
