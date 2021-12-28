local icons_ok, devicons = pcall(require, "nvim-web-devicons")
if not icons_ok then
  return
end

devicons.setup()
