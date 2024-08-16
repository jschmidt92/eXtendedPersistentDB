params [["_statsData", createHashMap, [createHashMap]]];

{
    private _key = _x;
    private _value = _y;

    switch (_key) do {
        case "kills": { player setVariable ["TAG_Kills", _value, true] };
        case "deaths": { player setVariable ["TAG_Deaths", _value, true] };
        case "rating": { player setVariable ["TAG_Rating", _value, true] };
    };
} forEach _statsData;