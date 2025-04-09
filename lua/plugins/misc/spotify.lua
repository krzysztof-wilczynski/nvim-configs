return {
	"AntonVanAssche/music-controls.nvim",
  enabled = vim.loop.os_uname().sysname ~= 'Windows_NT',
	opts = {
		default_player = "spotify",
	},
}
