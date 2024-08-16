private _nearbyVehicles = createHashMap;
private _pos = getPos player;
private _vehicles = _pos nearEntities ["LandVehicle", 10];

{
    private _vehicle = _x;
    private _data = createHashMap;

    _data set ["class", typeOf _vehicle];
    _data set ["cargo", [_vehicle] call xpdb_generate_fnc_cargoData];
    _data set ["id", [_vehicle] call xpdb_generate_fnc_vehicleID];
    _data set ["posDir", [_vehicle] call xpdb_generate_fnc_posDirData];
    _data set ["fuel", fuel _vehicle];
    _data set ["damage", damage _vehicle];

    _nearbyVehicles set [format ["vehicle.%1", _forEachIndex], _data];
} forEach _vehicles;

_nearbyVehicles