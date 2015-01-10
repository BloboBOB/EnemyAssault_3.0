// Create a mission entry for the server and client RPT file, easier to debug when you know what mission created the error
diag_log text ""; 
diag_log text format["|=============================   %1   =============================|", missionName]; // stamp mission name
diag_log text "";

enableSaving [false, false];

CIVILIAN setFriend [WEST, 1];
WEST setFriend [CIVILIAN, 1];
EAST setFriend [CIVILIAN, 1];
INDEPENDENT setFriend [CIVILIAN, 1];

// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

tf_no_auto_long_range_radio = true;


execVM "shk_taskmaster.sqf";


//------------------------------------------------------------
/** SOB Specials
*Ohne LEA
*/
enable_lea_addon = false;

/**
* Disable ingame AI radio and local callouts
*/
0 fadeRadio 0;
enableRadio false;
enableSentences false;
player disableConversation false;


[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};


//-- Ziv
[7, 500, 10] execVM "scripts\MAD_civilians.sqf";
[6, 500, 1000] execVM "scripts\MAD_traffic.sqf";


// AGM Whitelist

_whitelist = ["jsrs_environment","dragonfyre_bullethits","dragonfyre_explosions","dragonfyre_sonic_cracks","dragonfyre_230mm_titan","dragonfyre_air_weapons","dragonfyre_35mm_autocannon","dragonfyre_120mm_cannon","dragonfyre_autocannon","dragonfyre_dagr","dragonfyre_dar","dragonfyre_minigun","dragonfyre_30mm_cannon","dragonfyre_gau8","dragonfyre_155mm_amos","dragonfyre_m134","dragonfyre_lmgrcws","dragonfyre_gmg20","dragonfyre_gmg40","dragonfyre_127","dragonfyre_skalpel_atgm","dragonfyre_skyfire","dragonfyre_veh_titan","dragonfyre_4five45","dragonfyre_acpc","dragonfyre_mx","dragonfyre_m6","dragonfyre_khaybar","dragonfyre_m320r","dragonfyre_ebr","dragonfyre_fs2000","dragonfyre_m200","dragonfyre_p07","dragonfyre_nlaw","dragonfyre_pdw","dragonfyre_rahim","dragonfyre_rook40","dragonfyre_rpg32","dragonfyre_scorpian","dragonfyre_titan","dragonfyre_trg20","dragonfyre_ugl","dragonfyre_sdar","dragonfyre_vector","dragonfyre_zafir","dragonfyre_zubr45","dragonfyre_movement","jsrs2_distance","dragonfyre_distance","dragonfyre_fighterplane3","dragonfyre_cas_plane1","dragonfyre_ah99_blackfoot","dragonfyre_ah9_pawnee","dragonfyre_uav_1","dragonfyre_ch67_huron","dragonfyre_ch49_mohawk","dragonfyre_mi290_taru","dragonfyre_mi48_kajman","dragonfyre_uav_2","dragonfyre_po30_orca","dragonfyre_cas_plane2","dragonfyre_uh80_ghosthawk","dragonfyre_wy55_hellcat","dragonfyre_boat_armed_1","dragonfyre_2s9_sorcher","dragonfyre_afv4_gorgon","dragonfyre_amv7_marshal","dragonfyre_btrk_kamysh","dragonfyre_fv720_mora","dragonfyre_ifv6a_cheetah","dragonfyre_ifv6c_panther","dragonfyre_m2a1_slammer","dragonfyre_m4_scorcher","dragonfyre_m5_sandstorm","dragonfyre_mbt52_kuma","dragonfyre_mse3_marid","dragonfyre_t100_varsuk","dragonfyre_zsu39_tigris","dragonfyre_hatchback","dragonfyre_truck1","dragonfyre_hunter","dragonfyre_ifrit","dragonfyre_offroad","dragonfyre_quadbike","dragonfyre_strider","dragonfyre_suv","dragonfyre_truck2","dragonfyre_van","dragonfyre_truck3"];
 
_logic = "Logic" createVehicleLocal [0,0,0];
_logic setVariable ["Action", 1];
_logic setVariable ["CheckAll", true];
_logic setVariable ["Whitelist", _whitelist];
[_logic, [], true] call AGM_Core_fnc_moduleCheckPBOs;

deleteVehicle _logic;
