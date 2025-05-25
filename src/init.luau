--// //- 色 -// //--
-- --/// IROBURGER ///-- --
--// //- 色 -// //--

local iroburger = {}

local layer = require(script.Layer)
local highlighter = require(script.Highlighter)

export type LayerProperties = layer.LayerProperties
export type Layer = layer.Layer


do -- Body

      --[[
            Creates an iroburger Layer (iroLayer) with an optional property list.
            
            @param params iroLayerProperties
            @returns Layer -- The new iroLayer.
      --]]
      function iroburger.newLayer ( params: LayerProperties ) : Layer
            return layer.new(params)
       end
       -- aliases
       
       iroburger.NewLayer = iroburger.newLayer
       iroburger.new_layer = iroburger.newLayer

end


return iroburger