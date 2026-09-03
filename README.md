# Fedora 44 KDE Plasma Dotfiles

Personal KDE Plasma configuration files and customizations from Fedora 44. Includes transparent panels, dark theme, and optimized window management settings.

## What's Included

- **Plasma Configuration** - Panel layouts, transparency effects, screen locker settings
- **Window Manager (KWin)** - Window decorations, effects, keyboard shortcuts
- **Color Schemes** - Breeze Dark theme with custom tweaks
- **Icons & Themes** - Breeze icons and system theme
- **Terminal (Konsole)** - Terminal profiles and color schemes
- **File Manager (Dolphin)** - Layout and view preferences

## Current Setup

```
Theme:       Breeze (Dark)
Icons:       breeze-dark
Font:        Noto Sans (10pt)
Cursor:      Breeze
Terminal:    Konsole 26.4.3
File Manager: Dolphin
Panel:       Bottom with transparency and effects
Desktop:     KDE Plasma 6.7.3
OS:          Fedora Linux 44 (KDE Plasma Desktop Edition)
```

## Quick Start

### On Fedora KDE

```bash
# Clone this repo
git clone https://github.com/sadew-d-fernando/fedora-44-dotfile.git
cd fedora-44-dotfile

# Backup your current config (optional)
cp -r ~/.config ~/.config.backup
cp -r ~/.local/share ~/.local/share.backup

# Restore the dotfiles
./restore.sh
```

### On CachyOS KDE (or other Arch-based distros)

```bash
# Install required packages
sudo pacman -S breeze breeze-icons noto-fonts konsole dolphin

# Clone and restore
git clone https://github.com/sadew-d-fernando/fedora-44-dotfile.git
cd fedora-44-dotfile
./restore.sh
```

### On Other Linux Distros

```bash
# Make sure you have KDE Plasma installed with:
# - Breeze theme
# - breeze-icons package
# - noto-fonts

# Then restore
git clone https://github.com/sadew-d-fernando/fedora-44-dotfile.git
cd fedora-44-dotfile
./restore.sh
```

## File Structure

```
.
├── README.md                 # This file
├── restore.sh               # Restoration script
├── plasmarc                 # Plasma shell config
├── plasmashellrc            # Plasma panel/taskbar settings
├── kwinrc                   # Window manager settings (transparency, effects)
├── kdeglobals               # Global KDE settings
├── konsolerc                # Terminal config
├── dolphinrc                # File manager config
├── color-schemes/           # Color scheme files
├── icons/                   # Icon theme
├── konsole/                 # Terminal profiles
├── plasma/                  # Plasma theme files
├── kxmlgui5/                # KDE application UI layouts
├── KDE/                     # Additional KDE configs
└── kdedefaults/             # KDE default settings
```

## Customization

### Change Theme
```bash
System Settings > Appearance > Global Theme
# Or edit: ~/.config/kdeglobals
```

### Adjust Transparency
Edit `~/.config/kwinrc` - look for sections with `Opacity` settings

### Modify Panel
Right-click panel → Edit Panel → Adjust height, position, transparency

### Change Konsole Profile
Open Konsole → Settings → Edit Current Profile → Apply Profile

## Restore Script

The `restore.sh` script automatically copies all configurations to their correct locations:

```bash
# Make it executable
chmod +x restore.sh

# Run it
./restore.sh

# It will:
# 1. Copy color schemes to ~/.local/share/color-schemes/
# 2. Copy icons to ~/.local/share/icons/
# 3. Copy Konsole profiles to ~/.local/share/konsole/
# 4. Copy config files to ~/.config/
# 5. Restart Plasma shell to apply changes
```

## Updating Your Dotfiles

After making changes in KDE settings:

```bash
# Copy updated configs back
cp ~/.config/kdeglobals ./kdeglobals
cp ~/.config/kwinrc ./kwinrc
cp ~/.config/plasmarc ./plasmarc
cp ~/.config/plasmashellrc ./plasmashellrc
# ... etc for other files

# Commit and push
git add .
git commit -m "Update KDE configuration"
git push
```

## Backup & Recovery

### Backup current config
```bash
cp -r ~/.config ~/.config.backup
cp -r ~/.local/share ~/.local/share.backup
```

### Restore backup if something breaks
```bash
rm -rf ~/.config
rm -rf ~/.local/share
mv ~/.config.backup ~/.config
mv ~/.local/share.backup ~/.local/share
kquitapp6 plasmashell
kstart6 plasmashell &
```

## Compatibility

- **Fedora 44 (KDE)** - Tested ✓
- **CachyOS (KDE)** - Should work
- **Other Arch-based distros** - Likely compatible
- **Ubuntu KDE Neon** - Possible with adjustments
- **Debian KDE** - Possible with adjustments

Some paths may vary on different distributions. Edit `restore.sh` if needed.

## Notes

- These configs are optimized for a 1920x1080 display. Adjust panel sizes if using different resolution.
- Font rendering may look different on systems without Noto Sans
- Some effects require GPU acceleration and newer graphics drivers

## License

These dotfiles are released under **Creative Commons Zero v1.0 Universal (CC0)**.

You are free to use, modify, and distribute these files with no restrictions whatsoever. No attribution required.

## Credits

Created and maintained by Sadew Dineth Thasmina Fernando

## Support

If you have issues:
1. Check that required packages are installed
2. Verify file permissions: `chmod +x restore.sh`
3. Check KDE version compatibility
4. Restart Plasma: `kquitapp6 plasmashell && kstart6 plasmashell &`

Feel free to fork and customize for your own setup!
