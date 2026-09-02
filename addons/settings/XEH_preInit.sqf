#include "script_component.hpp"

ADDON = false;

[
    QEGVAR(core,reactionDelay), "TIME",
    [LSTRING(Settings_reactionDelay_DisplayName), LSTRING(Settings_reactionDelay_Tooltip)],
    ELSTRING(main,SettingsTitle),
    [0, 10, 2.75, 2], // min,max,default,decimals
    true, // global
    {}, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(ammoWhitelist), "EDITBOX",
    [LSTRING(Settings_ammoWhitelist_DisplayName), LSTRING(Settings_ammoWhitelist_Tooltip)],
    ELSTRING(main,SettingsTitle),
    "", // default
    true, // global
    { call EFUNC(core,applyAmmoWhitelist) }, // onchange
    false // Needs mission restart
] call CBA_fnc_addSetting;

ADDON = true;
