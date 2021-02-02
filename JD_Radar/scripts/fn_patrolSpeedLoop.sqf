/*
	Author: John Doe

	Description:
	updates the speed of the patrol car
*/

private _display = uiNamespace getVariable "JDRadar";

while {!(isNull objectParent player)} do {
	_display = uiNamespace getVariable "JDRadar";

	if !(isNil "_display") then {
		_PatrolControl = _display displayCtrl 1;
		_PatrolControl ctrlSetText str abs round speed player;
	};
	
	uiSleep 0.1;
};