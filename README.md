## FiveM Vehicle Modkit Manager

### Description
- This is a lightweight FiveM script that automatically applies and enforces specific vehicle modifications for server vehicles. It ensures that whenever a player enters a configured vehicle, any missing mods from a predefined list are instantly applied.

- The script is designed to enable the first available non-stock part (modIndex = 0) for any mod slot you specify. It also includes a powerful diagnostic command, /getmods, to help server owners easily identify which mod slots are available on any vehicle.

### Features
- Automatic Mod Enforcement: Constantly checks the player's vehicle and applies missing mods from your configuration.

- Easy Configuration: A clean config.lua file to specify which mod types to enable for each vehicle model.

- Mod Discovery Command: Includes a /getmods command to list all available mod slots and their options for any vehicle you're in.

- Lightweight: The script runs on a simple loop with minimal performance impact.

### How It Works
- The script operates on a continuous loop that runs every half-second.

1. It checks if the player is in a vehicle and is the driver.

2. It gets the vehicle's model name (e.g., "police3").

3. It looks in config.lua to see if there's a configuration for that model.

4. If a configuration exists, it loops through the list of specified modType numbers (e.g., spoilers, roof, grille).

5. For each modType, it checks if a mod is currently installed (GetVehicleMod). If the mod is missing (returns -1), the script automatically applies the first available part (modIndex = 0).

### Installation
1. Download the script files and place them in a folder within your server's resources directory (e.g., resources/[standalone]/SimpleModkitManager).

2. Add the following line to your server.cfg file to start the resource:

```ensure SimpleModkitManager```

(Note: Replace SimpleModkitManager with the name of your resource folder if you changed it.)

3. Configure your vehicles in the config.lua file (see below).

4. Restart your FiveM server.

### Configuration
- Configuration is done entirely within the config.lua file.

``Config_vehicleModConfig``: This is the main table where you define your settings.

- To add a vehicle, you create a new entry where the key is the vehicle's spawn name (e.g., "chp15exped") and the value is a list of modType numbers you want to enable.

### Example:
- Let's say you want to force-enable the first available Roof accessory (modType 10) and the first available Grille (modType 6) on a vehicle with the spawn name police3.
```
Config_vehicleModConfig = {
    ["police3"] = {10, 6}, -- Enables the first Roof and Grille options for police3```
    ["sentinel"] = {0, 4}, -- Enables the first Spoiler and Exhaust options for sentinel
}
```
A list of common modType numbers is provided at the top of the config.lua file for easy reference.

### Usage (Commands)
- This script includes one essential command for finding the correct modType numbers for your vehicles.

``/getmods``
- This command is your most powerful tool for configuring this script. It inspects the vehicle you are currently in and prints a complete list of all its available mod slots to the F8 console.

### How to Use:

- Get into the vehicle you want to configure.

- Press F8 to open the console.

- Type /getmods and press Enter.

### Example Output:
- If you use /getmods on a vehicle with a custom partition in the "Roof" slot, you might see this in the F8 console:
```
--- Vehicle Mod Information ---
Mod Type: 0 | Available Options: 4 (Index 0 to 3)
Mod Type: 6 | Available Options: 2 (Index 0 to 1)
Mod Type: 10 | Available Options: 2 (Index 0 to 1)
--- End of Information ---
```
- This output tells you:

1. The vehicle has a Grille slot (Mod Type: 6).

2. The vehicle has a Roof slot (Mod Type: 10).

- To enable the partition (which is in the Roof slot), you would add 10 to that vehicle's list in the config.
