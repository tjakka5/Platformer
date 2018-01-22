local Fluid = require("lib.fluid").init({
   useEvents = true
})
local Vector = require("lib.vector")

local Game = require("src.instances.game")

local C = require("src.components")
local S = require("src.systems")
local A = require("src.assemblages")

Game:addSystem(S.tileBreaker, "update")
Game:addSystem(S.tileBreaker, "mousepressed")
Game:addSystem(S.tileBreaker, "mousereleased")
Game:addSystem(S.physics, "update")

Game:addSystem(S.spriteRenderer, "draw")

local dirtTexture = love.graphics.newImage("assets/tiles/dirt.png")

for x = 1, 5 do
   local myTile = Fluid.entity()
   :give(C.transform, Vector(200 + x * 64, 200), Vector(32, 32))
   :give(C.sprite, dirtTexture, {255, 255, 255}, true)
   :give(C.breakable, {--[[tools]]}, 0.5, function(e)
      local transform = e:get(C.transform)
      local sprite    = e:get(C.sprite)

      e:destroy()

      local drop = Fluid.entity()
      drop:give(C.body, Vector(love.math.random(-200, 200), love.math.random(-100, -200)))

      drop:give(C.transform, transform.position, Vector(16, 16))
      drop:give(C.sprite, sprite.texture, sprite.color, true)

      Game:addEntity(drop)
   end)

   Game:addEntity(myTile)
end

Fluid.addInstance(Game)
