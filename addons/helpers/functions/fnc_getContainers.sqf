#include "script_component.hpp"

/*
 * Function: xpdb_helpers_fnc_getContainers
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

private _containersArray = [];

{
    private _class = _x # 0;
    private _instance = _x # 1;
    private _cargo = [_instance] call EFUNC(generate,cargoData);

    private _currentContainerArray = [];

    _currentContainerArray pushBack ["class", _class];
    _currentContainerArray pushBack ["cargo", _cargo];

    _containersArray pushBack _currentContainerArray;
    true
} count (everyContainer _container);

_containersArray;