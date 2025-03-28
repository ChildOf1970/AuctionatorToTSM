local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)
SearchAddOn.Title = select(1, ...)

local Private = {}

local Utility = {}

function Utility:log(message)
    Private:log(message)
end

function Utility:CopyToClipboard(text)
    Private:CopyToClipboard(text)
end

function Private:log(message)
    print(Private.COLOR_LIGHT_BLUE ..
        SearchAddOn.Title .. Private.SEPARATOR .. Private.COLOR_RESET .. Private.SPACE .. tostring(message))
end

function Private:CopyToClipboard(text)
    if text and text ~= Private.EMPTY_STRING then
        local editBox = CreateFrame(Private.EDIT_BOX, Private.EDIT_BOX, UIParent)
        editBox:SetSize(280, 20)
        editBox:SetPoint(Private.ALIGNMENT)
        editBox:SetFontObject(Private.FONT)
        editBox:SetAutoFocus(true)
        editBox:SetText(text)
        editBox:HighlightText()
        editBox:SetScript(Private.ON_ESCAPE_PRESSED, function(uiSelf)
            uiSelf:ClearFocus()
            uiSelf:Hide()
        end)
        editBox:SetScript(Private.ON_ENTER_PRESSED, function(uiSelf)
            uiSelf:ClearFocus()
            uiSelf:Hide()
        end)
        editBox:SetScript(Private.ON_HIDE, function(uiSelf)
            uiSelf:SetText(Private.EMPTY_STRING)
        end)
        editBox:Show()
    end
end

function Private:Initialise()
    self.ALIGNMENT = "CENTER"
    self.COLOR_LIGHT_BLUE = "|cff87CEEB"
    self.COLOR_RESET = "|r"
    self.EDIT_BOX = "EditBox"
    self.EMPTY_STRING = ""
    self.FONT = "GameFontNormal"
    self.ON_ENTER_PRESSED = "OnEnterPressed"
    self.ON_ESCAPE_PRESSED = "OnEscapePressed"
    self.ON_HIDE = "onHide"
    self.SEPARATOR = ":"
    self.SPACE = " "
    SearchAddOn.Module.Utility = Utility
end

Private:Initialise()
