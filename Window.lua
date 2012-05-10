Window = class()

function Window:init(winPos,winSize,winColor,windowBorderSize,windowBorderColor)
    -- Appearance Values
    self.id = ""
    self.pos = winPos
    self.size = winSize
    self.color = winColor
    self.borderSize = windowBorderSize
    self.borderColor = windowBorderColor
    self.hasTitle = false
    self.title = nil
    self.titleColor = vec3(255,255,255)
    self.titleBarColor = vec3(255,255,255)
    self.hasButtons = true
    self.canClose = true
    
    --Canvus Values
    self.canvusSize= vec2(self.pos.x,self.pos.y*.95)
    self.canvusPosStart = vec2(self.pos.x,self.pos.y)
    self.canvusPosEnd = vec2(self.canvusPosStart.x + self.canvusSize.x,self.canvusPosStart.y+self.canvusSize.y)
    
    -- Active Window Values
    self.isActive = true
    self.isOpen = false
    
    -- Movement Values
    self.canMove = false
    self.lastTouchBegan = nil
    self.moving = false
    
    -- Attachment Data
    self.attachments = {}
end

function Window:draw()
    
    --Updates Canvus to keep Attachments in place during movement
    self.canvusPosStart = vec2(self.pos.x,self.pos.y)
    self.canvusPosEnd = vec2(self.canvusPosStart.x + self.canvusSize.x,self.canvusPosStart.y+self.canvusSize.y)
    
    --Draw Main Window
    if self.isActive == true then
        
        pushStyle()
        strokeWidth(self.borderSize)
        stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
        fill(self.color.x,self.color.y,self.color.z,self.color.a)
        rect(self.pos.x,self.pos.y,self.size.x,self.size.y)
        popStyle()
        -- Draw all Attachments
        for i,v in ipairs(self.attachments) do
            v:draw()
        end
    end
    
    if self.hasTitle == true then
        local titleBarPosX = self.pos.x
        local titleBarPosY = ((self.pos.y+(self.size.y*.95)))
        local titleBarSizeX = self.size.x
        local titleBarSizeY = 20
        
        -- Draw Window Title Bar
        pushStyle()
        strokeWidth(self.borderSize)
        stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
        fill(self.titleBarColor.x,self.titleBarColor.y,self.titleBarColor.z,self.titleBarColor.a)
        rect(titleBarPosX,titleBarPosY,titleBarSizeX,titleBarSizeY)
        popStyle()
        
        -- Draw Window Title Bar Text
        pushStyle()
        fill(self.titleColor.x,self.titleColor.y,self.titleColor.z)
        text(self.title,titleBarPosX+(titleBarSizeX/2),titleBarPosY+(titleBarSizeY/2))
        popStyle()
        
        if self.hasButtons == true then
            -- Draw Open/Close Buttons
            if self.canClose == true then
                local closeButtonPosX = titleBarPosX + (titleBarSizeX*.9)
                local closeButtonSizeX = titleBarSizeX * .1
                local closeButtonPosY = titleBarPosY
                local closeButtonSizeY = titleBarSizeY
        
                pushStyle()
                strokeWidth(self.borderSize)
                stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
                fill(0, 0, 0, 255)
                rect(closeButtonPosX,closeButtonPosY,closeButtonSizeX, closeButtonSizeY)
                fill(255, 255, 255, 255)
                text("X",closeButtonPosX+(closeButtonSizeX/2),closeButtonPosY+(closeButtonSizeY/2))
                popStyle()
            end
        
            --Draw Minimize Button
            local minButtonPosX = titleBarPosX + (titleBarSizeX*.8)
            local minButtonSizeX = titleBarSizeX * .1
            local minButtonPosY = titleBarPosY
            local minButtonSizeY = titleBarSizeY
        
            pushStyle()
            strokeWidth(self.borderSize)
            stroke(self.borderColor.x,self.borderColor.y,self.borderColor.z,self.borderColor.a)
            fill(0, 0, 0, 255)
            rect(minButtonPosX,minButtonPosY,minButtonSizeX, minButtonSizeY)
            fill(255, 255, 255, 255)
            text("-",minButtonPosX+(minButtonSizeX/2),minButtonPosY+(minButtonSizeY/2))
            popStyle()
        end
    end
