class CfgAmmo {
    class BombCore;
    class LaserBombCore;
    class MissileBase;
    class ShellCore;
    class SubmunitionCore;

    // Cruise Missile
    class ammo_Missile_CruiseBase : MissileBase {
        GVAR(canIntercept) = 1;
        GVAR(vehicleClass) = QGVAR(Projectile_Large);
    };

    // GBU, Mk82
    class Bo_Mk82 : BombCore {
        GVAR(canIntercept) = 1;
        GVAR(vehicleClass) = QGVAR(Projectile_Large);
    };

    class ammo_Bomb_LaserGuidedBase : LaserBombCore {
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
