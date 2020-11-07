Level = Class{}

function Level:init()
    self.x = 1
  

end

function Level:update(dt)
    if scrolling then
        mountainsScroll = (mountainsScroll + MOUNTAINS_SCROLL_SPEED * dt) % MOUNTAINS_LOOPING_POINT
    end
end



function Level:render()
    love.graphics.draw(gTextures['background'], 0, 0)
    love.graphics.draw(gTextures['mountainFar'], -mountainFarScroll, 0)
    love.graphics.draw(gTextures['mountains'], -mountainsScroll, 0)
    
    for i = 1, 15 do
      love.graphics.draw(gTextures['ground'], VIRTUAL_WIDTH-(20*i), VIRTUAL_HEIGHT-35, 0, 0.3)
      love.graphics.draw(gTextures['ground'], VIRTUAL_WIDTH-(20*i), VIRTUAL_HEIGHT-16, 0, 0.3)
    end
end