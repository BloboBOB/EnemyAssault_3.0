_paramDaytimeHour = "paramDaytimeHour" call BIS_fnc_getParamValue;
if (_paramDaytimeHour == 0) then {
setDate [2024, 3, 1, (round(random 24)), (round(random 55))];//(round(random 1440))
} else {
setDate [2024, 3, 1, _paramDaytimeHour, 0];
};
call ghst_fnc_acquirelocations;
[] spawn ghst_fnc_randweather;

//Enemy Unit list
call ghst_fnc_unitlist;

[["AA1","AA2","AA3","AA4"],"B_APC_Tracked_01_AA_F",(random 360),false] spawn ghst_fnc_basedef;

[(getmarkerpos "eairspawn"),(getmarkerpos "center"),[10000,10000],600,2,[true,15],[false,"ColorRed"]] spawn ghst_fnc_eair;

_PARAM_AISkill = "PARAM_AISkill" call BIS_fnc_getParamValue;
[[(getmarkerpos "Respawn_West"),1000],[500,500],(4 + round(random 2)),[false,"ColorRed"],(_PARAM_AISkill/10)] spawn ghst_fnc_randespawn;

//Spawn EBU C-130
_PARAM_C130 = "PARAM_C130" call BIS_fnc_getParamValue;
if (_PARAM_C130 == 1) then {
private ["_markarray","_namearray","_air","_marksel","_VarName"];
_markarray = ["c1","t1"];
_namearray = ["c130c_1","c130t_2"];
	{
	_VarName = _namearray select 0;
	_namearray = _namearray - [_VarName];
	_marksel = _markarray select 0;
	_markarray = _markarray - [_marksel];
	_air = createVehicle [_x,(getmarkerpos _marksel), [], 0, "NONE"];
	_air setVehicleVarName _VarName;
	missionNamespace setVariable [_VarName,_air];
	publicVariable _VarName;
	_air setdir (markerdir _marksel);
	nul = [_air,5,false] execfsm "scripts\ghst_vehrespawn.fsm";
	} foreach ["C130J_Cargo","C130J"];
};

waituntil {! isnil "SHK_Taskmaster_Tasks"};

call ghst_fnc_randomobj;	