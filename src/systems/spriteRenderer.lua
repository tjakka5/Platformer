local Fluid = require("lib.fluid")

local C = require("src.components")

local SpriteRenderer = Fluid.system({C.transform, C.sprite})

function SpriteRenderer:draw()
   for _, e in ipairs(self.pool) do
      local transform = e:get(C.transform)
      local sprite    = e:get(C.sprite)

      local w, h = sprite.texture:getDimensions()

      local sx, sy = 1, 1
      local ox, oy = w/2, h/2

      if sprite.matchSize then
         sx, sy = transform.size.x / w, transform.size.y / h
      end

      love.graphics.setColor(sprite.color)
      love.graphics.draw(sprite.texture, transform.position.x, transform.position.y, 0, sx, sy, ox, oy)
   end
end

return SpriteRenderer
