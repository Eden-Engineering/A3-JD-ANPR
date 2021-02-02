/*
	Author: John Doe

	Description:
	Creates a loop for updating the target speed and lock speed
*/

params ["_display"];

private _LockControl = _display displayCtrl 2;
private _TargetControl = _display displayCtrl 3;
private _targetSpeed = 0;
private _lockSpeed = 0;
private _lastTarget = "";

//End loop when player leaves vehicle
while {!(isNull objectParent player)} do {
	if (systemPower) then {
		//Select Nearest car
		private _nearCars = nearestObjects [player, ["Car"], 200, true];
		_nearCars deleteAt 0;
		if !((count _nearCars) > 0) exitWith {
			_TargetControl ctrlSetText "0";
			uiSleep 0.8;
		};
		_target = _nearCars select 0;

		//Check if terrain or objects obstruct radar
		if !([_target] call JDR_fnc_isVisibleToRadar) exitWith {
			_TargetControl ctrlSetText "0";
			uiSleep 0.3;
		};

		
		_targetSpeed = abs round speed _target;

		//If new vehicle reset lock speed
		if !(_lastTarget isEqualTo _target) then {
			_lastTarget = _target;
			_lockSpeed = 0;
		};

		if (_targetSpeed > _lockSpeed) then {
			_lockSpeed = _targetSpeed;
		};

		//Update Radar
		_LockControl ctrlSetText str _lockSpeed;
		_TargetControl ctrlSetText str _targetSpeed;
		uiSleep 0.4;
	} else {
		sleep 0.01;
		_lastTarget = "";
		_lockSpeed = 0;
		_LockControl ctrlSetText str 0;
		_TargetControl ctrlSetText str 0;
	};
};