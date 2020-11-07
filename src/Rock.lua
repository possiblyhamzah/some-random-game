Rock = Class{}

-- since we only want the image loaded once, not per instantation, define it externally
--local PIPE_IMAGE = love.graphics.newImage('pipe.png')

function Rock:init()
    self.x = VIRTUAL_WIDTH + 64
    self.y = VIRTUAL_HEIGHT-47

    self.width = 23
    self.height = 16

    
end

function Rock:update(dt)
    self.x = self.x + ROCK_SCROLL * dt
end

function Rock:render()
    love.graphics.draw(gTextures['rock'], self.x, self.y)
end
