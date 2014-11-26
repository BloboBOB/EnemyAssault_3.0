// Update Player List
private ["_colors","_frequency","_time","_result"];

_frequency = 1;

while {true} do {
	_time = time;
	_result = false;
	_result = [] call FNC_UPDATE_PLAYER_LIST;
	waitUntil {_result};
	if (_time + _frequency > time) then {
		sleep (_time + _frequency - time);
	};
};
