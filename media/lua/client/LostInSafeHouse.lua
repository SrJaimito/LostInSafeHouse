require "SafeHouseItemsList"

local safeHouseItemsList = {}
local listIsShowing = false

local function LISH_OnKeyPressed(keycode)
    -- Check if user pressed hyphen key
    if keycode == 53 then
        if not listIsShowing then
            safeHouseItemsList = SafeHouseItemsList:new(300, 300, 500, 500);
            safeHouseItemsList:initialise();
            safeHouseItemsList:addToUIManager();
        else
            safeHouseItemsList:setVisible(false);
            safeHouseItemsList:removeFromUIManager();
        end

        listIsShowing = not listIsShowing
    end
end

Events.OnKeyPressed.Add(LISH_OnKeyPressed)
