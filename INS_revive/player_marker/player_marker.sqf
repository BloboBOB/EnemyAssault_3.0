// Draw Player Marker
private ["_markers","_frequency"];

_markers = [];

_frequency = 0.5;

while {true} do {
	// Check method serverside or clientside
	if (INS_REV_CFG_player_marker_serverSide) then {
		_markers = [_markers] call FNC_SET_PLAYER_MARKER_SERVER_SIDE;
	} else {
		_markers = [_markers] call FNC_SET_PLAYER_MARKER;
	};
	
	sleep _frequency;
};