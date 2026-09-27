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

if (GVAR(reactionDelay) > 0) then {
    uiSleep GVAR(reactionDelay);
};

// Projectile already splashed
if (isNull _projectile) exitWith { TRACE_1(QFUNC(makeInterceptable),_projectile) };

private _suffix = GVAR(sideSuffixes) get _side;

if !assert(!isNil "_suffix") exitWith {};

private _projectileType = if (isNil QGVAR(ammoWhitelist)) then {
    getText(configFile >> "CfgAmmo" >> _ammo >> QGVAR(vehicleClass))
} else {
    private _index = GVAR(ammoWhitelist) findIf {
        _ammo isKindOf[_x select 1, configFile >> "CfgAmmo"];
    };

    if !assert(_index isNotEqualTo -1) then {
        QGVAR(Projectile_Large);
    } else {
        GVAR(ammoWhitelist) select _index select 0;
    };
};

private _vehicleClass = format["%1_%2", _projectileType, _suffix];

if !assert(isClass(configFile >> "CfgVehicles" >> _vehicleClass)) exitWith {};

TRACE_2(QFUNC(makeInterceptable),_ammo,_vehicleClass);

private _interceptable = _vehicleClass createVehicle(_projectile modelToWorld[0,-5,0]);

if !assert(!isNull _interceptable) exitWith { ERROR_1("Failed to create vehicle %1",_vehicleClass) };

_interceptable setMass 0.025;
_interceptable setObjectTexture[0, ""]; // remove texture
_interceptable setVelocity velocity _projectile;
createVehicleCrew _interceptable;
driver _interceptable disableAI "ALL";
_interceptable deleteVehicleCrew gunner _interceptable;
_interceptable setVehicleTIPars[1, 1, 1];
(group driver _interceptable) setVariable["ace_map_hideBlueForceMarker", true];

[QGVAR(interceptVehicleCreated), [_interceptable, _projectile]] spawn CBA_fnc_serverEvent;

#ifndef __A3AIM_PRODUCTION__
allCurators apply { _x addCuratorEditableObjects[[_interceptable], true] };
#endif

_interceptable disableCollisionWith _projectile;
_interceptable addEventHandler["Killed", { LOG_1("UAV killed: %1",_this) }];

[{
    params[["_args",[],[[]]], ["_handlerID",0,[0]]];
    _args params[["_interceptable", objNull, [objNull]], ["_projectile", objNull, [objNull]]];

    private _canIntercept = (((getPosATL _projectile) select 2) >= GVAR(minInterceptHeight));

    if (!alive _projectile || { !alive _interceptable && _canIntercept }) exitWith {
        [QGVAR(interceptDone), [_interceptable, alive _projectile]] call CBA_fnc_serverEvent;

        deleteVehicle _interceptable;
        if (alive _projectile) then {
            deleteVehicle _projectile;
        };

        [_handlerID] call CBA_fnc_removePerFrameHandler;
    };

    // Interceptable is below minimal horizon, still flying but descending
    if (!_canIntercept && { alive _interceptable && { ((velocity _projectile) select 2) < 0 } }) exitWith {
        [QGVAR(interceptDone), [_interceptable, false]] call CBA_fnc_serverEvent;

        deleteVehicle _interceptable;
        [_handlerID] call CBA_fnc_removePerFrameHandler;
    };

    _interceptable setPos (_projectile modelToWorld[1,-5,1]);
    _interceptable setVelocity velocity _projectile;
}, 0, [_interceptable, _projectile]] call CBA_fnc_addPerFrameHandler;

nil;
