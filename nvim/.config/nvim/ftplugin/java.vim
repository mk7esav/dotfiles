
abbr main public static void main(String args[]) {<CR>
abbr sout System.out.println();<left><left>
nnoremap <F5> :FloatermNew --autoclose=0 --wintype=float --position=bottom --height=0.4 --width=0.9 --title=output javac % && java %< && rm *.class<CR>
