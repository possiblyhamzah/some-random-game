RockSpawner = Class{}


function RockSpawner:init(y)
    -- flag to hold whether this pair has been scored (jumped through)
    self.scored = false
    self.hasHit = false
    -- initialize pipes past the end of the screen
    self.x = VIRTUAL_WIDTH + 32

    -- y value is for the topmost pipe; gap is a vertical shift of the second lower pipe
    self.y = VIRTUAL_HEIGHT - 47

    -- instantiate two pipes that belong to this pair
    self.rock = Rock()

    -- whether this pipe pair is ready to be removed from the scene
    self.remove = false
end

function RockSpawner:update(dt)
    if scrolling == true then
        if self.x > -self.rock.width then
          self.x = self.x + ROCK_SCROLL * dt
          self.rock.x = self.x
        else
          self.remove = true
        end
    end
    --self.rock:update(dt)
end

function RockSpawner:render()
    self.rock:render()
end