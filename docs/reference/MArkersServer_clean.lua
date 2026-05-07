local b = {}

local function c(d)
  if b[d] then
    return b[d]
  end
  local e = string.gsub(d, "..", function(f)
    local g = tonumber(f, 16) - 2
    if g < 0 then
      g = g + 256
    end
    return string.char(g)
  end)
  b[d] = e
  return e
end

local h = "V2.2.0.0"
local i = "MArkersServer"
local j = 7.67
local k
local l = {
  a84d5574 = i,
  a11a2802 = "MArkers",
  a3f8003f = h
}

local function m()
  k = string.match(reaper.GetAppVersion(), "^[0-9]*%.?[0-9]+")
  if k then
    k = tonumber(k)
  else
    return false, "Reaper version %s or greater is required."
  end
  if k < j then
    reaper.ShowMessageBox(string.format([==[Reaper version %s or greater is required.
Your version: %s

Please update reaper.]==], j, k), i, 0)
    return false
  else
    return true
  end
end

if not m() then
  error(string.format([==[Reaper version %s or greater is required.
Your version: %s

Please update reaper.]==], j, k))
end
local n = package.config:sub(1, 1)

local function o(...)
  local assert = _ENV.assert
  local error = _ENV.error
  local pairs = _ENV.pairs
  local pcall = _ENV.pcall
  local setmetatable = _ENV.setmetatable
  local tostring = _ENV.tostring
  local type = _ENV.type
  local p = require("string").char
  local q = require("string").format
  local r = require("math").type
  local s = require("math").tointeger
  local t = require("table").concat
  local u = require("string").pack
  local v = require("string").unpack
  local w
  local x = {}
  
  local function y(z, A, B)
    error("bad argument #" .. tostring(A) .. " to " .. z .. " (" .. B .. ")")
  end
  
  local function C(z, A, D, E)
    y(z, A, E .. " expected, got " .. type(D))
  end
  
  local function F(z, A, D, E)
    if type(D) ~= E then
      C(z, A, D, E)
    end
  end
  
  local G = setmetatable({}, {
    __index = function(H, I)
      if 1 == I then
        return
      end
      error("pack '" .. I .. "' is unimplemented")
    end
  })
  x.packers = G
  G["nil"] = function(J)
    J[#J + 1] = p(192)
  end
  G["boolean"] = function(J, K)
    if K then
      J[#J + 1] = p(195)
    else
      J[#J + 1] = p(194)
    end
  end
  G["string_compat"] = function(J, L)
    local M = #L
    if M <= 31 then
      J[#J + 1] = p(160 + M)
    elseif M <= 65535 then
      J[#J + 1] = u(">B I2", 218, M)
    elseif M <= 4.294967295E9 then
      J[#J + 1] = u(">B I4", 219, M)
    else
      error("overflow in pack 'string_compat'")
    end
    J[#J + 1] = L
  end
  G["_string"] = function(J, L)
    local M = #L
    if M <= 31 then
      J[#J + 1] = p(160 + M)
    elseif M <= 255 then
      J[#J + 1] = p(217, M)
    elseif M <= 65535 then
      J[#J + 1] = u(">B I2", 218, M)
    elseif M <= 4.294967295E9 then
      J[#J + 1] = u(">B I4", 219, M)
    else
      error("overflow in pack 'string'")
    end
    J[#J + 1] = L
  end
  G["binary"] = function(J, L)
    local M = #L
    if M <= 255 then
      J[#J + 1] = p(196, M)
    elseif M <= 65535 then
      J[#J + 1] = u(">B I2", 197, M)
    elseif M <= 4.294967295E9 then
      J[#J + 1] = u(">B I4", 198, M)
    else
      error("overflow in pack 'binary'")
    end
    J[#J + 1] = L
  end
  
  local function N(L)
    if L == "string_compat" then
      G["string"] = G["string_compat"]
    elseif L == "string" then
      G["string"] = G["_string"]
    elseif L == "binary" then
      G["string"] = G["binary"]
    else
      y("set_string", 1, "invalid option '" .. L .. "'")
    end
  end
  
  x.set_string = N
  G["map"] = function(J, O, M)
    if M <= 15 then
      J[#J + 1] = p(128 + M)
    elseif M <= 65535 then
      J[#J + 1] = u(">B I2", 222, M)
    elseif M <= 4.294967295E9 then
      J[#J + 1] = u(">B I4", 223, M)
    else
      error("overflow in pack 'map'")
    end
    for I, P in pairs(O) do
      G[type(I)](J, I)
      G[type(P)](J, P)
    end
  end
  G["array"] = function(J, O, M)
    if M <= 15 then
      J[#J + 1] = p(144 + M)
    elseif M <= 65535 then
      J[#J + 1] = u(">B I2", 220, M)
    elseif M <= 4.294967295E9 then
      J[#J + 1] = u(">B I4", 221, M)
    else
      error("overflow in pack 'array'")
    end
    for Q = 1, M do
      local P = O[Q]
      G[type(P)](J, P)
    end
  end
  
  local function R(S)
    if S == "without_hole" then
      G["_table"] = function(J, O)
        local T, M, U = false, 0, 0
        for I in pairs(O) do
          if type(I) == "number" and I > 0 then
            if I > U then
              U = I
            end
          else
            T = true
          end
          M = M + 1
        end
        if U ~= M then
          T = true
        end
        if T then
          G["map"](J, O, M)
        else
          G["array"](J, O, M)
        end
      end
    elseif S == "with_hole" then
      G["_table"] = function(J, O)
        local T, M, U = false, 0, 0
        for I in pairs(O) do
          if type(I) == "number" and I > 0 then
            if I > U then
              U = I
            end
          else
            T = true
          end
          M = M + 1
        end
        if T then
          G["map"](J, O, M)
        else
          G["array"](J, O, U)
        end
      end
    elseif S == "always_as_map" then
      G["_table"] = function(J, O)
        local M = 0
        for I in pairs(O) do
          M = M + 1
        end
        G["map"](J, O, M)
      end
    else
      y("set_array", 1, "invalid option '" .. S .. "'")
    end
  end
  
  x.set_array = R
  G["table"] = function(J, O)
    G["_table"](J, O)
  end
  G["unsigned"] = function(J, M)
    if M >= 0 then
      if M <= 127 then
        J[#J + 1] = p(M)
      elseif M <= 255 then
        J[#J + 1] = p(204, M)
      elseif M <= 65535 then
        J[#J + 1] = u(">B I2", 205, M)
      elseif M <= 4.294967295E9 then
        J[#J + 1] = u(">B I4", 206, M)
      else
        J[#J + 1] = u(">B I8", 207, M)
      end
    elseif M >= -32 then
      J[#J + 1] = p(256 + M)
    elseif M >= -128 then
      J[#J + 1] = u(">B i1", 208, M)
    elseif M >= -32768 then
      J[#J + 1] = u(">B i2", 209, M)
    elseif M >= -2147483648 then
      J[#J + 1] = u(">B i4", 210, M)
    else
      J[#J + 1] = u(">B i8", 211, M)
    end
  end
  G["signed"] = function(J, M)
    if M >= 0 then
      if M <= 127 then
        J[#J + 1] = p(M)
      elseif M <= 32767 then
        J[#J + 1] = u(">B i2", 209, M)
      elseif M <= 2147483647 then
        J[#J + 1] = u(">B i4", 210, M)
      else
        J[#J + 1] = u(">B i8", 211, M)
      end
    elseif M >= -32 then
      J[#J + 1] = p(256 + M)
    elseif M >= -128 then
      J[#J + 1] = u(">B i1", 208, M)
    elseif M >= -32768 then
      J[#J + 1] = u(">B i2", 209, M)
    elseif M >= -2147483648 then
      J[#J + 1] = u(">B i4", 210, M)
    else
      J[#J + 1] = u(">B i8", 211, M)
    end
  end
  
  local function V(W)
    if W == "unsigned" then
      G["integer"] = G["unsigned"]
    elseif W == "signed" then
      G["integer"] = G["signed"]
    else
      y("set_integer", 1, "invalid option '" .. W .. "'")
    end
  end
  
  x.set_integer = V
  G["float"] = function(J, M)
    J[#J + 1] = u(">B f", 202, M)
  end
  G["double"] = function(J, M)
    J[#J + 1] = u(">B d", 203, M)
  end
  
  local function X(Y)
    if Y == "float" then
      G["number"] = function(J, M)
        if r(M) == "integer" then
          G["integer"](J, M)
        else
          G["float"](J, M)
        end
      end
    elseif Y == "double" then
      G["number"] = function(J, M)
        if r(M) == "integer" then
          G["integer"](J, M)
        else
          G["double"](J, M)
        end
      end
    else
      y("set_number", 1, "invalid option '" .. Y .. "'")
    end
  end
  
  x.set_number = X
  for I = 0, 4 do
    do
      local M = s(2 ^ I)
      local Z = 212 + I
      G["fixext" .. tostring(M)] = function(J, _, a0)
        assert(#a0 == M, "bad length for fixext" .. tostring(M))
        J[#J + 1] = u(">B i1", Z, _)
        J[#J + 1] = a0
      end
    end
  end
  G["ext"] = function(J, _, a0)
    local M = #a0
    if M <= 255 then
      J[#J + 1] = u(">B B i1", 199, M, _)
    elseif M <= 65535 then
      J[#J + 1] = u(">B I2 i1", 200, M, _)
    elseif M <= 4.294967295E9 then
      J[#J + 1] = u(">B I4 i1", 201, M, _)
    else
      error("overflow in pack 'ext'")
    end
    J[#J + 1] = a0
  end
  
  function x.pack(a0)
    local J = {}
    G[type(a0)](J, a0)
    return t(J)
  end
  
  local a1
  
  local function a2(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if Q > a5 then
      a3:underflow(Q)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    local a6 = a4:byte(Q)
    a3.i = Q + 1
    return a1[a6](a3, a6)
  end
  
  x.unpack_cursor = a2
  
  local function a7(a3, M)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    local a8 = Q + M - 1
    if a5 < a8 or M < 0 then
      a3:underflow(a8)
      a4, Q, a5 = a3.s, a3.i, a3.j
      a8 = Q + M - 1
    end
    a3.i = Q + M
    return a4:sub(Q, a8)
  end
  
  local function a9(a3, M)
    local H = {}
    for Q = 1, M do
      H[Q] = a2(a3)
    end
    return H
  end
  
  local function aa(a3, M)
    local H = {}
    for Q = 1, M do
      local I = a2(a3)
      local a6 = a2(a3)
      if nil == I or I ~= I then
        I = x.sentinel
      end
      if nil ~= I then
        H[I] = a6
      end
    end
    return H
  end
  
  local function ab(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 3 then
      a3:underflow(Q + 3)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 4
    return v(">f", a4, Q)
  end
  
  local function ac(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 7 then
      a3:underflow(Q + 7)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 8
    return v(">d", a4, Q)
  end
  
  local function ad(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if Q > a5 then
      a3:underflow(Q)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 1
    return v(">I1", a4, Q)
  end
  
  local function ae(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 1 then
      a3:underflow(Q + 1)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 2
    return v(">I2", a4, Q)
  end
  
  local function af(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 3 then
      a3:underflow(Q + 3)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 4
    return v(">I4", a4, Q)
  end
  
  local function ag(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 7 then
      a3:underflow(Q + 7)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 8
    return v(">I8", a4, Q)
  end
  
  local function ah(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if Q > a5 then
      a3:underflow(Q)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 1
    return v(">i1", a4, Q)
  end
  
  local function ai(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 1 then
      a3:underflow(Q + 1)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 2
    return v(">i2", a4, Q)
  end
  
  local function aj(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 3 then
      a3:underflow(Q + 3)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 4
    return v(">i4", a4, Q)
  end
  
  local function ak(a3)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    if a5 < Q + 7 then
      a3:underflow(Q + 7)
      a4, Q, a5 = a3.s, a3.i, a3.j
    end
    a3.i = Q + 8
    return v(">i8", a4, Q)
  end
  
  function x.build_ext(_, a0)
    return nil
  end
  
  local function al(a3, M, _)
    local a4, Q, a5 = a3.s, a3.i, a3.j
    local a8 = Q + M - 1
    if a5 < a8 or M < 0 then
      a3:underflow(a8)
      a4, Q, a5 = a3.s, a3.i, a3.j
      a8 = Q + M - 1
    end
    a3.i = Q + M
    return x.build_ext(_, a4:sub(Q, a8))
  end
  
  a1 = setmetatable({
    [192] = function()
      return nil
    end,
    [194] = function()
      return false
    end,
    [195] = function()
      return true
    end,
    [196] = function(a3)
      return a7(a3, ad(a3))
    end,
    [197] = function(a3)
      return a7(a3, ae(a3))
    end,
    [198] = function(a3)
      return a7(a3, af(a3))
    end,
    [199] = function(a3)
      return al(a3, ad(a3), ah(a3))
    end,
    [200] = function(a3)
      return al(a3, ae(a3), ah(a3))
    end,
    [201] = function(a3)
      return al(a3, af(a3), ah(a3))
    end,
    [202] = ab,
    [203] = ac,
    [204] = ad,
    [205] = ae,
    [206] = af,
    [207] = ag,
    [208] = ah,
    [209] = ai,
    [210] = aj,
    [211] = ak,
    [212] = function(a3)
      return al(a3, 1, ah(a3))
    end,
    [213] = function(a3)
      return al(a3, 2, ah(a3))
    end,
    [214] = function(a3)
      return al(a3, 4, ah(a3))
    end,
    [215] = function(a3)
      return al(a3, 8, ah(a3))
    end,
    [216] = function(a3)
      return al(a3, 16, ah(a3))
    end,
    [217] = function(a3)
      return a7(a3, ad(a3))
    end,
    [218] = function(a3)
      return a7(a3, ae(a3))
    end,
    [219] = function(a3)
      return a7(a3, af(a3))
    end,
    [220] = function(a3)
      return a9(a3, ae(a3))
    end,
    [221] = function(a3)
      return a9(a3, af(a3))
    end,
    [222] = function(a3)
      return aa(a3, ae(a3))
    end,
    [223] = function(a3)
      return aa(a3, af(a3))
    end
  }, {
    __index = function(H, I)
      if I < 192 then
        if I < 128 then
          return function(a3, a6)
            return a6
          end
        elseif I < 144 then
          return function(a3, a6)
            return aa(a3, a6 % 16)
          end
        elseif I < 160 then
          return function(a3, a6)
            return a9(a3, a6 % 16)
          end
        else
          return function(a3, a6)
            return a7(a3, a6 % 32)
          end
        end
      elseif I > 223 then
        return function(a3, a6)
          return a6 - 256
        end
      else
        return function()
          error("unpack '" .. q("%#x", I) .. "' is unimplemented")
        end
      end
    end
  })
  
  local function am(L)
    return {
      s = L,
      i = 1,
      j = #L,
      underflow = function()
        error("missing bytes")
      end
    }
  end
  
  local function an(ao)
    return {
      s = "",
      i = 1,
      j = 0,
      underflow = function(self, a8)
        self.s = self.s:sub(self.i)
        a8 = a8 - self.i + 1
        self.i = 1
        self.j = 0
        while a8 > self.j do
          local ap = ao()
          if not ap then
            error("missing bytes")
          end
          self.s = self.s .. ap
          self.j = #self.s
        end
      end
    }
  end
  
  function x.unpack(a4)
    F("unpack", 1, a4, "string")
    local aq = am(a4)
    local a0 = a2(aq)
    if aq.i <= aq.j then
      error("extra bytes")
    end
    return a0
  end
  
  function x.unpacker(ar)
    if type(ar) == "string" then
      do
        local aq = am(ar)
        return function()
          if aq.i <= aq.j then
            return aq.i, a2(aq)
          end
        end
      end
    elseif type(ar) == "function" then
      do
        local aq = an(ar)
        return function()
          if aq.i > aq.j then
            pcall(aq.underflow, aq, aq.i)
          end
          if aq.i <= aq.j then
            return true, a2(aq)
          end
        end
      end
    else
      y("unpacker", 1, "string or function expected, got " .. type(ar))
    end
  end
  
  N("string_compat")
  V("unsigned")
  if 4 == #u("n", 0.0) then
    x.small_lua = true
    a1[203] = nil
    a1[207] = nil
    a1[211] = nil
    X("float")
  else
    x.full64bits = true
    X("double")
    if #u("n", 0.0) > 8 then
      x.long_double = true
    end
  end
  R("without_hole")
  x._VERSION = "0.5.2"
  x._DESCRIPTION = "lua-MessagePack : a pure Lua 5.3 implementation"
  x._COPYRIGHT = "Copyright (c) 2012-2019 Francois Perrad"
  return x
end

o = o()
local as, at

local function au()
  local av = reaper.GetOS()
  av = av:lower()
  if av:match("macos") or av:match("osx") then
    return "mac"
  elseif av:match("win") then
    return "win"
  else
    return "linux"
  end
end

local function aw()
  local ax
  if k >= 6 and k < 7 then
    ax = "v6"
  elseif k >= 7 then
    ax = "v7"
  end
  at = au()
  if at == "mac" then
    package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. string.format("/Scripts/MArkers/%s/requirements/?.so", ax)
  elseif at == "win" then
    package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. string.format("/Scripts/MArkers/%s/requirements/?.dll", ax)
  else
    package.cpath = package.cpath .. ";" .. reaper.GetResourcePath() .. string.format("/Scripts/MArkers/%s/requirements/?.so.linux", ax)
  end
  package.path = package.path .. ";" .. reaper.GetResourcePath() .. string.format("/Scripts/MArkers/%s/requirements/?.lua", ax)
  if not o then
    return false, "Could not start MArkersServer, please contact MATools support"
  end
  as = require("socket")
  if not as then
    return false, "Could not start MArkersServer, please contact MATools support"
  end
  return true
end

local function ay(az)
  reaper.ShowConsoleMsg(string.format([==[
%s]==], az))
end

local function aA(az)
  local e = ""
  for a3 in string.gmatch(az, ".") do
    e = e .. string.format("%X", string.byte(a3))
  end
  return e
end

local aB

local function aC(aD, aE)
  local aF, aG
  if at == "mac" and aE then
    aF = io.popen("scutil --get ComputerName")
    if aF then
      aG = aF:read("*all")
      aF:close()
    else
      aG = as.dns.gethostname()
    end
  else
    aG = as.dns.gethostname()
  end
  aG = string.gsub(aG, "%s", "")
  aG = string.gsub(aG, "%W", "")
  if aD then
    reaper.SetExtState("MArkers", "ServerName", aG, 0)
  end
  return aG
end

local function aH(a0)
  local aI, aJ = xpcall(function()
    return o.pack(a0)
  end, debug.traceback)
  if aI then
    return aJ
  else
    return nil
  end
end

local function aK(L)
  local aI, aL = xpcall(function()
    return o.unpack(L)
  end, debug.traceback)
  if aI then
    return aL
  else
    return nil
  end
end

local function aM(aN, aO)
  aO = aO or 100
  for aP = aN, aN + aO - 1 do
    local aQ = as.tcp()
    aQ:setoption("reuseaddr", true)
    local aI, aR = aQ:bind("127.0.0.1", aP)
    aQ:close()
    if aI then
      return aP
    end
  end
  error("Could not find an available port")
end

local function aS()
  return {
    a13c343f = {},
    a91714e3 = {},
    ab3feca7 = {},
    a0c3f3b0 = {
      ad352352 = nil,
      a190b284 = nil,
      a9bc4a34 = nil,
      a9e9e327 = nil,
      a5142dd0 = -1
    },
    a36aebd6 = {}
  }
end

local function aT(aU, aV)
  local aW = 10 ^ (aV or 0)
  return math.floor(aU * aW + 0.5) / aW
end

local function aX(aY)
  aY = string.gsub(aY, n .. "$", "")
  local aF = assert(io.open(aY .. string.format("%stest.txt", n), "w"))
  aF:close()
  os.remove(aY .. string.format("%stest.txt", n))
end

local function aZ(aY)
  local function a_(aY)
    local aF = assert(io.open(aY .. string.format("%stest.txt", n), "w"))
    
    aF:close()
    os.remove(aY .. string.format("%stest.txt", n))
  end
  
  if not pcall(aX, aY) then
    assert(io.popen(string.format('mkdir "%s"', aY)))
  end
  while not pcall(aX, aY) do
  end
end

local function b0()
  local b1 = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
  return string.gsub(b1, "[xy]", function(a3)
    local P = a3 == "x" and math.random(0, 15) or math.random(8, 11)
    return string.format("%x", P)
  end)
end

local function b2()
  local b3 = tostring(os.time()):reverse():sub(1, 1)
  local b4 = b0()
  local b5 = string.gsub(b4, "x", function()
    return b3
  end)
  return b5
end

local function b6(b7)
  reaper.SetProjExtState(-1, "MArkers", "MATOOLSMARKERSGUID", string.format("{%s}", b7))
  local b8 = reaper.GetProjectName(-1)
  if b8 and "" ~= b8 then
    reaper.SetProjExtState(-1, "MArkersLookup", b7, b8)
    reaper.Main_SaveProject(-1, false)
  end
end

local function b9()
  local currentProj = reaper.EnumProjects(-1)
  local ba, bb = reaper.GetProjExtState(currentProj, "MARKERS", "MATOOLSMARKERSGUID")
  if bb and string.match(bb, "%{") then
    bb = string.match(bb, "%{(.-)%}")
  else
    return nil
  end
  return bb
end

local function bc(bd)
  local aF = assert(io.open(bd, "r"))
  if aF then
    aF:close()
  end
end

local function be(bf)
  if not bf then
    return aS()
  end
  local bb = b9()
  local bg = ""
  local bh = reaper.GetProjectName(-1, bg)
  local bi = string.gsub(bh, "%.[Rr][Pp][Pp]", "")
  local bj = reaper.GetProjectPath()
  local bk = string.format("%s%sMArkers%s%s-%s.dat", bj, n, n, bi, bf)
  local bl = string.format("%s%sMArkers%s%s-%s.dat", bj, n, n, bb, bf)
  local bm
  if pcall(bc, bk) then
    bm = bk
  elseif pcall(bc, bl) then
    bm = bl
  else
    return aS()
  end
  local aF = io.open(bm, "rb")
  if aF then
    local bn = aF:read("*all")
    aF:close()
    local bo = o.unpack(bn)
    return bo
  else
    return aS()
  end
end

local function bp(a0)
  local bg = ""
  local bh = reaper.GetProjectName(-1, bg)
  local bi = string.gsub(bh, "%.[Rr][Pp][Pp]", "")
  local bj = reaper.GetProjectPath()
  local bq = string.format("%s%sMArkers", bj, n)
  aZ(bq)
  local bb = b9()
  if a0.aa942c2a and a0.aa942c2a.a0c3f3b0 and a0.aa942c2a.a0c3f3b0.a04556b5 and a0.aa942c2a.a0c3f3b0.a04556b5 ~= bb then
    bb = a0.aa942c2a.a0c3f3b0.a04556b5
    b6(bb)
  end
  local br = string.format("%s-%s", bb, a0.a20cbdb3)
  local bm = string.format("%s%sMArkers%s%s.dat", bj, n, n, br)
  local bs = io.open(bm, "rb")
  if bs then
    bs:close()
    local bt = string.format("%s%sbackups", bq, n)
    aZ(bt)
    local bu = os.date("%Y%m%d-%H%M%S")
    local bv = string.format("%s%s%s-%s.dat", bt, n, br, bu)
    local ar = io.open(bm, "rb")
    local bw = io.open(bv, "wb")
    if ar and bw then
      bw:write(ar:read("*all"))
    end
    if ar then
      ar:close()
    end
    if bw then
      bw:close()
    end
  end
  local aF = io.open(bm, "wb")
  if aF then
    local bn = o.pack(a0.aa942c2a)
    aF:write(bn)
    aF:close()
    return {
      acf4591d = "done"
    }
  else
    return {
      acf4591d = "Unable to save metadata to Reaper Project"
    }
  end
end

local function bx(by)
  local currentProj = reaper.EnumProjects(-1)
  local bz, bA, bB = reaper.GetProjectTimeSignature2(0)
  local bC = reaper.CountTempoTimeSigMarkers(0)
  local bD = 0
  local bE = false
  for Q = 0, bC - 1 do
    local bF, bG, bH, bI, bJ, bA, bB, bK = reaper.GetTempoTimeSigMarker(currentProj, Q)
    if by >= bG or aT(bG, 3) == aT(by, 3) then
      bD = bG
      bz = bJ
    else
      return bz
    end
  end
  return bz
end

local function bL()
  local bM = 1.0E9
  local bN = reaper.GetExtState("MArkers", "ReaperTools_HideBase") or bM
  bN = tonumber(bN) or bM
  local Q = 0
  local bO = {}
  while true do
    local bP, bQ, a6 = reaper.EnumProjExtState(0, "ReaperTools_MarkerVisibilityCore", Q)
    if 0 == bP or false == bP or nil == bP then
      break
    end
    local bR = string.match(bQ, "HIDDEN_(%d+)")
    bR = tonumber(bR)
    if bR and (1 == a6 or "1" == a6) then
      bO[bR] = true
    end
    Q = Q + 1
  end
  return bN, bO
end

local function bS(bT)
  local currentProj = reaper.EnumProjects(-1)
  local bN, bU = bL()
  local bV = {
    a91714e3 = {},
    a39401d9 = {},
    a13c343f = {},
    a20da4dc = {},
    a931305d = 0,
    a91437f3 = 0
  }
  local bW
  local bX = 0
  local bY = false
  for bZ = 0, 256 do
    local b_ = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_DEFAULT:" .. bZ, 0, false)
    if b_ then
      bY = true
      if 2 == b_ or 3 == b_ then
        bW = bZ
        bX = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_COLOR:" .. bZ, 0, false)
      end
      local c0, c1 = reaper.GetSetProjectInfo_String(currentProj, "RULER_LANE_NAME:" .. bZ, "", false)
      local c2 = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_COLOR:" .. bZ, 0, false)
      local c3 = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_HIDDEN:" .. bZ, 0, false)
      local c4 = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_LOCKED:" .. bZ, 0, false)
      local c5 = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_VISIBLE:" .. bZ, 0, false)
      local c6 = reaper.GetSetProjectInfo(currentProj, "RULER_LANE_TIMEBASE:" .. bZ, 0, false)
      local c7 = {
        a09f63fb = bZ,
        a3bdc261 = c1 or "",
        a12b4a07 = c2 or 0,
        a25932d6 = 1 == c3,
        adc035d4 = 1 == c4,
        a3c40563 = 1 == c5,
        ab834454 = b_ or 0,
        a3150ea5 = c6 or -1
      }
      table.insert(bV.a20da4dc, c7)
    elseif bY then
      break
    end
  end
  bV.a931305d = bX or 0
  bV.a91437f3 = bW or 0
  local c8 = reaper.GetNumRegionsOrMarkers(currentProj)
  local c9 = 0
  for Q = 0, c8 - 1 do
    local ca = reaper.GetRegionOrMarker(currentProj, Q, "")
    if not ca then
      break
    end
    local cb = 1 == reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "B_ISREGION") and true or false
    local by = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "D_STARTPOS")
    local cc = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "D_ENDPOS")
    local c0, cd = reaper.GetSetRegionOrMarkerInfo_String(currentProj, ca, "P_NAME", "", false)
    local ce = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "I_INDEX")
    local cf = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "I_NUMBER")
    local bR = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "I_CUSTOMCOLOR")
    local cg = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "I_DISPLAYEDCOLOR")
    local ch = reaper.GetRegionOrMarkerInfo_Value(currentProj, ca, "I_LANENUMBER")
    local c0, b7 = reaper.GetSetRegionOrMarkerInfo_String(currentProj, ca, "GUID", "", false)
    local ci = ""
    ci = reaper.guidToString(b7, ci)
    ci = string.match(ci, "%{(.-)%}")
    local cj = bR
    if 0 == bR and not cb and ch ~= bW then
      cj = cg
    end
    if bU[tonumber(cj)] then
      by = by - bN
    end
    local ck = {
      a3bdc261 = cd,
      adbfa544 = cd,
      a5320370 = by,
      a12b4a07 = cj,
      a7044d68 = cg,
      a90ff523 = cf,
      a09f63fb = ce,
      ad40375c = ci,
      a156ed81 = bx(by),
      a4799f71 = ch
    }
    if not cb then
      table.insert(bV.a91714e3, ck)
      local cl
      for I, P in pairs(bV.a13c343f) do
        if P.a12b4a07 == cj then
          cl = true
        end
      end
      if not cl then
        local cm = {
          a12b4a07 = cj,
          a09f63fb = c9,
          aedcc9ac = true
        }
        c9 = c9 + 1
        table.insert(bV.a13c343f, cm)
      end
    else
      ck.a72235e2 = cc
      table.insert(bV.a39401d9, ck)
    end
  end
  return bV
end

local function cn(bT)
  local currentProj = reaper.EnumProjects(-1)
  local co = {}
  local cp = reaper.CountTempoTimeSigMarkers(currentProj)
  for Q = 0, cp - 1 do
    local bF, cq, bH, bI, cr, bA, bB, bK = reaper.GetTempoTimeSigMarker(currentProj, Q)
    local ck = {
      a43ac778 = cr,
      a7890f1e = bA,
      a1ac97d8 = bB,
      a5320370 = cq
    }
    table.insert(co, ck)
  end
  if 0 == cp then
    local cq = 0
    local bB = 4
    local cr, bA = reaper.GetProjectTimeSignature2(currentProj)
    local ck = {
      a43ac778 = cr,
      a7890f1e = bA,
      a1ac97d8 = bB,
      a5320370 = cq
    }
    table.insert(co, ck)
  end
  return co
end

local function cs(ct, ...)
  local H = {nil}
  return function()
    ct(table.unpack(H))
  end
end

local cu = {
  a1300d81 = {
    ab547850 = {
      a786d3d7 = 112,
      ac8a7474 = "bDNwbSAAAAAAAAAACQAAAAAAAAAGAAAAQAEAAAAAAAA="
    }
  },
  a354dc10 = {
    aad48cb9 = {
      a786d3d7 = 320,
      ac8a7474 = "bDNwbUABAAAAAAAACgAAAP////8EAAAAQAEAAAAAAAA="
    }
  },
  aa1266a5 = {
    aad48cb9 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAAAAAAAAAAAAAAAAAAQAEAAAAAAAA="
    },
    a5a372ec = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAAAgAAAAAAAAAAAAAAQAEAAAAAAAA="
    },
    a2405329 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAAAwAAAAAAAAAAAAAAQAEAAAAAAAA="
    },
    a0730844 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAABQAAAAAAAAAAAAAAQAEAAAAAAAA="
    },
    a04f3cc3 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAABwAAAAAAAAAAAAAAQAEAAAAAAAA="
    },
    ab547850 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAACQAAAAAAAAAAAAAAQAEAAAAAAAA="
    }
  },
  a948bd27 = {
    aad48cb9 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAAAAAAAAQAAAAEAAAAQAEAAAABAAA="
    },
    a5a372ec = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAAAgAAAAQAAAAEAAAAQAEAAAABAAA="
    },
    a2405329 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAAAwAAAAQAAAAEAAAAQAEAAAABAAA="
    },
    a0730844 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAABQAAAAQAAAAEAAAAQAEAAAABAAA="
    },
    a04f3cc3 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAABwAAAAQAAAAEAAAAQAEAAAABAAA="
    },
    ab547850 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbSAAAAAAAAAACQAAAAQAAAAEAAAAQAEAAAABAAA="
    }
  },
  a5abac4f = {
    aad48cb9 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbQABAAAAAAAAAAAAAP////8EAAAAAAEAAAAAAAA="
    },
    a5a372ec = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbQABAAAAAAAAAgAAAP////8EAAAAAAEAAAAAAAA="
    },
    a2405329 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbQABAAAAAAAAAwAAAP////8EAAAAAAEAAAAAAAA="
    },
    a0730844 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbQABAAAAAAAABQAAAP////8EAAAAAAEAAAAAAAA="
    },
    a04f3cc3 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbTAAAAAAAAAABwAAAP////8EAAAAMAAAAAAAAAA="
    },
    ab547850 = {
      a786d3d7 = 256,
      ac8a7474 = "bDNwbTAAAAAAAAAACQAAAP////8EAAAAMAAAAAAAAAA="
    }
  }
}

local function cv(bT)
  reaper.CSurf_OnStop()
  reaper.GetSetRepeat(0)
  local e = reaper.GetSetProjectInfo(-1, "RENDER_SETTINGS", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_BOUNDSFLAG", 1, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_CHANNELS", 2, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_SRATE", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_STARTPOS", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_ENDPOS", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_ADDTOPROJ", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_DITHER", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_NORMALIZE", 0, true)
  e = reaper.GetSetProjectInfo(-1, "RENDER_TAILFLAG", 0, true)
  local cw = reaper.GetProjectName(-1)
  cw = cw:gsub("%.[Rr][Pp][Pp]$", "")
  local cx = cw .. "_Waveform"
  local cy = reaper.GetProjectPath("") .. n .. "MA3Waveforms" .. n
  local cz = cy .. cx .. ".mp3"
  local cA = b2()
  local cB = cy .. cA .. ".mp3"
  local ba, e = reaper.GetSetProjectInfo_String(-1, "RENDER_FILE", cy, true)
  ba, e = reaper.GetSetProjectInfo_String(-1, "RENDER_PATTERN", cA, true)
  ba, e = reaper.GetSetProjectInfo_String(-1, "RENDER_FORMAT", cu.a1300d81.ab547850.ac8a7474, true)
  ba, e = reaper.GetSetProjectInfo_String(-1, "RENDER_FORMAT2", "", true)
  reaper.Main_OnCommand(40101, 0)
  reaper.Main_OnCommandEx(42230, 0, -1)
  local aF = io.open(cB, "rb")
  if not aF then
    return {
      acf4591d = "fail"
    }
  end
  local cC = aF:read("*all")
  local cD = aF:seek("end")
  aF:close()
  os.remove(cB)
  local aF = io.open(cz, "w+b")
  if aF then
    aF:write(cC)
    aF:close()
  end
  local e = {
    acf4591d = "done",
    a4a6a654 = cx,
    ad3af9e6 = cx .. ".mp3",
    ad3b2478 = cC,
    a057ff63 = cD
  }
  return e
end

local function cE(bT)
  local currentProj = reaper.EnumProjects(-1)
  local cF = {}
  
  local function cG(cH, cI, cJ)
    if not cF[cI] then
      local cK = reaper.GetMediaTrackInfo_Value(cH, "IP_TRACKNUMBER")
      local c0, cJ = reaper.GetTrackName(cH)
      cF[cI] = {
        ab89ceef = {},
        a01d3537 = {},
        a3bdc261 = cJ,
        a12b4a07 = reaper.GetTrackColor(cH),
        a09f63fb = cK,
        a33a7def = true,
        af09dc19 = nil,
        ad40375c = cI
      }
    end
  end
  
  local function cL(cI, cM, cN)
    cF[cI].ab89ceef[#cF[cI].ab89ceef + 1] = {
      a6d2608d = cN,
      a3bdc261 = cM,
      abbbba71 = {},
      a1925f31 = nil,
      aedcc9ac = true,
      a190b284 = 0
    }
  end
  
  local cO = reaper.CountTracks(currentProj)
  for Q = 0, cO - 1 do
    for a5 = 0, 127 do
      local cP = 0
      local cM = reaper.GetTrackMIDINoteName(Q, a5, cP)
      if cM then
        local cH = reaper.GetTrack(currentProj, Q)
        local cI = reaper.GetTrackGUID(cH)
        cI = string.match(cI, "%{(.-)%}")
        cG(cH, cI)
        cL(cI, cM, a5)
      end
    end
  end
  local cQ = reaper.CountMediaItems(currentProj)
  local cR = {}
  for Q = 0, cQ - 1 do
    local cS = reaper.GetMediaItem(currentProj, Q)
    local cT = reaper.GetMediaItem_Track(cS)
    local cU = reaper.GetTrackGUID(cT)
    cU = string.match(cU, "%{(.-)%}")
    local cV = reaper.GetMediaItemTake(cS, 0)
    local c0, cW = reaper.MIDI_CountEvts(cV)
    local cX = reaper.GetMediaItemInfo_Value(cS, "D_POSITION")
    local cY = reaper.GetMediaItemInfo_Value(cS, "D_LENGTH")
    local ba, cZ = reaper.GetSetMediaItemTakeInfo_String(cV, "GUID", "", false)
    cZ = string.gsub(cZ, "[%{%}]", "")
    if not cR[cU] then
      cR[cU] = {}
    end
    if not cR[cU][cZ] then
      cR[cU][cZ] = {}
    end
    if cW > 0 then
      for a5 = 0, cW - 1 do
        local bF, c_, d0, d1, d2, d3, cN, d4 = reaper.MIDI_GetNote(cV, a5)
        local d5 = reaper.MIDI_GetProjTimeFromPPQPos(cV, d1)
        local d6 = reaper.MIDI_GetProjTimeFromPPQPos(cV, d2)
        if (cX <= d5 or cX <= d6) and d5 < cX + cY then
          if not cR[cU][cZ][cN] then
            cR[cU][cZ][cN] = 1
          else
            cR[cU][cZ][cN] = cR[cU][cZ][cN] + 1
          end
          local ck = {
            a5320370 = d5,
            a72235e2 = d6,
            a6d2608d = cN,
            a77a41bb = d4,
            ad4987af = cZ,
            a09f63fb = tostring(cR[cU][cZ][cN])
          }
          cG(cT, cU)
          table.insert(cF[cU].a01d3537, ck)
          local cl
          for I, P in pairs(cF[cU].ab89ceef) do
            if P.a6d2608d == cN then
              cl = true
            end
          end
          if not cl then
            cL(cU, string.format("MIDI Note %s", cN), cN)
          end
          for I, P in pairs(cF[cU].ab89ceef) do
            if P.a6d2608d == cN then
              local d7
              for c0, d8 in pairs(P.abbbba71) do
                if d8 == d4 then
                  d7 = true
                end
              end
              if not d7 then
                table.insert(P.abbbba71, d4)
              end
              if not P.a156ed81 then
                P.a156ed81 = bx(d5)
              end
            end
          end
        end
      end
    end
  end
  
  local function d9(da, db)
    return da.a6d2608d < db.a6d2608d
  end
  
  local function dc(da, db)
    return da < db
  end
  
  for I, P in pairs(cF) do
    table.sort(P.ab89ceef, d9)
    for dd, de in pairs(P.ab89ceef) do
      table.sort(de.abbbba71, dc)
    end
  end
  for cI, cH in pairs(cF) do
    for I, P in pairs(cH.ab89ceef) do
      if not P.a156ed81 then
        P.a156ed81 = 120
      end
    end
  end
  return cF
end

local function df()
  local dg = reaper.EnumProjects(-1, "")
  if dg then
    local bF, dh = reaper.EnumProjects(-1, "")
    if bF then
      return dh
    else
      return nil
    end
  else
    return nil
  end
end

local function di(bT)
  local currentProj = reaper.EnumProjects(-1)
  local bg = ""
  local bh = reaper.GetProjectName(currentProj, bg)
  local bi = string.gsub(bh, "%.[Rr][Pp][Pp]", "")
  local dj = df()
  local dk = reaper.GetProjectTimeOffset(currentProj, false)
  local dl, dm = reaper.TimeMap_curFrameRate(currentProj)
  local bb = b9()
  local dn = reaper.GetProjectLength(currentProj)
  local dp = be(bT.a20cbdb3)
  local dq = {
    a3bdc261 = bi,
    a06af6c3 = dj,
    aa5f01de = bh,
    a04556b5 = bb,
    a27f7dd7 = dk,
    a9c920d0 = dl,
    a5f75b55 = dm,
    afd0469a = h:gsub("^V", ""),
    aa942c2a = dp,
    a3e4ce38 = at,
    a3075197 = dn
  }
  return dq
end

local function dr(dj, ds)
  if not pcall(bc, dj) then
    return
  end
  if not ds then
    reaper.Main_SaveProject(0)
  end
  reaper.Main_openProject("noprompt:" .. dj)
end

local function dt(a0)
  if not a0.aefac44a then
    return
  end
  local currentProj = reaper.EnumProjects(-1)
  reaper.defer(dr(a0.aefac44a, a0.ad0e1f41))
  return {
    acf4591d = "done"
  }
end

local function du()
  local currentProj = reaper.EnumProjects(-1)
  local bg = ""
  local bh = reaper.GetProjectName(currentProj, bg)
  local bi = string.gsub(bh, "%.[Rr][Pp][Pp]", "")
  local dv = reaper.IsProjectDirty(currentProj)
  if 0 == dv then
    return {
      acf4591d = "clean",
      a5142dd0 = bi
    }
  else
    return {
      acf4591d = "dirty",
      a5142dd0 = bi
    }
  end
end

local function dw()
  reaper.Main_SaveProject(currentProj)
  return {
    acf4591d = "done"
  }
end

local function dx(dk)
  if not dk then
    return
  end
  dk = tonumber(dk)
  if not dk then
    return
  end
  local currentProj = reaper.EnumProjects(-1)
  if not currentProj then
    return
  end
  reaper.Main_SaveProject(currentProj)
  local bg = ""
  local bh = reaper.GetProjectName(currentProj, bg)
  local dj = df()
  if not dj then
    return
  end
  local aF = assert(io.open(dj, "r"))
  if not aF then
    return
  end
  local dy = {}
  for dz in aF:lines() do
    if string.match(dz, "PROJOFFS") then
      dz = string.format("  PROJOFFS %s 0 0", dk)
    end
    table.insert(dy, dz)
  end
  aF:close()
  local dA = false
  local dB = false
  local dC
  for I, P in ipairs(dy) do
    if string.match(P, "%<ITEM") then
      dA = true
    end
    if string.match(P, "%>") then
      dA = false
      dB = false
      dC = nil
    end
    if string.match(P, "POSITION") then
      dC = string.match(P, "POSITION%s*([0-9]*%.?[0-9]+)")
      dC = tonumber(dC)
    end
    if string.match(P, "Timecode Generator") then
      dB = true
    end
    if string.match(P, "STARTTIME") and dA and dB and dC then
      local d5 = dC + dk
      dy[I] = string.gsub(P, "[0-9]*%.?[0-9]+", d5)
    end
  end
  local aF = assert(io.open(dj, "w+"))
  for I, P in ipairs(dy) do
    aF:write(P .. [==[
]==])
  end
  aF:close()
  reaper.Main_openProject(dj)
  return {
    acf4591d = "done"
  }
end

local function dD(dE, dF, dG, dH, dl, dI, dJ)
  if dE < 0 then
    dE = 0
    dF = 0
    dG = 0
    dH = 0
  end
  if dF < 0 then
    dE = 0
    dF = 0
    dG = 0
    dH = 0
  end
  if dG < 0 then
    dE = 0
    dF = 0
    dG = 0
    dH = 0
  end
  if dH < 0 then
    dE = 0
    dF = 0
    dG = 0
    dH = 0
  end
  dJ = tonumber(dJ) or 0
  if dJ < 0 then
    dJ = 0
  end
  if dJ > 255 then
    dJ = 255
  end
  dJ = math.floor(dJ)
  local dK = 0
  if 24 == dl then
    dK = 0
  elseif 25 == dl then
    dK = 1
  elseif 30 == dl then
    if dI then
      dK = 2
    else
      dK = 3
    end
  end
  local dL = string.char(65, 114, 116, 45, 78, 101, 116, 0, 0, 151, 0, 14, 0, dJ, dH, dG, dF, dE, dK)
  return dL
end

local function dM(dl, dm)
  local dN
  if 1 == reaper.GetPlayState() then
    dN = reaper.GetPlayPosition()
  else
    dN = reaper.GetCursorPosition()
  end
  local dO = reaper.GetProjectTimeOffset(0, false)
  local dG = dN + dO
  if dm then
    local dP = math.floor(dl * 0.066666 + 0.5)
    local dQ = dl * 3600 - dP * 54
    local dR = dl * 600 - dP * 9
    local dS = math.floor(dG * dl)
    local dT = math.floor(dS / dQ)
    dS = dS + 108 * dT + math.floor(dS % dQ / dR) * 18
    local dH = dS % math.floor(dl)
    local dU = math.floor(dS / math.floor(dl))
    local dG = dU % 60
    local dV = math.floor(dU / 60)
    local dF = dV % 60
    local dE = math.floor(dV / 60)
    return dE, dF, dG, dH
  else
    local dS = math.floor(dG * dl)
    local dH = dS % math.floor(dl)
    local dU = math.floor(dS / math.floor(dl))
    local dG = dU % 60
    local dV = math.floor(dU / 60)
    local dF = dV % 60
    local dE = math.floor(dV / 60)
    return dE, dF, dG, dH
  end
end

local dW
local dX = 0
local dY, dZ

local function d_(e0, bQ)
  local P = reaper.GetExtState(e0, bQ)
  if P == "true" then
    return true
  end
  if P == "false" then
    return false
  end
  return nil
end

local function e1(e0, bQ, e2)
  local P = reaper.GetExtState(e0, bQ)
  P = tonumber(P)
  if nil == P then
    return e2
  end
  return P
end

local function e3(e0)
  local e4 = reaper.GetExtState(e0, "artnet_mode")
  if e4 == "unicast" then
    local e5 = reaper.GetExtState(e0, "artnet_unicast_ip")
    if e5 and "" ~= e5 then
      return e5
    end
    return nil
  end
  local e6 = reaper.GetExtState(e0, "artnet_iface")
  if e6 == "__loopback__" then
    return "127.0.0.1"
  end
  local db = reaper.GetExtState(e0, "artnet_iface_broadcast")
  if db and "" ~= db then
    return db
  end
  return nil
end

local function e7()
  dX = dX + 1
  if dW then
    dW:close()
    dW = nil
  end
  return {
    acf4591d = "done"
  }
end

local function e8(bT)
  if dW then
    e7()
  end
  dX = dX + 1
  local e9 = dX
  dW = as.udp4()
  dW:settimeout(0.01)
  dW:setoption("broadcast", true)
  local e5 = bT.a74faa94
  local aP = 6454
  dW:setpeername(e5, aP)
  reaper.atexit(function()
    pcall(function()
      dW:close()
    end)
  end)
  local ea = as.gettime()
  
  local function eb()
    if e9 ~= dX then
      return
    end
    if not dW then
      return
    end
    local ec = as.gettime()
    local ed, dm = reaper.TimeMap_curFrameRate(currentProj)
    local ee = dm and 30 or math.floor(ed + 0.5)
    local ef = 1 / ee
    if ec >= ea then
      ea = ea + ef
      do
        local dE, dF, dG, dH = dM(ee, dm)
        local dL = dD(dE, dF, dG, dH, ee, dm, bT.ac02463f)
        if bT.a4151b75 or 1 == reaper.GetPlayState() then
          pcall(function()
            dW:send(dL)
          end)
        end
      end
    end
    if dW and e9 == dX then
      reaper.defer(eb)
    end
  end
  
  if dW then
    eb()
  end
  return {
    acf4591d = "done"
  }
end

local eg

local function eh()
  local bd = reaper.GetResourcePath()
  bd = bd .. eg
  if not pcall(bc, bd) then
    return
  end
  local ei = loadfile(bd)
  eg = nil
  pcall(ei)
end

local function ej()
  eg = "/Scripts/obs_start.lua"
  reaper.defer(eh)
  return {
    acf4591d = "done"
  }
end

local function ek()
  eg = "/Scripts/obs_stop.lua"
  reaper.defer(eh)
  return {
    acf4591d = "done"
  }
end

local function el()
  reaper.CSurf_OnPlay()
  return {
    acf4591d = "done"
  }
end

local function em()
  reaper.CSurf_OnPause()
  return {
    acf4591d = "done"
  }
end

local function en()
  reaper.CSurf_OnStop()
  reaper.GetSetRepeat(0)
  return {
    acf4591d = "done"
  }
end

local function eo()
  reaper.CSurf_OnRecord()
  return {
    acf4591d = "done"
  }
end

local function ep(a0)
  reaper.SetEditCurPos2(0, a0.a67a3ae2, true, true)
  return {
    acf4591d = "done"
  }
end

local function eq(a0)
  local er = tonumber(a0.a3ebc518) or 0
  local es = tonumber(a0.a6968c76) or 1
  local et = reaper.GetCursorPosition()
  local eu = er
  if -1 == es then
    eu = er * -1
  end
  local ev = et + eu
  if ev < 0 then
    ev = 0
  end
  local ew = reaper.GetProjectLength(0)
  if ew and ev > ew then
    ev = ew
  end
  reaper.SetEditCurPos2(0, ev, true, true)
  return {
    acf4591d = "done"
  }
end

local function ex(a0)
  reaper.GetSetRepeat(a0.ad2ce7f1)
  return {
    acf4591d = "done"
  }
end

local function ey(a0)
  reaper.GetSet_LoopTimeRange2(0, true, true, a0.ac40ed7a, a0.a7f91941, false)
  return {
    acf4591d = "done"
  }
end

local function ez(a0)
  if 1 == a0.ad2ce7f1 then
    reaper.SetExtState("MArkers", "AutoSync", "true", 1)
  else
    reaper.SetExtState("MArkers", "AutoSync", "false", 1)
  end
  return {
    acf4591d = "done"
  }
end

local function eA(a0)
  if 1 == a0.ad2ce7f1 then
    reaper.Main_OnCommand(41745, 0)
  else
    reaper.Main_OnCommand(41746, 0)
  end
  return {
    acf4591d = "done"
  }
end

local function eB(a0)
  if a0.a38325d7 then
    if a0.a38325d7 == "markers" then
      return bS(a0)
    elseif a0.a38325d7 == "tempo" then
      return cn(a0)
    elseif a0.a38325d7 == "waveform" then
      return cv(a0)
    elseif a0.a38325d7 == "midi" then
      return cE(a0)
    elseif a0.a38325d7 == "info" then
      return di(a0)
    elseif a0.a38325d7 == "saveMeta" then
      return bp(a0)
    elseif a0.a38325d7 == "openProject" then
      return dt(a0)
    elseif a0.a38325d7 == "isProjectDirty" then
      return du()
    elseif a0.a38325d7 == "saveProject" then
      return dw()
    elseif a0.a38325d7 == "play" then
      return el()
    elseif a0.a38325d7 == "pause" then
      return em()
    elseif a0.a38325d7 == "stop" then
      return en()
    elseif a0.a38325d7 == "record" then
      return eo()
    elseif a0.a38325d7 == "seek" then
      return ep(a0)
    elseif a0.a38325d7 == "skip" then
      return eq(a0)
    elseif a0.a38325d7 == "setRepeat" then
      return ex(a0)
    elseif a0.a38325d7 == "setLoop" then
      return ey(a0)
    elseif a0.a38325d7 == "setClick" then
      return eA(a0)
    elseif a0.a38325d7 == "saveTimecodeOffset" then
      return dx(a0.adeda4ce)
    elseif a0.a38325d7 == "SetAutoSync" then
      return ez(a0)
    elseif a0.a38325d7 == "startArtnetTimecode" then
      reaper.SetExtState(l.a11a2802, "artnet_tc_enabled", "true", true)
      return {
        acf4591d = "done"
      }
    elseif a0.a38325d7 == "stopArtnetTimecode" then
      reaper.SetExtState(l.a11a2802, "artnet_tc_enabled", "false", true)
      return {
        acf4591d = "done"
      }
    elseif a0.a38325d7 == "StartOBS" then
      return ej()
    elseif a0.a38325d7 == "StopOBS" then
      return ek()
    else
      return {
        acf4591d = "Invalid request"
      }
    end
  else
    return {
      acf4591d = "Invalid message"
    }
  end
end

local function eC()
  aB = aM(29882, 100)
  l.a73a1a2c = aB
  local eD = assert(as.bind("*", aB))
  eD:settimeout(0)
  local eE = {}
  
  local function eF(eG, Q)
    if eG then
      eG:close()
    end
    if eE[Q] then
      table.remove(eE, Q)
    end
  end
  
  local function eH(eG, Q, aR)
    if aR == "closed" then
      eF(eG, Q)
      if eE[Q] then
        table.remove(eE, Q)
      end
    elseif aR ~= "timeout" then
      eF(eG, Q)
      if eE[Q] then
        table.remove(eE, Q)
      end
    elseif aR == "timeout" then
      eF(eG, Q)
      if eE[Q] then
        table.remove(eE, Q)
      end
    end
  end
  
  local function eI(eG, eJ, a0, eK)
    local eL, aR = aH(a0)
    if aR then
      ay(aR)
    end
    if eL then
      eL = "MS" .. string.pack("<I4", #eL) .. eL
      local e, aR = eG:send(eL)
      if eK or aR and aR == "closed" then
        eF(eG, eJ)
      end
    end
  end
  
  local function eM(eG, eJ, eN)
    local eO = {
      acf4591d = "wait"
    }
    if eN then
      for I, P in pairs(eN) do
        eO[I] = P
      end
    end
    eI(eG, eJ, eO, false)
  end
  
  local eP = 1
  
  local function eQ()
    local eG = eD:accept()
    if eG then
      table.insert(eE, eG)
      eG:settimeout(eP)
    end
    for Q, eG in ipairs(eE) do
      local eR, aR = eG:receive(2)
      if aR then
        eH(eG, Q, aR)
      elseif eR ~= "MC" then
        eF(eG, Q)
      else
        local eS, aR = eG:receive(4)
        if aR then
          eH(eG, Q, aR)
        else
          local eT = string.unpack("<I4", eS)
          local a0, aR = eG:receive(eT)
          if a0 then
            local eU = aK(a0)
            if eU then
              eU.a01172df = eM
              eU.af172a50 = eI
              eU.a45d4094 = eF
              eU.ac007bd8 = eG
              eU.a2f2f405 = Q
              if eU.ac420da5 then
                eG:settimeout(eU.ac420da5)
              end
              if eU.abd9ebec then
                eI(eG, Q, {
                  acf4591d = "done"
                }, true)
                local eV = eB(eU)
              else
                local eV = eB(eU)
                if eV then
                  if -1 ~= eV then
                    eI(eG, Q, eV, true)
                  else
                  end
                elseif eE[Q] then
                  table.remove(eE, Q)
                end
              end
            end
          elseif aR then
            eH(eG, Q, aR)
          end
        end
      end
    end
    reaper.defer(eQ)
  end
  
  eQ()
end

local function eW(eX)
  local aF = io.popen(eX)
  local eY = aF:read("*all")
  aF:close()
  eY = eY or nil
  return eY
end

local function eZ(e_, f0)
  local f1 = assert(as.udp())
  assert(f1:setpeername(e_, f0 or 1))
  local e5, c0 = f1:getsockname()
  f1:close()
  return e5
end

local function f2()
  local f3 = "0.0.0.0"
  local f4 = 29881
  local f1 = assert(as.udp())
  assert(f1:setsockname(f3, f4))
  f1:settimeout(0)
  
  local function f5()
    local a0, e5, aP = f1:receivefrom()
    if a0 then
      local eU = aK(a0)
      if eU and eU.a38325d7 and eU.a38325d7 == "ReaperPoll" and aB then
        local f6 = eZ(e5, aB)
        if f6 then
          local f7 = {
            abf27542 = aC(false, true),
            aed31a9c = aB,
            a27009e2 = reaper.GetAppVersion():match("^([0-9]*%.?[0-9]+)"),
            a5dd2b8f = reaper.GetOS(),
            afd0469a = h:gsub("^V", ""),
            a74faa94 = f6
          }
          local eL = aH(f7)
          if eL then
            f1:sendto(eL, e5, aP)
          end
        end
      end
    end
    reaper.defer(f5)
  end
  
  f5()
end

local f8 = os.time()
local f9 = f8
local fa = 0
local fb = {}

local function fc(fd)
  local aF = assert(io.open(fd, "r"))
  return aF
end

local function fe()
  local currentProj = reaper.EnumProjects(-1)
  local b8 = reaper.GetProjectName(currentProj)
  local ba, ff = pcall(df)
  if not ba or not ff then
    return
  end
  local fg
  local aG = reaper.GetExtState("MArkers", "ServerName")
  if not aG or string.gsub(aG, " ", "") == "" then
    aG = aC(true, false)
  end
  reaper.SetProjExtState(currentProj, "MArkers", "ServerName", aG)
  local fh = "f" .. aA(ff)
  if not string.match(ff, "%.[Rr][Pp][Pp]$") then
    return
  end
  local e, aF = pcall(fc, ff)
  if not e then
    return
  end
  local fi = aF:read()
  local fj = aF:read("*all")
  io.close(aF)
  if not fi then
    return
  end
  local fk = string.match(fi, '<REAPER_PROJECT%s+[%d%.]+%s+"[^"]+"%s+(%d+)')
  if string.match(fj, "SERVERNAME%s%w+") then
    fg = string.match(fj, "SERVERNAME%s(%w+)")
  end
  
  local function fl()
    local dN = reaper.GetPlayPosition()
    local fm = reaper.GetPlayState()
    local fn = reaper.GetCursorPosition()
    reaper.Main_openProject(ff)
    if 1 == fm then
      reaper.SetEditCurPos(dN, true, true)
      reaper.CSurf_OnPlay()
      reaper.SetEditCurPos(fn, false, false)
    else
      reaper.SetEditCurPos(fn, true, true)
    end
  end
  
  if fk then
    fk = tonumber(fk)
    if not fb[fh] then
      fb[fh] = fk
    elseif fb[fh] ~= fk then
      if fg ~= aG then
        fb[fh] = fk
        fl()
      elseif fk <= os.time() and os.time() <= fk + 2 then
        fb[fh] = fk
      else
        fb[fh] = fk
        fl()
      end
    end
  end
end

local function fo()
  if not b9() then
    local bb = b2()
    b6(bb)
    return
  end
  local b8 = reaper.GetProjectName(currentProj)
  if not b8 or "" == b8 then
    local bb = b2()
    b6(bb)
    return
  end
  local fp = b9()
  if not fp then
    return
  end
  local ba, fq = reaper.GetProjExtState(-1, "MArkersLookup", fp)
  if fq and "" ~= fq then
    if fq ~= b8 then
      local e = reaper.ShowMessageBox(string.format([==[Project name has changed from...

%s

to

%s

Would you like to keep existing MArkers sync data (Yes), or reset this to a new project (No)?]==], fq, b8), "MATools - MArkersServer", 4)
      if 7 == e then
        local fr = b2()
        b6(fr)
      elseif 6 == e then
        b6(fp)
      end
    end
  else
    b6(fp)
  end
end

local function fs()
  local ft = os.time()
  if ft - f9 >= 0.2 then
    f9 = ft
    if reaper.GetExtState("MArkers", "AutoSync") == "true" then
      fe()
    end
    fo()
  end
  local fu = reaper.GetExtState("MArkers", "artnet_tc_enabled")
  local fv = fu == "true"
  if fv ~= dY then
    dY = fv
    if fv then
      do
        local e5 = e3("MArkers")
        if e5 and "" ~= e5 then
          do
            local fw = d_("MArkers", "artnet_tc_always_send") or false
            local dJ = e1("MArkers", "artnet_tc_stream_id", 0)
            pcall(function()
              e7()
            end)
            pcall(function()
              e8({
                a74faa94 = e5,
                a4151b75 = fw,
                ac02463f = dJ
              })
            end)
          end
        end
      end
    else
      pcall(function()
        e7()
      end)
    end
  elseif fv then
    do
      local e4 = reaper.GetExtState("MArkers", "artnet_mode")
      local e6 = reaper.GetExtState("MArkers", "artnet_iface")
      local fx = reaper.GetExtState("MArkers", "artnet_unicast_ip")
      local fy = reaper.GetExtState("MArkers", "artnet_tc_always_send")
      local fz = reaper.GetExtState("MArkers", "artnet_tc_stream_id")
      local e5 = e3("MArkers") or ""
      local fA = table.concat({
        e4,
        e6,
        fx,
        fy,
        fz,
        e5
      }, "|")
      if fA ~= dZ then
        dZ = fA
        if e5 and "" ~= e5 then
          do
            local fw = d_("MArkers", "artnet_tc_always_send") or false
            local dJ = e1("MArkers", "artnet_tc_stream_id", 0)
            pcall(function()
              e7()
            end)
            pcall(function()
              e8({
                a74faa94 = e5,
                a4151b75 = fw,
                ac02463f = dJ
              })
            end)
          end
        end
      end
    end
  end
  reaper.defer(fs)
end

local function fB(...)
  local fC = select(1, ...)
  local fD = "markers_server_gui_instance"
  local fE = "markers_server_gui_timestamp"
  local fF = "markers_server_gui_close_request"
  local fG = 2.0
  local fH = reaper.GetExtState(fC.a11a2802, fD)
  local fI = tonumber(reaper.GetExtState(fC.a11a2802, fE)) or 0
  local fJ = reaper.time_precise()
  if fH == "running" and fG > fJ - fI then
    reaper.SetExtState(fC.a11a2802, fF, "true", false)
    local fK = reaper.time_precise() + 0.5
    while fK > reaper.time_precise() do
    end
  end
  reaper.SetExtState(fC.a11a2802, fD, "running", false)
  reaper.SetExtState(fC.a11a2802, fE, tostring(fJ), false)
  reaper.SetExtState(fC.a11a2802, fF, "false", false)
  if not reaper.ImGui_CreateContext then
    reaper.ShowMessageBox([==[ReaImGui extension is required for this script.

]==] .. [==[Please install it via Extensions > ReaPack > Browse packages
]==] .. "Search for 'ReaImGui' and install it.", "Missing Dependency", 0)
    return {
      a026867c = function()
      end
    }
  end
  local fL = reaper.ImGui_CreateContext("MArkers Server")
  local fM = {}
  for cd, ct in pairs(reaper) do
    if cd:match("^ImGui_") then
      fM[cd:sub(7)] = ct
    end
  end
  pcall(function()
    if fM.GetConfigFlags and fM.SetConfigFlags and fM.ConfigFlags_DockingEnable then
      local fN = fM.GetConfigFlags(fL)
      fM.SetConfigFlags(fL, fN | fM.ConfigFlags_DockingEnable())
    end
  end)
  local fO = {
    aabe2af8 = false,
    ac2b18bf = false,
    a86415ff = "broadcast",
    a9836f49 = "Default",
    adcce5ee = "",
    ac40ae41 = "0",
    aaee3ce7 = nil,
    a1da8cc5 = nil,
    acc2f997 = false,
    a10eb0f1 = nil,
    a90a0464 = false,
    a9a14a3f = nil,
    a26a942b = nil,
    a6a42225 = false,
    a9e8acd2 = false,
    a8e576e2 = false,
    a2b23303 = false,
    a1f8ea33 = nil
  }
  
  local function fP()
    local fu = reaper.GetExtState(fC.a11a2802, "artnet_tc_enabled")
    fO.aabe2af8 = fu == "true"
    local fQ = reaper.GetExtState(fC.a11a2802, "artnet_tc_always_send")
    fO.ac2b18bf = fQ == "true"
    local fR = reaper.GetExtState(fC.a11a2802, "artnet_mode")
    if "" ~= fR then
      fO.a86415ff = fR
    end
    local fS = reaper.GetExtState(fC.a11a2802, "artnet_iface")
    if "" ~= fS then
      fO.a9836f49 = fS
    end
    local fT = reaper.GetExtState(fC.a11a2802, "artnet_unicast_ip")
    if "" ~= fT then
      fO.adcce5ee = fT
    end
    local fU = reaper.GetExtState(fC.a11a2802, "artnet_tc_stream_id")
    if "" ~= fU then
      fO.ac40ae41 = fU
    end
    local fV = reaper.GetExtState(fC.a11a2802, "AutoSync")
    fO.a9e8acd2 = fV == "true"
  end
  
  local function fW()
    local fX = reaper.GetExtState(fC.a11a2802, "gui_open_state")
    if "" == fX then
      return true
    end
    return fX == "true"
  end
  
  fP()
  
  local function fY(e5)
    local da, db, a3, dT = e5:match("^(%d+)%.(%d+)%.(%d+)%.(%d+)$")
    da, db, a3, dT = tonumber(da), tonumber(db), tonumber(a3), tonumber(dT)
    if not (da and db and a3) or not dT then
      return nil
    end
    if da > 255 or db > 255 or a3 > 255 or dT > 255 then
      return nil
    end
    return ((da * 256 + db) * 256 + a3) * 256 + dT
  end
  
  local function fZ(M)
    if not M then
      return nil
    end
    M = math.floor(M)
    if M < 0 then
      M = 0
    end
    local da = math.floor(M / 16777216) % 256
    local db = math.floor(M / 65536) % 256
    local a3 = math.floor(M / 256) % 256
    local dT = M % 256
    return string.format("%d.%d.%d.%d", da, db, a3, dT)
  end
  
  local function f_(g0)
    g0 = tonumber(g0)
    if not g0 or g0 < 0 or g0 > 32 then
      return nil
    end
    if 0 == g0 then
      return 0
    end
    return 4294967295 - (2 ^ (32 - g0) - 1)
  end
  
  local function g1(g2)
    return fY(g2)
  end
  
  local function g3(g4)
    if not g4 or "" == g4 then
      return nil
    end
    g4 = g4:gsub("^0x", "")
    if 8 ~= #g4 then
      return nil
    end
    local M = tonumber(g4, 16)
    return fZ(M)
  end
  
  local function g5(e5, g6, g0)
    local g7 = e5 and fY(e5)
    if not g7 then
      return nil
    end
    local g8
    if g6 and "" ~= g6 then
      g8 = g1(g6)
    elseif nil ~= g0 then
      g8 = f_(g0)
    end
    if not g8 then
      return nil
    end
    local g9 = 4294967295 - g8
    local ga = g7 + g9 - g7 % (g9 + 1)
    return fZ(ga)
  end
  
  local function gb()
    local e = {}
    local os = reaper.GetOS() or ""
    
    local function gc()
      local e0 = fC and fC.a11a2802 or "MArkers"
      local gd, P = pcall(function()
        return reaper.GetExtState(e0, "debug_netif")
      end)
      if not gd then
        return false
      end
      P = tostring(P or "")
      return "1" == P or P:lower() == "true" or P:lower() == "yes"
    end
    
    local function ge(gf)
      if not gc() then
        return
      end
      reaper.ShowConsoleMsg("[MArkersServer][netif] " .. tostring(gf) .. [==[
]==])
    end
    
    local gg = reaper.time_precise()
    
    local function gh(gi)
      ge("cmd=" .. gi)
      local gj = reaper.time_precise()
      local gk = ""
      local gl, gm, gn = false
      local go = false
      if gi:find("2>&1", 1, true) or gi:find("2>/", 1, true) or gi:find("2>", 1, true) then
        go = true
      end
      local gp = false
      if gi:match("^%s*[Cc][Mm][Dd]%.?[Ee]?[Xx]?[Ee]?%s*/[Cc]") then
        gp = true
      end
      local gq = false
      if not go then
        gq = true
      elseif os:match("Win") and gp then
        gq = true
      end
      if reaper.ExecProcess and gq then
        gl, gm, gn = pcall(function()
          return reaper.ExecProcess(gi, 15000)
        end)
      end
      if gl then
        gk = tostring(gm or "")
      else
        local aF = io.popen(gi)
        if not aF then
          ge("cmd failed to start")
          return "", 0.0, false
        end
        gk = aF:read("*all") or ""
        aF:close()
      end
      local gr = reaper.time_precise()
      if gl then
        ge(string.format("cmd done in %.3fs, bytes=%d, exec_rc=%s", gr - gj, #gk, tostring(gn)))
      else
        ge(string.format("cmd done in %.3fs, bytes=%d", gr - gj, #gk))
      end
      return gk, gr - gj, true
    end
    
    local gi
    local gk = ""
    if os:match("OSX") or os:match("mac") then
      gi = "/sbin/ifconfig -l"
      gk = select(1, gh(gi))
    elseif os:match("Linux") then
      gi = [==[sh -lc 'ip -o link show 2>/dev/null | awk -F": " "{print $2}"']==]
      gk = select(1, gh(gi))
    end
    if os:match("OSX") or os:match("mac") then
      for e6 in gk:gmatch("%S+") do
        if e6 ~= "lo0" then
          local e5
          local gs = io.popen("/usr/sbin/ipconfig getifaddr " .. e6 .. " 2>/dev/null")
          if gs then
            e5 = string.gsub(gs:read("*l") or "", "%s+", "")
            gs:close()
          end
          if e5 and "" ~= e5 then
            local g2, g0, gt
            local gu = io.popen("/sbin/ifconfig " .. e6 .. " 2>/dev/null")
            if gu then
              local gv = gu:read("*all") or ""
              gu:close()
              local gw = gv:match("netmask%s+(0x%x+)")
              g2 = g3(gw)
              gt = gv:match("broadcast%s+([0-9]+%.[0-9]+%.[0-9]+%.[0-9]+)")
            end
            gt = gt or g5(e5, g2, g0)
            local gx = string.format("%s (%s)", e6, e5)
            if g2 and "" ~= g2 then
              gx = string.format("%s (%s / %s)", e6, e5, g2)
            end
            e[#e + 1] = {
              label = gx,
              value = e6,
              ip = e5,
              mask = g2,
              prefix = g0,
              broadcast = gt
            }
          end
        end
      end
    elseif os:match("Linux") then
      local gy = {}
      local gz = {}
      local gA = {}
      local gs = io.popen("sh -lc 'ip -4 -o addr show 2>/dev/null'")
      if gs then
        do
          local gB = gs:read("*all") or ""
          gs:close()
          for dz in gB:gmatch([==[[^\r
]+]==]) do
            local e6, e5, gC = dz:match("^%d+:%s+([^%s]+)%s+inet%s+([0-9]+%.[0-9]+%.[0-9]+%.[0-9]+)/(%d+)")
            local gD = dz:match("%sbrd%s+([0-9]+%.[0-9]+%.[0-9]+%.[0-9]+)")
            if e6 and e5 and not gy[e6] then
              gy[e6] = e5
              gz[e6] = tonumber(gC)
              gA[e6] = gD
            end
          end
        end
      end
      for cd in gk:gmatch("%S+") do
        if cd ~= "lo" and cd ~= "lo0" then
          local e5 = gy[cd]
          if e5 and "" ~= e5 then
            local g0 = gz[cd]
            local gt = gA[cd] or g5(e5, nil, g0)
            local gx = string.format("%s (%s)", cd, e5)
            if g0 then
              gx = string.format("%s (%s / %d)", cd, e5, g0)
            end
            e[#e + 1] = {
              label = gx,
              value = cd,
              ip = e5,
              prefix = g0,
              mask = nil,
              broadcast = gt
            }
          end
        end
      end
    elseif os:match("Win") then
      do
        local gE = reaper.time_precise()
        
        local function gF(e5)
          return e5 and "" ~= e5 and nil ~= fY(e5)
        end
        
        local function gG(g2)
          local x = g2 and fY(g2)
          if not x then
            return false
          end
          if 0 == x or 4294967295 == x then
            return true
          end
          return 4294967295 == x | x - 1
        end
        
        local function gH(cd, e5, g2, g0)
          if not cd or "" == cd or not gF(e5) then
            return
          end
          if e5 == "127.0.0.1" then
            return
          end
          if e5:match("^169%.254%.") then
            return
          end
          local gt = g5(e5, g2, g0)
          local gx = string.format("%s (%s)", cd, e5)
          if g2 and "" ~= g2 then
            gx = string.format("%s (%s / %s)", cd, e5, g2)
          elseif nil ~= g0 then
            gx = string.format("%s (%s / %d)", cd, e5, g0)
          end
          e[#e + 1] = {
            label = gx,
            value = cd,
            ip = e5,
            mask = g2,
            prefix = g0,
            broadcast = gt
          }
        end
        
        do
          local gI = select(1, gh('cmd /C powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "Get-NetIPAddress -AddressFamily IPv4 | Select-Object InterfaceAlias,IPAddress,PrefixLength | ConvertTo-Csv -NoTypeInformation" 2>&1'))
          for dz in gI:gmatch([==[[^\r
]+]==]) do
            if not dz:match([==[^%s*\"InterfaceAlias\"]==]) then
              local da, e5, gC = dz:match('^%s*"(.-)","(.-)","(.-)"%s*$')
              if da and e5 then
                local g0 = tonumber(gC)
                gH(da, e5, nil, g0)
              end
            end
          end
          ge(string.format("powershell parse: res=%d", #e))
        end
        if 0 == #e then
          do
            local gJ = select(1, gh("cmd /C ipconfig 2>&1"))
            local gK = {}
            local gL
            
            local function gM()
              if gL and gL.name and gL.name ~= "" then
                gK[#gK + 1] = gL
              end
            end
            
            for dz in gJ:gmatch([==[[^\r
]+]==]) do
              local gN = dz:match("^%S.*:%s*$")
              if gN then
                gM()
                local cd = gN:gsub("%s*:%s*$", "")
                gL = {
                  name = cd,
                  ips = {},
                  masks = {}
                }
              elseif gL then
                for e5 in dz:gmatch("([0-9]+%.[0-9]+%.[0-9]+%.[0-9]+)") do
                  if gG(e5) then
                    gL.masks[#gL.masks + 1] = e5
                  elseif gF(e5) then
                    gL.ips[#gL.ips + 1] = e5
                  end
                end
              end
            end
            gM()
            for c0, da in ipairs(gK) do
              local e5
              for c0, gO in ipairs(da.ips or {}) do
                if gO ~= "127.0.0.1" and not gO:match("^169%.254%.") then
                  e5 = gO
                  break
                end
              end
              local g2
              for c0, gP in ipairs(da.masks or {}) do
                if gG(gP) then
                  g2 = gP
                  break
                end
              end
              if g2 then
                gH(da.name, e5, g2, nil)
              end
            end
            ge(string.format("ipconfig parse: adapters=%d, res=%d", #gK, #e))
          end
        end
        if 0 == #e then
          local function gQ(dz)
            local gR = {}
            
            local Q = 1
            local M = #dz
            while Q <= M do
              local gS = dz:sub(Q, Q)
              if gS == "," then
                gR[#gR + 1] = ""
                Q = Q + 1
              elseif gS == '"' then
                Q = Q + 1
                local gT = {}
                while M >= Q do
                  local a3 = dz:sub(Q, Q)
                  if a3 == '"' then
                    if dz:sub(Q + 1, Q + 1) == '"' then
                      gT[#gT + 1] = '"'
                      Q = Q + 2
                    else
                      Q = Q + 1
                      break
                    end
                  else
                    gT[#gT + 1] = a3
                    Q = Q + 1
                  end
                end
                gR[#gR + 1] = table.concat(gT)
                if dz:sub(Q, Q) == "," then
                  Q = Q + 1
                end
              else
                local a5 = Q
                while M >= a5 and dz:sub(a5, a5) ~= "," do
                  a5 = a5 + 1
                end
                gR[#gR + 1] = dz:sub(Q, a5 - 1)
                Q = a5
                if dz:sub(Q, Q) == "," then
                  Q = Q + 1
                end
              end
            end
            return gR
          end
          
          local gI = select(1, gh("cmd /C wmic nicconfig where (IPEnabled=TRUE) get Description,IPAddress,IPSubnet /format:csv 2>&1"))
          for dz in gI:gmatch([==[[^\r
]+]==]) do
            local gU = dz or ""
            gU = string.gsub(gU, "^%s+", "")
            gU = string.gsub(gU, "%s+$", "")
            if "" ~= gU and not gU:match("^[Nn][Oo][Dd][Ee]%s*,") then
              local aF = gQ(gU)
              local gV = aF[2]
              local gW = aF[3]
              local gX = aF[4]
              if gV and gW and gX then
                gV = string.gsub(gV, "^%s+", "")
                gV = string.gsub(gV, "%s+$", "")
                gW = tostring(gW or "")
                gX = tostring(gX or "")
                local e5 = gW:match("([0-9]+%.[0-9]+%.[0-9]+%.[0-9]+)")
                local g2 = gX:match("([0-9]+%.[0-9]+%.[0-9]+%.[0-9]+)")
                if not g2 then
                  local gC = gX:match("(%d+)")
                  local g0 = tonumber(gC)
                  if g0 then
                    local g8 = f_(g0)
                    g2 = fZ(g8)
                  end
                end
                gH(gV, e5, g2, nil)
              end
            end
          end
          ge(string.format("wmic parse: res=%d", #e))
          if 0 == #e and gI and "" ~= gI then
            local a4 = tostring(gI)
            if #a4 > 800 then
              a4 = a4:sub(1, 800) .. "..."
            end
            a4 = string.gsub(a4, [==[\r]==], [==[\\r]==])
            a4 = string.gsub(a4, [==[
]==], [==[\
]==])
            ge("wmic raw (trunc): " .. a4)
          end
        end
        local gY = reaper.time_precise()
        ge(string.format("win netif total %.3fs, res=%d", gY - gg, #e))
      end
    end
    do
      local gZ = {
        label = "Loopback (127.0.0.1 / 255.0.0.0)",
        value = "__loopback__",
        ip = "127.0.0.1",
        mask = "255.0.0.0",
        prefix = 8,
        broadcast = "127.255.255.255"
      }
      local g_ = false
      for c0, h0 in ipairs(e) do
        if h0.value == gZ.value then
          g_ = true
          break
        end
      end
      if not g_ then
        table.insert(e, 1, gZ)
      end
    end
    return e
  end
  
  local function h1(h2)
    local ec = reaper.time_precise()
    if not (not h2 and fO.a9a14a3f and fO.a26a942b) or ec - fO.a26a942b > 30.0 then
      fO.a9a14a3f = gb()
      fO.a26a942b = ec
    end
    return fO.a9a14a3f
  end
  
  local function h3()
    local h4, h5 = fM.Viewport_GetCenter(fM.GetWindowViewport(fL))
    fM.SetNextWindowPos(fL, h4, h5, fM.Cond_Appearing(), 0.5, 0.5)
    fM.SetNextWindowSize(fL, 450, 0, fM.Cond_Always())
    local h6, h7 = fM.BeginPopupModal(fL, "ArtNet Configuration", true)
    if h6 then
      fM.Text(fL, "Mode:")
      fM.SameLine(fL)
      local h8, h9 = fM.Combo(fL, "##mode", fO.a86415ff == "unicast" and 1 or 0, "Broadcast" .. string.char(0) .. "Unicast" .. string.char(0))
      if h8 then
        fO.a86415ff = 1 == h9 and "unicast" or "broadcast"
        reaper.SetExtState(fC.a11a2802, "artnet_mode", fO.a86415ff, true)
        fO.a90a0464 = false
      end
      fM.Spacing(fL)
      if fO.a86415ff == "broadcast" then
        local ha = h1(false)
        local hb = 0
        local hc = {}
        for Q, hd in ipairs(ha) do
          table.insert(hc, hd.label)
          if hd.value == fO.a9836f49 then
            hb = Q - 1
          end
        end
        local he = table.concat(hc, string.char(0)) .. string.char(0)
        fM.Text(fL, "Interface:")
        fM.SameLine(fL)
        fM.SetNextItemWidth(fL, -1)
        local hf, hg = fM.Combo(fL, "##interface", hb, he)
        if hf then
          local c_ = ha[hg + 1]
          if c_ then
            fO.a9836f49 = c_.value
            reaper.SetExtState(fC.a11a2802, "artnet_iface", fO.a9836f49, true)
            reaper.SetExtState(fC.a11a2802, "artnet_iface_ip", c_.ip or "", true)
            reaper.SetExtState(fC.a11a2802, "artnet_iface_mask", c_.mask or "", true)
            reaper.SetExtState(fC.a11a2802, "artnet_iface_prefix", c_.prefix or "", true)
            reaper.SetExtState(fC.a11a2802, "artnet_iface_broadcast", c_.broadcast or "", true)
            fO.a90a0464 = false
          end
        end
      else
        fM.Text(fL, "Unicast IP:")
        fM.SameLine(fL)
        fM.SetNextItemWidth(fL, -1)
        local hh, hi = fM.InputText(fL, "##unicast_ip", fO.adcce5ee)
        if hh then
          fO.adcce5ee = hi
          reaper.SetExtState(fC.a11a2802, "artnet_unicast_ip", fO.adcce5ee, true)
        end
      end
      fM.Spacing(fL)
      fM.Text(fL, "Stream ID:")
      fM.SameLine(fL)
      fM.SetNextItemWidth(fL, -1)
      local hj, hk = fM.InputText(fL, "##stream_id", fO.ac40ae41, fM.InputTextFlags_CharsDecimal())
      if hj then
        local M = tonumber(hk) or 0
        if M < 0 then
          M = 0
        end
        if M > 255 then
          M = 255
        end
        fO.ac40ae41 = tostring(math.floor(M))
        reaper.SetExtState(fC.a11a2802, "artnet_tc_stream_id", fO.ac40ae41, true)
      end
      fM.Spacing(fL)
      local hl, hm = fM.Checkbox(fL, "Send whilst paused", fO.ac2b18bf)
      if hl then
        fO.ac2b18bf = hm
        reaper.SetExtState(fC.a11a2802, "artnet_tc_always_send", tostring(fO.ac2b18bf), true)
      end
      fM.Spacing(fL)
      fM.Separator(fL)
      fM.Spacing(fL)
      if fM.Button(fL, "Close", 120, 0) then
        fO.a6a42225 = false
        fM.CloseCurrentPopup(fL)
      end
      fM.EndPopup(fL)
    end
    if not h7 then
      fO.a6a42225 = false
    end
  end
  
  local function hn()
    local h4, h5 = fM.Viewport_GetCenter(fM.GetWindowViewport(fL))
    fM.SetNextWindowPos(fL, h4, h5, fM.Cond_Appearing(), 0.5, 0.5)
    fM.SetNextWindowSize(fL, 450, 250, fM.Cond_Appearing())
    local h6, h7 = fM.BeginPopupModal(fL, "Project File Sync", true)
    if h6 then
      fM.TextWrapped(fL, "This feature is useful when multiple people are working on the same Reaper file. As soon as another user saves the project, MArkersServer will detect the file saved to disk has changed and force re-open the file for you. This will work when files are saved on cloud services like Dropbox, but for the fastest possible sync in a local enviroment, please use LAN file sharing or a NAS.")
      fM.Spacing(fL)
      fM.Separator(fL)
      fM.Spacing(fL)
      if fM.Button(fL, "Close", 120, 0) then
        fO.a8e576e2 = false
        fM.CloseCurrentPopup(fL)
      end
      fM.EndPopup(fL)
    end
    if not h7 then
      fO.a8e576e2 = false
    end
  end
  
  local function ho(gx, hp)
    local hq = 50
    local hr = 24
    local hs, ht = fM.GetCursorScreenPos(fL)
    local hu = fM.GetWindowDrawList(fL)
    local hv = 3425907711
    local hw = 869020671
    local hx = 4294967295
    local hy = hp and hw or hv
    local hz = hp and hq - hr or 0
    fM.DrawList_AddRectFilled(hu, hs, ht, hs + hq, ht + hr, hy, hr / 2)
    local hA = hr / 2 - 1
    local hB = hs + hz + hr / 2
    local hC = ht + hr / 2
    fM.DrawList_AddCircleFilled(hu, hB, hC, hA, hx)
    fM.SetCursorScreenPos(fL, hs, ht)
    fM.InvisibleButton(fL, gx, hq, hr)
    local hD = fM.IsItemClicked(fL)
    return hD, hp
  end
  
  local function hE()
    local fu = reaper.GetExtState(fC.a11a2802, "artnet_tc_enabled")
    local hF = fu == "true"
    if hF ~= fO.aabe2af8 then
      fO.aabe2af8 = hF
    end
    local fV = reaper.GetExtState(fC.a11a2802, "AutoSync")
    local hG = fV == "true"
    if hG ~= fO.a9e8acd2 then
      fO.a9e8acd2 = hG
    end
  end
  
  local function hH()
    if fO.a2b23303 then
      return
    end
    local hI = reaper.GetExtState(fC.a11a2802, fF)
    if hI == "true" then
      reaper.SetExtState(fC.a11a2802, fD, "", false)
      return
    end
    reaper.SetExtState(fC.a11a2802, fE, tostring(reaper.time_precise()), false)
    hE()
    fM.PushStyleVar(fL, fM.StyleVar_WindowRounding(), 8)
    fM.PushStyleVar(fL, fM.StyleVar_FrameRounding(), 6)
    fM.PushStyleVar(fL, fM.StyleVar_GrabRounding(), 6)
    fM.PushStyleVar(fL, fM.StyleVar_ChildRounding(), 6)
    fM.PushStyleVar(fL, fM.StyleVar_WindowPadding(), 10, 8)
    fM.PushStyleVar(fL, fM.StyleVar_FramePadding(), 6, 4)
    fM.PushStyleVar(fL, fM.StyleVar_ItemSpacing(), 6, 6)
    fM.PushStyleColor(fL, fM.Col_WindowBg(), 522134015)
    fM.PushStyleColor(fL, fM.Col_TitleBg(), 640035583)
    fM.PushStyleColor(fL, fM.Col_TitleBgActive(), 640035583)
    fM.PushStyleColor(fL, fM.Col_Button(), 774779903)
    fM.PushStyleColor(fL, fM.Col_ButtonHovered(), 4285202687)
    fM.PushStyleColor(fL, fM.Col_ButtonActive(), 4286906623)
    fM.PushStyleColor(fL, fM.Col_FrameBg(), 774779903)
    fM.PushStyleColor(fL, fM.Col_FrameBgHovered(), 943210495)
    fM.PushStyleColor(fL, fM.Col_FrameBgActive(), 1111640831)
    fM.PushStyleColor(fL, fM.Col_CheckMark(), 869020671)
    fM.PushStyleColor(fL, fM.Col_Header(), 774779903)
    fM.PushStyleColor(fL, fM.Col_HeaderHovered(), 943210495)
    fM.PushStyleColor(fL, fM.Col_HeaderActive(), 1111640831)
    fM.PushStyleColor(fL, fM.Col_Separator(), 1027423743)
    fM.PushStyleColor(fL, fM.Col_Text(), 3772834047)
    fM.SetNextWindowSize(fL, 550, 350, fM.Cond_FirstUseEver())
    local h6, h7 = fM.Begin(fL, "MArkers Server", true)
    if not h6 then
      fO.a1f8ea33 = nil
    end
    if h6 then
      fM.PushStyleColor(fL, fM.Col_ChildBg(), 640035583)
      local hJ = pcall(function()
        if fM.BeginChild(fL, "header", 0, 52) then
          if not fO.a1f8ea33 then
            do
              local hK = reaper.GetResourcePath() .. "/Scripts/MArkers/img/small_icon_matools.png"
              if reaper.file_exists(hK) then
                local hL, hM = pcall(function()
                  return fM.CreateImage(fL, hK)
                end)
                if hL and hM then
                  fO.a1f8ea33 = hM
                else
                  local hN, hO = pcall(function()
                    return fM.CreateImage(hK)
                  end)
                  if hN and hO then
                    fO.a1f8ea33 = hO
                  else
                    fO.a1f8ea33 = nil
                  end
                end
              end
            end
          end
          do
            local hP = 32
            local hQ = 10
            local hR = fM.GetWindowWidth(fL)
            if fO.a1f8ea33 and hR and hP < hR then
              local gd, hS = pcall(function()
                return fM.ValidatePtr(fO.a1f8ea33, "ImGui_Image*")
              end)
              if gd and hS then
                fM.SetCursorPos(fL, hQ, 10)
                local hT = pcall(function()
                  fM.Image(fL, fO.a1f8ea33, hP, hP)
                end)
                if not hT then
                  fO.a1f8ea33 = nil
                else
                  hQ = hQ + hP + 10
                end
              else
                fO.a1f8ea33 = nil
              end
            end
            local hU = 52
            local hV = fM.GetTextLineHeight(fL)
            if hV and hV > 0 then
              local hW = math.floor((hU - hV) * 0.5)
              fM.SetCursorPos(fL, hQ, hW)
              fM.PushStyleColor(fL, fM.Col_Text(), 4294967295)
              fM.Text(fL, "MArkers Server")
              fM.PopStyleColor(fL)
            end
            local hX = fC.a3f8003f or "v2.1.0.0"
            local aP = fC.a73a1a2c or "29882"
            local hY = "Port " .. aP
            local hZ = select(1, fM.CalcTextSize(fL, hX))
            local h_ = select(1, fM.CalcTextSize(fL, hY))
            local hR = fM.GetWindowWidth(fL)
            local i0 = fM.GetTextLineHeight(fL)
            if hZ and h_ and hR and i0 and hZ > 0 and h_ > 0 and hR > 0 and i0 > 0 then
              local i1 = math.max(hZ, h_)
              local i2 = 10
              local i3 = hR - i2 - i1
              local i4 = 10
              if i3 >= 0 then
                fM.SetCursorPos(fL, i3 + i1 - hZ, i4)
                fM.Text(fL, hX)
                fM.SetCursorPos(fL, i3 + i1 - h_, i4 + i0)
                fM.Text(fL, hY)
              end
            end
            fM.EndChild(fL)
          end
        end
      end)
      fM.PopStyleColor(fL)
      fM.Spacing(fL)
      fM.PushStyleColor(fL, fM.Col_Text(), 4294967295)
      fM.Text(fL, "ArtNet Timecode")
      fM.PopStyleColor(fL)
      fM.Spacing(fL)
      fM.AlignTextToFramePadding(fL)
      fM.Text(fL, "Enabled:")
      fM.SameLine(fL)
      local i5 = fM.GetWindowWidth(fL)
      if i5 and i5 > 70 then
        fM.SetCursorPosX(fL, i5 - 70)
      end
      local i6 = ho("##artnet_toggle", fO.aabe2af8)
      if i6 then
        fO.aabe2af8 = not fO.aabe2af8
        reaper.SetExtState(fC.a11a2802, "artnet_tc_enabled", tostring(fO.aabe2af8), true)
      end
      fM.Spacing(fL)
      fM.Spacing(fL)
      fM.PushStyleColor(fL, fM.Col_Button(), 1027423743)
      fM.PushStyleColor(fL, fM.Col_ButtonHovered(), 1296911871)
      fM.PushStyleColor(fL, fM.Col_ButtonActive(), 1566399999)
      if fM.Button(fL, "Configure", -1, 35) then
        fO.a6a42225 = true
        fM.OpenPopup(fL, "ArtNet Configuration")
      end
      fM.PopStyleColor(fL, 3)
      fM.Spacing(fL)
      fM.PushStyleColor(fL, fM.Col_Text(), 4294967295)
      fM.Text(fL, "Project File Sync")
      fM.PopStyleColor(fL)
      fM.Spacing(fL)
      fM.AlignTextToFramePadding(fL)
      fM.Text(fL, "Enable:")
      fM.SameLine(fL)
      local i5 = fM.GetWindowWidth(fL)
      if i5 and i5 > 160 then
        fM.SetCursorPosX(fL, i5 - 160)
      end
      fM.PushStyleColor(fL, fM.Col_Button(), 1027423743)
      fM.PushStyleColor(fL, fM.Col_ButtonHovered(), 1296911871)
      fM.PushStyleColor(fL, fM.Col_ButtonActive(), 1566399999)
      if fM.Button(fL, "Info", 80, 0) then
        fO.a8e576e2 = true
        fM.OpenPopup(fL, "Project File Sync")
      end
      fM.PopStyleColor(fL, 3)
      fM.SameLine(fL)
      local i7 = ho("##sync_toggle", fO.a9e8acd2)
      if i7 then
        fO.a9e8acd2 = not fO.a9e8acd2
        reaper.SetExtState(fC.a11a2802, "AutoSync", tostring(fO.a9e8acd2), true)
      end
      h3()
      hn()
      fM.End(fL)
    end
    fM.PopStyleColor(fL, 15)
    fM.PopStyleVar(fL, 7)
    if h7 then
      reaper.defer(hH)
    else
      reaper.SetExtState(fC.a11a2802, "gui_open_state", "false", true)
      reaper.SetExtState(fC.a11a2802, fD, "", false)
      if fM.DestroyContext then
        pcall(function()
          fM.DestroyContext(fL)
        end)
      end
    end
  end
  
  local function i8()
    if fW() then
      reaper.SetExtState(fC.a11a2802, "gui_open_state", "true", true)
      hH()
    end
  end
  
  return {a026867c = i8}
end

fB = fB(l)

local function i9()
  local ia = reaper.GetExtState("MArkers", "server_running")
  if ia == "true" then
    fB.a026867c()
    return
  end
  reaper.ClearConsole()
  local ib, aR = aw()
  if not ib then
    reaper.ShowMessageBox(aR, i, 0)
    return
  end
  aC(true, false)
  local ic = reaper.GetExtState("MArkers", "AutoSync")
  if ic ~= "true" and ic ~= "false" then
    reaper.SetExtState("MArkers", "AutoSync", "false", 1)
  end
  reaper.SetExtState("MArkers", "Version", h, 0)
  f2()
  eC()
  reaper.SetExtState("MArkers", "server_running", "true", false)
  fB.a026867c()
  fs()
end

return i9()
