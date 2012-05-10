TouchBox = class()

function TouchBox:init(pos,size)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "TouchBox"
    self.pos = pos
    self.size = size
    self.beganFunc = nil
    self.movingFunc = nil
    self.endedFunc = nil
    self.masterWin = nil
    
    self.debug = false
end

function TouchBox:draw()
    -- Codea does not automatically call this method
    if self.debug == true then
        local realX = (self.pos.x+self.masterWin.canvusPosStart.x)
        local realY = (self.pos.y+self.masterWin.canvusPosStart.y)
        pushStyle()
        strokeWidth(2)
        stroke(255, 30, 0, 255)
        fill(127, 127, 127, 0)
        rect(realX,realY,self.size.x,self.size.y)
        popStyle()
    end
end

function TouchBox:touched(touch)
    -- Codea does not automatically call this method
    local realX = (self.pos.x+self.masterWin.canvusPosStart.x)
    local realY = (self.pos.y+self.masterWin.canvusPosStart.y)
    local endX = realX + self.size.x
    local endY = realY + self.size.y
    masterWin = self.masterWin
    
    if touch.x >= realX and touch.x <= endX then
        if touch.y >= realY and touch.y <= endY then
            if touch.state == BEGAN and self.beganFunc ~= nil then
                exec=loadstring(self.beganFunc)
                exec()
            elseif touch.state == MOVING and self.movingFunc ~= nil then
                exec=loadstring(self.movingFunc)
                exec()
            elseif touch.state == ENDED and self.endedFunc ~= nil then
                exec=loadstring(self.endedFunc)
                exec()
            end
        end
    end
end

-------------------------------------------

function TouchBox:setMaster(masterWin)
    self.masterWin = masterWin
end

function TouchBox:setID(id)
    self.id = id
end

function TouchBox:setDebugDraw(bool)
    self.debug = bool
end

function TouchBox:setFunc(state,func)
    if state == BEGAN then
        self.beganFunc = func
    elseif state == MOVING then
        self.movingFunc = func
    elseif state == ENDED then
        self.endedFunc = func
    end
end
    