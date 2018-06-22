class CfgPatches
{
	class dzn_WeaponHoldersCarryable
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"CBA_MAIN","ace_dragging"};
		author[] = {"10Dozen"};
	};
};

class Extended_PreInit_EventHandlers
{
	class dzn_WeaponHoldersCarryable_PreInit
	{
		init = "call ('\dzn_WHC\Init.sqf' call SLX_XEH_COMPILE)";
	};
};