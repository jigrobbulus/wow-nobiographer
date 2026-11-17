# NoBiographer

A tiny World of Warcraft addon that hides [AutoBiographer](https://www.curseforge.com/wow/addons/autobiographer) milestone spam from guild chat.

AutoBiographer posts guild messages like:

```
[Guild] [Somebody]: [AutoBiographer] I have killed 1,000 creatures!
```

NoBiographer filters any guild or officer chat line that starts with `[AutoBiographer]`, so you never see them. This includes your own. Everything else in guild chat shows as usual.

## Install

Copy the `NoBiographer` folder into your AddOns directory, for example:

```
World of Warcraft/_classic_era_/Interface/AddOns/NoBiographer
```

The TOC lists Classic Era/Anniversary, TBC and Mists interface versions.

## Commands

| Command | What it does |
| --- | --- |
| `/nobio` | Toggle hiding on or off |
| `/nobio on` / `/nobio off` | Turn hiding on or off |
| `/nobio status` | Show whether hiding is on, and how many messages have been hidden |
