local Fluid = require("lib.fluid")
local Bump  = require("lib.bump")

local C = require("src.components")

local World = Fluid.system({C.transform, C.collider})
World.hash  = Bump.newWorld(32)

function World:entityAddedTo(e, pool) --[[ TODO fix this]]
   if pool.__name == "pool" then
      local transform = e:get(C.transform)
      local collider  = e:get(C.collider)

      World.hash:add(collider, transform.position.x - transform.size.x/2, transform.position.y - transform.size.y/2, transform.size.x, transform.size.y)
   end
end

function World:entityRemovedFrom(e, pool)
   if pool.__name == "pool" then
      local collider = e:get(C.collider)

      World.hash:remove(collider)
   end
end

function World:update(dt)
   --[[
   for _, e in ipairs(self.grounded) do
      e:remove(C.grounded)
      e:check()
   end
   ]]

   for _, e in ipairs(self.pool) do
      local transform = e:get(C.transform)
      local collider  = e:get(C.collider)
      local body      = e:get(C.body)

      local new_x, new_y, cols, len = World.hash:move(collider, transform.position.x - transform.size.x/2, transform.position.y - transform.size.y/2) --[[ TODO add filter ]]
      transform.position.x, transform.position.y = new_x + transform.size.x/2, new_y + transform.size.y/2

      if body then
         for i = 1, len do
            local col = cols[i]

            if col.normal.x ~= 0 then
               body.velocity.x = 0
            end

            if col.normal.y ~= 0 then
               body.velocity.y = 0
            end
         end
      end
   end
end

function World:draw()
   love.graphics.setColor(225, 30, 30)

   local items, len = self.hash:getItems()

   for i = 1, len do
      local x, y, w, h = self.hash:getRect(items[i])

      love.graphics.rectangle("line", x, y, w, h)
   end
end

return World
