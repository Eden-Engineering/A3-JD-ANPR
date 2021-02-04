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
	"B_GEN_Offroad_01_comms_F",
	"M_Charger2015",
	"M_Charger2015_slick",
	"M_Charger2015_white",
	"M_Charger2015_Black",
	"M_Charger2015_Red",
	"M_explorer",
	"M_explorer_slick",
	"M_explorer_white",
	"M_explorer_Black",
	"M_explorer_Red",
	"M_Tahoe",
	"M_TahoePD",
	"M_TahoePD_slick",
	"M_TahoePD_white",
	"M_TahoePD_Black",
	"M_TahoePD_Red",
	"M_CV",
	"M_CV_slick",
	"M_CV_white",
	"M_CV_Black",
	"M_CV_Red",
	"M_CV_Marshal",
	"M_Charger2015_Marshal",
	"M_explorer_Marshal",
	"M_TahoePD_Marshal",
	"M_TaurusPD",
	"M_TaurusPD_slick",
	"M_TaurusPD_white",
	"M_TaurusPD_Black",
	"M_TaurusPD_Red",
	"M_TaurusPD_Marshal"
];

if (typeOf _vehicle in _vehicles) then {
	true;
} else {
	false;
};