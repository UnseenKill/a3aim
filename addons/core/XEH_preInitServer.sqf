#include "script_component.hpp"

GVAR(ammoCache) = createHashMap;
GVAR(minInterceptHeight) = 30;
GVAR(sideSuffixes) = createHashMapFromArray[
    [east, "O"],
    [west, "B"],
    [independent, "I"]
];

nil;
