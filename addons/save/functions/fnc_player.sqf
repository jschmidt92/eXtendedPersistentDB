#include "script_component.hpp"

/*
 * Function: xpdb_save_fnc_player
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
 * Save player data to specified slot.
 *
 * Arguments:
 * 0: ID of Slot <SCALAR> (default: 0)
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [1] call xpdb_save_fnc_player
 *
 * Public: Yes
 */

params [["_slot", nil, [0]]];

[EGVAR(db,debug), "xpdb_save_fnc_player", format ["Saving player data to slot '%1'", _slot], true] call EFUNC(utils,debug);

private _playerData = [player, true] call EFUNC(generate,unitData);
["player", _playerData, _slot] call EFUNC(core,saveData);