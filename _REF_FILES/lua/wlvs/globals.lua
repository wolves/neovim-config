P = function(v)
  print(vim.inspect(v))
  return v
end

local ok, reload = pcall(require, "plenary.reload")
RELOAD = ok and reload.reload_module or function(...)
  return ...
end

R = function(name)
  RELOAD(name)
  return require(name)
end
