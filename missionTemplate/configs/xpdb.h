class CfgXPDB {
    class save {
        class playerStats { // XPDB_ARMADBCORE.0.playerStats
            function = "TAG_player_fnc_saveStats";
            args[] = {};
            scheduled = 0;
        };
        class world { // XPDB_ARMADBCORE.0.world
            function = "TAG_world_fnc_saveNearbyVehicles";
            args[] = {};
            scheduled = 0;
        };
    };
    class load {
        class playerStats { // XPDB_ARMADBCORE.0.playerStats
            function = "TAG_player_fnc_loadStats";
            args[] = {};
            scheduled = 1;
        };
        class world { // XPDB_ARMADBCORE.0.world
            function = "TAG_world_fnc_loadNearbyVehicles";
            args[] = {};
            scheduled = 1;
        };
    };
};