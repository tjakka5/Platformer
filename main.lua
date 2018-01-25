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
Game:addSystem(S.world, "update")

Game:addSystem(S.spriteRenderer, "draw")
Game:addSystem(S.world, "draw")

local dirtTexture = love.graphics.newImage("assets/tiles/dirt.png")
local sandTexture = love.graphics.newImage("assets/tiles/sand.png")

for x = 1, 5 do
   for y = 1, 10 do
      local myTile = Fluid.entity()
      :give(C.transform, Vector(32 + x * 64, 32 + y * 64), Vector(64, 64))
      :give(C.sprite, y > 9 and dirtTexture or sandTexture, {255, 255, 255}, true)
      :give(C.body, Vector(0, 0), y > 9 and 0 or 1)
      :give(C.collider, function() end)
      :give(C.breakable, {--[[tools]]}, 0.5, function(e)
         local transform = e:get(C.transform)
         local sprite    = e:get(C.sprite)

         e:destroy()

         local drop = Fluid.entity()
         :give(C.transform, transform.position, Vector(32, 32))
         :give(C.sprite, sprite.texture, sprite.color, true)
         :give(C.body, Vector(love.math.random(-200, 200), love.math.random(-100, -200)), 0.8)
         :give(C.collider, function() end)

         Game:addEntity(drop)
      end)

      Game:addEntity(myTile)
   end
end

Fluid.addInstance(Game)
