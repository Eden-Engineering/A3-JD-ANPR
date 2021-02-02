/*
	Author: John Doe

	Description:
	Detect if target vehicle is obstruct5ed by objects or terrain

	Parameter(s):
	0: OBJECT - target vehicle

	Returns:
	BOOL
*/

params ["_target"];

if (count (lineIntersectsWith [eyePos player, aimPos _target, vehicle player, _target]) != 0) exitWith {
	false;
};

if (terrainIntersect [(ASLToAGL eyePos player), (ASLToAGL aimPos _target)]) exitWith {
	false;
};

true;