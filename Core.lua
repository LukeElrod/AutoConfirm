AutoConfirmationSettings = {
    abandonQuest = false,
    lootRoll = false,
    autoDeleteItem = false,
    removeGlyph = false,
    glyphPlacement = false,
    itemReforge = false,
    lootDistribution = false,
    battlefieldEntry = false,
    deleteMailAutomatically = false,
    releaseSpirit = false,
    acceptResurrect = false,
    acceptTrade = false,
    lootBind = false,
    equipBind = false,
    useBind = false,
    acceptSharedQuest = false,
    enchantBind = false,
    replaceEnchant = false,
    leaveInstance = false,
    leaveBattlefield = false,
    surrenderArena = false
}

local function PopupHook(self)
    --debug
    --print(self.which)

    if (self.which == "ABANDON_QUEST" or self.which == "ABANDON_QUEST_WITH_ITEMS") and AutoConfirmationSettings.abandonQuest then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LOOT_ROLL" and AutoConfirmationSettings.lootRoll then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "DELETE_GOOD_ITEM" and AutoConfirmationSettings.autoDeleteItem then
        self.editBox:SetText("delete")
    elseif self.which == "CONFIRM_REMOVE_GLYPH" and AutoConfirmationSettings.removeGlyph then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_GLYPH_PLACEMENT" and AutoConfirmationSettings.glyphPlacement then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_UPGRADE_ITEM" and AutoConfirmationSettings.itemReforge then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LOOT_DISTRIBUTION" and AutoConfirmationSettings.lootDistribution then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_BATTLEFIELD_ENTRY" and AutoConfirmationSettings.battlefieldEntry then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "DELETE_MAIL" and AutoConfirmationSettings.deleteMailAutomatically then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "DEATH" and AutoConfirmationSettings.releaseSpirit then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "RESURRECT" and AutoConfirmationSettings.acceptResurrect then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "acceptTrade" and AutoConfirmationSettings.acceptTrade then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "LOOT_BIND" and AutoConfirmationSettings.lootBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "EQUIP_BIND" and AutoConfirmationSettings.equipBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "USE_BIND" and AutoConfirmationSettings.useBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "QUEST_ACCEPT" and AutoConfirmationSettings.acceptSharedQuest then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "BIND_ENCHANT" and AutoConfirmationSettings.enchantBind then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "REPLACE_ENCHANT" and AutoConfirmationSettings.replaceEnchant then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LEAVE_INSTANCE_PARTY" and AutoConfirmationSettings.leaveInstance then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_LEAVE_BATTLEFIELD" and AutoConfirmationSettings.leaveBattlefield then
        C_Timer.After(0.05, function() self.button1:Click() end)
    elseif self.which == "CONFIRM_SURRENDER_ARENA" and AutoConfirmationSettings.surrenderArena then
        C_Timer.After(0.05, function() self.button1:Click() end)
    end
end

hooksecurefunc("StaticPopup_OnShow", PopupHook)
