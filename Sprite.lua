Sprite = class()

function Sprite:init(img,pos,size,tinting)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "Sprite"
    self.img = img
    self.pos = pos
    self.size = size
    self.tinting = tinting
    self.masterWin = nil
end

function Sprite:draw()
    pushStyle()
    tint(self.tinting.x,self.tinting.y,self.tinting.z,self.tinting.a)
    local realX = (self.pos.x+self.masterWin.canvusPosStart.x)
    local realY = (self.pos.y+self.masterWin.canvusPosStart.y)
    sprite(self.img,realX,realY,self.size.x,self.size.y)
    popStyle()
    
end

function Sprite:touched(touch)
    -- Codea does not automatically call this method
end

-----------------------------------------------

function Sprite:setMaster(masterWin)
    self.masterWin = masterWin
end

function Sprite:setID(id)
    self.id = id
end
