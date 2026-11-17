-- NoBiographer: hides AutoBiographer milestone posts from guild chat.
-- AutoBiographer posts them as "[AutoBiographer] I have <milestone>!" to GUILD.

local PREFIX = "[AutoBiographer]"
local PREFIX_LEN = #PREFIX

local defaults = { enabled = true, hidden = 0 }
local db = defaults

local function IsAutoBiographerMessage(msg)
  if (type(msg) ~= "string") then return false end
  if (issecretvalue and issecretvalue(msg)) then return false end
  return msg:sub(1, PREFIX_LEN) == PREFIX
end

-- Filters run once per chat frame showing the channel; count each line once.
local lastCountedLine

local function Filter(_, _, msg, _, _, _, _, _, _, _, _, _, lineID)
  if (db.enabled and IsAutoBiographerMessage(msg)) then
    if (lineID == nil or lineID ~= lastCountedLine) then
      lastCountedLine = lineID
      db.hidden = (db.hidden or 0) + 1
    end
    return true
  end
  return false
end

-- Classic clients have the global; newer ones (possibly WoW Forever) may
-- only have it under ChatFrameUtil.
local AddFilter = ChatFrame_AddMessageEventFilter
  or (ChatFrameUtil and ChatFrameUtil.AddMessageEventFilter)

if (AddFilter) then
  AddFilter("CHAT_MSG_GUILD", Filter)
  AddFilter("CHAT_MSG_OFFICER", Filter)
else
  C_Timer.After(5, function()
    print("|cff88ccffNoBiographer|r: this client has no chat filter API, so AutoBiographer posts can't be hidden. Please report this on GitHub.")
  end)
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, _, name)
  if (name ~= "NoBiographer") then return end
  NoBiographerDB = NoBiographerDB or {}
  for k, v in pairs(defaults) do
    if (NoBiographerDB[k] == nil) then NoBiographerDB[k] = v end
  end
  db = NoBiographerDB
  self:UnregisterEvent("ADDON_LOADED")
end)

SLASH_NOBIOGRAPHER1 = "/nobio"
SLASH_NOBIOGRAPHER2 = "/nobiographer"
SlashCmdList.NOBIOGRAPHER = function(input)
  input = (input or ""):lower():match("^%s*(.-)%s*$")
  if (input == "on") then
    db.enabled = true
  elseif (input == "off") then
    db.enabled = false
  elseif (input == "" or input == "toggle") then
    db.enabled = not db.enabled
  elseif (input ~= "status") then
    print("|cff88ccffNoBiographer|r: /nobio [on | off | toggle | status]")
    return
  end
  print(("|cff88ccffNoBiographer|r: %s. %d AutoBiographer message(s) hidden so far."):format(
    db.enabled and "|cff00ff00hiding|r AutoBiographer guild posts" or "|cffff4444showing|r AutoBiographer guild posts",
    db.hidden or 0))
end
