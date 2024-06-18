AutoConfirmationSettings = {
    abandonQuest = false,
    confirmLootRoll = false,
    autoDeleteItem = false,
    removeGlyph = false,
    confirmGlyphPlacement = false,
    confirmItemReforge = false,
    confirmLootDistribution = false,
    confirmBattlefieldEntry = false,
    deleteMailAutomatically = false,
    releaseSpirit = false,
    acceptResurrect = false,
    acceptTrade = false,
    confirmLootBind = false,
    confirmEquipBind = false,
    confirmUseBind = false,
    acceptSharedQuest = false,
    confirmEnchantBind = false,
    confirmReplaceEnchant = false,
    confirmLeaveInstance = false,
    confirmLeaveBattlefield = false,
    confirmSurrenderArena = false
}

local function PopupHook(self)
    --debug
    --print(self.which)

    if (self.which == "ABANDON_QUEST" or self.which == "ABANDON_QUEST_WITH_ITEMS") and AutoConfirmationSettings.abandonQuest then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LOOT_ROLL" and AutoConfirmationSettings.confirmLootRoll then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "DELETE_GOOD_ITEM" and AutoConfirmationSettings.autoDeleteItem then
        self.editBox:SetText("delete")
    elseif self.which == "CONFIRM_REMOVE_GLYPH" and AutoConfirmationSettings.removeGlyph then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_GLYPH_PLACEMENT" and AutoConfirmationSettings.confirmGlyphPlacement then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_UPGRADE_ITEM" and AutoConfirmationSettings.confirmItemReforge then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LOOT_DISTRIBUTION" and AutoConfirmationSettings.confirmLootDistribution then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_BATTLEFIELD_ENTRY" and AutoConfirmationSettings.confirmBattlefieldEntry then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "DELETE_MAIL" and AutoConfirmationSettings.deleteMailAutomatically then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "DEATH" and AutoConfirmationSettings.releaseSpirit then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "RESURRECT" and AutoConfirmationSettings.acceptResurrect then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "acceptTrade" and AutoConfirmationSettings.acceptTrade then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "LOOT_BIND" and AutoConfirmationSettings.confirmLootBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "EQUIP_BIND" and AutoConfirmationSettings.confirmEquipBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "USE_BIND" and AutoConfirmationSettings.confirmUseBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "QUEST_ACCEPT" and AutoConfirmationSettings.acceptSharedQuest then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "BIND_ENCHANT" and AutoConfirmationSettings.confirmEnchantBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "REPLACE_ENCHANT" and AutoConfirmationSettings.confirmReplaceEnchant then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LEAVE_INSTANCE_PARTY" and AutoConfirmationSettings.confirmLeaveInstance then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LEAVE_BATTLEFIELD" and AutoConfirmationSettings.confirmLeaveBattlefield then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_SURRENDER_ARENA" and AutoConfirmationSettings.confirmSurrenderArena then
        C_Timer.After(0.05, function() self.button1:Click() end)
    end
end

hooksecurefunc("StaticPopup_OnShow", PopupHook)
