


function! Google()
python << EOM
# coding=utf-8

import vim 
import string
import webbrowser

letters = set(string.letters)

line = vim.current.line
row, col = vim.current.window.cursor

start = end = col

while start >= 0 and line[start] in letters:
    start -= 1

while end < len(line) and line[end] in letters:
    end += 1

word = line[start+1:end]

if not word or word.isspace():
    print "you cannot call google in space position"
else:
    try:
        url = 'http://www.google.fi/search?hl=en&safe=off&q=%s&btnG=Search' % word
        webbrowser.open(url)
        print 'Google : %s ' % word
    except Exception, e:
        print "failed. reason: " + str(e)

EOM
endfunction

command Google :call Google() | :redraw!
