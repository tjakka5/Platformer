local Fluid  = require("lib.fluid")
local Vector = require("lib.vector")

local Transform = Fluid.component(function(e, position, size)
   e.position = position or Vector( 0,  0)
   e.size     = size     or Vector(64, 64)
end, true)

function Transform:translate(translation)
   self.position = self.position + translation
end

return Transform
