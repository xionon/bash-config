syntax region todoDone start=/✓\|^\s*:/ end=/$/
hi def todoDoneDefinition gui=italic guifg=#0020A0
hi link todoDone todoDoneDefinition
syntax region todoTodo start=/-/ end=/ /
hi def todoTodoDefinition guifg=DarkRed guibg=LightGray
hi link todoTodo todoTodoDefinition
