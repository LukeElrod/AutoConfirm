AutoConfirmationSettings = {
    abandonQuest = false,
    lootRoll = false,
    autoDeleteItem = false,
    lootDistribution = false,
    battlefieldEntry = false,
    deleteMailAutomatically = false,
    releaseSpirit = false,
    acceptResurrect = false,
    lootBind = false,
    equipBind = false,
    useBind = false,
    acceptSharedQuest = false,
    enchantBind = false,
    replaceEnchant = false,
    surrenderArena = false,
    deleteItem = false
}

--ensure this loads properly
local function OnVariablesLoaded()
    if not AutoConfirmationSettings then
        AutoConfirmationSettings = {
            abandonQuest = false,
            lootRoll = false,
            autoDeleteItem = false,
            lootDistribution = false,
            battlefieldEntry = false,
            deleteMailAutomatically = false,
            releaseSpirit = false,
            acceptResurrect = false,
            lootBind = false,
            equipBind = false,
            useBind = false,
            acceptSharedQuest = false,
            enchantBind = false,
            replaceEnchant = false,
            surrenderArena = false,
            deleteItem = false
        }
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("VARIABLES_LOADED")
f:SetScript("OnEvent", OnVariablesLoaded)

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

local function PopupHook(which)
    --debug
    print(which)
    if (which == "ABANDON_QUEST" or which == "ABANDON_QUEST_WITH_ITEMS") and AutoConfirmationSettings.abandonQuest then
        StaticPopup1Button1:Click()
    elseif which == "CONFIRM_LOOT_ROLL" and AutoConfirmationSettings.lootRoll then
        StaticPopup1Button1:Click()
    elseif which == "DELETE_GOOD_ITEM" and AutoConfirmationSettings.autoDeleteItem then
        StaticPopup1EditBox:SetText("delete")
    elseif which == "CONFIRM_LOOT_DISTRIBUTION" and AutoConfirmationSettings.lootDistribution then
        StaticPopup1Button1:Click()
    elseif which == "CONFIRM_BATTLEFIELD_ENTRY" and AutoConfirmationSettings.battlefieldEntry then
        StaticPopup1Button1:Click()
    elseif which == "DELETE_MAIL" and AutoConfirmationSettings.deleteMailAutomatically then
        StaticPopup1Button1:Click()
    elseif which == "DEATH" and AutoConfirmationSettings.releaseSpirit then
        StaticPopup1Button1:Click()
    elseif which == "RESURRECT" and AutoConfirmationSettings.acceptResurrect then
        StaticPopup1Button1:Click()
    elseif which == "LOOT_BIND" and AutoConfirmationSettings.lootBind then
        StaticPopup1Button1:Click()
    elseif which == "EQUIP_BIND" and AutoConfirmationSettings.equipBind then
        StaticPopup1Button1:Click()
    elseif which == "USE_BIND" and AutoConfirmationSettings.useBind then
        StaticPopup1Button1:Click()
    elseif which == "QUEST_ACCEPT" and AutoConfirmationSettings.acceptSharedQuest then
        StaticPopup1Button1:Click()
    elseif which == "BIND_ENCHANT" and AutoConfirmationSettings.enchantBind then
        StaticPopup1Button1:Click()
    elseif which == "REPLACE_ENCHANT" and AutoConfirmationSettings.replaceEnchant then
        StaticPopup1Button1:Click()
    elseif which == "CONFIRM_SURRENDER_ARENA" and AutoConfirmationSettings.surrenderArena then
        StaticPopup1Button1:Click()
    elseif which == "DELETE_ITEM" and AutoConfirmationSettings.deleteItem then
        StaticPopup1Button1:Click()
    end
end

local orig_StaticPopup_OnShow = StaticPopup_OnShow
function StaticPopup_OnShow()
    PopupHook(this.which)
    orig_StaticPopup_OnShow()
end
