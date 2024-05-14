return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local devicons = require("nvim-web-devicons")

    devicons.set_icon({
      gql = {
        icon = " ",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
    })

    devicons.setup()
  end,
}
