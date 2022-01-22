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
    self:drawText("Safe House Items", 10, 10, 1, 1, 1, 1, UIFont.Large)
end

function SafeHouseItemsList:create()
    local titleHeight = getTextManager():MeasureStringY(UIFont.Large, "Safe House Items") + 10

    self.itemsList = ISScrollingListBox:new(10, titleHeight + 20, self:getWidth() - 20, self:getHeight() - titleHeight - 30)
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
