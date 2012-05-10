TextInput = class()

function TextInput:init(pos,fntsize,color,fnt,size,maxLen,mode,align,borderWidth,borderColor,bgColor)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "TextBox"
    self.textOutput = " "
    self.pos = pos
    self.fntsize = fntsize
    self.color = color
    self.fnt = fnt
    self.mode = mode
    self.align = align
    self.size = size
    self.maxLen = maxLen
    self.borderWidth = borderWidth
    self.borderColor = borderColor
    self.bgColor = bgColor
    self.masterWin = nil
    self.isActive = false
    self.buffer = ""
    self.onEnterFunction = nil
    
end

function TextInput:draw()
    -- Codea does not automatically call this method
    local realTextX = (self.pos.x+self.masterWin.canvusPosStart.x)
    local realTextY = (self.pos.y+self.masterWin.canvusPosStart.y)
    
    if lastKey == RETURN and self.isActive == true then
        self.isActive = false
        if self.onEnterFunction ~= nil then
            exec=loadstring(self.onEnterFunction)
            exec()
        end
    end
        
    if self.isActive == true then
        self.buffer = keyboardBuffer()
        if lastKey ~= RETURN then
            local bufferLen = string.len(self.buffer)
            if bufferLen > self.maxLen then
                self.buffer = self.textOutput
            end
        end
    end
    
    if string.len(self.buffer) > 0 and self.isActive == true then
        self.textOutput = self.buffer
    end
    
    local bufferSize = textSize(self.textOutput)
    pushStyle()
    strokeWidth(self.borderWidth)
    stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
    fill(self.bgColor.x,self.bgColor.y,self.bgColor.z,self.bgColor.a)
    rect(realTextX,realTextY,self.size.x,self.size.y)
    popStyle()
    
    pushStyle()
    fill(self.color.x,self.color.y,self.color.z,self.color.a)
    fontSize(self.fntsize)
    font(fnt)
    textMode(self.mode)
    textAlign(self.align)
    text(self.textOutput,realTextX+3,realTextY + (self.size.y/self.fntsize))
    popStyle()
end

function TextInput:touched(touch)
        
    local realTextX = (self.pos.x+self.masterWin.canvusPosStart.x)
    local realTextY = (self.pos.y+self.masterWin.canvusPosStart.y)
    local endX = realTextX + self.size.x
    local endY = realTextY + self.size.y
    
    if touch.x >= realTextX and touch.x <= endX and touch.state == BEGAN then
        if touch.y >= realTextY and touch.y < endY then
            showKeyboard()
            self.textOutput = ""
            self.buffer = ""
            self.isActive = true
            lastKey = BACKSPACE
                
        end
    end
    
end

------------------------------------------

function TextInput:setMaster(masterWin)
    self.masterWin = masterWin
end

function TextInput:setID(id)
    self.id = id
end

function TextInput:setOnEnterFunction(func)
    self.onEnterFunction = func
end

