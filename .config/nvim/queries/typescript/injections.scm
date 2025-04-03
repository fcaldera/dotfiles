;; extends

(variable_declarator
  name: (identifier) @name (#match? @name "^(sql|[a-zA-Z0-9]+_?sql(_?[a-zA-Z0-9]+)?|[a-zA-Z0-9]+Sql([A-Z][a-zA-Z0-9]*)?)$")
  value: (template_string (string_fragment) @injection.content)
(#set! injection.language "sql"))
