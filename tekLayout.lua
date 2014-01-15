local SCREENWIDTH = GetScreenWidth() * UIParent:GetEffectiveScale()
local LAPPY = UIParent:GetHeight() <= 900
local FONTSIZE = LAPPY and 13 or 11

local f = CreateFrame("frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
	f:UnregisterAllEvents()
	f:SetScript("OnEvent", nil)
  
  SetCVar("chatBubbles", 0)
  SetCVar("chatBubblesParty", 1)
  SetCVar("guildMemberNotify", 1)
  SetCVar("violenceLevel", 5)
  SetCVar("alwaysCompareItems", 1)
  SetCVar("ObjectSelectionCircle", 1)
	SetCVar("alternateResourceText", 1)
	SetCVar("statusTextDisplay", "BOTH")
	SetCVar("mapQuestDifficulty", 1)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("screenshotQuality", 10)
	SetCVar("chatMouseScroll", 1)
	SetCVar("chatStyle", "classic")
	SetCVar("WholeChatWindowClickable", 0)
	SetCVar("ConversationMode", "inline")
	SetCVar("showTutorials", 0)
	SetCVar("UberTooltips", 1)
	SetCVar("threatWarning", 3)
	SetCVar('alwaysShowActionBars', 1)
	SetCVar('lockActionBars', 1)
	SetCVar('SpamFilter', 1)
	SetCVar("autoLootDefault", 1)
  SetCVar("scriptErrors", 1)
	SetCVar("useUiScale", 1)
	SetCVar("uiScale", SCALE)
  SetCVar("uiScale", 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)"))

  FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)

	FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(ChatFrame3)
	FCF_SetLocked(ChatFrame3, 1)
	ChatFrame3:Show()			

  for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)

    frame:SetHeight(150)
    frame:SetWidth( ( (SCREENWIDTH -400) / 2) )

    if i == 1 then
			frame:ClearAllPoints()
			frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 5, 10)		
      frame:SetUserPlaced(true)      
		elseif i == 3 then
			frame:ClearAllPoints()
			frame:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 10)
		end

		FCF_SavePositionAndDimensions(frame)
		FCF_StopDragging(frame)
		FCF_SetChatWindowFontSize(nil, frame, FONTSIZE)        
    FCF_SetWindowColor(frame, 0, 0, 0)
    FCF_SetWindowAlpha(frame, 0)
		
		-- rename windows 
		if i == 1 then
			FCF_SetWindowName(frame, 'General')
		elseif i == 2 then
			FCF_SetWindowName(frame, 'Guild')
		elseif i == 3 then 
			FCF_SetWindowName(frame, 'Loot') 
		end
	end
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")

	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")	
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_INLINE_TOAST_ALERT")
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)	
  ChatFrame_AddMessageGroup(ChatFrame3, "ERRORS")
  ChatFrame_AddMessageGroup(ChatFrame3, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_GUILD_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONSTER_BOSS_EMOTE")  
	ChatFrame_AddChannel(ChatFrame1, "General")
	ChatFrame_RemoveChannel(ChatFrame1, 'Trade')
	ChatFrame_AddChannel(ChatFrame3, 'Trade')


	PetBattleFrame:SetPoint("BOTTOMRIGHT", WorldFrame, "BOTTOMRIGHT", 0, 4)
	PetBattleFrame:SetFrameStrata("HIGH")
end)
