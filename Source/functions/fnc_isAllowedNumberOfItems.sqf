/*
	author: 10Dozen
	description: Checks amount of items stored in the given weapon holder (only first level, backpack's content is not counted) and compares to allowed number
	input: 0: OBJECT - weapon holder, 1: SCALAR - number of allowed items
	returns: BOOL
*/

params ["_holder", "_allowedNumber"];

private _items = (
	weaponCargo _holder
	+ magazineCargo _holder
	+ itemCargo _holder
	+ backpackCargo _holder
);

(count _items <= _allowedNumber)