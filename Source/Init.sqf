#include "macro.hpp"
#include "Functions.sqf"
#include "Settings.sqf"

if (isDedicated) exitWith {};

[] spawn {
	waitUntil { 
		!isNil SVAR(CheckTimeout) 
		&& !isNil SVAR(AllowedNumberOfItems) 
		&& !isNil SVAR(Classlist)
		&& !isNil SVAR(CheckRadius)
		&& time > 0
	};
	
	waitUntil { GVAR(Enabled) };
	
	while { true } do {
		sleep GVAR(CheckTimeout);

		[] spawn GVAR(fnc_processNearHolders);
	};
};