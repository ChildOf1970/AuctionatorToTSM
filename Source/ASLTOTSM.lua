local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)
SearchAddOn.Title = select(1, ...)

local Private = {}

function Private:GetSearchFromShoppingList()
    return SearchAddOn.Module.Search:GetSearchFromShoppingList()
end

function Private:CopyToClipboard(text)
    SearchAddOn.Module.Utility:CopyToClipboard(text)
end

function Private:log(message)
    SearchAddOn.Module.Utility:log(message)
end

function Private:SetLoadedMessage()
    local frame = CreateFrame(self.FRAME)
    frame:RegisterEvent(self.PLAYER_LOGIN)
    frame:SetScript(self.ON_EVENT, function(uiSelf, event, _)
        if event == self.PLAYER_LOGIN then
            uiSelf:UnregisterEvent(self.PLAYER_LOGIN)
            uiSelf:Hide()
            uiSelf:SetParent(nil)
            uiSelf:SetScript(self.ON_UPDATE, nil)
            uiSelf:SetScript(self.ON_EVENT, nil)
            self:log(self.MSG_LOADED)
        end
    end)
end

function Private:SetSlashCommand()
    _G[self.SLASH_PREFIX .. SearchAddOn.Title .. self.SLASH_SUFFIX] = self.SLASH .. SearchAddOn.Title
    SlashCmdList[SearchAddOn.Title] = function(_)
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
    self.MSG_LOADED = "Loaded!"
    self.ON_EVENT = "OnEvent"
    self.ON_UPDATE = "OnUpdate"
    self.PLAYER_LOGIN = "PLAYER_LOGIN"
    self.SHOPPING_LIST_EMPTY_OR_NOT_FOUND = "Shopping list is empty or does not exist."
    self.SLASH = "/"
    self.SLASH_PREFIX = "SLASH_"
    self.SLASH_SUFFIX = "1"
    self:SetLoadedMessage()
    self:SetSlashCommand()
end

Private:Initialise()
