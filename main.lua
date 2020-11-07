require 'src/Dependencies'

function love.load()
    -- initialize our nearest-neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')
    
    -- seed the RNG
    math.randomseed(os.time())

    -- app window title
    love.window.setTitle('Some Game')

     gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['countdown'] = function() return CountdownState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end
        --['play'] = function() return PlayState() end
    }
    gStateMachine:change('title')

    gSounds['music']:setLooping(true)
    gSounds['music']:setVolume(0.5)
    gSounds['music']:play()
    
    
    -- initialize our virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })

  
    love.keyboard.keysPressed = {}

    -- initialize mouse input table
    --love.mouse.buttonsPressed = {}
end

function love.resize(w, h)
    push:resize(w, h)
end



function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    elseif key == 'p' then
      --love.graphics.draw(pause, 300, 100)
      if scrolling == true then
        scrolling = false
      elseif scrolling == false then
        scrolling = true
      end
    end
end


function love.update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    gStateMachine:render()
    --love.graphics.draw(gTextures['flags'], gFrames['flags'][1], 0,0)
    push:finish()
end
--[[
    LÖVE2D callback fired each time a mouse button is pressed; gives us the
    X and Y of the mouse, as well as the button in question.



function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end


--local medal1 = love.graphics.newImage('medal1.png')
function love.update(dt)
    
    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    
    
    push:finish()
end

]]