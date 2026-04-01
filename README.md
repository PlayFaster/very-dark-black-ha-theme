# Very Dark Black Theme for Home Assistant

![HACS Theme](https://img.shields.io/badge/HACS-Theme-orange.svg)  ![Latest Release](https://img.shields.io/github/v/release/PlayFaster/very-dark-black-ha-theme?label=Release&logo=github)  [![Validate](https://github.com/PlayFaster/very-dark-black-ha-theme/actions/workflows/validate.yaml/badge.svg)](https://github.com/your-username/very-dark-black-ha-theme/actions)  ![Last Commit](https://img.shields.io/github/last-commit/PlayFaster/very-dark-black-ha-theme?label=Last%20commit)
  
A Home Assistant dark mode theme that provides black or very dark backgrounds wherever possible along with a choice of primary colours.
  
## 📋 Requirements

- **[`card-mod`](https://github.com/thomasloven/lovelace-card-mod)** – The Card Mod integration is required for this theme.

## 📊 Compatibility

To ensure all "Pure Black" features (like custom scrollbars and border removals) work correctly, verify you meet these minimum requirements:

| Dependency | Minimum Version | Reason |
| :--- | :--- | :--- |
| **Home Assistant** | `2022.11.0` | Required for `ha-card` border variables. |
| **card-mod** | `3.0.0` | Required for theme-level CSS injection. |
  
## ✨ Features

This is a simple theme focused on providing a very dark mode look. It's designed to be clean and simple, with a choice of primary colours.
  
- **Black Backgrounds**: Black background applied everywhere.
  
- **Primary Colour Choice**: Various sub-themes with different foreground colours.
  - Cyan
  - Green
  - Red
  - Fuchsia
  - Orange
  - Purple
  - Indigo
  - Silver (Monochrome)
  - **Black Base (Shared Config)**: A utility theme used for shared logic.

## 🖼️ Screenshots
  
![Black with Purple Preview](.github/images/vdbt_preview_home_purple.png)

![Black with Green Preview](.github/images/vdbt_preview_theme_select_green.png)

![Black with Cyan Preview](.github/images/vdbt_preview_sensors_cyan.png)

![Black with Orange Preview](.github/images/vdbt_preview_home_orange.png)
    
## 🚀 Installation

### Prerequisites: Enable themes and install card-mod

1. Install `card-mod` via [HACS](https://hacs.xyz/) or per the instructions on its [GitHub page](https://github.com/thomasloven/lovelace-card-mod "card-mod").
  
2. Add the following to your `configuration.yaml` file if not present (HA restart required):

```yaml
frontend:
  themes: !include_dir_merge_named themes
```

### Download Theme

#### HACS

1. Add this URL as a **Custom Repository** in HACS.
  
2. Click Download.
  
#### Manual

1. Under the Home Assistant `config` folder, create a new folder named `themes`.
2. Copy the theme yaml file into it.
3. Run the `frontend.reload_themes` action (Restart Home Assistant if `configuration.yaml` changes were made).

### Apply Theme

- Go to your [Profile General](https://my.home-assistant.io/redirect/profile) tab (bottom left of screen) and change Theme under Browser Settings.

### Automate Theme Changes

You can use a Home Assistant automation to change the theme at startup, or based on any other time or condition you wish. 

**Important:** In the [Profile General](https://my.home-assistant.io/redirect/profile) screen, you **must** keep **"Use default theme"** selected under the Theme settings. If you manually select a specific theme in your profile, the automation will not be able to override it.

Example automation to set the theme at startup:

```yaml
alias: Set (Default) Theme at Startup
description: >-
  This automation allows you to set or change the default theme at Home
  Assistant Startup, provided you keep the Default Theme selected.
triggers:
  - trigger: homeassistant
    event: start
conditions: []
actions:
  - action: frontend.set_theme
    metadata: {}
    data:
      name: Black with Orange
      name_dark: Black with Orange
mode: single
```

## 🛠️ Development

For technical details on the YAML standards, icon logic, and Shoelace tokens used in this theme, see the [Development Reference](docs/theme_dev_reference.md).

## 🙏 Acknowledgements & Thanks

- Inspired by the excellent [`Frosted Glass`](https://github.com/wessamlauf/homeassistant-frosted-glass-themes) themes of @wessamlauf - thank you!
- Made possible by @thomasloven and the [`card-mod`](https://github.com/thomasloven/lovelace-card-mod) contributors.
