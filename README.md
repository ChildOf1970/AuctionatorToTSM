# Auctionator To TSM

[![Build Status](https://github.com/ChildOf1970/AuctionatorToTSM/actions/workflows/release.yaml/badge.svg)](https://github.com/ChildOf1970/AuctionatorToTSM/actions/workflows/release.yaml)
[![Stable Release Date](https://img.shields.io/github/release-date/ChildOf1970/AuctionatorToTSM?logo=github&label=Released&cacheSeconds=600)](https://github.com/ChildOf1970/AuctionatorToTSM/releases)
[![Stable Release](https://img.shields.io/github/v/release/ChildOf1970/AuctionatorToTSM?logo=github&label=Stable)](https://github.com/ChildOf1970/AuctionatorToTSM/releases)
![GitHub commits since latest release](https://img.shields.io/github/commits-since/ChildOf1970/AuctionatorToTSM/latest?logo=github)
[![GitHub Downloads (all assets, latest release)](https://img.shields.io/github/downloads/ChildOf1970/AuctionatorToTSM/latest/total?logo=github&label=Downloads)](https://github.com/ChildOf1970/AuctionatorToTSM/releases/latest)
<br>
[![On Curseforge](https://img.shields.io/badge/download-Curseforge-orange?label=Download)](https://www.curseforge.com/wow/addons/asltotsm)
[![On Wago](https://img.shields.io/badge/download-Wago-orange?label=Download)](https://addons.wago.io/addons/asltotsm/)
[![On WoWI](https://img.shields.io/badge/download-WoWI-orange?label=Download)](https://www.wowinterface.com/downloads/info26919-AuctionatortoTSM.html)

## Description

This AddOn is for people who love CraftSim but prefer the TSM Auction House interface to the Auctionator one.  As there is no direct integration between CraftSim and TSM to do searches based on the ingredients needed to fulfill the Craft Queue, this AddOn uses the Auctionator Shopping List that CraftSim can generate to create a TSM shopping scan string.

## Instructions

To use this Addon follow the steps below:

1. Create and populate an Auctionator shopping list called "CraftSim CraftQueue".  This is usually done within the CraftSim Craft Queue by pressing the "Create Auctionator Shopping List" button.
2. Use the slash command "/ASLToTSM" to copy the items from the shopping list into the search string. Each item copied is removed from the shopping list.
3. Hit CTRL+C followed by either Enter or Esc to transfer the search string into the clipboard.
4. Open the TSM auction house interface and paste (CTRL+V) the search string into the search field on the browse tab.

## Note

The Reagents database used to find the item id from the item name and tier only has reagents from TWW.  This AddOn is specifically targeted at TWW.
