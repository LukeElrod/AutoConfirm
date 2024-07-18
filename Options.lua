local panel = CreateFrame("Frame")
panel.name = "AutoConfirm"
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
    {text = "Loot Roll", variable = "lootRoll"},
    {text = "Auto Type Delete", variable = "autoDeleteItem"},
    {text = "Remove Glyph", variable = "removeGlyph"},
    {text = "Glyph Placement", variable = "glyphPlacement"},
    {text = "Item Reforge", variable = "itemReforge"},
    {text = "Loot Distribution", variable = "lootDistribution"},
    {text = "Battlefield Entry", variable = "battlefieldEntry"},
    {text = "Delete Mail", variable = "deleteMailAutomatically"},
    {text = "Death", variable = "releaseSpirit"},
    {text = "Resurrect", variable = "acceptResurrect"},
    {text = "Accept Trade", variable = "acceptTrade"},
    {text = "Loot Bind", variable = "lootBind"},
    {text = "Equip Bind", variable = "equipBind"},
    {text = "Use Bind", variable = "useBind"},
    {text = "Shared Quest", variable = "acceptSharedQuest"},
    {text = "Enchant Bind", variable = "enchantBind"},
    {text = "Replace Enchant", variable = "replaceEnchant"},
    {text = "Leave Instance", variable = "leaveInstance"},
    {text = "Leave Battlefield", variable = "leaveBattlefield"},
    {text = "Surrender Arena", variable = "surrenderArena"}
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

SLASH_AUTOCONFIRM1, SLASH_AUTOCONFIRM2 = "/autoconfirm", "/ac"

function SlashCmdList.AUTOCONFIRM(msg, editBox) -- 4.
    InterfaceAddOnsList_Update()
    InterfaceOptionsFrame_OpenToCategory(panel)
end