--[=[
      Modifies the Highlight Instance.
--]=]
local Highlighter = { }

local ERR_NOT_TYPE = "%* is not a(n) %*."

local TYP_INSTANCE = "Instance"
local _TYP_TABLE = "table"
local _TYP_STRING = "string"
local _TYP_NUMBER = "number"

local CLASS_HIGHLIGHT = "Highlight"


do
      
      --[[
            Returns if the given container has more than 1 Highlights as children.

            @param container Instance
            @return boolean -- Returns `true` if the given container has more than 1 Highlights.
            @return number -- The count of highlights.
      --]]
      function Highlighter.HasMoreThan1HLs( container: Instance )
            assert(
                  typeof(container) == TYP_INSTANCE,
                  string.format(ERR_NOT_TYPE, container, TYP_INSTANCE)
            )

            local count = 0
            for _, child: Instance in container:GetChildren() do
                  if not child:IsA(CLASS_HIGHLIGHT) then continue end
                  count += 1
            end
            return count > 1, count
      end
      -- aliases

      Highlighter.hasMoreThan1HLs = Highlighter.HasMoreThan1HLs
      Highlighter.has_more_than_1_HLs = Highlighter.HasMoreThan1HLs
      
      Highlighter.HasMoreHLs = Highlighter.HasMoreThan1HLs
      Highlighter.hasMoreHLs = Highlighter.HasMoreThan1HLs
      Highlighter.has_more_HLs = Highlighter.HasMoreThan1HLs

      --[[
            Leaves a single Highlight in the given container, if they have more than one.

            @param container Instance
            @return boolean -- Returns `true` if the given container had more than 1 Highlights.
            @return number -- The count of highlights.
      --]]
      function Highlighter.UnifyHLs( container: Instance )
            assert(
                  typeof(container) == TYP_INSTANCE,
                  string.format(ERR_NOT_TYPE, container, TYP_INSTANCE)
            )

            local count = 0
            for _, child: Instance in container:GetChildren() do
                  if not child:IsA(CLASS_HIGHLIGHT) then continue end
                  count += 1
                  if count > 1 then
                        child:Destroy()
                  end
            end
            return count > 1, count
      end
      -- aliases

      Highlighter.unifyHLs = Highlighter.UnifyHLs
      Highlighter.unify_HLs = Highlighter.UnifyHLs

end

return Highlighter