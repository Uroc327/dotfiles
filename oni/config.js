// For more information on customizing Oni,
// check out our wiki page:
// https://github.com/onivim/oni/wiki/Configuration

// TODO: close tab bar when there ain't any tabs
// TODO: use vims color scheme
// TODO: custom quick info using language server protocol

const activate = oni => {
    console.log("config activated")
    oni.input.unbind("<F2>")
    oni.input.unbind("<F3>")
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,

    // disable oni stuff
    "achievements.enabled": false,
    "autoClosingPairs.enabled": false,
    "browser.enabled": false,
    "commandline.mode": false,
    "editor.clipboard.enabled": false,
    "editor.completions.mode": "hidden",
    "editor.quickInfo.enabled": false,
    "learning.enabled": false,
    "oni.hideMenu": true,
    "oni.useDefaultConfig": false,
    "sidebar.enabled": false,
    "statusbar.enabled": false,
    "ui.animations.enabled": false,
    "wildmenu.mode": false,

    // ui
    "editor.fontFamily": "DejaVu Sans Mono",
    "editor.fontSize": "11px",
    "editor.linePadding": 0,
    "ui.colorscheme": "smyck_custom",
    //"ui.colorscheme": "onedark"
    //"editor.fontFamily": "Source Code Pro",
    //"editor.fontFamily": "Inconsolata",
    //"editor.fontFamily": "Droid Sans Mono",
}
