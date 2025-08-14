#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3AIM_core_fnc_canIntercept

Description:
    Check if a given ammunition type can be intercepted

Parameters:
    0: _ammo - The ammunition type to check <STRING>

Optional:

Example:
    (begin example)
    ["BombCluster_03_Ammo_F"] call A3AIM_core_fnc_canIntercept;
    (end example)

Returns:
    True if the ammunition can be intercepted, false otherwise <BOOL>

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(canIntercept),_this);

params[
    ["_ammo", "", [""]]
];

private _canIntercept = GVAR(ammoCache) get[_ammo, 0];

if (_canIntercept isEqualTo 0) then {
    _canIntercept = getNumber(configFile >> "CfgAmmo" >> _ammo >> QGVAR(canIntercept)) isNotEqualTo 0;
    GVAR(ammoCache) set[_ammo, _canIntercept];
};

_canIntercept;
