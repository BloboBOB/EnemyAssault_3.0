/*
V1.1 script by: Ghost - Creates an aircraft and flys to point on map specified by left click and drops selected vehicle.
ghst_drop = [player,"spawnmarker",300,30] spawn ghst_fnc_cargodrop;
*/
//if (!isserver) exitwith {};
private ["_airtype"];
#include "def_VEHsel.hpp"

_host = _this select 0;
_spawnmark = _this select 1;
_airtype = _this select 2;// type of air to spawn i.e. "C130J_Cargo" or "I_Heli_Transport_02_F"
_flyheight = _this select 3;
_delay = (_this select 4) * 60;// time before cargo drop support can be called again

if (player getVariable "ghst_cargodrop") exitwith {player groupchat "Cargo Drop Busy";};

_vehiclelist = ghst_vehiclelist2;
_PARAM_PlayerVehicles = "PARAM_PlayerVehicles" call BIS_fnc_getParamValue;

{if (!(alive _x) or (! canmove _x and count crew _x == 0)) then {
	deletevehicle _x;
	ghst_local_vehicles = ghst_local_vehicles - [_x];
};} foreach ghst_local_vehicles;

if (count ghst_local_vehicles == _PARAM_PlayerVehicles) exitwith {hint format ["You can only spawn %1 vehicles", _PARAM_PlayerVehicles];};

#ifndef VBS
 disableSerialization;
#endif

// fill dialog with vehicle names
createDialog "Selectvehicle";
sleep 0.1;
_ctrlList = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _vehicleList)-1 do {
	_vehicle = _vehicleList select _i;
	lbAdd [DLG_VEH_LIST,format["%1",_vehicle select 1]];
	lbSetPicture [DLG_VEH_LIST, _i, _vehicle select 2];
	lbSetValue [DLG_VEH_LIST, _i, _i];
};
lbSort (findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST); 

// put the selection somewhat in the middle of the displayed listing
_index = -1;
_i=(_index -9) max 0;
lbSetCurSel [DLG_VEH_LIST, _i];
lbSetCurSel [DLG_VEH_LIST, _index];

// preview controls
_ctrlPic = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_PIC;
_ctrlName = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_NAME;
_ctrlDesc = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_DESC;

_VEHidx = lbValue [DLG_VEH_LIST, _index];
_lstidx = _index;
_lstpos = -1;
DLG_VEH_SELECTED = false;

		while {ctrlVisible DLG_VEH_LIST} do {
			_index = lbCurSel DLG_VEH_LIST;
			_posidx = _index;
		#ifdef VBS	
			if !(isNil "DLG_VEH_SEL") then {
				if (DLG_VEH_SEL select 3) then {
					_posidx = _ctrlList lbPosIndex [DLG_VEH_SEL select 1,DLG_VEH_SEL select 2];
				};
			};
		#endif	
			if (DLG_VEH_SELECTED) then {
				_VEHidx=lbValue [DLG_VEH_LIST, _index];
				closeDialog DLG_VEH_IDD;
			};
			if (_posidx == -1) then {
				_posidx = _index;
			};
			if (_lstpos != _posidx) then {
				_lbidx = lbValue [DLG_VEH_LIST, _posidx];
				_wDName = (_vehicleList select _lbidx) select 1;
				_wPic = (_vehicleList select _lbidx) select 2;
				_wDesc = (_vehicleList select _lbidx) select 3;
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_VEHsel=(_vehicleList select _VEHidx) select 0;

if (ghst_vehsel != "none" && DLG_VEH_SELECTED) then {
_veh_name = (configFile >> "cfgVehicles" >> (_vehsel) >> "displayName") call bis_fnc_getcfgdata;

openMap true;

_host groupchat format ["Left click on the map where you want %1 drop", _veh_name];

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "Air Drop Ready";
	};
_pos = [clickpos select 0, clickpos select 1, _flyheight];

sleep 1;

openMap false;

//hint format ["%1", _pos];

_airdrop1 = createGroup WEST;

_dir = [_spawnmark, _pos] call BIS_fnc_dirTo;

_PARAM_C130 = "PARAM_C130" call BIS_fnc_getParamValue;
if (_PARAM_C130 == 1) then {
	_airtype = "C130J_Cargo";
};

_air1_array = [_spawnmark, _dir, _airtype, _airdrop1] call BIS_fnc_spawnVehicle;
_air1 = _air1_array select 0;
_air1 setpos [getpos _air1 select 0, getpos _air1 select 1, _flyheight];
_air1 setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];

_air1 sidechat "I am inbound with cargo";

player setVariable ["ghst_cargodrop", true];

_air1 flyinheight _flyheight;
_airdrop1 setbehaviour "CARELESS";

While {(alive _air1) and (canmove _air1)} do {

_air1 domove [(_pos select 0) + 200 * sin(_dir),(_pos select 1) + 200 * cos(_dir)];

waituntil {(_air1 distance _pos) < 100};

_dir = getdir _air1;
_chute1 = createVehicle ["B_Parachute_02_F",[0,0,0], [], 0, "FLY"];
_chute1 setdir _dir;
_chute1 setposatl [(getposatl _air1 select 0) - 20 * sin(_dir),(getposatl _air1 select 1) - 20 * cos(_dir),(getposatl _air1 select 2)];

_ghst_drop = createVehicle [_vehsel,[0,0,0], [], 0, "none"];

_ghst_drop attachTo [_chute1,[0,0,1]];

	[_ghst_drop,_veh_name] spawn { 
				private ["_veh","_veh_name","_smoke"];
				_veh = _this select 0;
				_veh_name = _this select 1;
				
				waituntil {(getposatl _veh select 2) < 1.5}; 
				detach _veh;
				_veh setposatl [(getposatl _veh select 0),(getposatl _veh select 1) + 5,0.2];		
				[_veh, "ColorGrey", _veh_name] call ghst_fnc_tracker;
				//_smoke = "SmokeShellGreen" createVehicle (getPosatl _veh);
			};

_air1 sidechat "Air drop complete heading home";

_air1 domove _spawnmark;

sleep 120;

if (true) exitwith {};
};

if (!(alive _air1) or !(canMove _air1)) then {player groupchat "Shit we lost air support";};

{deletevehicle _x} foreach crew _air1;
deletevehicle _air1;
sleep 20;
deletegroup _airdrop1;

sleep _delay;
};

hint "Air Drop Ready";

player setVariable ["ghst_cargodrop", false];

if (true) exitwith {};