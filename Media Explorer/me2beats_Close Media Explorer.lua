-- @description Close Media Explorer
-- @version 1.1
-- @author me2beats
-- @changelog
--  + init

local r = reaper

local undo_name = 'Close Media Explorer'

function ToggleActionOnOff(id,on,undo_name,undo_flag)

  local state = r.GetToggleCommandState(id)
  if on == 1 and state == 0 or on == 0 and state ~= 0 then
    r.Undo_BeginBlock()
    r.Main_OnCommand(id,0)
    r.Undo_EndBlock(undo_name, undo_flag)
  end
end

ToggleActionOnOff(50124,0,undo_name,2) -- Media explorer: Show/hide media explorer