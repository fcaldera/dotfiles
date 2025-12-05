;; extends

(call_expression
  function: [
    ; Direct identifier case
    (identifier) @func_name
    
    ; Nested expression case
    (non_null_expression
      (instantiation_expression
        (await_expression
          (identifier) @func_name)))
  ]
  (#eq? @func_name "sql")
  arguments: (template_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql")
  (#set! injection.combined)
  (#set! injection.include-children))
