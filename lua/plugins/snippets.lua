-- LuaSnip

require("luasnip.loaders.from_vscode").lazy_load()

local ls = require ("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("init", {
    t({"#include <bits/stdc++.h>"}),
    t({"", ""}),
    t({"", "using namespace std;"}),
    t({"", ""}),
    t({"","int main() {"}),
    t({"", "   "}), i(1),
    t({"", "   return 0;"}),
    t({"", "}"}),
  })
})
