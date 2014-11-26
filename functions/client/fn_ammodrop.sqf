/*
V1.4 script by: Ghost - Creates specified aircraft and flys to point on map specified by left click and drops ammo box.
ghst_ammodrop = [player,300,"airtype","objdrop",300,30] spawn ghst_fnc_ammodrop;
*/
if (!local player) exitwith {};

_host = _this select 0;
_spawnmark = _this select 1;
_airtype = _this select 2;
_objdrop = _this select 3;
_flyheight = _this select 4;
_delay = (_this select 5) * 60;// time before ammo support can be called again

if (player getVariable "ghst_ammodrop") exitwith {player groupchat "Ammo Drop Busy";};

openMap true;

_host groupchat "Left click on the map where you want Ammo drop";

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "Ammo Drop Ready";
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

player setVariable ["ghst_ammodrop", true];

_air1 sidechat "I am inbound with your Ammo";

_air1 flyinheight _flyheight;
_airdrop1 setbehaviour "CARELESS";

While {(alive _air1) and (canmove _air1)} do {

_air1 domove [(_pos select 0) + 200 * sin(_dir),(_pos select 1) + 200 * cos(_dir)];

waituntil {(_air1 distance _pos) < 100};

_dir = getdir _air1;
_chute1 = createVehicle ["B_Parachute_02_F",[0,0,0], [], 0, "FLY"];
_chute1 setdir _dir;
_chute1 setposatl [(getposatl _air1 select 0) - 20 * sin(_dir),(getposatl _air1 select 1) - 20 * cos(_dir),(getposatl _air1 select 2)];

_ghst_drop = createVehicle [_objdrop,[0,0,0], [], 0, "none"];
_ghst_drop attachTo [_chute1,[0,0,1]];

_air1 domove _spawnmark;

	[_ghst_drop] spawn {
		private ["_crate","_chem","_crate_name","_smoke"];
		_crate = _this select 0;
		
		waituntil {(getposatl _crate select 2) < 1.5}; 
		//detach _crate;
		_crate setposatl [getposatl _crate select 0,getposatl _crate select 1,0];
		_crate_name = "Ammo Box";//getText (configFile >> "cfgVehicles" >> (_droptype) >> "displayName");
		[_crate, "ColorBlack", _crate_name] spawn ghst_fnc_tracker;
		//_crate call ghst_fnc_magazines;
		_chem = createMine ["placed_chemlight_green", (position _crate), [], 0];
		sleep 3;
		_chem attachto [_crate,[0,0,0.1]];
		_smoke = "SmokeShellPurple" createVehicle (getPosatl _crate);
				
	};

_air1 sidechat "Ammo drop complete heading home";

sleep 120;

if (true) exitwith {};
};

if (!(alive _air1) or !(canMove _air1)) then {player groupchat "Shit we lost air support";};

{deletevehicle _x} foreach crew _air1;
deletevehicle _air1;
sleep 5;
deletegroup _airdrop1;

sleep _delay;

hint "Ammo Drop Ready";

player setVariable ["ghst_ammodrop", false];

if (true) exitwith {};