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
    if (self.which == "ABANDON_QUEST" or self.which == "ABANDON_QUEST_WITH_ITEMS") and AutoConfirmationSettings.abandonQuest then
        self.button1:Click()
    elseif self.which == "CONFIRM_LOOT_ROLL" and AutoConfirmationSettings.confirmLootRoll then
        self.button1:Click()
    elseif self.which == "DELETE_GOOD_ITEM" and AutoConfirmationSettings.autoDeleteItem then
        self.editBox:SetText("delete")
    elseif self.which == "CONFIRM_REMOVE_GLYPH" and AutoConfirmationSettings.removeGlyph then
        self.button1:Click()
    elseif self.which == "CONFIRM_GLYPH_PLACEMENT" and AutoConfirmationSettings.confirmGlyphPlacement then
        self.button1:Click()
    elseif self.which == "CONFIRM_UPGRADE_ITEM" and AutoConfirmationSettings.confirmItemReforge then
        self.button1:Click()
    elseif self.which == "CONFIRM_LOOT_DISTRIBUTION" and AutoConfirmationSettings.confirmLootDistribution then
        self.button1:Click()
    elseif self.which == "CONFIRM_BATTLEFIELD_ENTRY" and AutoConfirmationSettings.confirmBattlefieldEntry then
        self.button1:Click()
    elseif self.which == "DELETE_MAIL" and AutoConfirmationSettings.deleteMailAutomatically then
        self.button1:Click()
    elseif self.which == "DEATH" and AutoConfirmationSettings.releaseSpirit then
        self.button1:Click()
    elseif self.which == "RESURRECT" and AutoConfirmationSettings.acceptResurrect then
        self.button1:Click()
    elseif self.which == "acceptTrade" and AutoConfirmationSettings.acceptTrade then
        self.button1:Click()
    elseif self.which == "LOOT_BIND" and AutoConfirmationSettings.confirmLootBind then
        self.button1:Click()
    elseif self.which == "EQUIP_BIND" and AutoConfirmationSettings.confirmEquipBind then
        self.button1:Click()
    elseif self.which == "USE_BIND" and AutoConfirmationSettings.confirmUseBind then
        self.button1:Click()
    elseif self.which == "QUEST_ACCEPT" and AutoConfirmationSettings.acceptSharedQuest then
        self.button1:Click()
    elseif self.which == "BIND_ENCHANT" and AutoConfirmationSettings.confirmEnchantBind then
        self.button1:Click()
    elseif self.which == "REPLACE_ENCHANT" and AutoConfirmationSettings.confirmReplaceEnchant then
        self.button1:Click()
    elseif self.which == "CONFIRM_LEAVE_INSTANCE_PARTY" and AutoConfirmationSettings.confirmLeaveInstance then
        self.button1:Click()
    elseif self.which == "CONFIRM_LEAVE_BATTLEFIELD" and AutoConfirmationSettings.confirmLeaveBattlefield then
        self.button1:Click()
    elseif self.which == "CONFIRM_SURRENDER_ARENA" and AutoConfirmationSettings.confirmSurrenderArena then
        self.button1:Click()
    end
end

hooksecurefunc("StaticPopup_OnShow", PopupHook)
