---@meta

---The GrandExchange table contains functions that enable read-only access to properties relevant to the Grand Exchange in the game.
---@class GrandExchange
GrandExchange = {}

---Type of offer for a offer on the Grand Exchange.
---@enum GrandExchangeOfferType
GrandExchangeOfferType = {
	BUY = 0,
	SELL = 1,
}

---Repesentation of a stage for a offer on the Grand Exchange.
---@enum GrandExchangeOfferStage
GrandExchangeOfferStage = {
	EMPTY = 0,
	ADDING = 1,
	ADDED = 2,
	VERIFYING = 3,
	ABORTING = 4,
	FINISHED = 5,
}

---A representation of an offer on the Grand Exchange.
---@class GrandExchangeOffer
---@field stage GrandExchangeOfferStage The stage the offer has reached.
---@field type GrandExchangeOfferType The type of offer.
---@field item ObjType The item associated with the offer.
---@field price integer The gold price per individual item.
---@field itemCount integer Number of items in the offer.
---@field soldCount integer Number of items that have been sold in the offer.
---@field goldFromSale integer Amount of gold available after some items have been bought/sold.

---Returns the offer in the specified slot or nil if the slot can't be found.
---@param slot integer 1-indexed slot number.
---@return GrandExchangeOffer? # The offer in the specified slot. Is `nil` if the slot can't be found.
function GrandExchange.GetOffer(slot) end

---Returns the maximum number of offers a player can have on the Grand Exchange.
---@return integer # The maximum number of offers a player can have on the Grand Exchange.
function GrandExchange.MaxOffers() end
