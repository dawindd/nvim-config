local U = require("utils")
U.ensure("mason", function(mason)
	mason.setup({
		pip = {
			upgrade_pip = true,
		},
		max_concurrent_installers = 8,
		ui = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	})
end)
