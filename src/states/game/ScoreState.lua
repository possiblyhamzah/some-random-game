ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]

--local bronze = love.graphics.newImage('bronze.png')
--local silver = love.graphics.newImage('silver.png')
--local gold = love.graphics.newImage('gold.png')

function ScoreState:enter(params)
    self.score = params.score
    self.level = Level
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.isDown('return') then
        gStateMachine:change('countdown')
    end
    
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    --love.graphics.setFont(flappyFont)
    self.level:render()
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    --love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    
    --[[if self.score > 15 then
      love.graphics.draw(gold, 300, 100)
    elseif self.score > 10 then
      love.graphics.draw(silver, 300, 100)
    elseif self.score > 5 then
      love.graphics.draw(bronze, 300, 100)
    end]]
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end