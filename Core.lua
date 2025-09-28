AutoConfirmationSettings = {
    acceptQuest = false,
    completeQuest = false,
    abandonQuest = false,
    lootRoll = false,
    typeDelete = false,
    lootDistribution = false,
    battlefieldEntry = false,
    releaseSpirit = false,
    acceptResurrect = false,
    lootBind = false,
    equipBind = false,
    useBind = false,
    acceptSharedQuest = false,
    replaceEnchant = false,
    deleteItem = false,
    bindEnchant = false,
    replaceTradeEnchant = false,
    summon = false,
    bindHearthstone = false,
    resetInstances = false,
    partyInvite = false,
    declinePartyInvite = false,
    declineGuildInvite = false,
    antiAfk = false,
    autoGreed = false,
    autoNeed = false,
    autoPass = false,
}

--ensure this loads properly
local function OnVariablesLoaded()
    if not AutoConfirmationSettings then
        AutoConfirmationSettings = {
            acceptQuest = false,
            completeQuest = false,
            abandonQuest = false,
            lootRoll = false,
            typeDelete = false,
            lootDistribution = false,
            battlefieldEntry = false,
            releaseSpirit = false,
            acceptResurrect = false,
            lootBind = false,
            equipBind = false,
            useBind = false,
            acceptSharedQuest = false,
            replaceEnchant = false,
            deleteItem = false,
            bindEnchant = false,
            replaceTradeEnchant = false,
            summon = false,
            bindHearthstone = false,
            resetInstances = false,
            partyInvite = false,
            declinePartyInvite = false,
            declineGuildInvite = false,
            antiAfk = false,
            autoGreed = false,
            autoNeed = false,
            autoPass = false,
        }
    end
end

local function PopupHook(which)
    --debug
    --print(which)
    if (which == "ABANDON_QUEST" or which == "ABANDON_QUEST_WITH_ITEMS") and AutoConfirmationSettings.abandonQuest then
        StaticPopup1Button1:Click()
    elseif which == "CONFIRM_LOOT_ROLL" and AutoConfirmationSettings.lootRoll then
        ConfirmLootRoll(arg1, arg2)
        StaticPopup1:Hide()
    elseif which == "DELETE_GOOD_ITEM" and AutoConfirmationSettings.typeDelete then
        StaticPopup1EditBox:SetText("delete")
    elseif which == "CONFIRM_LOOT_DISTRIBUTION" and AutoConfirmationSettings.lootDistribution then
        StaticPopup1Button1:Click()
    elseif which == "CONFIRM_BATTLEFIELD_ENTRY" and AutoConfirmationSettings.battlefieldEntry then
        for i = 1, MAX_BATTLEFIELD_QUEUES do
            local status = GetBattlefieldStatus(i)
            if status == "confirm" then
                AcceptBattlefieldPort(i, true)
            end
        end
    elseif which == "DEATH" and AutoConfirmationSettings.releaseSpirit then
        StaticPopup1Button1:Click()
    elseif which == "RESURRECT_NO_SICKNESS" and AutoConfirmationSettings.acceptResurrect then
        AcceptResurrect()
    elseif which == "LOOT_BIND" and AutoConfirmationSettings.lootBind then
        LootSlot(arg1)
        StaticPopup1:Hide()
    elseif (which == "EQUIP_BIND" or which == "AUTOEQUIP_BIND") and AutoConfirmationSettings.equipBind then
        EquipPendingItem(this:GetID())
    elseif which == "USE_BIND" and AutoConfirmationSettings.useBind then
        ConfirmBindOnUse()
    elseif which == "QUEST_ACCEPT" and AutoConfirmationSettings.acceptSharedQuest then
        ConfirmAcceptQuest()
    elseif which == "REPLACE_ENCHANT" and AutoConfirmationSettings.replaceEnchant then
        StaticPopup1Button1:Click()
    elseif which == "BIND_ENCHANT" and AutoConfirmationSettings.bindEnchant then
        BindEnchant()
    elseif which == "DELETE_ITEM" and AutoConfirmationSettings.deleteItem then
        StaticPopup1Button1:Click()
    elseif which == "TRADE_REPLACE_ENCHANT" and AutoConfirmationSettings.replaceTradeEnchant then
        ReplaceTradeEnchant()
    elseif which == "CONFIRM_SUMMON" and AutoConfirmationSettings.summon then
        ConfirmSummon()
    elseif which == "CONFIRM_BINDER" and AutoConfirmationSettings.bindHearthstone then
        StaticPopup1Button1:Click()
    elseif which == "CONFIRM_RESET_INSTANCES" and AutoConfirmationSettings.resetInstances then
        StaticPopup1Button1:Click()
    elseif which == "PARTY_INVITE" and AutoConfirmationSettings.partyInvite then
        StaticPopup1Button1:Click()
    elseif which == "PARTY_INVITE" and AutoConfirmationSettings.declinePartyInvite then
        StaticPopup1Button2:Click()
    elseif which == "GUILD_INVITE" and AutoConfirmationSettings.declineGuildInvite then
        StaticPopup1Button2:Click()
    elseif which == "CAMP" and AutoConfirmationSettings.antiAfk then
        StaticPopup1Button1:Click()
    end
end

local orig_StaticPopup_OnShow = StaticPopup_OnShow
function StaticPopup_OnShow()
    PopupHook(this.which)
    orig_StaticPopup_OnShow()
end

local f = CreateFrame("Frame")
f:RegisterEvent("VARIABLES_LOADED")
f:RegisterEvent("QUEST_DETAIL")
f:RegisterEvent("QUEST_COMPLETE")
f:RegisterEvent("QUEST_PROGRESS")
f:RegisterEvent("START_LOOT_ROLL")
f:SetScript("OnEvent", function()
    if event == "VARIABLES_LOADED" then
        OnVariablesLoaded()
    elseif event == "QUEST_DETAIL" and AutoConfirmationSettings.acceptQuest then
        AcceptQuest()
    elseif event == "QUEST_COMPLETE" and AutoConfirmationSettings.completeQuest then
        if GetNumQuestChoices() > 1 then
            return
        end
        GetQuestReward()
    elseif event == "QUEST_PROGRESS" and AutoConfirmationSettings.completeQuest then
        CompleteQuest()
    elseif event == "START_LOOT_ROLL" and AutoConfirmationSettings.autoPass then
        RollOnLoot(arg1, 0)
    elseif event == "START_LOOT_ROLL" and AutoConfirmationSettings.autoNeed then
        RollOnLoot(arg1, 1)
    elseif event == "START_LOOT_ROLL" and AutoConfirmationSettings.autoGreed then
        RollOnLoot(arg1, 2)
    end
end)

function dumpTable(tbl, indent)
    indent = indent or 0
    local prefix = string.rep("  ", indent)
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            print(prefix .. tostring(k) .. ":")
            dumpTable(v, indent + 1)
        else
            print(prefix .. tostring(k) .. ": " .. tostring(v))
        end
    end
end
