PlayState = Class{__includes = BaseState}

function PlayState:init()
    
    self.level = Level
    
    self.gravityOn = true
    self.gravityAmount = 6

    self.player = Player({
        x = 0, y = 0,
        width = 16, height = 20,
        texture = 'player-run',
        stateMachine = StateMachine 
        {
            ['running'] = function() return PlayerRunningState(self.player) end,
            ['jumping'] = function() return PlayerJumpingState(self.player, self.gravityAmount) end,
            ['falling'] = function() return PlayerFallingState(self.player, self.gravityAmount) end
        }
    })
  
    self.timer = math.random(2,4)*1.25

    self.player:changeState('running')
    
    self.rocks = {}--RockSpawner()
    self.score = 0
end


function PlayState:update(dt)
    Timer.update(dt)

    self.timer = self.timer + dt 
     
    -- update player and level
    self.player:update(dt)
    self.level:update(dt)
    --self.rocks:update(dt)
    if self.timer > 5 then
      table.insert(self.rocks, RockSpawner())
      self.timer = math.random(2,3)*1.25
    end
    
    for k, rock in pairs(self.rocks) do
        -- score a point if the pipe has gone past the bird to the left all the way
        -- be sure to ignore it if it's already been scored
        if not rock.scored then
            if rock.x + rock.rock.width < self.player.x + 50 then
                self.score = self.score + 1
                rock.scored = true
                gSounds['score']:play()
            end
        end
        
        if self.player.x + self.player.width + 40 >= rock.x then
          rock.hasHit = true
        end
        
        if not rock.hasHit and self.player.x + self.player.width + 60 >= rock.x and self.player.y + 113 + 3 >= rock.y  then
          --self.score =self.score + 1
          scrolling = false
          rock.hasHit = true
          gSounds['hurt']:play()
          gStateMachine:change('score', {score = self.score})
        end
        
        rock:update(dt)
    end
    
    for k, rock in pairs(self.rocks) do
        if rock.remove then
            table.remove(self.rocks, k)
        end
    end
    
end

function PlayState:render()
    love.graphics.push()
    
    self.level:render()
    
     self.player:render()
    for k, rock in pairs(self.rocks) do
        rock:render()
        --love.graphics.print('Rock Y: ' .. tostring(self.rocks[1].y), 8, 16)
    end
    
    
   
    
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)
    
    
 
    
    love.graphics.pop()
    
    
end