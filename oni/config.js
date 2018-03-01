
// TODO: close tab bar when there ain't any tabs
// TODO: use vims color scheme

activate = (oni) => {
	oni.input.unbind("<F2>")
	oni.input.unbind("<F3>")
}

module.exports = {
	activate,
	"commandline.mode": false,
	"editor.clipboard.enabled": false,
	"editor.completions.mode": "hidden",
	"editor.fontFamily": "DejaVu Sans Mono",
	"editor.fontSize": "11px",
	"editor.linePadding": 0,
	"oni.hideMenu": true,
	"oni.useDefaultConfig": false,
	"sidebar.enabled": false,
	"statusbar.enabled": false,
	"tabs.mode": "tabs",
	"ui.colorscheme": "smyck_custom",
	//"ui.colorscheme": "onedark"
	//"editor.fontFamily": "Source Code Pro",
	//"editor.fontFamily": "Inconsolata",
	//"editor.fontFamily": "Droid Sans Mono",
}

