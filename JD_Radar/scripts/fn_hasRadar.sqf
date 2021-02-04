/*
	Author: John Doe

	Description:
	Does the supplied vehicle have police anpr/radar?

	Parameter(s):
	0: OBJECT - target vehicle

	Returns:
	BOOL
*/


params ["_vehicle"];

private _vehicles = [
	"B_GEN_Offroad_01_gen_F",
	"B_GEN_Van_02_transport_F",
	"B_GEN_Van_02_vehicle_F",
	"B_GEN_Offroad_01_covered_F",
	"B_GEN_Offroad_01_comms_F"
];

if (typeOf _vehicle in _vehicles) then {
	true;
} else {
	false;
};