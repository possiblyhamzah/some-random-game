--
-- libraries
--
Class = require 'lib/class'
push = require 'lib/push'
Timer = require 'lib/knife.timer'

--
-- our own code
--

-- utility
require 'src/constants'
require 'src/StateMachine'
require 'src/Util'

-- game states
require 'src/states/BaseState'
require 'src/states/game/PlayState'
require 'src/states/game/ScoreState'
require 'src/states/game/TitleScreenState'
require 'src/states/game/CountdownState'
--require 'src/states/game/StartState'

-- entity states
require 'src/states/entity/PlayerFallingState'
require 'src/states/entity/PlayerJumpingState'
require 'src/states/entity/PlayerRunningState'

-- general
require 'src/Animation'
require 'src/Entity'
require 'src/Rock'
require 'src/Level'
require 'src/Player'
require 'src/RockSpawner'



gSounds = 
{
    ['jump'] = love.audio.newSource('sounds/jump.wav', 'static'),
    ['death'] = love.audio.newSource('sounds/death.wav', 'static'),
    ['music'] = love.audio.newSource('sounds/music.mp3', 'static'),
    ['powerup-reveal'] = love.audio.newSource('sounds/powerup-reveal.wav', 'static'),
    ['pickup'] = love.audio.newSource('sounds/pickup.wav', 'static'),
    ['empty-block'] = love.audio.newSource('sounds/empty-block.wav', 'static'),
    ['kill'] = love.audio.newSource('sounds/kill.wav', 'static'),
    ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
    ['hurt'] = love.audio.newSource('sounds/hurt.wav', 'static'),
    ['kill2'] = love.audio.newSource('sounds/kill2.wav', 'static')
}
gTextures = 
{
    ['background'] = love.graphics.newImage('graphics/parallax-mountain-bg.png'),
    ['mountainFar'] = love.graphics.newImage('graphics/parallax-mountain-montain-far.png'),
    ['mountains'] = love.graphics.newImage('graphics/parallax-mountain-mountains.png'),
    ['player-run'] = love.graphics.newImage('graphics/SteamMan_run.png'),
    ['player-jump'] = love.graphics.newImage('graphics/SteamMan_jump.png'),
    ['ground'] = love.graphics.newImage('graphics/ground.png'),
    ['rock'] = love.graphics.newImage('graphics/rock.png')
}

gFrames = 
{
    
    ['player-run'] = GenerateQuads(gTextures['player-run'], 48, 48),
    ['player-jump'] = GenerateQuads(gTextures['player-jump'], 48, 48)
}

-- these need to be added after gFrames is initialized because they refer to gFrames from within


gFonts = 
{
    ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
    ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
    ['large'] = love.graphics.newFont('fonts/font.ttf', 32),
    ['title'] = love.graphics.newFont('fonts/font.ttf', 32)
}