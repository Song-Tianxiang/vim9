vim9script

if !executable("deno")
    finish
endif

# g:denops_server_addr = '127.0.0.1:32123'
# var denops_path = g:plugs['denops.vim']['dir']
# 
# job_start(
#     $"deno run -A --no-check {denops_path}denops/@denops-private/cli.ts",
#     {
#         stoponexit: "",
#     }
# )
