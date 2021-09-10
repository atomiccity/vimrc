let s:config_list = []
let s:plugin_list = []

function plugin#register(plugin_name)
    call add(s:plugin_list, a:plugin_name)
endfunction

function plugin#list_plugins()
    return s:plugin_list
endfunction

function plugin#get_registration(plugin_name)
    return "plugins#" . a:plugin_name . "#register()"
endfunction

function plugin#get_config(plugin_name)
    return "plugins#" . a:plugin_name . "#config()"
endfunction

function plugin#add(plugin_name)
    exec "call " . plugin#get_registration(a:plugin_name)
    call add(s:config_list, plugin#get_config(a:plugin_name))
endfunction

function plugin#load_all()
    if has('win64') || has('win32') || has('win16')
        " Use expand because plugin_dir is eventually used in a git command
        " and git doesn't handle ~ for HOME on Windows.
        let plugin_dir = expand('~/AppData/Local/nvim-plugins')
    else
        let plugin_dir = '~/.local/share/nvim-plugins
    endif

    let dein_dir = plugin_dir . '/repos/github.com/Shougo/dein.vim'
    let &runtimepath = &runtimepath . ',' . dein_dir

    " Check to see if dein-vim is installed, if not bootstrap the plugin
    " manager
    if empty(glob(dein_dir))
        echom "Checking out dein-vim to " . dein_dir
        execute '!git clone https://github.com/Shougo/dein.vim ' . dein_dir
    endif

    " Use dein to load plugins
    call dein#begin(plugin_dir)
    call dein#add(dein_dir)

    " Call dein#add on all plugins here
    for p in plugin#list_plugins()
        call dein#add(p)
    endfor

    call dein#end()

    " See if plugins need to be installed.  Install if so.
    if dein#check_install()
        echom "Installing plugins during first-time startup.  This may take a while..."
        call s:InstallPlugins()
    endif

    " Call each plugin's config
    for c in s:config_list
        exec "call " . c
    endfor
endfunction

function s:InstallPlugins()
    let g:spacevim_plugin_manager_processes = get(g:, 'spacevim_plugin_manager_processes', 8)
    let g:spacevim_plugin_manager = get(g:, 'spacevim_plugin_manager', 'dein')
    call SpaceVim#commands#install_plugin()

    " Need to wait until installation is done so initalization can complete
    " TODO: Replace this wait loop with a synchronous GUI using SpaceVim library as guide
    let count = 0
    while count < 15
        sleep 500m
        redraw
        let count += 1
    endwhile

    "call dein#recache_runtimepath()
endfunction
