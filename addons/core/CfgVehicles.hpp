class CfgVehicles {
    class UAV_01_base_F;

    class GVAR(Projectile_Base) : UAV_01_base_F {
        scope = 0;
        curatorScope = 0;

        model = "\A3\Weapons_F\Ammoboxes\Supplydrop.p3d";

        acceleration = 0;
        armor = 10;
        hiddenSelectionsTextures[] = {"",""};
        irTarget = 0;
        isUAV = 0;
        laserTarget = 0;
        radarTarget = 1;
        radarTargetSize = 0.5;
        threat[] = {1,1,0};
        nvTarget = 0;
        visualTarget = 0;
    };

    class GVAR(Projectile_Large) : GVAR(Projectile_Base) {
        displayName = CSTRING(Projectile_Large);
        irTarget = 1;
        irTargetSize = 2;
    };

    class GVAR(Projectile_Large_B) : GVAR(Projectile_Large) {
        crew = "B_UAV_AI";
        faction = "BLU_F";
        scope = 1;
        side = 1;
    };

    class GVAR(Projectile_Large_I) : GVAR(Projectile_Large) {
        crew = "I_UAV_AI";
        faction = "IND_F";
        scope = 1;
        side = 2;
    };

    class GVAR(Projectile_Large_O) : GVAR(Projectile_Large) {
        crew = "O_UAV_AI";
        faction = "OPF_F";
        scope = 1;
        side = 0;
    };

    class GVAR(Projectile_Small) : GVAR(Projectile_Base) {
        displayName = CSTRING(Projectile_Small);
    };

    class GVAR(Projectile_Small_B) : GVAR(Projectile_Small) {
        crew = "B_UAV_AI";
        faction = "BLU_F";
        scope = 1;
        side = 1;
    };

    class GVAR(Projectile_Small_I) : GVAR(Projectile_Small) {
        crew = "I_UAV_AI";
        faction = "IND_F";
        scope = 1;
        side = 2;
    };

    class GVAR(Projectile_Small_O) : GVAR(Projectile_Small) {
        crew = "O_UAV_AI";
        faction = "OPF_F";
        scope = 1;
        side = 0;
    };
};
