local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)
SearchAddOn.Title = select(1, ...)

local EventHandler = {}

local Private = {}

local Utility = {}

function Utility:log(message)
    Private:log(message)
end

function Utility:CopyToClipboard(text)
    Private:CopyToClipboard(text)
end

function Utility:Initialise()
end

function Private:log(message)
    print(self.COLOR_LIGHT_BLUE ..
        self.Title .. self.SEPARATOR .. self.COLOR_RESET .. self.SPACE .. tostring(message))
end

function Private:CopyToClipboard(text)
    if text and text ~= EventHandler.EMPTY_STRING then
        local editBox = CreateFrame(self.EDIT_BOX, self.Title .. self.UNDERSCORE .. self.NAME, UIParent)
        editBox:SetSize(280, 20)
        editBox:SetPoint(self.ALIGNMENT)
        editBox:SetFontObject(self.FONT)
        editBox:SetAutoFocus(true)
        editBox:SetText(text)
        editBox:HighlightText()
        editBox:SetScript(EventHandler.ON_ESCAPE_PRESSED, EventHandler.OnEscapePressed)
        editBox:SetScript(EventHandler.ON_ENTER_PRESSED, EventHandler.OnEnterPressed)
        editBox:SetScript(EventHandler.ON_HIDE, EventHandler.OnHide)
        editBox:Show()
    end
end

function Private:Initialise()
    self.ALIGNMENT = "CENTER"
    self.COLOR_LIGHT_BLUE = "|cff87CEEB"
    self.COLOR_RESET = "|r"
    self.EDIT_BOX = "EditBox"
    self.FONT = "GameFontNormal"
    self.NAME = "EditBox"
    self.SEPARATOR = ":"
    self.SPACE = " "
    self.UNDERSCORE = "_"
    self.Title = SearchAddOn.Title
end

function EventHandler:OnEscapePressed()
    self:ClearFocus()
    self:Hide()
end

function EventHandler:OnEnterPressed()
    self:ClearFocus()
    self:Hide()
end

function EventHandler:OnHide()
    self:SetText(EventHandler.EMPTY_STRING)
end

function EventHandler:Initialise()
    self.EMPTY_STRING = ""
    self.ON_ENTER_PRESSED = "OnEnterPressed"
    self.ON_ESCAPE_PRESSED = "OnEscapePressed"
    self.ON_HIDE = "onHide"
end

EventHandler:Initialise()
Private:Initialise()
Utility:Initialise()

SearchAddOn.Module.Utility = Utility
