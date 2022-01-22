require "ISUI/ISPanel"

SafeHouseItemsList = ISPanel:derive("SafeHouseItemsList");

function SafeHouseItemsList:initialise()
    ISPanel.initialise(self);
    self:create();
end

function SafeHouseItemsList:prerender()
    ISPanel.prerender(self);
end

function SafeHouseItemsList:render()
end

function SafeHouseItemsList:create()
    self.itemsList = ISScrollingListBox:new(10, 10, self:getWidth() - 20, self:getHeight() - 20)
    self.itemsList:initialise();
    self.itemsList:instantiate();

    self.itemsList.itemheight = 30;
    self.itemsList.joypadParent = self;
    self.itemsList.font = UIFont.Small;
    self.itemsList.drawBorder = true;

    for i = 1, 50 do
        self.itemsList:addItem("Item " .. i, nil)
    end

    self:addChild(self.itemsList);
end

function SafeHouseItemsList:new(x, y, width, height)
    self.width = width
    self.height = height

    local o = {};
    o = ISPanel:new(x, y, width, height);
    setmetatable(o, self);
    self.__index = self;

    return o;
end
