/*
	Author: John Doe

	Description:
	Creates a loop for updating the target speed and lock speed
*/

private _display = uiNamespace getVariable "JDRadar";
private _LockControl = _display displayCtrl 2;
private _TargetControl = _display displayCtrl 3;

private _targetSpeed = 0;
private _lockSpeed = 0;
private _lastTarget = objNull;

//End loop when player leaves vehicle
while {!isNil "_display"} do {
	if (true) then {
		//Select Nearest car that is visible to anpr scanner
		private _nearCars = nearestObjects [player, ["Car"], JDR_RadarDistance, true];
		_nearCars deleteAt 0;
		private _target = _nearCars findIf {[_x] call JDR_fnc_isVisibleToRadar};
		if (_target isEqualTo -1) exitWith {
			_TargetControl ctrlSetText str 0;
		};
		_target = _nearCars # _target;


		if (((itemCargo _target) findIf {_x isEqualTo "JDR_RadarJammer"}) != -1) exitWith {
			_TargetControl ctrlSetText str 0;
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
	};
	uiSleep 0.15;
};