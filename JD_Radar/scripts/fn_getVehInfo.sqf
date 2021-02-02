/*
	Author: John Doe

	Description:
	Gets all the relevent info from vehicle used for anpr

	Parameter(s):
	0: OBJECT - target vehicle

	Returns:
	ARRAY
*/


params ["_vehicle"];

private _model = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
private _ownerName = "John Doe";
private _ownerUID = "123123891230912830912";
private _plate = getPlateNumber _vehicle;
private _isInsured = true;

[_model, _ownerName, _ownerUID, _plate, _isInsured];