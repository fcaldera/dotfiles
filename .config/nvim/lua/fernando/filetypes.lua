vim.filetype.add({
  filename = {
    ["Jenkinsfile"] = "groovy",
  },
  pattern = {
    [".env"] = "sh",
    [".env.*"] = "sh",
  },
})
