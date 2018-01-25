local Fluid  = require("lib.fluid")
local Vector = require("lib.vector")

local Body = Fluid.component(function(e, velocity, gravityScale)
   e.velocity     = velocity     or Vector(0, 0)
   e.gravityScale = gravityScale or 1
end)

return Body
