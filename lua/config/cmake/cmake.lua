-- Compilation on Terminal Magic with CMAKE --
-- -------------- --
-- Step 1: -- Create a CMakeLists.txt for your project.
-- Step 2: -- Create a Build Directory and execute your cmake initial config command.
-- Step 3: -- Press <space>bld OR <space>, you will be prompted
--

-- no number on terminal opening event
local os_name = vim.loop.os_uname().sysname

if os_name == "Darwin" then
	vim.env.CPATH = vim.fn.system("xcrun --show-sdk-path"):gsub("\n", "") .. "/usr/include"
	vim.env.CPLUS_INCLUDE_PATH = vim.env.CPATH
elseif os_name == "Linux" then
	vim.env.CPATH = "/usr/include"
	vim.env.CPLUS_INCLUDE_PATH = "/usr/include"
else
	vim.notify("Windows is not yet supported", vim.log.levels.WARN)
end
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
	end,
})

-- open the terminal AND layout: to the left and only 60 characters width
local term_id = 0
local function open_that_terminal()
	vim.cmd.new()
	vim.cmd.term()
	vim.cmd.wincmd("H")
	vim.api.nvim_win_set_width(0, 60)
	-- store the id.
	term_id = vim.bo.channel
end
vim.keymap.set("n", "<space>trm", open_that_terminal, { noremap = true, silent = true })

local compile_commands_path = nil
local compile_commands_directory = nil
local function get_compile_commands_path()
	if not compile_commands_path then
		local input = vim.fn.input("Enter path to compile_commands.json: ")
		input = vim.fn.fnamemodify(input, ":p")
		vim.notify("Searching for " .. input)
		if vim.fn.filereadable(input) == 1 then
			compile_commands_path = input
			vim.notify("Ok bld path is " .. input)
			compile_commands_directory = vim.fn.fnamemodify(compile_commands_path, ":h")
		else
			vim.notify(" Invalid path to compile_commands.json " .. input, vim.log.levels.ERROR)
		end
	end
end

-- Function to use the terminal buffer for building the current buffer
local function build_compilation_unit()
	vim.cmd("write")
	if term_id == 0 then
		open_that_terminal()
	end
	local file_path = vim.fn.expand("%:p") -- Full path of the current buffer
	get_compile_commands_path()
	if not compile_commands_path then
		return
	end
	local compilation_ok_message = file_path .. " compilation " .. "ok"
	local shell_command = string.format(
		"cd %s; $(cat %s | grep -E 'command.*%s' | cut -d '\"' -f 4); if [ $? -eq 0 ]; then echo %s; fi; cd -",
		compile_commands_directory,
		compile_commands_path,
		file_path,
		compilation_ok_message
	)

	-- Read compile_commands.json to find the build command for this file
	if term_id ~= 0 then
		vim.fn.chansend(term_id, shell_command .. "\n")
	else
		vim.notify("Terminal is not open! Use <space>trm to open a terminal.", vim.log.levels.ERROR)
	end
end

local function send_make_command()
	vim.cmd("write")
	if term_id == 0 then
		open_that_terminal()
	end
	get_compile_commands_path()
	if term_id ~= 0 and compile_commands_directory ~= nil then
		local shell_command = string.format("cd %s;make -j$(($(nproc) - 1))", compile_commands_directory)
		vim.fn.chansend(term_id, shell_command .. "\n")
	elseif term_id == 0 then
		vim.notify("Teminal is not open! use <space>trm to open terminal.", vim.log.levels.ERROR)
	elseif compile_commands_directory == nil then
		vim.notify("Couldn't get the folder for the compile_commands.json file", vim.lof.levels.ERROR)
	end
end

-- Map build function to <space>bld
vim.keymap.set("n", "<space>bld", build_compilation_unit, { noremap = true, silent = true })
vim.keymap.set("n", "<space>cmk", send_make_command, { noremap = true, silent = true })
