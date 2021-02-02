/*
	Author: John Doe

	Description:
	change this depending on ur framework
*/

params ["_uid"];

if (isNull objectParent player) exitWith {};

systemPower = !systemPower;

if (systemPower) then {
	private _display = uiNamespace getVariable "JDRadar";
	private _anprControl = _display displayCtrl 5;
	_anprControl ctrlSetStructuredText parseText "<t size='1.1' color='#a6a6a6' align='center' valign='middle'>Scanning...</t>";
};