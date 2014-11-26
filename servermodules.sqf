//Create AGM Medical Module Params
_PARAM_AGMMEDICAL = "PARAM_AGMMEDICAL" call BIS_fnc_getParamValue;
if (_PARAM_AGMMEDICAL == 1) then {

	_PARAM_MaxUnconsciousnessTime = "PARAM_MaxUnconsciousnessTime" call BIS_fnc_getParamValue;
	_PARAM_AllowNonmedics = "PARAM_AllowNonmedics" call BIS_fnc_getParamValue;
	_PARAM_PunishNonMedics = "PARAM_PunishNonMedics" call BIS_fnc_getParamValue;
	_PARAM_RequireDiagnosis = "PARAM_RequireDiagnosis" call BIS_fnc_getParamValue;
	_PARAM_PreventInstaDeath = "PARAM_PreventInstaDeath" call BIS_fnc_getParamValue;
	_PARAM_PreventDeathWhileUnconscious = "PARAM_PreventDeathWhileUnconscious" call BIS_fnc_getParamValue;
	_PARAM_SingleBandage = "PARAM_SingleBandage" call BIS_fnc_getParamValue;
	_PARAM_AllowChatWhileUnconscious = "PARAM_AllowChatWhileUnconscious" call BIS_fnc_getParamValue;

	["AGM_Medical_CoefBleeding", 1] call AGM_Core_fnc_setParameter;
	["AGM_Medical_CoefPain", 1] call AGM_Core_fnc_setParameter;
	["AGM_Medical_MaxUnconsciousnessTime", _PARAM_MaxUnconsciousnessTime] call AGM_Core_fnc_setParameter;
	["AGM_Medical_AllowNonMedics", _PARAM_AllowNonmedics] call AGM_Core_fnc_setParameter;
	["AGM_Medical_PunishNonMedics", _PARAM_PunishNonMedics] call AGM_Core_fnc_setParameter;
	["AGM_Medical_RequireDiagnosis", _PARAM_RequireDiagnosis] call AGM_Core_fnc_setParameter;
	["AGM_Medical_PreventInstaDeath", _PARAM_PreventInstaDeath] call AGM_Core_fnc_setParameter;
	["AGM_Medical_PreventDeathWhileUnconscious", _PARAM_PreventDeathWhileUnconscious] call AGM_Core_fnc_setParameter;
	["AGM_Medical_SingleBandage", _PARAM_SingleBandage] call AGM_Core_fnc_setParameter;
	["AGM_Medical_AllowChatWhileUnconscious", _PARAM_AllowChatWhileUnconscious] call AGM_Core_fnc_setParameter;

};