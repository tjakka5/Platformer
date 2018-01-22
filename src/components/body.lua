local Fluid  = require("lib.fluid")
local Vector = require("lib.vector")

local Body = Fluid.component(function(e, velocity, hasCollider, gravityScale)
   e.velocity     = velocity     or Vector(0, 0)
   e.hasCollider  = hasCollider  or false
   e.gravityScale = gravityScale or 1
end)

return Body
