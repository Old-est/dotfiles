require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = {
			[""] = "msg",
			echo = "msg",
			echomsg = "msg",
			bufwrite = "msg",
			progress = "msg",
			undo = "msg",
			wmsg = "msg",

			emsg = "pager",
			echoerr = "pager",
			lua_error = "pager",
			shell_out = "pager",
			shell_err = "pager",
			list_cmd = "pager",
			verbose = "pager",

			search_cmd = "cmd",
			search_count = "cmd",
			completion = "cmd",
			confirm = "cmd",
			typed_cmd = "cmd",
		},
		cmd = { height = 0.4 },
		msg = { height = 0.25, timeout = 4000 },
		pager = { height = 0.6 },
		dialog = { height = 0.4 },
	},
})

require("config")
