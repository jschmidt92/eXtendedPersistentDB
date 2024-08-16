#include "script_component.hpp"

/*
 * Function: xpdb_db_fnc_config
 * Author: NikolaiF90, J.Schmidt
 * Edit: 07.27.2024
 * Copyright © 2024 NikolaiF90, J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Configuration for XPDB_ARMADBCORE.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call xpdb_db_fnc_config
 *
 * Public: Yes
 */

EGVAR(db,debug) = ["DEBUG_MODE", 0] call BFUNC(getParamValue);
if (EGVAR(db,debug) == 1) then { EGVAR(db,debug) = true; } else { EGVAR(db,debug) = false; };

[EGVAR(db,debug), "xpdb_db_fnc_config", format ["Configuring '%1'...", Scenario_Name], true] call EFUNC(utils,debug);

EGVAR(db,host) = player;
EGVAR(db,prefix) = "XPDB_ARMADBCORE";
EGVAR(db,saveInterval) = 600;

EGVAR(db,conts) = [];
EGVAR(db,slots) = [];
EGVAR(db,vars) = [];
EGVAR(db,vehs) = [];

EGVAR(db,native) = ["NATIVE_MODE", 1] call BFUNC(getParamValue);
if (EGVAR(db,native) == 1) then { EGVAR(db,native) = true; } else { EGVAR(db,native) = false; };

EGVAR(db,configDone) = true;
[EGVAR(db,debug), "xpdb_db_fnc_config", format ["Finished configuring '%1'.", Scenario_Name], true] call EFUNC(utils,debug);