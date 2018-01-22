local Fluid = require("lib.fluid")

local C = require("src.components")

local Physics = Fluid.system({C.transform, C.body}, {C.onGround, "grounded"})
Physics.gravity = 600

function Physics:update(update)
   for _, e in ipairs(self.grounded) do
      e:remove(C.grounded)
      e:check()
   end

   for _, e in ipairs(self.pool) do
      local transform = e:get(C.transform)
      local body      = e:get(C.body)

      body.velocity.y = body.velocity.y + self.gravity * update.dt

      transform.position = transform.position + body.velocity * update.dt
   end
end

return Physics
