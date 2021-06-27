require('todo-comments').setup {
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = {"FIXME", "BUG", "FIXIT", "ISSUE"} -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = {icon = " ", color = "warning"},
        WARN = {icon = " ", color = "warning", alt = {"WARNING", "XXX"}},
        PERF = {icon = " ", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
        NOTE = {icon = " ", color = "hint", alt = {"INFO"}},
        MDD = {icon = " ", color = "error", alt = {"MIKE"}}
    },
    highlight = {
        before = "empty", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400 -- ignore lines longer than this
    },
}
