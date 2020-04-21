--[[
  GD50 2018
  Pong Remake

  pong-2
  "The Rectangle Update"

  -- Main Program --

  Author: Colton Ogden


  Originally programmed by Atari in 1972.  Features 
  paddles.  Controlled by platers, with the goal to hit
  the ball past your opponent's edge.  Firtst to 10 wins.

  This version is built to more closely resemble
  the original pong machines or the Atari 2600 in
  resolution, though in widescreen (16:9) so it looks like
  modern systems.
]]

--Push is a library that will allow us to draw our game at a virtual
--resolution, instead of however large our window is; used to provide
--a more retro aesthetic
--
--https://github.com.Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

--[[
  Runs when the game first starts up, only once; used to initialize the game
]]
function love.load ()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  -- more "retro-looking" font object we can use for any text
  smallFont=love.graphics.newFont('font.ttf', 8)

  -- set LOVE2D's active font to the smallFont object
  love.graphics.setFont(smallFont)

  --initialize window with virtual resolution  
  push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT,{
    fullscreen = false, 
    resizable = false, 
    vsync = true
  })
end

--[[
  keyboard handling, called by LOVE2D each frame;
  passes in the key we pressed so we can access.
]]

function love.keypressed(key)
  -- keys can be access by string name
    if key == 'escape' then
      --function LOVE gives us to terminate application
      love.event.quit()
    end
  end

  --[[
    Called aftger update by LOVE2D, used to draw anything to the screen,
    updated or otherwise.
  ]]
function love.draw()
  -- begin rendering at virtual resolution
  push:apply('start')

  -- clear the screen with a specific color; in this case, a color similar
  -- to some versions of the original Pong
  love.graphics.clear(40,45,52,255)

  -- draw welcome text toward the top of the screen
  love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH,'center')

  --
  -- paddles are simply rectangles we draw on the screen at certain points,
  -- as is the ball
  --

  -- render first paddle (left side)
  love.graphics.rectangle('fill', 10, 30, 5, 20)

  -- render second paddle (right side)
  love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5)

  -- render ball (center)
  love.graphics.rectangle('fill', VIRTUAL_WIDTH /2-2, VIRTUAL_HEIGHT/2-2,4,4)

  -- end rendering at virtual resolution
  push:apply('end')
  end
  
  