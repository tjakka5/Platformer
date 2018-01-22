local Fluid = require("lib.fluid")

local Sprite = Fluid.component(function(e, texture, color, matchSize)
   e.texture   = texture   or nil
   e.color     = color     or {255, 255, 255, 255}
   e.matchSize = matchSize or false
end)

return Sprite
