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
