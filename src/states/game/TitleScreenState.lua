TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
    -- nothing
    self.level = Level
end

function TitleScreenState:update(dt)
    if love.keyboard.isDown('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
  self.level:render()
  love.graphics.setColor(0,0,0,1)
    love.graphics.setFont(gFonts['large'])
    
    
    love.graphics.printf('Some Random Game', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(1,1,1,1)
end
