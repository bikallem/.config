let g:test#java#uppsala#file_pattern = '\v.*Test.java$'

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#java#patterns)
  return join(name['namespace'] + name['test'], '#')
endfunction

" Returns true if the given file belongs to your test runner
function! test#java#uppsala#test_file(file) abort
  return a:file =~? g:test#java#uppsala#file_pattern
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#java#uppsala#build_position(type, position) abort
  let filepath = a:position['file']
  let filedir = fnamemodify(a:position['file'], ':h')
  let filename = fnamemodify(a:position['file'], ':t:r')
  let parentdir = fnamemodify(filedir, ':t')
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return ['--test_filter=' . "'" . name . "$'" . ' -- //' . filedir . ':' . parentdir . '_auto_gen_' . filename]
    endif
  endif
  " echom result
  return [' -- //' . filedir . ':' . parentdir . '_auto_gen_' . filename]
endfunction

" Returns processed args (if you need to do any processing)
function! test#java#uppsala#build_args(args) abort
  return a:args
endfunction

" Returns the executable of your test runner
function! test#java#uppsala#executable() abort
  return '$HOME/stripe/uppsala/bazel test'
endfunction
