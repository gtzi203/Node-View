
--init

local modpath = minetest.get_modpath("node_view")

dofile(modpath .. "/functions.lua")

if minetest.get_modpath("default") then
  cg = "minetest_game"
elseif minetest.get_modpath("mcl_core") then
  cg = "mineclone"

  if minetest.get_modpath("vl_legacy") then
    cgs = "voxelibre"
  else
    cgs = "mineclonia"
  end
end

minetest.register_on_joinplayer(function(player)
  local meta = player:get_meta()
  meta:set_string("last_obj", "")
  meta:set_int("last_health", -1)
end)

minetest.register_globalstep(function(dtime)
  for _, player in ipairs(minetest.get_connected_players()) do
    get_hud(player)
  end
end)
