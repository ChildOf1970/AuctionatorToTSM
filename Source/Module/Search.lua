local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)
SearchAddOn.Title = select(1, ...)

local Auctionator = Auctionator.API.v1

local Private = {}

local Search = {}

function Search:GetSearchFromShoppingList()
    return Private:GetSearchFromShoppingList()
end

function Private:GetShoppingListItems()
    return pcall(Auctionator.GetShoppingListItems, SearchAddOn.Title, self.CRAFTSIM_QUEUE_NAME)
end

function Private:ConvertFromSearchString(shoppingListItem)
    return Auctionator.ConvertFromSearchString(SearchAddOn.Title, shoppingListItem)
end

function Private:GetItemID(itemName, itemTier)
    return SearchAddOn.Module.Reagent:GetItemID(itemName, itemTier)
end

function Private:log(message)
    SearchAddOn.Module.Utility:log(message)
end

function Private:DeleteShoppingListItem(itemSearchString)
    Auctionator.DeleteShoppingListItem(SearchAddOn.Title, self.CRAFTSIM_QUEUE_NAME,
        itemSearchString)
end

function Private:GetSearchFromShoppingList()
    local success, result = Private:GetShoppingListItems()
    if success then
        local searchString = Private.EMPTY_STRING
        for _, shoppingListItem in ipairs(result) do
            local itemData = Private:ConvertFromSearchString(shoppingListItem)
            local itemID = Private:GetItemID(itemData.searchString, itemData.tier)
            if not itemID then
                if not itemData.tier then
                    Private:log(Private.ITEM_NAME ..
                        itemData.searchString .. Private.ITEM_QUANTITY .. itemData.quantity)
                else
                    Private:log(Private.ITEM_NAME ..
                        itemData.searchString ..
                        Private.ITEM_TIER ..
                        itemData.tier .. Private.ITEM_QUANTITY .. itemData.quantity)
                end
            else
                Private:DeleteShoppingListItem(shoppingListItem)
                searchString = searchString ..
                    Private.ITEM_INDICATOR ..
                    itemID ..
                    Private.QUANTITY_INDICATOR .. itemData.quantity .. Private.SEARCH_ITEM_SEPARATOR
            end
        end
        if searchString == Private.EMPTY_STRING then
            return Private.EMPTY_STRING
        end
        return searchString:sub(1, #searchString - 1)
    else
        return Private.EMPTY_STRING
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
    SearchAddOn.Module.Search = Search
end

Private:Initialise()
