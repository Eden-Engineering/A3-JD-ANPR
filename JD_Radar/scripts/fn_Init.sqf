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
		[
			"player",
			[],
			-100,
			"_this call JDR_fnc_toggleSystem"
		],
		[
			DIK_P,
			[
				false,
				true,
				true
			]
		]
	] call CBA_fnc_addKeybindToFleximenu;

	player addEventHandler ["GetInMan", {
		"JDRadar" cutRsc ["JDRadar", "PLAIN"];
		private _display = uiNamespace getVariable "JDRadar";
		systemPower = false;
		[_display] spawn JDR_fnc_PatrolSpeedLoop;
		[_display] spawn JDR_fnc_RadarLoop;
		[_display] spawn JDR_fnc_anprLoop;
	}];

	player addEventHandler ["GetOutMan", {
		private _display = uiNamespace getVariable "JDRadar";
		_display closeDisplay 1;
	}];
};