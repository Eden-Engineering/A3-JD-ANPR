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
			[] call JDR_fnc_toggleSystem;
		},
		{}, [DIK_P,[false,false,false]]
	] call CBA_fnc_addKeybind;

	[
		"JDR_StartOn",
		"CHECKBOX",
		"Start On",
		["JD: Radar/ANPR", "General"],
		false,
		nil,
		{}
	] call CBA_fnc_addSetting;

	[
		"JDR_WarrantSound",
		"CHECKBOX",
		"Warrant Sound",
		["JD: Radar/ANPR", "General"],
		false,
		nil,
		{}
	] call CBA_fnc_addSetting;

	[
		"JDR_RadarDistance",
		"SLIDER",
		"Radar Distance",
		["JD: Radar/ANPR", "Performance"],
		[20, 200, 200, 0],
		nil,
		{}
	] call CBA_fnc_addSetting;

	[
		"JDR_ANPRDistance",
		"SLIDER",
		"ANPR Distance",
		["JD: Radar/ANPR", "Performance"],
		[20, 50, 40, 0],
		nil,
		{}
	] call CBA_fnc_addSetting;

	player addEventHandler ["GetInMan", {
		systemPower = false;
		if (JDR_StartOn) then {
			[] call JDR_fnc_toggleSystem;
		};
	}];

	player addEventHandler ["GetOutMan", {
		private _display = uiNamespace getVariable "JDRadar";
		_display closeDisplay 1;
	}];
};