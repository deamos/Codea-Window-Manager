

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

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(69, 69, 69, 255)

    --Cycles Through All Windows attached to the Window Handler
    --and Draws Windows which has their isOpen variable set to true
    WinHandle:draw()
    
end

function touched(touch)
    --Cycles through all windows and 
    WinHandle:touched(touch)
end

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
