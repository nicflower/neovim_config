return {
    cmd = { vim.fn.getenv("HOME") .. "/src/lexical/_build/dev/package/lexical/bin/start_lexical.sh" }, 
    --root_dir = function(fname)             
    --    return util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()                         
    --end,                                                                                             
    filetypes = { "elixir", "eelixir", "heex" },                                                       
    -- optional settings                                                                               
    settings = {}                                                                                      
}
