local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

comment.setup {
    pre_hook = function()
        local status_ok_ts, ts_integrations = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
        if not status_ok_ts then
            print("Cannot load ts_context_commentstring integration")
            return
        end

        ts_integrations.create_pre_hook()
    end,
}
