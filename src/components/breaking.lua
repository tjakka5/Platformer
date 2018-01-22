local Fluid = require("lib.fluid")

local Breaking = Fluid.component(function(e, progress)
   e.progress = progress or 0
end)

return Breaking
