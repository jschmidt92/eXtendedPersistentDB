#include "script_component.hpp"

/*
 * Function: xpdb_helpers_fnc_isContainerEmpty
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
 * N/A
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * N/A
 *
 * Public: Yes
 */

params ["_container"];

if (!(magazineCargo _container isEqualTo [])) exitWith { false };
if (!(weaponCargo _container isEqualTo [])) exitWith { false };
if (!(itemCargo _container isEqualTo [])) exitWith { false };
if (!(backpackCargo _container isEqualTo [])) exitWith { false };

true;