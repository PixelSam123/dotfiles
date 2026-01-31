return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = {
                "--",
                "-W",
                "clippy::pedantic",
                "-W",
                "clippy::nursery",
                "-A",
                "clippy::unused_async",
              },
            },
          },
        },
      },
    },
  },
}
