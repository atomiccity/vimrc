if exists('g:GuiLoaded')
    " The (ugly) Qt tabline may show briefly.  This can be solved by starting nvim-qt like:
    "   nvim-qt --no-ext-tabline
    GuiTabline 0

    GuiPopupmenu 0

    GuiFont! Hack\ NF:h10
endif
