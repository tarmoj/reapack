-- @description Set time selection to nearest markers from cursor
-- @version 1.01
-- @author me2beats
-- @changelog
--  + init

local r = reaper; local function nothing() end; local function bla() r.defer(nothing) end

local _, markers = r.CountProjectMarkers(); if markers<2 then bla() return end

local cur = r.GetCursorPosition()

local m_start_i = r.GetLastMarkerAndCurRegion(0, cur)
if m_start_i == -1 then bla() return end
local ret,_, m_start = r.EnumProjectMarkers(m_start_i)
local ret,_, m_end = r.EnumProjectMarkers(m_start_i+1)

if not m_end then bla() return end
r.Undo_BeginBlock() r.PreventUIRefresh(1)
r.GetSet_LoopTimeRange(1, 0, m_start, m_end, 0)
r.PreventUIRefresh(-1) r.Undo_EndBlock('Set time selection to nearest markers from cursor', -1)
