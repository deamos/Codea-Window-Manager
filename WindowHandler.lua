WindowHandler = class()

function WindowHandler:init()
    -- you can accept and set parameters here
    self.list = {}
end

function WindowHandler:draw()
    for i,v in ipairs(self.list) do
        v:drawIfOpen()
    end
end

function WindowHandler:touched(touch)
    -- Codea does not automatically call this method
    for i,v in ipairs(self.list) do
        if v.isOpen == true then
            v:touched(touch)
        end
    end
end

-------------------------------------------------

function WindowHandler:addWindow(win)
    table.insert(self.list,win)
end

function WindowHandler:removeWindow(id)
    for i,v in ipairs(self.list) do
        if v.id == id then
            table.remove(self.list,i)
        end
    end
end