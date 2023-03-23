local colorscheme = "tokyonight"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme" .. colorscheme .. "not found")
	return
end

--[[ if status_ok then ]]
--[[ 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) ]]
--[[ 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) ]]
--[[ 	return ]]
--[[ end ]]
