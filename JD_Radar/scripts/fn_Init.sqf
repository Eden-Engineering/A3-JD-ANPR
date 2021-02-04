/*
	Author: John Doe

	Description:
	postInit add eh for radar/anpr
*/

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[] spawn {
	if !(hasInterface) exitWith {};
	waitUntil {!isNull findDisplay 46};

	if (isNil "cba_common") exitWith {
		systemChat "JD: CBA NO WORK!";
		diag_log "JD: CBA NO WORK!";
	};

	[
		"JD: ANPR/Radar",
		"toggle_system",
		"Toggle System",
		{
			call JDR_fnc_toggleSystem
		},
		{}, [DIK_P,[false,false,false]]
	] call CBA_fnc_addKeybind;

	player addEventHandler ["GetInMan", {
		systemPower = false;
	}];

	player addEventHandler ["GetOutMan", {
		private _display = uiNamespace getVariable "JDRadar";
		_display closeDisplay 1;
	}];
};