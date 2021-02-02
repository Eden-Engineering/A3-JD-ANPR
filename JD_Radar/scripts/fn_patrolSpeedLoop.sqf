/*
	Author: John Doe

	Description:
	updates the speed of the patrol car
*/

params ["_display"];

_PatrolControl = _display displayCtrl 1;
while {!(isNull objectParent player)} do {
	if (systemPower) then {
		_PatrolControl ctrlSetText str abs round speed player;
		uiSleep 0.1;
	} else {
		sleep 0.01;
		_PatrolControl ctrlSetText str 0;
	};
};