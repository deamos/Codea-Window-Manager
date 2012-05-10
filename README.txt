Codea Window Library v.5 (5/5/2012)
----------------------------------------------

This Library is a work in progess.  Any suggestions or bugs, please notify me at deamos@divby0.net

Purpose: To create a useable framework for creating GUIs rapidly in Codea similar to the MS Windows or OS X.

Supports: 
Text Boxes, Sprite Drawing, Text Input Boxes, Touch Boxes, Standard Codea Drawing functions (Line, Ellipse, Rectangles)

Todo:
1) Add the ability to push/pop Window Attachments, allowing them to be changed quickly without having to create a new window
2) Create a standard set of iOS-like attachments (Sliders, multi-selection buttons, etc)
3) Better handling of Window Touches (Being able to drag attachments around, add touch support to most standard attachments instead of using the TouchBox Class)
4) Overall Code Optimization


Class Definitions
----------------------------------------------
WindowHandler()

Functions:
-WindowHandler:init()
--self.list = list: This is the list that contains all added Windows

-WindowHandler:touch(touch)
--Passes all Touch events to every open window

-WindowHandler:addWindow(win)
--win: object 
--Adds a created window object to the Window Handler.  Do this when you are done creating a window.

-WindowHandler:removeWindow(id)
--id: string - id of the window to be removed
--Use this to remove a window completely from the Window Handler based on a set ID

Window()

Variables:
-self.id = String: This can be used to uniquely identify the window when searching.
-self.pos = vec2(x,y): X and Y position of the Bottom Left Corner of where the window will be drawn after calling Window:open()
-self.size = vec2(x,y): X and Y size values of the window.
-self.color = vec4(x,y,z,a): Color of the main Window.
-self.borderSize = INT: Value for the size of the window's border
-self.borderColor = vec4(x,y,z,a): Color of the border
-self.hasTitle = bool: Does the window have the top title bar. Defaults to False
-self.title = String: Text to be displayed in the Title Bar if it is drawn
-self.titleColor = vec3(x,y,z): Color of the Text in the Title Bar
-self.titleBarColor = vec3(x,y,z): Color of the Title Bar
-self.hasButtons = bool: If the Title Bar is Drawn, Are the Minimize/Close Buttons Shown. Defaults to true.
-self.canClose = bool: Can the window be closed. If set to false, The close button will not be drawn.  Defaults to true.

-self.canvusSize = vec2(x,y): Sets the size for the attachment canvus. Used mostly to determine relative X,Y coords for Attachments
-self.canvusPosStart = vec2(x,y): Global start point for the attachment canvus.
-self.canvusPosEnd = vec2(x,y): Global End point for the attachment canvus.

-self.isActive = bool: Is the window minimized or active.  Defaults to true (Maximized)
-self.isOpen = bool: Is the window opened or closed. To open, call Window:open().  Defaults to false.

-self.canMove = bool: Can the window move or not.  Defaults to false.
-self.lastTouchBegan = bool: Internal variable used for handling window touches.
-self.moving = bool: Internal variable to determine if the window is currently moving.

-self.attachments = list: All window attachments are stored here.

Functions:
-Window:init(winPos,winSize,winColor,windowBorderSize,windowBorderColor)
--winPos: vec2(x,y) - Sets self.pos. Starting Position for window.
--winSize: vec2(x,y) - Sets self.size. Window Sizing.
--winColor: vec4(x,y,z,a) - Sets self.volor. Window Color
--windowBorderSize: int - Sets self.borderSize
--windowBorderColor: vec4(x,y,z,a) - Sets the color of the border

-Window:addTitle(title,titleColor,titleBarColor)
--title: string - Sets self.title
--titleColor: vec3(x,y,z) - Title Color. Sets self.titleColor
--titleBarColor: vec3(x,y,z) - Title Bar Color. Sets self.titleBarColor
*Note, This also automatically sets self.hasTitle to True

-Window:setCanMove(value)
--value: bool - Sets the self.canMove variable to value.

-Window:setCanClose(value)
--value: bool - Sets the self.canClose Variable to value.

-Window:drawIfOpen()
*****Use this to draw the window if you do not use the window handler.  This will only draw if self.isOpen == true.*****

-Window:open() and Window:close()
--Opens and closes the Window by setting self.isOpen.

-Window:minMaxtoggle()
--Used for toggling between the active/maximized and inactive/minimized states

-Window:addAttachment(attachment)
--attachment: object - This is an attachment object that will get added to the attachment/canvus surface.
**Use this function each time you want to add a new object to the window.
Ex: Window:addAttachment(textBoxObject)

-Window:setID(id)
-id: string - String identifier for the Window.  Sets self.id.

----------------------------------------------------------
Window Creation Example

-- Use this function to perform your initial setup
function setup()

	displayMode(FULLSCREEN)   

	--Creates Main Window Handler  
	WinHandle = WindowHandler() 
    
	--Sets up Windows based off of defined windows in setupWindows() 
	--Found in WindowDefinitions tab in this Example 
	setupWindows()
    
	--Adds the Window to the main Window Handler  
	WinHandle:addWindow(newWin)
  
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

end

---------------------------------------------------------
Window Drawing

function draw()
    -- This sets a dark background color 
    background(69, 69, 69, 255)

    --Cycles Through All Windows attached to the Window Handler
    --and Draws Windows which has their isOpen variable set to true
    WinHandle:draw()
    
end

----------------------------------------------------------
Window Handling Touches

function touched(touch)
    --Cycles through all windows and 
    WinHandle:touched(touch)
end

----------------------------------------------------------
Extra Window Stuff

***NOTE***
**I recommend adding this function to your program if you plan on handling text input boxes**
-This is in to help manage the way Text Input boxes are programmed without overwriting other text input boxes.

function keyboard(key)
    --Handles Keyboard Input Ending Correctly.
    --This must be any program that handles a Text Input Box
    
    if key == RETURN then
        hideKeyboard()
        lastKey = RETURN
    else
        lastKey = key
    end
end


-------------------------------------------------------------------------------------------
Attachment Classes
-------------------------------------------------------------------------------------------
More to add here soon...

