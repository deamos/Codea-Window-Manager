TextBox = class()

function TextBox:init(displayText,pos,size,color,fnt,mode,align)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "TextBox"
    self.displayText = displayText
    self.txtWrap = 0
    self.pos = pos
    self.size = size
    self.color = color
    self.fnt = fnt
    self.mode = mode
    self.align = align
    self.masterWin = nil
    
end

function TextBox:draw()
    -- Codea does not automatically call this method
    pushStyle()
    fill(self.color.x,self.color.y,self.color.z,self.color.a)
    fontSize(self.size)
    font(self.fnt)
    textMode(self.mode)
    textAlign(self.align)
    
    realTextX = (self.pos.x+self.masterWin.canvusPosStart.x)
    realTextY = (self.pos.y+self.masterWin.canvusPosStart.y)
    textWrapWidth(self.txtWrap)
    text(self.displayText,realTextX,realTextY)
    popStyle()
end

function TextBox:touched(touch)

end

------------------------------------------------

function TextBox:setMaster(masterWin)
    self.masterWin = masterWin
end

function TextBox:setID(id)
    self.id = id
end

function TextBox:setTextWrap(width)
    self.txtWrap = width
end


