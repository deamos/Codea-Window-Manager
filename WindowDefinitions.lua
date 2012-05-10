function exampleWindows()  
    --Window Configuration Example
    windowPos = vec2((WIDTH/2)-150,(HEIGHT/2))
    windowSize = vec2(300,300)
    windowColor = vec4(255,255,255,255)
    windowBorderSize = 3
    windowBorderColor = vec4(1,1,1,255)
    newWin = Window(windowPos,windowSize,windowColor,windowBorderSize,windowBorderColor)
    
    windowTitle = "Window 1"
    windowTitleColor = vec3(255,255,255)
    windowTitleBGColor = vec4(10,10,10,255)
    newWin:addTitle(windowTitle,windowTitleColor,windowTitleBGColor)
    newWin:setCanMove(true)
    newWin:setID("masterWindow")
    newWin:open()
    
    displayText = "Test"
    pos = vec2(150,150)
    size = 30
    color = vec4(0,100,0,255)
    fnt = "Baskerville"
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Txt1")
    newWin:addAttachment(newTextBox)
    
    img = "Planet Cute:Gem Blue"
    pos = vec2(20,250)
    size = vec2(32,58)
    tinting = vec4(255,255,255,255)
    newSprite=Sprite(img,pos,size,tinting)
    newWin:addAttachment(newSprite)
    
    pos = vec2(3,220)
    size = vec2(35,43)
    touchState = BEGAN
    --Please use the masterWin variable to pass the Window instance vars
    --See ExtraFunctions for an example
    func = "funct1(masterWin)"
    newTouchBox = TouchBox(pos,size,touchState,func)
    newTouchBox:setDebugDraw(false)
    newWin:addAttachment(newTouchBox)
    
    pos = vec3(10,10)
    fntsize = 30
    color = vec4(0,0,0,255)
    fnt = "Baskerville"
    mode = CORNER
    align = LEFT
    size = vec2(100,30)
    maxLen = 8
    borderWidth = 2
    borderColor= vec4(0,0,0,255)
    bgColor = vec4(255,255,255,0)
    newTxtInput = TextInput(pos,fntsize,color,fnt,size,maxLen,mode,align,borderWidth,borderColor,bgColor)
    
    newTxtInput:setID("textinput1")
    newWin:addAttachment(newTxtInput)
    
    pos = vec2(50,50)
    size = vec2(90,50)
    borderWidth = 2
    borderColor = vec4(255,0,0,255)
    rectColor = vec4(0,0,0,0)
    newRectangle = Rectangle(pos,size,borderWidth,borderColor,rectColor)
    newWin:addAttachment(newRectangle)
    
    pos = vec2(100,130)
    size = vec2(50,50)
    borderWidth = 1
    borderColor = vec4(255,0,0,255)
    ellipseColor = vec4(0,0,0,70)
    newEllipse = Ellipse(pos,size,borderWidth,borderColor,ellipseColor)
    newWin:addAttachment(newEllipse)
    
    start=vec2(30,100)
    stop = vec2(80,80)
    lineMode=ROUND
    lineWidth = 6
    lineColor = vec4(0,255,0,255)
    
    newLine = Line(start,stop,lineMode,lineWidth,lineColor)
    newWin:addAttachment(newLine)
end

