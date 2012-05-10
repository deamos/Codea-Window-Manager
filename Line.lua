Line = class()

function Line:init(start,stop,lineMode,lineWidth,lineColor)
    -- you can accept and set parameters here
    self.id = ""
    self.objType = "Line"
    self.start = start
    self.stop = stop
    self.lineMode = lineMode
    self.lineWidth = lineWidth
    self.lineColor = lineColor
    self.masterWin = nil
end

function Line:draw()
    -- Codea does not automatically call this method
    pushStyle()
    smooth()
    lineCapMode(lineMode)
    strokeWidth(self.lineWidth)
    stroke(self.lineColor.x,self.lineColor.y,self.lineColor.z,self.lineColor.a)
    local realStartX = (self.start.x+self.masterWin.canvusPosStart.x)
    local realStartY = (self.start.y+self.masterWin.canvusPosStart.y)
    local realStopX = (self.stop.x+self.masterWin.canvusPosStart.x)
    local realStopY = (self.stop.y+self.masterWin.canvusPosStart.y)
    line(realStartX,realStartY,realStopX,realStopY)
    noSmooth()
    popStyle()
end

function Line:touched(touch)
    -- Codea does not automatically call this method
end

-------------------------------------------

function Line:setMaster(masterWin)
    self.masterWin = masterWin
end

function Line:setID(id)
    self.id = id
end
