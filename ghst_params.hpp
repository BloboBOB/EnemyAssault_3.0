class EmtpyLine1
{
	title = ":: Mission Settings";
	values[]={0,0};
	texts[]={ "",""};
	default = 0;
};
class paramDaytimeHour
{
	title = "    Time of Day:";
	values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,0};
	texts[] = {"0100","0200","0300","0400","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300","2400","Random"};
	default = 12;
};
/*
//class paramDaytimeHour
#define DAYTIMEHOUR_DEFAULT	12
#include "\a3\functions_f\Params\paramDaytimeHour.hpp"
*/
class PARAM_Rain
{
	title= "    Weather Setting:";
	values[]= {0,1,3,6,90,99};
	texts[]= {"Random Weather and No Rain","Random Weather and Rain","%30 Rain","%60 Rain","Stormy Heavy Rain","Stormy no Rain"};
	default= 1;
};
class PARAM_Teamdead
{
	title = "    Fail Mission when Team is killed:";
	values[] = {1,0};
	texts[] = {"Yes","No"};
	default = 0;
};
class PARAM_AISkill
{
	title= "    AI Accuracy and Speed Skill";
	values[]= { 1,2,3,4,5,6,7,8,9,10 };
	texts[]= { "0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1.0" };
	default= 3;
	code = "";
};
class PARAM_Tasks
{
	title = "    Number of Tasks:";
	values[] = {8,7,6,5,4,3,2,1};
	texts[] = {"8","7","6","5","4","3","2","1"};
	default = 6;
};
class PARAM_Enemy
{
	title = "    Type of Enemy:";
	values[] = {2,1,0};
	texts[] = {"Random","Greek Army","Iranian Army"};
	default = 1;
};
class PARAM_Kavala
{
	title = "    Number of Locations:";
	values[] = {3,2,1,0};
	texts[] = {"ALL","Half","Kavala Only","Random"};
	default = 3;
};
class PARAM_Fatigue
{
	title = "    Player Fatigue:";
	values[] = {1,0};
	texts[] = {"ON","OFF"};
	default = 0;
};
class PARAM_PlayerVehicles
{
	title = "    Number of Player Vehicles Allowed:";
	values[] = {1,2,3,4,5,6};
	texts[] = {"1","2","3","4","5","6"};
	default = 3;
};
class EmtpyLine2
{
	title = ":: Mod Settings";
	values[]={0,0};
	texts[]={ "",""};
	default = 0;
};
class PARAM_USHELO
{
	title = "    USE US Helo Pack:";
	values[] = {0,1};
	texts[] = {"No US Helo Pack","USE US Helo Pack"};
	default = 0;
};
class PARAM_FA18
{
	title = "    USE JS FA18:";
	values[] = {0,1};
	texts[] = {"No JS FA18","USE JS FA18"};
	default = 0;
};
class PARAM_FA18X
{
	title = "    USE JS FA18X:";
	values[] = {0,1};
	texts[] = {"No JS FA18X","USE JS FA18X"};
	default = 0;
};
class PARAM_SU35
{
	title = "    USE JS SU35:";
	values[] = {0,1};
	texts[] = {"No JS SU35","USE JS SU35"};
	default = 0;
};
class PARAM_C130
{
	title = "    USE C130:";
	values[] = {0,1};
	texts[] = {"No C-130","USE C-130"};
	default = 0;
};/*
class PARAM_MH47E
{
	title = "    USE MH47E:";
	values[] = {0,1};
	texts[] = {"No MH-47E","USE MH-47E"};
	default = 1;
};*/
class EmtpyLine3
{
	title = ":: AGM Medical Settings";
	values[]={0,0};
	texts[]={ "",""};
	default = 0;
};
class PARAM_AGMMEDICAL
{
	title = "    USE AGM Medical:";
	values[] = {0,1};
	texts[] = {"No AGM Medical","USE AGM Medical"};
	default = 1;
};
class PARAM_MaxUnconsciousnessTime
{
	title = "    Max Unconsciousness Time Till Death:";
	values[] = {-1,60,120,180,240,300};
	texts[] = {"Disabled","1 Min","2 Min","3 Min","4 Min","5 Min"};
	default = 180;
};
class PARAM_AllowNonmedics
{
	title = "    Allow Non-Medic Epi/Bloodbags:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 1;
};
class PARAM_PunishNonMedics
{
	title = "    Punish Non-Medics:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 1;
};
class PARAM_RequireDiagnosis
{
	title = "    Require Diagnosis:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 0;
};
class PARAM_PreventInstaDeath
{
	title = "    Prevent InstaDeath:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 0;
};
class PARAM_PreventDeathWhileUnconscious
{
	title = "    Prevent Death While Unconscious:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 0;
};
class PARAM_SingleBandage
{
	title = "    Single Bandage Heal:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 0;
};
class PARAM_AllowChatWhileUnconscious
{
	title = "    Allow Chat While Unconscious:";
	values[] = {0,1};
	texts[] = {"NO","YES"};
	default = 1;
};
/*class PARAM_HeadlessClient
{
	title = "Headless Client:";
	values[] = {1,0};
	texts[] = {"ON","OFF"};
	default = 1;
};
*/