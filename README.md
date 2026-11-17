# NoBiographer

A tiny World of Warcraft addon that hides [AutoBiographer](https://www.curseforge.com/wow/addons/autobiographer) milestone spam from guild chat.

AutoBiographer posts guild messages like:

```
[Guild] [Somebody]: [AutoBiographer] I have killed 1,000 creatures!
```

NoBiographer filters any guild or officer chat line that starts with `[AutoBiographer]`, so you never see them. This includes your own. Everything else in guild chat shows as usual.

## Install

1. Download **[NoBiographer.zip](https://github.com/jigrobbulus/wow-nobiographer/releases/latest/download/NoBiographer.zip)** from the latest release.
2. Unzip it into your AddOns directory, so you end up with:

   ```
   World of Warcraft/_classic_era_/Interface/AddOns/NoBiographer/NoBiographer.toc
   ```

Don't use GitHub's green "Code → Download ZIP" button. It wraps the addon in an extra folder and WoW won't load it.

The TOC lists Classic Era/Anniversary, TBC and Mists interface versions.

## Commands

| Command | What it does |
| --- | --- |
| `/nobio` | Toggle hiding on or off |
| `/nobio on` / `/nobio off` | Turn hiding on or off |
| `/nobio status` | Show whether hiding is on, and how many messages have been hidden |

## License

[MIT](LICENSE)
