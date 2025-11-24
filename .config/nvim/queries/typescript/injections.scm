;; extends

(call_expression
  function: (identifier) @func_name (#eq? @func_name "sql")
  arguments: (template_string) @injection.content
  (#set! injection.language "sql"))

