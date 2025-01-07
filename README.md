# Insane commands for vanilla vim
---

> [!note] Tab ->|
> It can be used to autocomplete most of the commands within the terminal, including vim commands

- :vimgrep /pattern with special characters/ **/\[pattern_to_where_to_lookup\] 
-> Recursive search in current dir, within the pattern specified
    - After using vimgrep, use :cn, :cp to go to the next found match
    - :cfirst to go to the first match
    - :clast to go to the last match
- :cd \[directory_path\] -> Change directory of the current file inside vim
- :e \[filename\] -> opens a file in current tab
- :tabe \[filename\] -> Opens a new tab inside vim and we can name it however we want
- Use *gt* to go forwards within vim tabs, *gT* to go backwards
- Use \* to search the ocurrencies of the word above the cursor
- zz to center the screen in the cursor's position
- Use control + N and control + P to autocomplete without linting

# Commands and keymaps exclusive for this nvim configuration
---

> [!important] j and k are switched, so...
> in every mode or combination of keys j will go upwards and k downwards
> *Personal recomendation:* I'm already used to this but its not the best practice because when you go to a server,
> either you have to change the keybinds which is pretty quick but its not a good thing to do. *So if you want to
> reverse this keybind...*
*comment this code lines in the init.lua file*
```lua
-- Invertir j y k para movimiento
vim.api.nvim_set_keymap("n", "j", "k", opts)
vim.api.nvim_set_keymap("n", "k", "j", opts)
vim.api.nvim_set_keymap("v", "j", "k", opts)
vim.api.nvim_set_keymap("v", "k", "j", opts)

-- Hacer lo mismo para otras combinaciones como c (cortar) y y (copiar)
vim.api.nvim_set_keymap("n", "cj", "ck", opts)
vim.api.nvim_set_keymap("n", "ck", "cj", opts)

vim.api.nvim_set_keymap("n", "yj", "yk", opts)
vim.api.nvim_set_keymap("n", "yk", "yj", opts)

vim.keymap.set("n", "d", function()
    local key = vim.fn.getcharstr()
    local num = ""
    -- Capture the number of lines to delete
    while key:match("%d") do
        num = num .. key
        key = vim.fn.getcharstr()
    end
    -- Check the next key to determine direction
    if key == "j" then
        return "d" .. num .. "k"
    elseif key == "k" then
        return "d" .. num .. "j"
    else
        -- If the next key is not 'j' or 'k', return the original command
        return "d" .. num .. key
    end
end, { expr = true })
```

## \<leader\> == " "
---

### Manage code
---
- \<leader\>/ -> Comment toggle. *Works in normal mode and in visual mode*
- \<leader\>s -> Changes all ocurrencys of the word below the cursor for the current file
- \<leader\>u -> Open undo tree

### Navegating through proyects
---
- \<leader\>e -> Open harpoon saved files. You can delete files from your current harpoon with dd and then save changes
with :w
- \<leader\>a -> Save current file to harpoon
- \<C-h\>, \<C-j\>, \<C-k\>, \<C-l\>, \<C-n\>, \<C-m\>, \<C-,\>, \<C-.\> -> Swap through saved files in harpoon
- \<leader\>pv -> Proyect view. Opens a general view of the current proyect, it will always the proyect of the first
opened file. Its similar to :ex in vanilla vim.
- \<leader\>ft -> Format total. Formats the current file (need *Language server protocol installed*)
- \<leader\>ff -> Find files. Fuzzy finder in current proyect for archives/directories name
- \<leader\>fg -> Find grep. Uses *live_grep* to grep for patterns within the current proyect
- \<leader\>th -> Grep through themes



