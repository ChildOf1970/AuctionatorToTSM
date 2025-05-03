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
        local MyFrame = CreateFrame(self.COMPONENT_FRAME, self.Title .. self.UNDERSCORE .. self.NAME, UIParent, self.TEMPLATE_FRAME)
        MyFrame:SetSize(300, 150)
        MyFrame:SetPoint(self.ALIGNMENT_CENTER)
        MyFrame:SetMovable(true)
        MyFrame:EnableMouse(true)
        MyFrame:RegisterForDrag(self.LEFT_BUTTON)
        MyFrame:SetScript(EventHandler.ON_DRAG_START, MyFrame.StartMoving)
        MyFrame:SetScript(EventHandler.ON_DRAG_STOP, MyFrame.StopMovingOrSizing)
        MyFrame:SetFrameStrata(self.STRATA_DIALOG)
        MyFrame:SetFrameLevel(20)

        local MyTitle = MyFrame:CreateFontString(nil, self.LAYER_OVERLAY, self.FONT_HIGHLIGHT)
        MyTitle:SetPoint(self.ALIGNMENT_TOP, MyFrame, self.ALIGNMENT_TOP, 0, -10)
        MyTitle:SetText(self.FRAME_TITLE)

        local MyEditBox = CreateFrame(self.COMPONENT_EDIT_BOX, nil, MyFrame, self.TEMPLATE_INPUT_BOX)
        MyEditBox:SetSize(260, 30)
        MyEditBox:SetPoint(self.ALIGNMENT_CENTER, MyFrame, self.ALIGNMENT_CENTER, 4, 10)
        MyEditBox:SetFontObject(self.FONT_NORMAL)
        MyEditBox:SetAutoFocus(true)
        MyEditBox:SetText(text)
        MyEditBox:HighlightText()

        local MyOKButton = CreateFrame(self.COMPONENT_BUTTON, nil, MyFrame, self.TEMPLATE_BUTTON)
        MyOKButton:SetSize(100, 30)
        MyOKButton:SetPoint(self.ALIGNMENT_BOTTOM, MyFrame, self.ALIGNMENT_BOTTOM, 4, 10)
        MyOKButton:SetText(self.OK)
        MyOKButton:SetNormalFontObject(self.FONT_NORMAL)
        MyOKButton:SetHighlightFontObject(self.FONT_HIGHLIGHT)

        MyEditBox:SetScript(EventHandler.ON_KEY_UP, function(_, event)
            if(event == EventHandler.EVENT_ESCAPE or event == EventHandler.EVENT_ENTER) then
                MyEditBox:ClearFocus()
                MyFrame:Hide()
            end
        end)
        MyFrame:SetScript(EventHandler.ON_HIDE, function()
            MyEditBox:SetText(EventHandler.EMPTY_STRING)
        end)
        MyOKButton:SetScript(EventHandler.ON_CLICK, function()
            MyEditBox:ClearFocus()
            MyFrame:Hide()
        end)

        MyFrame:Show()
    end
end

function Private:Initialise()
    self.ALIGNMENT_BOTTOM = "BOTTOM"
    self.ALIGNMENT_CENTER = "CENTER"
    self.ALIGNMENT_TOP = "TOP"
    self.COLOR_LIGHT_BLUE = "|cff87CEEB"
    self.COLOR_RESET = "|r"
    self.COMPONENT_BUTTON = "Button"
    self.COMPONENT_EDIT_BOX = "EditBox"
    self.COMPONENT_FRAME = "Frame"
    self.FONT_HIGHLIGHT = "GameFontHighlight"
    self.FONT_NORMAL = "GameFontNormal"
    self.FRAME_TITLE = "Auctionator to TSM"
    self.LAYER_OVERLAY = "OVERLAY"
    self.LEFT_BUTTON = "LeftButton"
    self.NAME = "Frame"
    self.OK = "OK"
    self.SEPARATOR = ":"
    self.SPACE = " "
    self.STRATA_DIALOG = "DIALOG"
    self.TEMPLATE_FRAME = "UIPanelDialogTemplate"
    self.TEMPLATE_INPUT_BOX = "InputBoxTemplate"
    self.TEMPLATE_BUTTON = "GameMenuButtonTemplate"
    self.UNDERSCORE = "_"
    self.Title = SearchAddOn.Title
end

function EventHandler:Initialise()
    self.EMPTY_STRING = ""
    self.EVENT_ESCAPE = "ESCAPE"
    self.EVENT_ENTER = "ENTER"
    self.ON_CLICK = "OnClick"
    self.ON_DRAG_START = "OnDragStart"
    self.ON_DRAG_STOP = "OnDragStop"
    self.ON_KEY_UP = "OnKeyUp"
    self.ON_HIDE = "onHide"
end

EventHandler:Initialise()
Private:Initialise()
Utility:Initialise()

SearchAddOn.Module.Utility = Utility
