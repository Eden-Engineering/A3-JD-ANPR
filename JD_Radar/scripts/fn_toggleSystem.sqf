/*
	Author: John Doe

	Description:
	toggles the state of the system
*/

if !([vehicle player] call JDR_fnc_hasRadar) exitWith {};

systemPower = !systemPower;

if (systemPower) then {
	"JDRadar" cutRsc ["JDRadar", "PLAIN"];
	private _display = uiNamespace getVariable "JDRadar";
	playSound "JD_RadarOn";
	[] spawn JDR_fnc_PatrolSpeedLoop;
	[] spawn JDR_fnc_RadarLoop;
	[] spawn JDR_fnc_anprLoop;
} else {
	private _display = uiNamespace getVariable "JDRadar";
	_display closeDisplay 1;
	playSound "JD_RadarOff";
};