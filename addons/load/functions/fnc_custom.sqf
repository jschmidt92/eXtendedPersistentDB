#include "script_component.hpp"

/*
 * Function: xpdb_load_fnc_custom
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
 * Executes an eXtended Persistent Database load based on user-defined configuration in XPDB_CfgXPDB (eXtended Persistent Database) within the mission config file.
 *
 * Arguments:
 * 0: ID of Slot <SCALAR> (default: 0)
 * 1: Unscheduled environment <BOOL> (default: false)
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [1] call xpdb_load_fnc_custom
 *
 * Public: Yes
 */

params [["_slot", nil, [0]]];


private _configPath = "missionConfigFile >> 'CfgXPDB' >> 'load'";
private _config = call compile _configPath;

if (isNull _config) exitWith {
    [EGVAR(db,debug), "xpdb_load_fnc_custom", format ["Mission Config: eXtended Persistent Database config '%1' not found. eXtended Persistent Database load process skipped.", _configPath], true] call DEFUNC(utils,debug);
};

[EGVAR(db,debug), "xpdb_load_fnc_custom", format ["Initializing eXtended Persistent Database load for slot '%1'", _slot], true] call DEFUNC(utils,debug);

private _loadEntries = "true" configClasses (_config);

{
    private _entryName = configName _x;
    private _functionName = getText (_x >> "function");
    private _args = getArray (_x >> "args");
    
    if (_functionName != "") then {
        private _function = call compile _functionName;
        private _savedData = [_entryName, _slot] call DEFUNC(core,loadData);

        if (!isNil "_savedData") then {
            _args pushBack _savedData;
            _args call _function;

            [EGVAR(db,debug), "xpdb_load_fnc_custom", format ["Loading '%1.%2.%3'", EGVAR(db,prefix), _slot, _entryName], false] call DEFUNC(utils,debug);
        };
    };
} forEach _loadEntries;

[EGVAR(db,debug), "xpdb_load_fnc_custom", "eXtended Persistent Database load completed.", true] call DEFUNC(utils,debug);
