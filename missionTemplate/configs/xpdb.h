class CfgXPDB {
    class save {
        class playerStats { // XPDB_ARMADBCORE.0.playerStats
            function = "TAG_player_fnc_saveStats";
            args[] = {};
        };
        class world { // XPDB_ARMADBCORE.0.world
            function = "TAG_world_fnc_saveNearbyVehicles";
            args[] = {};
        };
    };
    class load {
        class playerStats { // XPDB_ARMADBCORE.0.playerStats
            function = "TAG_player_fnc_loadStats";
            args[] = {};
        };
        class world { // XPDB_ARMADBCORE.0.world
            function = "TAG_world_fnc_loadNearbyVehicles";
            args[] = {};
        };
    };
};