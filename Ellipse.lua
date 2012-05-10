Ellipse = class()

function Ellipse:init(pos,size,borderWidth,borderColor,ellipseColor)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "Ellipse"
    self.pos = pos
    self.size = size
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.ellipseColor = ellipseColor
    self.masterWin = nil
end

function Ellipse:draw()
    -- Codea does not automatically call this method
    pushStyle()
    strokeWidth(self.borderWidth)
    stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
    fill(self.ellipseColor.x,self.ellipseColor.y,self.ellipseColor.z,self.ellipseColor.a)
    local realX = (self.pos.x+self.masterWin.canvusPosStart.x)
    local realY = (self.pos.y+self.masterWin.canvusPosStart.y)
    ellipse(realX,realY,self.size.x,self.size.y)
    popStyle()
end

function Ellipse:touched(touch)
    -- Codea does not automatically call this method
end

------------------------------------------

function Ellipse:setMaster(masterWin)
    self.masterWin = masterWin
end

function Ellipse:setID(id)
    self.id = id
end