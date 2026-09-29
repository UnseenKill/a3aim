#include "script_component.hpp"

ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

GVAR(minInterceptHeight) = 30;
GVAR(sideSuffixes) = createHashMapFromArray[
    [east, "O"],
    [west, "B"],
    [independent, "I"]
];

nil;
