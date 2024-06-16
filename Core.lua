RazVars =
{
    abandonQuest = false,
    confirmLootRoll = false,
    deleteGoodItem = false,
    removeGlyph = false,
    placeGlyph = false,
    reforgeItem = false,
    masterLoot = false,
    bfEntry = false,
    deleteMail = false,
    releaseSpirit = false,
    ressurect = false,
    trade = false,
    lootBind = false,
    equipBind = false,
    useBind = false,
    sharedQuest = false,
    enchantBind = false,
    replaceEnchant = false,
    leaveInstance = false,
    leaveBf = false,
    surrenderArena = false
}

local function PopupHook(self)
    if self.which == "ABANDON_QUEST" and RazVars.abandonQuest then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_LOOT_ROLL" and RazVars.confirmLootRoll then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_REMOVE_GLYPH" and RazVars.removeGlyph then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_GLYPH_PLACEMENT" and RazVars.placeGlyph then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_UPGRADE_ITEM" and RazVars.reforgeItem then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_LOOT_DISTRIBUTION" and RazVars.masterLoot then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_BATTLEFIELD_ENTRY" and RazVars.bfEntry then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "DELETE_MAIL" and RazVars.deleteMail then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "DEATH" and RazVars.releaseSpirit then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "RESURRECT" and RazVars.ressurect then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "TRADE" and RazVars.trade then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "LOOT_BIND" and RazVars.lootBind then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "EQUIP_BIND" and RazVars.equipBind then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "USE_BIND" and RazVars.useBind then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "QUEST_ACCEPT" and RazVars.sharedQuest then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "BIND_ENCHANT" and RazVars.enchantBind then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "REPLACE_ENCHANT" and RazVars.replaceEnchant then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_LEAVE_INSTANCE_PARTY" and RazVars.leaveInstance then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_LEAVE_BATTLEFIELD" and RazVars.leaveBf then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    elseif self.which == "CONFIRM_SURRENDER_ARENA" and RazVars.surrenderArena then
        C_Timer.After(0.05, function()
            self.button1:Click()
        end)
    end
end

hooksecurefunc("StaticPopup_OnShow", PopupHook)

local function SpecialHandler(self, event, ...)
    if event == "DELETE_ITEM_CONFIRM" and RazVars.deleteGoodItem then
        local dialog = StaticPopup1
        if dialog and dialog:IsVisible() then
            local editBox = _G[dialog:GetName() .. "EditBox"]
            if editBox then
                editBox:SetText("delete")
                editBox:HighlightText()
            end
        end
    end
end

local eventFrame = CreateFrame("EventFrame")
eventFrame:RegisterEvent("DELETE_ITEM_CONFIRM")
eventFrame:SetScript("OnEvent", SpecialHandler)
