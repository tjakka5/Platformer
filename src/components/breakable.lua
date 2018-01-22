local Fluid = require("lib.fluid")

local Breakable = Fluid.component(function(e, toolTypes, hardness, drop)
   e.toolTypes = toolTypes or {}
   e.hardness  = hardness  or 1
   e.drop      = drop      or function() end
end)

return Breakable
