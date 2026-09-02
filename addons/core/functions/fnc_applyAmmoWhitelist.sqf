#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: a3aim_core_fnc_applyAmmoWhitelist

Description:
    Apply CBA setting for ammo whitelist.

    Convert string to internal array, validate whitelist entries.

Parameters:
    0: _setting - CBA setting string from EDITBOX <STRING>

Optional:

Example:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(applyAmmoWhitelist),_this);

if !assert(params[
    ["_setting", nil, [""]]
]) exitWith {};

if !(isServer) exitWith { WARNING_1("Not on server, ignoring ammo whitelist '%1'.",_setting) };

GVAR(ammoWhitelist) = _setting splitString "," apply {
    private _ammo = toLowerANSI trim _x;

    if (_ammo find "l:" isEqualTo -1) then {
        [QGVAR(Projectile_Small), _ammo];
    } else {
        [QGVAR(Projectile_Large), _ammo select [2]];
    };
};

if (GVAR(ammoWhitelist isEqualTo [])) exitWith {
    INFO("Ammo whitelist is empty. Intercepting all pre-configured munitions types.");
    missionNamespace setVariable[QGVAR(ammoWhitelist), nil];
};

private _invalid = GVAR(ammoWhitelist)
    apply { _x select 1 }
    select { !isClass(configFile >> "CfgAmmo" >> _x) }
    joinString ", ";

if (_invalid isNotEqualTo "") exitWith {
    WARNING_1("Failed to apply ammo whitelist from setting string: %1",_setting);
    WARNING_1("Invalid ammo entries: %1",_invalid);
    missionNamespace setVariable[QGVAR(ammoWhitelist), nil];
};

INFO_1("Ammo whitelist: %1",GVAR(ammoWhitelist));

nil;
