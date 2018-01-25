local Fluid = require("lib.fluid")

local collider = Fluid.component(function(e, filter)
   e.filter = filter or function(e, other) end
end)

return collider
