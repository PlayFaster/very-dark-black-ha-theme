# Very Dark Black Theme for Home Assistant

A Home Assistant dark mode theme that provides black or very dark backgrounds wherever possible along with a choice of primary (text/accent) colours.
  
## Requirements

- **[`card-mod`](https://github.com/thomasloven/lovelace-card-mod)** – The Card Mod integration is required for this theme. 
  
## ✨ Features

This is a simple theme focused on providing a very dark mode look. It's designed to be clean and simple, with a choice of primary (foreground) colours.
  
- **Black Backgrounds**: Black background applied, everywhere.
  
- **Foreground Colour Choice**: Various sub-themes with different foreground colours.
- Cyan
- Green
- Red
- Fuchsia
- Orange
  
## 🚀 Installation

### Prerequisites: Enable themes and install card-mod

1. Install `card-mod` via [HACS](https://hacs.xyz/) or per the instructions on its [GitHub page](https://github.com/thomasloven/lovelace-card-mod "card-mod").
   
2. Add the following to your ``configuration.yaml`` file if not present (HA restart required):

```yaml
frontend:
  themes: !include_dir_merge_named themes
```

### Download Theme

#### HACS

1. Add this URL as a **Custom Repository** in HACS.
  
2. Click Download.
  
#### Manual

1. Under the Home Assistant ``config`` folder, create a new folder named ``themes``.
2. Copy the theme yaml file into it.
3. Run the `frontend.reload_themes` action (Restart Home Assistant if `configuration.yaml` changes were made).

### Apply Theme

- Go to your [Profile General](https://my.home-assistant.io/redirect/profile) tab (bottom left of screen) and change Theme under Browser Settings.

  
## Contributors & Acknowledgements

🙏 Special Thanks

- Inspired by the excellent [`Frosted Glass`](https://github.com/wessamlauf/homeassistant-frosted-glass-themes) themes of @wessamlauf - thank you!
- Made possible by @thomasloven and the [`card-mod`](https://github.com/thomasloven/lovelace-card-mod) contributors.

  