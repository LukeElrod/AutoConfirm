local panel = CreateFrame("Frame")
panel.name = "Raz"
InterfaceOptions_AddCategory(panel)

local scrollFrame = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", 3, -4)
scrollFrame:SetPoint("BOTTOMRIGHT", -27, 4)

local scrollChild = CreateFrame("Frame")
scrollFrame:SetScrollChild(scrollChild)
scrollChild:SetWidth(InterfaceOptionsFramePanelContainer:GetWidth()-18)
scrollChild:SetHeight(1) 

local title = scrollChild:CreateFontString("ARTWORK", nil, "GameFontNormalLarge")
title:SetPoint("TOP")
title:SetText("Auto Confirmations")

local function CreateCheckButton(parent, yOffset, text, variable)
    local button = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    button:SetPoint("TOPLEFT", 0, yOffset)
    button.Text:SetText(text)
    button:SetScript("OnClick", function()
        AutoConfirmationSettings[variable] = button:GetChecked()
    end)
    return button
end

local checkButtons = {
    {text = "Abandon Quest", variable = "abandonQuest"},
    {text = "Loot Roll", variable = "confirmLootRoll"},
    {text = "Auto Type Delete", variable = "autoDeleteItem"},
    {text = "Remove Glyph", variable = "removeGlyph"},
    {text = "Confirm Glyph", variable = "confirmGlyphPlacement"},
    {text = "Reforge", variable = "confirmItemReforge"},
    {text = "Master Loot", variable = "confirmLootDistribution"},
    {text = "Battlefield Entry", variable = "confirmBattlefieldEntry"},
    {text = "Delete Mail", variable = "deleteMailAutomatically"},
    {text = "Death", variable = "releaseSpirit"},
    {text = "Resurrect", variable = "acceptResurrect"},
    {text = "acceptTrade", variable = "acceptTrade"},
    {text = "Loot Bind", variable = "confirmLootBind"},
    {text = "Equip Bind", variable = "confirmEquipBind"},
    {text = "Use Bind", variable = "confirmUseBind"},
    {text = "Shared Quest", variable = "acceptSharedQuest"},
    {text = "Enchant Bind", variable = "confirmEnchantBind"},
    {text = "Replace Enchant", variable = "confirmReplaceEnchant"},
    {text = "Leave Instance", variable = "confirmLeaveInstance"},
    {text = "Leave Battlefield", variable = "confirmLeaveBattlefield"},
    {text = "Surrender Arena", variable = "confirmSurrenderArena"}
}

for i, buttonInfo in ipairs(checkButtons) do
    local yOffset = -20 * i
    buttonInfo.button = CreateCheckButton(scrollChild, yOffset, buttonInfo.text, buttonInfo.variable)
end

local function InitOptions()
    for _, buttonInfo in ipairs(checkButtons) do
        buttonInfo.button:SetChecked(AutoConfirmationSettings[buttonInfo.variable])
    end
end

panel:SetScript("OnShow", InitOptions)