/*
	Author: John Doe

	Description:
	updates the speed of the patrol car
*/

private _display = uiNamespace getVariable "JDRadar";
_PatrolControl = _display displayCtrl 1;

while {!isNil "_display"} do {
	_PatrolControl ctrlSetText str abs round speed player;
	uiSleep 0.1;
};