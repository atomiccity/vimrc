if exists('g:loaded_lib_plugin')
    finish
endif

let s:plugin_list = {}

function RegisterPlugin(plugin_name, config_function)
    let s:plugin_list[a:plugin_name] = a:config_function
endfunction

function GetPluginList()
    return keys(s:plugin_list)
endfunction

function GetConfigFunction(plugin_name)
    return s:plugin_list[a:plugin_name]
endfunction

function LoadPlugins()
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

    " Source all plugin scripts here
    for p in glob("plugin_*.vim", 1, 1)
        source p
    endfor

    " Use dein to load plugins
    call dein#begin(plugin_dir)
    call dein#add(dein_dir)

    " Call dein#add on all plugins here
    for p in keys(s:plugin_list)
        call dein#add(p)
    endfor

    call dein#end()

    " See if plugins need to be installed.  Install if so.
    if dein#check_install()
        echom "Installing plugins during first-time startup.  This may take a while..."
        " Disable async installs because we can't continue with startup until
        " all plugins are installed
        let g:dein#install_max_processes = 1
        call dein#install()
    endif

    " Call each plugin's config
    for p in GetPluginList()
        call function(GetConfigFunction(p))
    endfor
endfunction

let g:loaded_lib_plugin = 1
