local Fluid = require("lib.fluid")

local C = require("src.components")

local TileBreaker = Fluid.system({C.transform, C.breakable, "breakable"}, {C.breakable, C.breaking, "breaking"})

function TileBreaker:update(dt)
   for _, e in ipairs(self.breaking) do
      local breakable = e:get(C.breakable)
      local breaking  = e:get(C.breaking)

      breaking.progress = breaking.progress + dt

      if breaking.progress >= breakable.hardness then
         e:remove(C.breaking)
         e:check()

         breakable.drop(e)
      end
   end
end

function TileBreaker:mousepressed(mx, my, button)
   for _, e in ipairs(self.breakable) do
      local transform = e:get(C.transform)

      if mx > transform.position.x - transform.size.x/2 and mx < transform.position.x + transform.size.x/2 and
         my > transform.position.y - transform.size.y/2 and my < transform.position.y + transform.size.y/2 then

         e:give(C.breaking)
         e:check()
      end
   end
end

function TileBreaker:mousereleased(mx, my, button)
   for _, e in ipairs(self.breaking) do
      e:remove(C.breaking)
      e:check()
   end
end

return TileBreaker
