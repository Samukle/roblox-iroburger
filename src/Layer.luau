--[=[
      Highlight Layer. Has its own Transparency and Colors
      for both Fill and Outline, excluding for Occlusion.

      @class iroLayer
      @prop Name string
      @prop Index number

      @prop FillColor Color3
      @prop FillTransparency number
      @prop OutlineColor Color3
      @prop OutlineTransparency number
--]=]
local Layer = { }

export type LayerProperties = {
      Name: string?,
      Index: number?,
      FillColor: Color3?,
      FillTransparency: number?,
      OutlineColor: Color3?,
      OutlineTransparency: number?,
}

export type Layer = {
      Name: string,
      Index: number,
      FillColor: Color3,
      FillTransparency: number,
      OutlineColor: Color3,
      OutlineTransparency: number
}

local TYP_TABLE = "table"
local _TYP_STRING = "string"

local CLASS_NAME = "iroLayer"
local DUMMY: Layer = {
      Name = "iroLayer",
      Index = 1,
      FillColor = Color3.new(0,0,0),
      FillTransparency = 1,
      OutlineColor = Color3.new(0,0,0),
      OutlineTransparency = 1
}


do -- Body
      
      local function __tostring ( )
            return CLASS_NAME
      end

      -- Class functions
      Layer.schema = { }
      -- Object metatable
      Layer.shadow = {
            __type = CLASS_NAME,
            __index = Layer.schema,
            __tostring = __tostring
      }

      --[[
            Creates an iroburger Layer (iroLayer) with an optional property list.
            
            @param params LayerProperties
            @returns Layer -- The new iroLayer.
      --]]
      function Layer.new ( params: LayerProperties ): Layer
            local this = { }
            -- Construct based out of the dummy layer
            for k, v in next, DUMMY do
                  this [k] = if typeof(params [k]) == typeof(v) then params [k] else v
            end
            setmetatable(this, Layer.shadow)
            return this
      end
      -- alias

      Layer.New = Layer.new

      --[[
            Returns if the given object is an iroLayer through duck typing.

            @param object any
            @return boolean
      --]]
      function Layer.Is ( obj: any ): boolean
            return typeof(obj) == TYP_TABLE and getmetatable(obj) == Layer.shadow
      end
      -- alias
      
      Layer.is = Layer.Is

end

do -- Schema

      --[[
            Destroys the iroLayer.
      --]]
      function Layer.schema:Destroy ( ): ()
            setmetatable(self, nil)
            table.clear(self)
            table.freeze(self)
      end
      -- alias
      
      Layer.schema.destroy = Layer.schema.Destroy

      --[[
            Returns if the given object is an iroLayer through duck typing.

            @param object any
            @return boolean
      --]]
      function Layer.schema:Is ( obj: any ): boolean
            return Layer.Is(obj)
      end
      -- alias

      Layer.schema.is = Layer.schema.Is

end


return Layer