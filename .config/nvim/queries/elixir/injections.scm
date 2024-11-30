(call
  target: (dot
            left: (alias) @repo (#eq? @repo "Repo") 
            right: (identifier) @function (#match? @function "query")
           )
  (arguments
    (string
      (quoted_content) @injection.content
    )
  )
 (#set! injection.language "sql"))

