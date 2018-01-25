local Fluid = require("lib.fluid")

local C = require("src.components")

local ControlInteraction = Fluid.system({C.controls}, {C.hovered, name = "hovered"})

function ControlInteraction:update(dt)
end

function ControlInteraction:mousepressed(button, mx, my)
end

function ControlInteraction:mousereleased(button, mx, my)
end

return ControlInteraction
