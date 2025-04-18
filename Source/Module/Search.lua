local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)
SearchAddOn.Title = select(1, ...)

local Auctionator = Auctionator.API.v1

local Private = {}

local Search = {}

function Search:GetSearchFromShoppingList()
    return Private:GetSearchFromShoppingList()
end

function Search:Initialise()
end

function Private:GetShoppingListItems()
    return pcall(self.Auctionator.GetShoppingListItems, self.Title, self.CRAFTSIM_QUEUE_NAME)
end

function Private:ConvertFromSearchString(shoppingListItem)
    return self.Auctionator.ConvertFromSearchString(self.Title, shoppingListItem)
end

function Private:GetItemID(itemName, itemTier)
    return self.Module.Reagent:GetItemID(itemName, itemTier)
end

function Private:log(message)
    self.Module.Utility:log(message)
end

function Private:DeleteShoppingListItem(itemSearchString)
    self.Auctionator.DeleteShoppingListItem(self.Title, self.CRAFTSIM_QUEUE_NAME,
        itemSearchString)
end

function Private:GetSearchFromShoppingList()
    local success, result = self:GetShoppingListItems()
    if success then
        local searchString = self.EMPTY_STRING
        for _, shoppingListItem in ipairs(result) do
            local itemData = self:ConvertFromSearchString(shoppingListItem)
            local itemID = self:GetItemID(itemData.searchString, itemData.tier)
            if not itemID then
                if not itemData.tier then
                    self:log(self.ITEM_NAME ..
                        itemData.searchString .. self.ITEM_QUANTITY .. itemData.quantity)
                else
                    self:log(self.ITEM_NAME ..
                        itemData.searchString ..
                        self.ITEM_TIER ..
                        itemData.tier .. self.ITEM_QUANTITY .. itemData.quantity)
                end
            else
                self:DeleteShoppingListItem(shoppingListItem)
                searchString = searchString ..
                    self.ITEM_INDICATOR ..
                    itemID ..
                    self.QUANTITY_INDICATOR .. itemData.quantity .. self.SEARCH_ITEM_SEPARATOR
            end
        end
        if searchString == self.EMPTY_STRING then
            return self.EMPTY_STRING
        end
        return searchString:sub(1, #searchString - 1)
    else
        return self.EMPTY_STRING
    end
end

function Private:Initialise()
    self.CRAFTSIM_QUEUE_NAME = "CraftSim CraftQueue"
    self.EMPTY_STRING = ""
    self.ITEM_INDICATOR = "i:"
    self.ITEM_NAME = "Name: "
    self.ITEM_QUANTITY = ", Quantity: "
    self.ITEM_TIER = ", Tier: "
    self.QUANTITY_INDICATOR = "/x"
    self.SEARCH_ITEM_SEPARATOR = ";"
    self.Auctionator = Auctionator
    self.Module = SearchAddOn.Module
    self.Title = SearchAddOn.Title
end

Private:Initialise()
Search:Initialise()

SearchAddOn.Module.Search = Search
