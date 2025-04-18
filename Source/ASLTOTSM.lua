local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)
SearchAddOn.Title = select(1, ...)

local EventHandler = {}

local Private = {}

function Private:GetSearchFromShoppingList()
    return self.Module.Search:GetSearchFromShoppingList()
end

function Private:CopyToClipboard(text)
    self.Module.Utility:CopyToClipboard(text)
end

function Private:log(message)
    self.Module.Utility:log(message)
end

function Private:SetLoadedMessage()
    local frame = CreateFrame(self.FRAME)
    frame:RegisterEvent(EventHandler.PLAYER_LOGIN)
    frame:SetScript(EventHandler.ON_EVENT, EventHandler.OnEvent)
end

function Private:SetSlashCommand()
    _G[self.SLASH_PREFIX .. self.Title .. self.SLASH_SUFFIX] = self.SLASH .. self.Title
    SlashCmdList[self.Title] = function(_)
        local searchString = self:GetSearchFromShoppingList()
        if not searchString or searchString == self.EMPTY_STRING then
            self:log(self.SHOPPING_LIST_EMPTY_OR_NOT_FOUND)
            return
        end
        self:CopyToClipboard(searchString)
    end
end

function Private:Initialise()
    self.EMPTY_STRING = ""
    self.FRAME = "Frame"
    self.SHOPPING_LIST_EMPTY_OR_NOT_FOUND = "Shopping list is empty or does not exist."
    self.SLASH = "/"
    self.SLASH_PREFIX = "SLASH_"
    self.SLASH_SUFFIX = "1"
    self.Module = SearchAddOn.Module
    self.Title = SearchAddOn.Title
    self:SetLoadedMessage()
    self:SetSlashCommand()
end

function EventHandler:log(message)
    self.Module.Utility:log(message)
end

function EventHandler:OnEvent(event, _)
    if event == EventHandler.PLAYER_LOGIN then
        self:UnregisterEvent(EventHandler.PLAYER_LOGIN)
        self:Hide()
        self:SetParent(nil)
        self:SetScript(EventHandler.ON_UPDATE, nil)
        self:SetScript(EventHandler.ON_EVENT, nil)
        EventHandler:log(EventHandler.MSG_LOADED)
    end
end

function EventHandler:Initialise()
    self.ON_EVENT = "OnEvent"
    self.ON_UPDATE = "OnUpdate"
    self.MSG_LOADED = "Loaded!"
    self.PLAYER_LOGIN = "PLAYER_LOGIN"
    self.Module = SearchAddOn.Module
    return self
end

EventHandler:Initialise()
Private:Initialise()
