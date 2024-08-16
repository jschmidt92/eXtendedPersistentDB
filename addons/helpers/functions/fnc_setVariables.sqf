#include "script_component.hpp"

/*
 * Function: xpdb_helpers_fnc_setVariables
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

params ["_unit", "_varsArray"];

{
    _unit setVariable [_x, nil];
    true
} count (allVariables _unit);

{
    private _key = _x # 0;
    private _value = _x # 1;

    if (isNil "_value") then {
        _unit setVariable [_key, nil];
    } else {
        _unit setVariable [_key, _value];
    };
    true
} count (_varsArray);