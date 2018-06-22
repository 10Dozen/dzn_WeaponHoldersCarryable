#include "macro.hpp"
#define PATH                    "\dzn_WHC\functions\"
#define COMPILE_FUNCTION(X)     GVAR(X) = compile preprocessFileLineNumbers format ["%1%2.sqf", PATH, #X]

COMPILE_FUNCTION(fnc_processNearHolders);
COMPILE_FUNCTION(fnc_isAllowedNumberOfItems);
