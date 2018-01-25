local Fluid = require("lib.fluid")

local C = require("src.components")

local Physics = Fluid.system({C.transform, C.body})
Physics.gravity = 600

function Physics:update(dt)
   for _, e in ipairs(self.pool) do
      local transform = e:get(C.transform)
      local body      = e:get(C.body)

      body.velocity.y = body.velocity.y + self.gravity * body.gravityScale * dt

      transform.position = transform.position + body.velocity * dt
   end
end

return Physics
