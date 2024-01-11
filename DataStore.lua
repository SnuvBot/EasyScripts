-- Constants
local DATASTORE_KEY = "PlayerDataKey"

-- Function to save player data to DataStore
local function savePlayerData(player)
    local playerData = player:FindFirstChild("PlayerData")
    if playerData then
        pcall(function()
            game:GetService("DataStoreService"):GetDataStore(DATASTORE_KEY):SetAsync(tostring(player.UserId), playerData.Value)
        end)
    end
end

-- Function to load player data from DataStore
local function loadPlayerData(player)
    local playerData = player:FindFirstChild("PlayerData")
    if playerData then
        pcall(function()
            local success, result = game:GetService("DataStoreService"):GetDataStore(DATASTORE_KEY):GetAsync(tostring(player.UserId))
            playerData.Value = (success and result) or 0
        end)
    end
end
