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

## \<leader\> == " "
---

### Manage code
---
- \<leader\># -> Comment toggle. *Works in normal mode and in visual mode*
- \<leader\>s -> Changes all ocurrencys of the word below the cursor for the current file
- \<leader\>u -> Open undo tree
- \<leader\>y or \<leader\>Y -> Copy in system's clipboard
- \<leader\>p or \<leader\>P -> Paste from system's clipboard

### Navegating through proyects
---
- \<leader\>e -> Open harpoon saved files. You can delete files from your current harpoon with dd and then save changes
with :w
- \<leader\>a -> Save current file to harpoon
- \<C-h\>, \<C-j\>, \<C-k\>, \<C-l\>, \<C-n\>, \<C-m\>, \<C-,\>, \<C-.\> -> Swap through saved files in harpoon
- \<C-S-N\>, \<C-S-P\> -> Go next, Go Prev in harpoon saved files
- \<leader\>pv -> Proyect view. Opens a general view of the current proyect, it will always the proyect of the first
opened file. Its similar to :ex in vanilla vim.
- \<leader\>ft -> Format total. Formats the current file (need *Language server protocol installed*)
- \<leader\>ff -> Find files. Fuzzy finder in current proyect for archives/directories name
- \<leader\>/ -> Search w/live_grep throught current proyect
- \<leader\>th -> Grep through themes