end

function Window:touched(touch)
    
    -- Determine Window Title Bar Touch Points
    local barPosX = self.pos.x
    local barPosY = ((self.pos.y+(self.size.y*.9)))
    local barPosEndX = self.pos.x + self.size.x
    local barPosEndY = barPosY + (self.size.y*.1)
    local titleBarSizeX = self.size.x
    local titleBarSizeY = (self.size.y*.1)
    
    self.canvusPosStart = vec2(self.pos.x,self.pos.y)
    self.canvusPosEnd = vec2(self.canvusPosStart.x + self.canvusSize.x,self.canvusPosStart.y+self.canvusSize.y)
    
    local closeButtonPosX = barPosX + (titleBarSizeX*.9)
    local closeButtonPosEndX = closeButtonPosX + titleBarSizeX * .1
    local closeButtonPosY = barPosY
    local closeButtonPosEndY= closeButtonPosY + titleBarSizeY
    
    local minButtonPosX = barPosX + (titleBarSizeX*.8)
    local minButtonPosEndX = minButtonPosX + titleBarSizeX * .1
    local minButtonPosY = barPosY
    local minButtonPosEndY= minButtonPosY + titleBarSizeY
    
    --Check attachment touched functions
    if self.isActive and self.isOpen then
        for i,v in ipairs(self.attachments) do
            v:touched(touch)
        end
    end
    
    -- Check that touch is within Title Bar or moving
    if ((touch.x > barPosX and touch.x < barPosEndX) or self.moving == true) and self.canMove == true then
        if (touch.y > barPosY and touch.y < barPosEndY) or self.moving == true then
        
            if touch.state == BEGAN then
                self.lastTouchBegan=vec2(touch.x,touch.y)
                self.moving = true
        
            elseif touch.state == MOVING and self.moving == true then
            -- set a began point and then take the measurement
                local xDiff = touch.x - self.lastTouchBegan.x
                local yDiff = touch.y - self.lastTouchBegan.y
                self.pos.x = self.pos.x + xDiff
                self.pos.y = self.pos.y + yDiff
                self.lastTouchBegan = vec2(touch.x,touch.y)

            elseif touch.state == ENDED and self.moving == true then
                self.moving = false
            end
        end
    end
    
    if self.hasButtons == true then
   
     --Check that touch is within close Window Button
        if touch.x > closeButtonPosX and touch.x < closeButtonPosEndX and touch.state == BEGAN then
            if touch.y > closeButtonPosY and touch.y < closeButtonPosEndY then
                self:close()
            end
        elseif touch.x > minButtonPosX and touch.x < minButtonPosEndX and touch.state == BEGAN then
                if touch.y > minButtonPosY and touch.y < minButtonPosEndY then
                self:minMaxToggle()
            end
        end
    end
end
---------------------------------------------------------------

function Window:addTitle(title,titleColor,titleBarColor)
    self.hasTitle = true
    self.title = title
    self.titleColor = titleColor
    self.titleBarColor = titleBarColor
end

function Window:setCanMove(val)
    self.canMove = val
end

function Window:setCanClose(val)
    self.canClose = val
end

function Window:drawIfOpen()
    if self.isOpen == true then
        self:draw()
    end
end

function Window:open()
    self.isOpen = true
end

function Window:close()
    self.isOpen = false
end

function Window:minMaxToggle()
    self.isActive = not self.isActive
end

function Window:addAttachment(attachment)
    attachment:setMaster(self)
    table.insert(self.attachments,attachment)
end

function Window:setID(id)
    self.id = id
end
    

