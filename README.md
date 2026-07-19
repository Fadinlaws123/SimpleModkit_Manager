<div align="center">

# 🔧 SimpleModkit Manager

### A lightweight FiveM utility for automatically applying configured vehicle modkit options.

<p>
  <a href="https://simpledevelopments.org/store"><img src="https://img.shields.io/badge/Explore_Our_Store-5865F2?style=for-the-badge&logo=googlechrome&logoColor=white" /></a>
  <a href="https://discord.gg/RquDVTfDwu"><img src="https://img.shields.io/badge/Join_Our_Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" /></a>
  <a href="https://github.com/Fadinlaws123/SimpleModkit_Manager"><img src="https://img.shields.io/badge/View_on_GitHub-181717?style=for-the-badge&logo=github&logoColor=white" /></a>
</p>

<p>
  <img src="https://img.shields.io/badge/FiveM-Standalone-FF6B35?style=flat-square&logo=fivem&logoColor=white" />
  <img src="https://img.shields.io/badge/Vehicle-Modkit_Manager-238636?style=flat-square" />
  <img src="https://img.shields.io/badge/Status-Release_Ready-238636?style=flat-square" />
  <img src="https://img.shields.io/github/stars/Fadinlaws123/SimpleModkit_Manager?style=flat-square&logo=github&label=Stars" />
</p>

</div>

---

## 📖 About

**SimpleModkit Manager** automatically applies configured vehicle modifications when a player enters a supported vehicle as the driver.

The resource is useful for addon or emergency vehicles that rely on specific mod slots for equipment, partitions, grilles, roof accessories, or other vehicle components that should always be enabled.

A built-in `/getmods` diagnostic command helps identify the available modification slots on any vehicle.

---

## ✨ Features

- Automatic vehicle mod enforcement
- Per-vehicle configuration
- Supports configurable mod type slots
- Applies the first available non-stock option when required
- `/getmods` diagnostic command
- Prints available mod slots and option counts to the F8 console
- Lightweight standalone implementation
- No framework dependency

---

## 🎮 Command

### `/getmods`

While sitting in a vehicle, use `/getmods` and open the F8 console to view the modification slots available for that vehicle.

Example output:

```text
--- Vehicle Mod Information ---
Mod Type: 0 | Available Options: 4 (Index 0 to 3)
Mod Type: 6 | Available Options: 2 (Index 0 to 1)
Mod Type: 10 | Available Options: 2 (Index 0 to 1)
--- End of Information ---
```

---

## ⚙️ Configuration

Vehicle mod settings are managed through `config.lua`.

Example:

```lua
Config_vehicleModConfig = {
    ["police3"] = {10, 6},
    ["police"] = {0, 4},
}
```

Each vehicle entry contains the mod type numbers that should be automatically enabled.

---

## 📥 Installation

1. Place the resource in your server's resources directory.
2. Configure the vehicles and mod slots in `config.lua`.
3. Add the resource to your `server.cfg` using the exact folder name.
4. Restart the resource or server.

---

## 📋 Requirements

- FiveM server
- No framework required
- Vehicles with supported modkit options

---

## 🌐 SimpleDevelopments

SimpleModkit Manager is developed and maintained by **SimpleDevelopments**.

<div align="center">

### Keep it Simple. Keep it SimpleDevelopments.

</div>
