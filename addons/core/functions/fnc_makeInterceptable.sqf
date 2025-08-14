#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3AIM_core_fnc_makeInterceptable

Description:
    Make a projectile interceptable

Parameters:
    0: _projectile - The projectile to make interceptable <OBJECT>
    1: _ammo - The ammunition type used <STRING>
    2: _side - The side of the unit that fired the projectile <SIDE>

Optional:

Example:
    (begin example)
    [_projectile, _ammo, _side] call A3AIM_core_fnc_makeInterceptable;
    (end example)

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(makeInterceptable),_this);

if !assert(params[
    ["_projectile", nil, [objNull]],
    ["_ammo", nil, [""]],
    ["_side", nil, [sideUnknown]]
]) exitWith {};

if !assert(!isNull _projectile) exitWith {};



nil;
