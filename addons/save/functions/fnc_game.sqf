#include "script_component.hpp"

/*
 * Function: xpdb_save_fnc_game
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
 * Save game data to specified slot.
 *
 * Arguments:
 * 0: ID of Slot <SCALAR> (default: 0)
 * 1: Unscheduled Environment <BOOL> (default: false)
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [1] call xpdb_save_fnc_game
 *
 * Public: Yes
 */

params [["_slot", 0, [0]]];

[EGVAR(db,debug), "xpdb_save_fnc_game", format ["Saving progress to slot '%1'...", _slot], true] call EFUNC(utils,debug);

[_slot] call EFUNC(core,clearSave);

if (EGVAR(db,native)) then {
    [_slot] spawn DFUNC(containers);
    [_slot] call DFUNC(custom);
    [_slot] call DFUNC(player);
    [_slot] call DFUNC(environment);
    [_slot] call DFUNC(mapMarkers);
    [_slot] call DFUNC(variables);
    [_slot] spawn DFUNC(vehs);
} else {
    [_slot] call DFUNC(custom);
};

saveMissionProfileNamespace;
[EGVAR(db,debug), "xpdb_save_fnc_game", "Progress has been saved", true] call EFUNC(utils,debug);