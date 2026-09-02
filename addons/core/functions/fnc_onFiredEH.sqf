#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3AIM_core_fnc_onFiredEH

Description:
    FiredBIS event handler

Parameters:
    0: _unit - The unit that fired the weapon <OBJECT>
    1: _weapon - The weapon that was fired <STRING>
    2: _muzzle - The muzzle from which the weapon was fired <STRING>
    3: _mode - The firing mode used <STRING>
    4: _ammo - The ammunition type used <STRING>
    5: _magazine - The magazine from which the ammunition was taken <STRING>
    6: _projectile - The projectile that was fired <OBJECT>
    7: _gunner - The gunner of the vehicle (if applicable) <OBJECT>

Optional:

Example:

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onFiredEH),_this);

params[
    ["_unit", objNull, [objNull]], 
    ["_weapon", "", [""]], 
    ["_muzzle", "", [""]], 
    ["_mode", "", [""]], 
    ["_ammo", "", [""]], 
    ["_magazine", "", [""]], 
    ["_projectile", objNull, [objNull]], 
    ["_gunner", objNull, [objNull]]
];

if isNull _projectile exitWith {};
if ([_ammo] call FUNC(canIntercept)) then {
    [{
        call FUNC(makeInterceptable);
    }, [_projectile, _ammo, side _unit], GVAR(reactionDelay)] call CBA_fnc_waitAndExecute;
};

nil;
