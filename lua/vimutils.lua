local VimUtils = {}

function VimUtils.cur_dir()
    return vim.fn.expand('%:p:h')
end

function VimUtils.cur_file()
    return vim.fn.expand('%')
end

return VimUtils
