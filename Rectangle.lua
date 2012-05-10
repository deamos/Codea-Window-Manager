Rectangle = class()

function Rectangle:init(pos,size,borderWidth,borderColor,rectColor)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "Rectangle"
    self.pos = pos
    self.size = size
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.rectColor = rectColor
    self.masterWin = nil
end

function Rectangle:draw()
    -- Codea does not automatically call this method
    pushStyle()
    strokeWidth(self.borderWidth)
    stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
    fill(self.rectColor.x,self.rectColor.y,self.rectColor.z,self.rectColor.a)
    local realX = (self.pos.x+self.masterWin.canvusPosStart.x)
    local realY = (self.pos.y+self.masterWin.canvusPosStart.y)
    rect(realX,realY,self.size.x,self.size.y)
    popStyle()
end

function Rectangle:touched(touch)
    -- Codea does not automatically call this method
end

-------------------------------------------------

function Rectangle:setMaster(masterWin)
    self.masterWin = masterWin
end

function Rectangle:setID(id)
    self.id = id
end