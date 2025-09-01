local checkButtons = {
    { text = "Abandon Quest",         variable = "abandonQuest" },
    { text = "Loot Roll",             variable = "lootRoll" },
    { text = "Auto Type Delete",      variable = "autoDeleteItem" },
    { text = "Distribute Loot",       variable = "lootDistribution" },
    { text = "Enter Battleground",    variable = "battlefieldEntry" },
    { text = "Release Spirit",        variable = "releaseSpirit" },
    { text = "Resurrect",             variable = "acceptResurrect" },
    { text = "Loot Bind",             variable = "lootBind" },
    { text = "Equip Bind",            variable = "equipBind" },
    { text = "Use Bind",              variable = "useBind" },
    { text = "Shared Quest",          variable = "acceptSharedQuest" },
    { text = "Enchant Bind",          variable = "enchantBind" },
    { text = "Replace Enchant",       variable = "replaceEnchant" },
    { text = "Delete Item - CAUTION", variable = "deleteItem" },
    { text = "Replace Trade Enchant", variable = "replaceTradeEnchant" },
    { text = "Summon",                variable = "summon" },
    { text = "Hearthstone Bind",      variable = "bindHearthstone" },
    { text = "Reset Instances",       variable = "resetInstances" },
}

local AutoConfirmPanel = CreateFrame("Frame", "AutoConfirmPanel", UIParent)
AutoConfirmPanel:SetWidth(300)
AutoConfirmPanel:SetHeight(400)
AutoConfirmPanel:SetPoint("CENTER", nil, "CENTER")
AutoConfirmPanel:SetBackdrop({
    bgFile = "Interface/Tooltips/UI-Tooltip-Background",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    tile = true,
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
AutoConfirmPanel:SetBackdropColor(0, 0, 0, 1)
AutoConfirmPanel:Hide()

local scrollFrame = CreateFrame("ScrollFrame", "AutoConfirmScrollFrame", AutoConfirmPanel, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", AutoConfirmPanel, 8, -40)
scrollFrame:SetPoint("BOTTOMRIGHT", AutoConfirmPanel, -30, 10)

local content = CreateFrame("Frame", nil, scrollFrame)
content:SetWidth(240)
content:SetHeight(28 * table.getn(checkButtons) + 20)
scrollFrame:SetScrollChild(content)

local title = AutoConfirmPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOP", AutoConfirmPanel, 0, -16)
title:SetText("Auto Confirmations")

local closeButton = CreateFrame("Button", nil, AutoConfirmPanel, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", AutoConfirmPanel, -4, -4)
closeButton:SetScript("OnClick", function() AutoConfirmPanel:Hide() end)


local function CreateCheckButton(parent, yOffset, text, variable)
    local button = CreateFrame("CheckButton", nil, parent, "OptionsCheckButtonTemplate")
    button:SetPoint("TOPLEFT", parent, 0, yOffset)
    button:SetWidth(24)
    button:SetHeight(24)
    button.text = button:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    button.text:SetPoint("LEFT", button, "RIGHT", 4, 0)
    button.text:SetText(text)
    button:SetScript("OnClick", function()
        AutoConfirmationSettings[variable] = button:GetChecked() and 1 or nil
    end)
    return button
end

for i, buttonInfo in ipairs(checkButtons) do
    local yOffset = -10 - 28 * (i - 1)
    buttonInfo.button = CreateCheckButton(content, yOffset, buttonInfo.text, buttonInfo.variable)
end

local function InitOptions()
    for _, buttonInfo in ipairs(checkButtons) do
        buttonInfo.button:SetChecked(AutoConfirmationSettings[buttonInfo.variable])
    end
end

AutoConfirmPanel:SetScript("OnShow", InitOptions)

SLASH_AUTOCONFIRM1 = "/autoconfirm"
SLASH_AUTOCONFIRM2 = "/ac"
SlashCmdList["AUTOCONFIRM"] = function(msg)
    if AutoConfirmPanel:IsShown() then
        AutoConfirmPanel:Hide()
    else
        AutoConfirmPanel:Show()
    end
end
