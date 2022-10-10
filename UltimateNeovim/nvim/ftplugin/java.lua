vim.cmd [[

ia main public static void main(String args[]) {}<left><cr><esc><S-o>
ia init public class <c-r>%<c-w><bs> {}<left><cr>
ia sout System.out.println("");<esc>2<left>i
nnoremap ; $a;<esc>
ia ssout <esc>ISystem.out.println(<esc>A);<esc>
ia aslist- <esc>IArrays.asList(<esc>A);

nnoremap <leader>i ggiimport java.util.*;<cr>
        \import java.util.stream.*;<cr>
        \import java.io.*;<cr>
        \import java.math.*;<cr>
        \import java.net.*;<cr>
        \import java.util.concurrent.*;<cr>
        \import java.util.prefs.*;<cr>
        \import java.util.regex.*;<cr>

]]

local coq = require('coq')
local lsp = require('lspconfig')
local jlsp = require('jdtls')
local jdtls_setup = require('jdtls.setup')

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        "/home/office/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration",
        "/home/office/.local/share/nvim/lsp_servers/jdtls/config_linux",
        "-data",
        "/home/office/.local/share/nvim/lsp_servers/jdtls/workspace/myspace"
    },
    root_dir = jdtls_setup.find_root({
        ".git", "mvnw", "gradlew",
    }),
    settings = {
        java = {
        }
    },
    init_options = {
        bundles = {
        }
    }
}

jlsp.start_or_attach(config)
lsp.jdtls.setup {}
