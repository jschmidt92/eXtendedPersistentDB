params [["_vehicles", createHashMap, [createHashMap]]];

{
    private _key = _x;
    private _value = _y;

    if (_key select [0, 10] == "vehicle.") then {
        private _vehicle = _value getOrDefault ["class", ""] createVehicle [0, 0, 0];

        [_vehicle, _value getOrDefault ["cargo", []]] call xpdb_utils_fnc_applyCargoData;
        [_vehicle, _value getOrDefault ["damages", []]] call xpdb_utils_fnc_applyDamage;
        _vehicle setFuel (_value getOrDefault ["fuel", 1]);
        _vehicle setDamage (_value getOrDefault ["generalDamage", 0]);
        [_vehicle, _value getOrDefault ["posDir", []]] call xpdb_utils_fnc_applyPosDir;
    };
} forEach _vehicles;