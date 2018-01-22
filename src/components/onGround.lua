local Fluid = require("lib.fluid")

local OnGround = Fluid.component(function(e, surface)
   e.surface = surface or nil
end)

return OnGround
