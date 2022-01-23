require "SafeHouseItemsList"

local safeHouseItemsList = {}
local listIsShowing = false

local function LISH_OnKeyPressed(keycode)
    -- Check if user pressed hyphen key
    if keycode == 53 then
        if not listIsShowing then
            local player = getPlayer()
            local playerLocation = player:getCurrentSquare()
            local playerSafeHouse = SafeHouse.getSafeHouse(playerLocation)

            -- Are you in your safe house?
            if playerSafeHouse and (not SafeHouse.isSafeHouse(playerLocation, player:getUsername(), true)) then
                local core = getCore()
                local screenWidth = core:getScreenWidth()
                local screenHeight = core:getScreenHeight()

                local width = 400
                local height = screenHeight / 2
                local x = (screenWidth - width) / 2
                local y = (screenHeight - height) / 2

                safeHouseItemsList = SafeHouseItemsList:new(x, y, width, height);
                safeHouseItemsList:initialise();
                safeHouseItemsList:addToUIManager();
            end
        else
            safeHouseItemsList:setVisible(false);
            safeHouseItemsList:removeFromUIManager();
        end

        listIsShowing = not listIsShowing
    end
end

Events.OnKeyPressed.Add(LISH_OnKeyPressed)