function setupWindows()

    windowPos = vec2(0,HEIGHT*.6)
    windowSize = vec2(WIDTH*.35,(HEIGHT*.4))
    windowColor = vec4(255,255,255,255)
    windowBorderSize = 3
    windowBorderColor = vec4(255,255,255,190)
    newWin = Window(windowPos,windowSize,windowColor,windowBorderSize,windowBorderColor)
    
    windowTitle = "Examples Menu"
    windowTitleColor = vec3(255,255,255)
    windowTitleBGColor = vec4(10,10,10,255)
    newWin:addTitle(windowTitle,windowTitleColor,windowTitleBGColor)
    newWin:setID("mainMenu")
    newWin:setCanClose(false)
    newWin:open()
    
    displayText = "Example 1: Normal Window"
    pos = vec2(windowSize.x * .5, windowSize.y*.90)
    size = 22
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Futura-CondensedMedium")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Option1")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .1, windowSize.y*.85)
    size = vec2(windowSize.x * .80, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setDebugDraw(true)
    newTouchBox:setFunc(BEGAN,"option1()")
    newWin:addAttachment(newTouchBox)
    
    displayText = "Example 2: Non-Moving Window"
    pos = vec2(windowSize.x * .5, windowSize.y*.80)
    size = 22
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Futura-CondensedMedium")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Option2")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .05, windowSize.y*.75)
    size = vec2(windowSize.x * .90, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setDebugDraw(true)
    newTouchBox:setFunc(BEGAN,"option2()")
    newWin:addAttachment(newTouchBox)
    
    displayText = "Example 3: Window With Text Input"
    pos = vec2(windowSize.x * .5, windowSize.y*.70)
    size = 22
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Futura-CondensedMedium")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Option3")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .01, windowSize.y*.65)
    size = vec2(windowSize.x * .98, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setFunc(BEGAN,"option3()")
    newTouchBox:setDebugDraw(true)
    newWin:addAttachment(newTouchBox)
    
    displayText = "Example 4: Sprites and Images"
    pos = vec2(windowSize.x * .5, windowSize.y*.60)
    size = 22
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Futura-CondensedMedium")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Option4")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .08, windowSize.y*.55)
    size = vec2(windowSize.x * .84, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setFunc(BEGAN,"option4()")
    newTouchBox:setDebugDraw(true)
    newWin:addAttachment(newTouchBox)
    
    displayText = "Example 5: Touch Objects"
    pos = vec2(windowSize.x * .5, windowSize.y*.50)
    size = 22
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Futura-CondensedMedium")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Option5")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .15, windowSize.y*.45)
    size = vec2(windowSize.x * .70, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setFunc(BEGAN,"option5()")
    newTouchBox:setDebugDraw(true)
    newWin:addAttachment(newTouchBox)
    
    displayText = "Example 6: Altering Values"
    pos = vec2(windowSize.x * .5, windowSize.y*.40)
    size = 22
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Futura-CondensedMedium")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("Option6")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .13, windowSize.y*.35)
    size = vec2(windowSize.x * .74, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setFunc(BEGAN,"option6()")
    newTouchBox:setDebugDraw(true)
    newWin:addAttachment(newTouchBox)
    
    displayText = "Quit"
    pos = vec2(windowSize.x * .5, windowSize.y*.20)
    size = 28
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("HelveticaNeue-CondensedBold")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("ExitOption")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .40, windowSize.y*.15)
    size = vec2(windowSize.x * .21, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setFunc(ENDED,"close()")
    newTouchBox:setDebugDraw(true)
    newWin:addAttachment(newTouchBox)
    
    displayText = "About Codea Window Library"
    pos = vec2(windowSize.x * .5, windowSize.y*.05)
    size = 20
    fill(238, 5, 5, 255)
    color = vec4(fill())
    font("HelveticaNeue-CondensedBlack")
    fnt=font()
    resetStyle()
    mode = CENTER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setID("AboutName")
    newWin:addAttachment(newTextBox)
    
    pos = vec2(windowSize.x * .02, windowSize.y*.005)
    size = vec2(windowSize.x * .95, windowSize.y*.1)
    newTouchBox = TouchBox(pos,size)
    newTouchBox:setFunc(BEGAN,"aboutNameFunct()")
    newTouchBox:setDebugDraw(true)
    newWin:addAttachment(newTouchBox)
   
end

function option1()
    windowPos = vec2((WIDTH*.05),100)
    windowSize = vec2(700,300)
    windowColor = vec4(255,255,255,255)
    windowBorderSize = 3
    windowBorderColor = vec4(1,1,1,255)
    newWin = Window(windowPos,windowSize,windowColor,windowBorderSize,windowBorderColor)
    
    windowTitle = "Example 1"
    windowTitleColor = vec3(255,255,255)
    windowTitleBGColor = vec4(10,10,10,255)
    newWin:addTitle(windowTitle,windowTitleColor,windowTitleBGColor)
    newWin:setCanMove(true)
    newWin:setID("Option1Window")
    newWin:open()
    
    displayText = "• This is an example of a basic window you can create using the Codea Library."
    pos = vec2(10,250)
    size = 20
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Noteworthy-Light")
    fnt = font()
    resetStyle()
    mode = CORNER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    --newTextBox:setID("Txt1")
    newWin:addAttachment(newTextBox)
    
    displayText = "• A window is created by creating a Window() Object"
    pos = vec2(10,230)
    size = 20
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Noteworthy-Light")
    fnt = font()
    resetStyle()
    mode = CORNER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    --newTextBox:setID("Txt1")
    newWin:addAttachment(newTextBox)
    
    displayText = "Example: windowObj = Window(windowPos,windowSize,windowColor,windowBorderSize,windowBorderColor)"
    pos = vec2(10,200)
    size = 13
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Courier")
    fnt = font()
    resetStyle()
    mode = CORNER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setTextWrap(700)
    newWin:addAttachment(newTextBox)
    
        displayText = "· By default newly created windows can move, do not have a title bar, and are closed."
    pos = vec2(10,185)
    size = 14
    fill(0, 0, 0, 255)
    color = vec4(fill())
    font("Didot")
    fnt = font()
    resetStyle()
    mode = CORNER
    align = LEFT
    newTextBox = TextBox(displayText,pos,size,color,fnt,mode,align)
    newTextBox:setTextWrap(700)
    newWin:addAttachment(newTextBox)
    
    WinHandle:addWindow(newWin)
end