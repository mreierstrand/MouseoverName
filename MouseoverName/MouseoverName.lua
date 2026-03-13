local frame = CreateFrame("Frame", "MouseoverNameFrame", UIParent)
frame:SetSize(200, 20)
frame:SetFrameStrata("TOOLTIP")

local text = frame:CreateFontString(nil, "OVERLAY")
text:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
text:SetAllPoints()
text:SetJustifyH("LEFT")

frame:Hide()

local function UpdateDisplay()
    if UnitExists("mouseover") then
        local name = UnitName("mouseover")
        local color = {r = 1, g = 1, b = 1}

        if UnitIsPlayer("mouseover") then
            local _, classFile = UnitClass("mouseover")
            local classColor = RAID_CLASS_COLORS[classFile]
            if classColor then
                color = classColor
            end
        else
            local reaction = UnitReaction("mouseover", "player")
            if reaction then
                color = FACTION_BAR_COLORS[reaction]
            end
        end

        text:SetText(name)
        text:SetTextColor(color.r, color.g, color.b)
        frame:Show()
    else
        frame:Hide()
    end
end

frame:SetScript("OnEvent", function(_, event)
    if event == "UPDATE_MOUSEOVER_UNIT" then
        UpdateDisplay()
    end
end)

frame:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

frame:SetScript("OnUpdate", function()
    local x, y = GetCursorPosition()
    local scale = UIParent:GetEffectiveScale()
    frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", (x/scale)+20, (y/scale)+20)

    if not UnitExists("mouseover") and frame:IsShown() then
        frame:Hide()
    end
end)

SLASH_MOUSEOVERN1 = "/mon"
SlashCmdList["MOUSEOVERN"] = function(msg)
    local cmd, arg = msg:match("^(%S*)%s*(%S*)$")
    cmd = cmd:lower()

    if cmd == "font" and tonumber(arg) then
        local size = tonumber(arg)
        text:SetFont("Fonts\\FRIZQT__.TTF", size, "OUTLINE")
        print("MouseoverName: Font size set to", size)
    else
        print("MouseoverName commands:")
        print("/mon font <size> - change font size")
    end
end