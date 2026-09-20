local system_exts = {
	pdf = true, PDF = true,
	png = true, jpg = true, jpeg = true, gif = true, bmp = true, webp = true,
	PNG = true, JPG = true, JPEG = true,
	mp4 = true, mov = true, avi = true, mkv = true, webm = true,
	MP4 = true, MOV = true,
	doc = true, docx = true, xls = true, xlsx = true, ppt = true, pptx = true,
}

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local ext = vim.fn.expand("%:e")
		if system_exts[ext] then
			local file = vim.fn.expand("%:p")
			vim.fn.jobstart({ "open", file }, { detach = true })
			vim.schedule(function()
				vim.cmd("bd!")
			end)
		end
	end,
})
