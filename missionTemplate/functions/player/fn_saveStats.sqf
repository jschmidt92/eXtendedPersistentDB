private _statsData = createHashMap;

_statsData set ["kills", player getVariable ["TAG_Kills", 0]];
_statsData set ["deaths", player getVariable ["TAG_Deaths", 0]];
_statsData set ["rating", player getVariable ["TAG_Rating", 0]];

_statsData