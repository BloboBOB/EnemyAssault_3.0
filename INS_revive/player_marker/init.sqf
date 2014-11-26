private ["_markers", "_colors", "_color","_playerRespawn"];

// Wait until INS_revive function is initialized
waitUntil {!isNil "INS_REV_FNCT_init_completed"};

// Compile Functions
Call Compile PreprocessFileLineNumbers "INS_revive\player_marker\functions.sqf";

// Server Side
if (isServer && INS_REV_CFG_player_marker_serverSide) then {
	[] execVM "INS_revive\player_marker\unitupdate.sqf";
	[] execVM "INS_revive\player_marker\player_marker.sqf";
};

// Client Side
if (!isDedicated && !INS_REV_CFG_player_marker_serverSide) then {
	[] execVM "INS_revive\player_marker\unitupdate.sqf";
	[] execVM "INS_revive\player_marker\player_marker.sqf";
};