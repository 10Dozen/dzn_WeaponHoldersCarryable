/*
	author: 10Dozen
	description: Process weapon holders around the player and add/remove ACE Draggable effects
	input: nothing
	returns: nothing
*/

#include "..\macro.hpp"

// Collect holders of all classes
private _holders = [];
private _pos = getPos player;

{
	_holders append ( _pos nearObjects [_x, GVAR(CheckRadius)] );
} forEach GVAR(Classlist);

// Process all collected holders
{
	if ([_x, GVAR(AllowedNumberOfItems)] call GVAR(fnc_isAllowedNumberOfItems)) then {
		if !(_x getVariable ["dzn_WHC_Processed", false]) then {

			_x setVariable ["dzn_WHC_Processed", true];
			[_x, true, [0,1,0], 0] call ace_dragging_fnc_setDraggable;
			[_x, true, [0,0.5,1], 0] call ace_dragging_fnc_setCarryable;
		};
	} else {
		if (_x getVariable ["dzn_WHC_Processed", false]) then {

			_x setVariable ["dzn_WHC_Processed", false];
			[_x, false, [0,1,0], 0] call ace_dragging_fnc_setDraggable;
			[_x, false, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
		};
	};
} forEach _holders;

(true)