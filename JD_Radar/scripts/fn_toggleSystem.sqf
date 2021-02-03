/*
	Author: John Doe

	Description:
	toggles the state of the system
*/

params ["_uid"];

if (isNull objectParent player) exitWith {};

systemPower = !systemPower;

if (systemPower) then {
	"JDRadar" cutRsc ["JDRadar", "PLAIN"];
	private _display = uiNamespace getVariable "JDRadar";
	playSound "JD_RadarOn";
} else {
	private _display = uiNamespace getVariable "JDRadar";
	_display closeDisplay 1;
	playSound "JD_RadarOff";
};