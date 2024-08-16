#include "script_component.hpp"

/*
 * Function: xpdb_save_fnc_custom
 * Author: J.Schmidt
 * Edit: 08.12.2024
 * Copyright © 2024 NikolaiF90, J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Executes an eXtended Persistent Database save based on user-defined configuration in XPDB_CfgXPDB (eXtended Persistent Database) within the mission config file.
 *
 * Arguments:
 * 0: ID of Slot <SCALAR> (default: 0)
 * 1: Unscheduled environment <BOOL> (default: false)
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [1] call xpdb_save_fnc_custom
 *
 * Public: Yes
 */

params [["_slot", nil, [0]]];

private _configPath = "missionConfigFile >> 'CfgXPDB' >> 'save'";
private _config = call compile _configPath;

if (isNull _config) exitWith {
    [EGVAR(db,debug), "xpdb_save_fnc_custom", format ["Mission Config: eXtended Persistent Database config '%1' not found. eXtended Persistent Database save process skipped.", _configPath], true] call DEFUNC(utils,debug);
};

[EGVAR(db,debug), "xpdb_save_fnc_custom", format ["Initializing eXtended Persistent Database save for slot '%1'...", _slot], false] call DEFUNC(utils,debug);

private _saveEntries = "true" configClasses (_config);

{
    private _entryName = configName _x;
    private _functionName = getText (_x >> "function");
    private _args = getArray (_x >> "args");
    
    if (_functionName != "") then {
        private _function = call compile _functionName;
        private _result = _args call _function;
        
        if (!isNil "_result") then {
            [EGVAR(db,debug), "xpdb_save_fnc_custom", format ["Saving '%1.%2.%3'", EGVAR(db,prefix), _slot, _entryName], false] call DEFUNC(utils,debug);
            [_entryName, _result, _slot] call DEFUNC(core,saveData);
        };
    };
} forEach _saveEntries;

[EGVAR(db,debug), "xpdb_save_fnc_custom", "eXtended Persistent Database save completed.", false] call DEFUNC(utils,debug);