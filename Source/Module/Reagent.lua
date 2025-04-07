local SearchAddOn = {}
SearchAddOn.Module = select(2, ...)

local Private = {}

local Reagent = {}

function Reagent:GetItemID(itemName, itemTier)
    return Private:GetItemID(itemName, itemTier)
end

function Private:log(message)
    SearchAddOn.Module.Utility:log(message)
end

function Private:GetItemID(itemName, itemTier)
    if self.ReagentData[itemName] then
        if not itemTier then
            return self.ReagentData[itemName]
        else
            return self.ReagentData[itemName][itemTier]
        end
    else
        return nil
    end
end

function Private:Initialise()
    self.ReagentData = {
        ["Adorning Ribbon"] = "228930",
        ["Adjustable Framework"] = {
            [1] = "222511",
            [2] = "222512",
            [3] = "222413"
        },
        ["Algari Missive of the Aurora"] = {
            [1] = "222579",
            [2] = "222580",
            [3] = "222581"
        },
        ["Algari Missive of the Feverflare"] = {
            [1] = "222582",
            [2] = "222583",
            [3] = "222584"
        },
        ["Algari Missive of the Fireflash"] = {
            [1] = "222585",
            [2] = "222586",
            [3] = "222587"
        },
        ["Algari Missive of the Harmonious"] = {
            [1] = "222588",
            [2] = "222589",
            [3] = "222590"
        },
        ["Algari Missive of the Peerless"] = {
            [1] = "222591",
            [2] = "222592",
            [3] = "222593"
        },
        ["Algari Missive of the Quickblade"] = {
            [1] = "222594",
            [2] = "222595",
            [3] = "222596"
        },
        ["Ambivalent Amber"] = "212498",
        ["Apprentice's Crafting License"] = "225670",
        ["Apricate Ink"] = {
            [1] = "222615",
            [2] = "222616",
            [3] = "222617"
        },
        ["Aqirite"] = {
            [1] = "210933",
            [2] = "210934",
            [3] = "210935"
        },
        ["Arathor's Spear"] = {
            [1] = "210808",
            [2] = "210809",
            [3] = "210810"
        },
        ["Assorted Whirligigs"] = "227770",
        ["Basically Beef"] = "223512",
        ["Bismuth"] = {
            [1] = "210930",
            [2] = "210931",
            [3] = "210932"
        },
        ["Bismuth Bitterling"] = "220137",
        ["Black Dye"] = "2325",
        ["Blasphemite"] = "212514",
        ["Blue Dye"] = "6260",
        ["Blame Redirection Device"] = {
            [1] = "221926",
            [2] = "221927",
            [3] = "221928"
        },
        ["Blessing Blossom"] = {
            [1] = "210805",
            [2] = "210806",
            [3] = "210807"
        },
        ["Blinker Fluid"] = "227771",
        ["Bloody Perch"] = "220135",
        ["Blossom Pigment"] = {
            [1] = "224805",
            [2] = "224804",
            [3] = "224803"
        },
        ["Bottled Brilliance"] = {
            [1] = "225987",
            [2] = "225988",
            [3] = "225989"
        },
        ["Bottled Storm"] = "218338",
        ["Boundless Cipher"] = {
            [1] = "222558",
            [2] = "222559",
            [3] = "222560"
        },
        ["Bountiful Bolts"] = "227769",
        ["Bright Polishing Cloth"] = {
            [1] = "222879",
            [2] = "222880",
            [3] = "222881"
        },
        ["Bubbling Mycobloom Culture"] = {
            [1] = "228401",
            [2] = "228402",
            [3] = "228403"
        },
        ["Bug Brisket"] = "225567",
        ["Burning Cinderbee Setae"] = "218339",
        ["Cataclysmic Converter"] = "227772",
        ["Carapace-Backed Hide"] = {
            [1] = "219880",
            [2] = "219881",
            [3] = "219882"
        },
        ["Chaos Circuit"] = {
            [1] = "221865",
            [2] = "221866",
            [3] = "221867"
        },
        ["Charged Alloy"] = {
            [1] = "222420",
            [2] = "222421",
            [3] = "222422"
        },
        ["Chitin Armor Banding"] = {
            [1] = "219898",
            [2] = "219899",
            [3] = "212900"
        },
        ["Clipped Bird Wing"] = "225569",
        ["Codified Greenwood"] = {
            [1] = "222555",
            [2] = "222556",
            [3] = "222557"
        },
        ["Complicated Fuse Box"] = {
            [1] = "221932",
            [2] = "221933",
            [3] = "221934"
        },
        ["Concealed Chaos Module"] = {
            [1] = "221938",
            [2] = "221939",
            [3] = "221940"
        },
        ["Concentration Concentrate"] = {
            [1] = "224173",
            [2] = "224174",
            [3] = "224175"
        },
        ["Core Alloy"] = {
            [1] = "222417",
            [2] = "222418",
            [3] = "222419"
        },
        ["Crushed Gemstones"] = {
            [1] = "213219",
            [2] = "213220",
            [3] = "213221"
        },
        ["Crystal Vial"] = "3371",
        ["Crystalfused Hide"] = {
            [1] = "219883",
            [2] = "219884",
            [3] = "219885"
        },
        ["Crystalline Powder"] = "213610",
        ["Crystalline Sturgeon"] = "220136",
        ["Dawnthread Lining"] = {
            [1] = "222868",
            [2] = "222869",
            [3] = "222870"
        },
        ["Dawnweave Bolt"] = {
            [1] = "222801",
            [2] = "222802",
            [3] = "222803"
        },
        ["Decorative Lens"] = {
            [1] = "213753",
            [2] = "213754",
            [3] = "213755"
        },
        ["Dilly-Dally Dace"] = "220134",
        ["Distilled Algari Freshwater"] = "226205",
        ["Dornish Pike"] = "220143",
        ["Duskweave Bolt"] = {
            [1] = "222798",
            [2] = "222799",
            [3] = "222800"
        },
        ["Echoing Flux"] = "226202",
        ["Elemental Flux"] = "18567",
        ["Energy Redistribution Beacon"] = {
            [1] = "221941",
            [2] = "221942",
            [3] = "221943"
        },
        ["Engraved Gemcutter"] = {
            [1] = "213750",
            [2] = "213751",
            [3] = "213752"
        },
        ["Entropy Enhancer"] = {
            [1] = "221868",
            [2] = "221869",
            [3] = "221870"
        },
        ["Eternium Thread"] = "38426",
        ["Exquisite Weavercloth Bolt"] = {
            [1] = "224832",
            [2] = "224833",
            [3] = "224834"
        },
        ["Extravagant Emerald"] = "212505",
        ["Fine Thread"] = "2321",
        ["Forged Framework"] = {
            [1] = "222499",
            [2] = "222500",
            [3] = "222501"
        },
        ["Frayed Wiring"] = "228414",
        ["Fresh Parchment"] = "226204",
        ["Gilded Vial"] = {
            [1] = "211806",
            [2] = "211807",
            [3] = "211808"
        },
        ["Gleaming Shard"] = {
            [1] = "219949",
            [2] = "219950",
            [3] = "219951"
        },
        ["Glittering Glass"] = "213399",
        ["Gloom Chitin"] = {
            [1] = "212667",
            [2] = "212668",
            [3] = "212669"
        },
        ["Gloomfathom Hide"] = "221757",
        ["Goldengill Troup"] = "225533",
        ["Gyrating Gear"] = {
            [1] = "221859",
            [2] = "221860",
            [3] = "221861"
        },
        ["Handful of Bismuth Bolts"] = {
            [1] = "221853",
            [2] = "221854",
            [3] = "221855"
        },
        ["Handful of Pebbles"] = "213398",
        ["Harmonious Horticulture"] = {
            [1] = "212563",
            [2] = "212564",
            [3] = "212565"
        },
        ["Heavy Silken Thread"] = "8343",
        ["Honed Bone Shards"] = "218337",
        ["Imperfect Null Stone"] = "217707",
        ["Impeccable Cogwheel"] = {
            [1] = "221917",
            [2] = "221918",
            [3] = "221919"
        },
        ["Inverted Prism"] = {
            [1] = "213759",
            [2] = "213760",
            [3] = "213761"
        },
        ["Ironclaw Alloy"] = {
            [1] = "222426",
            [2] = "222427",
            [3] = "222428"
        },
        ["Ironclaw Ore"] = {
            [1] = "210936",
            [2] = "210937",
            [3] = "210938"
        },
        ["Kaheti Slum Shark"] = "220147",
        ["Kaheti Swarm Chitin"] = "218336",
        ["Leyline Residue"] = "213613",
        ["Light Parchment"] = "39534",
        ["Luredrop"] = {
            [1] = "210799",
            [2] = "210800",
            [3] = "210801"
        },
        ["Luredrop Pigment"] = {
            [1] = "222612",
            [2] = "222613",
            [3] = "222614"
        },
        ["Massive Worm Flank"] = "225565",
        ["Marbled Stone"] = {
            [1] = "213756",
            [2] = "213757",
            [3] = "213758"
        },
        ["Mosswool Thread"] = "224764",
        ["Mycobloom"] = {
            [1] = "210796",
            [2] = "210797",
            [3] = "210798"
        },
        ["Nacreous Pigment"] = {
            [1] = "222618",
            [2] = "222619",
            [3] = "222620"
        },
        ["Nibbling Minnow"] = "220138",
        ["Null Lotus"] = "213197",
        ["Null Stone"] = "210939",
        ["Orbinid"] = {
            [1] = "210802",
            [2] = "210803",
            [3] = "210804"
        },
        ["Orbinid Pigment"] = {
            [1] = "224802",
            [2] = "224801",
            [3] = "224800"
        },
        ["Ostentatious Onyx"] = "212511",
        ["Overclocked Cogwheel"] = {
            [1] = "221914",
            [2] = "221915",
            [3] = "221916"
        },
        ["Potion of the Reborn Cheetah"] = {
            [1] = "212266",
            [2] = "212267",
            [3] = "212268"
        },
        ["Prismatic Null Stone"] = {
            [1] = "213771",
            [2] = "213772",
            [3] = "213773"
        },
        ["Profaned Tinderbox"] = "221758",
        ["Purple Dye"] = "4342",
        ["Quiet River Bass"] = "220142",
        ["Radiant Ruby"] = "212495",
        ["Recalibrated Safety Switch"] = {
            [1] = "221923",
            [2] = "221924",
            [3] = "221925"
        },
        ["Red Dye"] = "2604",
        ["Refulgent Crystal"] = {
            [1] = "219952",
            [2] = "219954",
            [3] = "219955"
        },
        ["Regal Dottyback"] = "220146",
        ["Ringing Deeps Ingot"] = "221754",
        ["Roaring Angleseeker"] = "220144",
        ["Rune Thread"] = "14341",
        ["Safety Switch"] = {
            [1] = "221862",
            [2] = "221863",
            [3] = "221864"
        },
        ["Sanctified Alloy"] = {
            [1] = "222423",
            [2] = "222424",
            [3] = "222425"
        },
        ["Sanguine Dogfish"] = "220149",
        ["Serrated Cogwheel"] = {
            [1] = "221911",
            [2] = "221912",
            [3] = "221913"
        },
        ["Shadow Ink"] = {
            [1] = "222609",
            [2] = "222610",
            [3] = "222611"
        },
        ["Simple Flour"] = "30817",
        ["Simple Wood"] = "4470",
        ["Specular Rainbowfish"] = "220141",
        ["Spiked Sea Raven"] = "220150",
        ["Spool of Dawnthread"] = {
            [1] = "222792",
            [2] = "222793",
            [3] = "222794"
        },
        ["Spool of Duskthread"] = {
            [1] = "222789",
            [2] = "222790",
            [3] = "222791"
        },
        ["Spool of Weaverthread"] = {
            [1] = "222795",
            [2] = "222796",
            [3] = "222797"
        },
        ["Sporecoated Hide"] = {
            [1] = "219889",
            [2] = "219890",
            [3] = "219891"
        },
        ["Stack of Pentagold Reviews"] = "225671",
        ["Storm Dust"] = {
            [1] = "219946",
            [2] = "219947",
            [3] = "219948"
        },
        ["Stormcharged Leather"] = {
            [1] = "212664",
            [2] = "212665",
            [3] = "212666"
        },
        ["Storm-Touched Weapon Wrap"] = {
            [1] = "219901",
            [2] = "219902",
            [3] = "219903"
        },
        ["Stunning Sapphire"] = "212508",
        ["Sunless Carapace"] = {
            [1] = "212674",
            [2] = "212675",
            [3] = "212676"
        },
        ["Thunderous Hide"] = {
            [1] = "212670",
            [2] = "212672",
            [3] = "212673"
        },
        ["Unraveled Instructions"] = "225672",
        ["Vial of Kaheti Oils"] = "221756",
        ["Vicious Flask of Honor"] = "212292",
        ["Viridescent Spores"] = "213612",
        ["Viridian Charmcap"] = "221763",
        ["Warped Wing"] = "225566",
        ["Weavercloth"] = {
            [1] = "224828",
            [2] = "228231",
            [3] = "228232"
        },
        ["Weavercloth Bolt"] = {
            [1] = "222804",
            [2] = "222805",
            [3] = "222806"
        },
        ["Weavercloth Embroidery Thread"] = {
            [1] = "222882",
            [2] = "222883",
            [3] = "222884"
        },
        ["Whimsical Wiring"] = {
            [1] = "221856",
            [2] = "221857",
            [3] = "221858"
        },
        ["Whispering Stargazer"] = "220139",
        ["Writhing Hide"] = {
            [1] = "219886",
            [2] = "219887",
            [3] = "219888"
        },
        ["Writhing Sample"] = "213611",
    }
    SearchAddOn.Module.Reagent = Reagent

    self:log("Item Database Loaded")
end

Private:Initialise()
