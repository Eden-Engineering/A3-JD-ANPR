/*
	Author: John Doe

	Description:
	Creates a loop for updating the anpr info on the top right of the screen
*/

private _display = uiNamespace getVariable "JDRadar";
private _anprControl = _display displayCtrl 5;

private _lastScan = "";

while {!isNil "_display"} do {
	if (true) then {
		
		//Select Nearest car that is visible to anpr scanner
		private _nearCars = nearestObjects [player, ["Car"], JDR_ANPRDistance, true];
		_nearCars deleteAt 0;
		private _target = _nearCars findIf {[_x] call JDR_fnc_isVisibleToANPR};
		if (_target isEqualTo -1) exitWith {};
		_target = _nearCars # _target;
	
		private _vehInfo = [_target] call JDR_fnc_getVehInfo;
		private _ownerName = _vehInfo # 1;
		private _isInsured = _vehInfo # 4;

		if ([_vehInfo # 2] call JDR_fnc_isWanted) then {
			if (JDR_WarrantSound) then {
				playSound "JD_RadarBeep";
			};
			_ownerName = format ["%1 - <t color='#910707' size='1'>Wanted</t>",_ownerName];
		} else {
			_ownerName = format ["%1 - <t size='1'>No active warrants</t>",_ownerName];
		};

		if (_isInsured) then {
			_isInsured = "<t size='1'>Valid</t>";
		} else {
			_isInsured = "<t color='#910707' size='1'>Invalid</t>";
		};

		_scanInfo = format ["
			<t size='0.7' color='#a6a6a6'>Model - </t><t size='1'>%1</t><br/>
			<t size='0.7' color='#a6a6a6'>Owner - </t><t size='1'>%2</t><br/>
			<t size='0.7' color='#a6a6a6'>Plate - </t><t size='1'>%3</t><br/>
			<t size='0.7' color='#a6a6a6'>Insurance - </t>%4<br/>
			", _vehInfo # 0, _ownerName, _vehInfo # 3, _isInsured
		];

		_anprControl ctrlSetStructuredText parseText _scanInfo;
	};
	uiSleep 1;
};