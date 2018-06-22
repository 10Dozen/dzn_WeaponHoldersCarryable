#include "macro.hpp"

private _add = {
	params ["_var","_type","_val",["_exp", "No Expression"],["_subcat", ""]];	
	
	private _arr = [
		format["dzn_WHC_%1",_var]
		,_type
		, [localize format["STR_WHC_%1",_var], localize format ["STR_WHC_%1_desc",_var]]
		, if (_subcat == "") then {
			"dzn Weapon Holders Carryable"
		} else {
			["dzn Weapon Holders Carryable", _subcat]
		}
		,_val
		,true
	];
	
	if !(typename _exp == "STRING" && { _exp == "No Expression" }) then { _arr pushBack _exp; };
	_arr call CBA_Settings_fnc_init;
};


[
	"Enabled"
	, "CHECKBOX"
	, true
] call _add;

[
	"AllowedNumberOfItemsSetting"
	, "EDITBOX"
	, "2"
	, {
		private _newVal = parseNumber _this;
		if (_newVal == 0) exitWith { GVAR(AllowedNumberOfItemsSetting) = str GVAR(AllowedNumberOfItems); };
		GVAR(AllowedNumberOfItems) = _newVal;
	}
] call _add;

[
	"CheckTimeoutSetting"
	, "EDITBOX"
	, "5"
	, {
		private _newVal = parseNumber _this;
		if (_newVal == 0) exitWith { GVAR(CheckTimeoutSetting) = str GVAR(CheckTimeout); };
		GVAR(CheckTimeout) = _newVal;
	}
] call _add;

[
	"CheckRadiusSetting"
	, "EDITBOX"
	, "50"
	, {
		private _newVal = parseNumber _this;
		if (_newVal == 0) exitWith { GVAR(CheckRadiusSetting) = str GVAR(CheckRadius); };
		GVAR(CheckRadius) = _newVal;
	}
] call _add;

[
	"ClasslistSetting"
	, "EDITBOX"
	, "GroundWeaponHolder, WeaponHolderSimulated"
	, {
		GVAR(Classlist) = _this splitString ", ";
		publicVariable SVAR(Classlist);
	}
] call _add;

