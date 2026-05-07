local a = {}
local b = {}

local function c(d)
  if b[d] then
    return b[d]
  end
  local e = string.gsub(d, "..", function(f)
    local g = tonumber(f, 16) - 13
    if g < 0 then
      g = g + 256
    end
    return string.char(g)
  end)
  b[d] = e
  return e
end

local h = {}
h[1] = {}
local i = h[1]
h[2] = {}
local j = h[2]
h[3] = {}
local k = h[3]
h[4] = {}
local l = h[4]
h[5] = {}
local m = h[5]
h[6] = {}
local n = h[6]
h[7] = {}
local o = h[7]
h[8] = {}
local p = h[8]
h[9] = {}
local q = h[9]
h[10] = {}
local r = h[10]
h[13] = {}
local s = h[13]
local t = select(1, ...)
local u = select(2, ...)
local v = select(3, ...)
local w = select(4, ...)
local x = GetPathSeparator()
local y = {}
y.plugin_name = "MArkersLIVE"
y.plugin_label = "MArkersLIVE"
y.company_name = "MATools"
y.company_label = "MATools"
y.plugin_version = "2.3.7.0"
y.min_compat_ver = "2.2.0.0"
y.plugins_path = string.format("grandMA3%sgma3_library%sdatapools%splugins", x, x, x)
y.g_running = false
y.g_first_run = true
y.g_str_false = "false"
y.g_t1 = {}
y.g_progress = {}
y.g_plugin_var_obj = nil
y.g_unset_a = nil
y.g_full_label = string.format("%s - %s", y.company_name, y.plugin_label)
y.g_unset_b = nil
y.g_arg4 = w
y.g_arg3 = v
y.g_h_tables = h
local z

local function A(...)
  local function B(C, D)
    local E = {}
    
    E[1] = Obj.Acquire(C, "UILayoutGrid")
    E[1]["PluginComponent"] = D
    E[1]["Name"] = "CustomValueFadeControl"
    E[1]["Rows"] = "1"
    E[1]["Columns"] = "5"
    E[1]["DefaultMargin"] = "0"
    E[1][2][1]["SizePolicy"] = "Stretch"
    E[1][2][1]["Size"] = "0.3"
    E[1][2][2]["SizePolicy"] = "Fixed"
    E[1][2][2]["Size"] = "2"
    E[1][2][3]["SizePolicy"] = "Stretch"
    E[1][2][3]["Size"] = "0.4"
    E[1][2][4]["SizePolicy"] = "Fixed"
    E[1][2][4]["Size"] = "2"
    E[1][2][5]["SizePolicy"] = "Stretch"
    E[1][2][5]["Size"] = "0.3"
    E[2] = Obj.Acquire(E[1], "Button")
    E[2]["PluginComponent"] = D
    E[2]["Anchors"] = "0,0"
    E[2]["Name"] = "ValueFade_Minus"
    E[2]["Text"] = "-"
    E[3] = Obj.Acquire(E[1], "UIObject")
    E[3]["PluginComponent"] = D
    E[3]["Anchors"] = "1,0"
    E[4] = Obj.Acquire(E[1], "UIObject")
    E[4]["PluginComponent"] = D
    E[4]["Anchors"] = "1,0"
    E[4]["BackColor"] = "ValueFadeControl.NumericTextActive"
    E[4]["H"] = "80%"
    E[4]["AlignmentV"] = "Center"
    E[5] = Obj.Acquire(E[1], "Button")
    E[5]["PluginComponent"] = D
    E[5]["Anchors"] = "2,0"
    E[5]["Name"] = "ValueFade_Button"
    E[6] = Obj.Acquire(E[1], "UIObject")
    E[6]["PluginComponent"] = D
    E[6]["Anchors"] = "2,0"
    E[6]["Name"] = "ValueFade_Label"
    E[6]["BackColor"] = "Global.Transparent"
    E[6]["Text"] = "Label"
    E[6]["HasHover"] = "No"
    E[6]["Interactive"] = "No"
    E[6]["H"] = "50%"
    E[6]["AlignmentV"] = "Top"
    E[6]["Font"] = "Regular14"
    E[6]["TextColor"] = "ValueFadeControl.LabelInactive"
    E[7] = Obj.Acquire(E[1], "UIObject")
    E[7]["PluginComponent"] = D
    E[7]["Anchors"] = "2,0"
    E[7]["Name"] = "ValueFade_Value"
    E[7]["BackColor"] = "Global.Transparent"
    E[7]["Text"] = "Value"
    E[7]["HasHover"] = "No"
    E[7]["Interactive"] = "No"
    E[7]["H"] = "60%"
    E[7]["AlignmentV"] = "Bottom"
    E[8] = Obj.Acquire(E[1], "UIObject")
    E[8]["PluginComponent"] = D
    E[8]["Anchors"] = "3,0"
    E[9] = Obj.Acquire(E[1], "UIObject")
    E[9]["PluginComponent"] = D
    E[9]["Anchors"] = "3,0"
    E[9]["BackColor"] = "ValueFadeControl.NumericTextActive"
    E[9]["H"] = "80%"
    E[9]["AlignmentV"] = "Center"
    E[10] = Obj.Acquire(E[1], "Button")
    E[10]["PluginComponent"] = D
    E[10]["Anchors"] = "4,0"
    E[10]["Name"] = "ValueFade_Plus"
    E[10]["Text"] = "+"
    local F = E[1]
    E = nil
    return F
  end
  
  local A = {}
  local y = select(1, ...)
  local G = "V1.0.0.0"
  local H = "V1.6.3.7"
  local x = GetPathSeparator()
  
  local function I(...)
    local A = select(1, ...)
    local y = select(2, nil)
    local I = {}
    return I
  end
  
  I = I(A, y)
  A.aa4b264c = I
  local J = load("\027LuaT\000\025\147\r\n\026\n\004\b\bxV\000\000\000\000\000\000\000\000\000\000\000(w@\001\169MATools/requirements/bitwise/bitwise.lua\128\128\000\001\002\145Q\000\000\000\019\000\000\000R\000\000\000\207\000\000\000\018\000\000\001\207\128\000\000\018\000\001\001\207\000\001\000\018\000\002\001\207\128\001\000\018\000\003\001\207\000\002\000\018\000\004\001\207\128\002\000\018\000\005\001F\000\002\001\198\000\001\001\134\004\130a\004\130b\004\130c\004\130d\004\130e\004\130f\129\001\000\000\134\128\134\136\002\000\003\132)\001\000\001.\000\001\rH\001\002\000G\001\001\000\128\128\128\132\001\000\000\001\128\130\130a\128\132\130b\128\132\128\128\139\141\002\000\003\132*\001\000\001.\000\001\014H\001\002\000G\001\001\000\128\128\128\132\001\000\000\001\128\130\130a\128\132\130b\128\132\128\128\144\146\002\000\003\132+\001\000\001.\000\001\015H\001\002\000G\001\001\000\128\128\128\132\001\000\000\001\128\130\130a\128\132\130b\128\132\128\128\149\151\001\000\002\131\178\000\000\000\200\000\002\000\199\000\001\000\128\128\128\131\001\000\001\128\129\130a\128\131\128\128\154\156\002\000\003\132,\001\000\001.\000\001\016H\001\002\000G\001\001\000\128\128\128\132\001\000\000\001\128\130\130a\128\132\130b\128\132\128\128\159\161\002\000\003\132-\001\000\001.\000\001\017H\001\002\000G\001\001\000\128\128\128\132\001\000\000\001\128\130\130a\128\132\130b\128\132\128\145\001\002\000\005\254\a\254\a\254\a\254\a\254\a\254\005\000\128\129\136bitwise\131\145\129\133_ENV")()
  A.a9ee5774 = J
  
  local function K(...)
    local J = select(1, nil)
    local L = {}
    
    function L.a805c5da(M, N, O)
      if 0 == #M then
        return ""
      end
      if not N then
        return M:gsub(".", function(P)
          return string.format("%02x", string.byte(P))
        end)
      end
      O = O or ""
      local E = {}
      for Q = 1, #M - 1 do
        E[#E + 1] = string.format("%02x%s", M:byte(Q), 0 == Q % N and string.char(10) or O)
      end
      E[#E + 1] = string.format("%02x", M:byte(#M))
      return table.concat(E)
    end
    
    return L
  end
  
  K = K(A.a9ee5774)
  A.a7ecf2d5 = K
  
  local function R(...)
    local K = select(1, ...)
    local string, assert = string, assert
    local S, T = string.pack, string.unpack
    local U = {
      1116352408,
      1899447441,
      3049323471,
      3921009573,
      961987163,
      1508970993,
      2453635748,
      2870763221,
      3624381080,
      310598401,
      607225278,
      1426881987,
      1925078388,
      2162078206,
      2614888103,
      3248222580,
      3835390401,
      4022224774,
      264347078,
      604807628,
      770255983,
      1249150122,
      1555081692,
      1996064986,
      2554220882,
      2821834349,
      2952996808,
      3210313671,
      3336571891,
      3584528711,
      113926993,
      338241895,
      666307205,
      773529912,
      1294757372,
      1396182291,
      1695183700,
      1986661051,
      2177026350,
      2456956037,
      2730485921,
      2820302411,
      3259730800,
      3345764771,
      3516065817,
      3600352804,
      4094571909,
      275423344,
      430227734,
      506948616,
      659060556,
      883997877,
      958139571,
      1322822218,
      1537002063,
      1747873779,
      1955562222,
      2024104815,
      2227730452,
      2361852424,
      2428436474,
      2756734187,
      3204031479,
      3329325298
    }
    
    local function V(W, X)
      local Y = X + 1
      local Z = Y + 8
      local _ = Z % 64
      local a0 = 64 - _
      local a1 = S(">I8", X * 8)
      W = W .. string.char(128) .. string.rep(string.char(0), a0) .. a1
      assert(0 == #W % 64)
      return W
    end
    
    local a2 = {}
    
    local function a3(W)
      W = V(W, #W)
      assert(0 == #W % 64, "SHA256: padded message length not multiple of 64")
      local a4, a5, a6, a7, a8, a9, aa, ab = 1779033703, 3144134277, 1013904242, 2773480762, 1359893119, 2600822924, 528734635, 1541459225
      local ac = U
      local ad = a2
      local ae = #W
      for Q = 1, ae, 64 do
        ad[1], ad[2], ad[3], ad[4], ad[5], ad[6], ad[7], ad[8], ad[9], ad[10], ad[11], ad[12], ad[13], ad[14], ad[15], ad[16] = T(">I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4I4", W, Q)
        for af = 17, 64 do
          local ag = ad[af - 15]
          ag = ag << 32 | ag
          local ah = ad[af - 2]
          ah = ah << 32 | ah
          local ai = ag >> 7
          local aj = ag >> 18
          local ak = ag >> 35
          local al = ai ~ aj
          local am = al ~ ak
          local an = ah >> 17
          local ao = ah >> 19
          local ap = ah >> 42
          local aq = an ~ ao
          local ar = aq ~ ap
          local as = am + ar + ad[af - 7] + ad[af - 16]
          ad[af] = as & 4294967295
        end
        local at, au, P, av, aw, ax, ay, az = a4, a5, a6, a7, a8, a9, aa, ab
        for af = 1, 64 do
          aw = aw << 32 | aw & 4294967295
          local aA = aw >> 6
          local aB = aw >> 11
          local aC = aw >> 25
          local aD = aA ~ aB
          local aE = aD ~ aC
          local aF = ax ~ ay
          local aG = aw & aF
          local aH = ay ~ aG
          local aI = aE + aH + az + ac[af] + ad[af]
          az = ay
          ay = ax
          ax = aw
          aw = av + aI
          av = P
          P = au
          au = at
          at = at << 32 | at & 4294967295
          local aJ = at ~ P
          local aK = aJ & av
          local aL = at & P
          local aM = aK ~ aL
          local aN = at >> 2
          local aO = at >> 13
          local aP = at >> 22
          local aQ = aN ~ aO
          local aR = aQ ~ aP
          at = aI + aM + aR
        end
        a4 = a4 + at
        a5 = a5 + au
        a6 = a6 + P
        a7 = a7 + av
        a8 = a8 + aw
        a9 = a9 + ax
        aa = aa + ay
        ab = ab + az
      end
      a4 = a4 & 4294967295
      a5 = a5 & 4294967295
      a6 = a6 & 4294967295
      a7 = a7 & 4294967295
      a8 = a8 & 4294967295
      a9 = a9 & 4294967295
      aa = aa & 4294967295
      ab = ab & 4294967295
      return S(">I4I4I4I4I4I4I4I4", a4, a5, a6, a7, a8, a9, aa, ab)
    end
    
    local aS = {
      4794697086780616226,
      8158064640168781261,
      -5349999486874862801,
      -1606136188198331460,
      4131703408338449720,
      6480981068601479193,
      -7908458776815382629,
      -6116909921290321640,
      -2880145864133508542,
      1334009975649890238,
      2608012711638119052,
      6128411473006802146,
      8268148722764581231,
      -9160688886553864527,
      -7215885187991268811,
      -4495734319001033068,
      -1973867731355612462,
      -1171420211273849373,
      1135362057144423861,
      2597628984639134821,
      3308224258029322869,
      5365058923640841347,
      6679025012923562964,
      8573033837759648693,
      -7476448914759557205,
      -6327057829258317296,
      -5763719355590565569,
      -4658551843659510044,
      -4116276920077217854,
      -3051310485924567259,
      489312712824947311,
      1452737877330783856,
      2861767655752347644,
      3322285676063803686,
      5560940570517711597,
      5996557281743188959,
      7280758554555802590,
      8532644243296465576,
      -9096487096722542874,
      -7894198246740708037,
      -6719396339535248540,
      -6333637450476146687,
      -4446306890439682159,
      -4076793802049405392,
      -3345356375505022440,
      -2983346525034927856,
      -860691631967231958,
      1182934255886127544,
      1847814050463011016,
      2177327727835720531,
      2830643537854262169,
      3796741975233480872,
      4115178125766777443,
      5681478168544905931,
      6601373596472566643,
      7507060721942968483,
      8399075790359081724,
      8693463985226723168,
      -8878714635349349518,
      -8302665154208450068,
      -8016688836872298968,
      -6606660893046293015,
      -4685533653050689259,
      -4147400797238176981,
      -3880063495543823972,
      -3348786107499101689,
      -1523767162380948706,
      -757361751448694408,
      500013540394364858,
      748580250866718886,
      1242879168328830382,
      1977374033974150939,
      2944078676154940804,
      3659926193048069267,
      4368137639120453308,
      4836135668995329356,
      5532061633213252278,
      6448918945643986474,
      6902733635092675308,
      7801388544844847127
    }
    
    local function aT(W, X)
      local Y = X + 1
      local Z = Y + 16
      local _ = Z % 128
      local a0 = 128 - _
      local a1 = S(">I16", X * 8)
      W = W .. string.char(128) .. string.rep(string.char(0), a0) .. a1
      return W
    end
    
    local aU = {}
    
    local function aV(W)
      W = aT(W, #W)
      assert(0 == #W % 128, "SHA512: padded message length not multiple of 128")
      local a4, a5, a6, a7, a8, a9, aa, ab = 7640891576956012808, -4942790177534073029, 4354685564936845355, -6534734903238641935, 5840696475078001361, -7276294671716946913, 2270897969802886507, 6620516959819538809
      local ac = aS
      local ad = aU
      local ae = #W
      for Q = 1, ae, 128 do
        ad[1], ad[2], ad[3], ad[4], ad[5], ad[6], ad[7], ad[8], ad[9], ad[10], ad[11], ad[12], ad[13], ad[14], ad[15], ad[16] = T(">i8i8i8i8i8i8i8i8i8i8i8i8i8i8i8i8", W, Q)
        for af = 17, 80 do
          local at = ad[af - 15]
          local au = ad[af - 2]
          local aN = at >> 1
          local aO = at >> 7
          local aP = at >> 8
          local aW = at << 56
          local aX = at << 63
          local aQ = aN ~ aO
          local aY = aQ ~ aP
          local aZ = aY ~ aW
          local aR = aZ ~ aX
          local a_ = au >> 6
          local b0 = au >> 19
          local b1 = au >> 61
          local b2 = au << 3
          local b3 = au << 45
          local b4 = a_ ~ b0
          local b5 = b4 ~ b1
          local b6 = b5 ~ b2
          local b7 = b6 ~ b3
          ad[af] = aR + b7 + ad[af - 7] + ad[af - 16]
        end
        local at, au, P, av, aw, ax, ay, az = a4, a5, a6, a7, a8, a9, aa, ab
        for af = 1, 80 do
          local aA = aw >> 14
          local aB = aw >> 18
          local aC = aw >> 41
          local b8 = aw << 23
          local b9 = aw << 46
          local ba = aw << 50
          local aD = aA ~ aB
          local bb = aD ~ aC
          local bc = bb ~ b8
          local bd = bc ~ b9
          local aE = bd ~ ba
          local aF = ax ~ ay
          local aG = aw & aF
          local aH = ay ~ aG
          local be = aE + aH + az + ac[af] + ad[af]
          az = ay
          ay = ax
          ax = aw
          aw = be + av
          av = P
          P = au
          au = at
          local aJ = at ~ P
          local aK = aJ & av
          local aL = at & P
          local aM = aK ~ aL
          local aN = at >> 28
          local aO = at >> 34
          local aP = at >> 39
          local aW = at << 25
          local aX = at << 30
          local bf = at << 36
          local aQ = aN ~ aO
          local aY = aQ ~ aP
          local aZ = aY ~ aW
          local bg = aZ ~ aX
          local aR = bg ~ bf
          at = be + aM + aR
        end
        a4 = a4 + at
        a5 = a5 + au
        a6 = a6 + P
        a7 = a7 + av
        a8 = a8 + aw
        a9 = a9 + ax
        aa = aa + ay
        ab = ab + az
      end
      return S(">i8i8i8i8i8i8i8i8", a4, a5, a6, a7, a8, a9, aa, ab)
    end
    
    local function bh(bi, bj)
      local e = K.a805c5da(bi)
      if bj then
        e = string.upper(e)
      end
      return e
    end
    
    return {
      a7948bc8 = a3,
      aa49ca28 = aV,
      ace2ba8b = bh
    }
  end
  
  R = R(A.a7ecf2d5)
  
  local function bk(...)
    local J = select(1, ...)
    local S, T = string.pack, string.unpack
    local bl, bm = string.byte, string.char
    local bn, bo = table.insert, table.concat
    local bp = string.format
    
    local function bq(br, ...)
      Printf(bp(br, nil))
    end
    
    local function bs(at, au, P, av)
      au = au or 0
      P = P or 0
      av = av or 0
      bq("%016x %016x %016x %016x", at, au, P, av)
    end
    
    local function bt(M, W)
      Printf("---" .. W)
      bs(M[1], M[2], M[3], M[4])
      bs(M[5], M[6], M[7], M[8])
      bs(M[9], M[10], M[11], M[12])
      bs(M[13], M[14], M[15], M[16])
      bs(M[17], M[18], M[19], M[20])
      Printf("---")
    end
    
    local function bu(M, bv, bw, bx, by)
      local bz, bA, bB, bC = M[1], M[2], M[3], M[4]
      local bD, bE, bF, bG = M[5], M[6], M[7], M[8]
      local bH, bI, bJ, bK = M[9], M[10], M[11], M[12]
      local bL, bM, bN, bO = M[13], M[14], M[15], M[16]
      local bP, bQ, bR, bS = M[17], M[18], M[19], M[20]
      local bT
      bz = J.c(bz, bL)
      bA = J.c(bA, bM)
      bB = J.c(bB, bN)
      bC = J.c(bC, bO)
      bT = bO
      bO = bN
      bN = bM
      bM = bL
      bL = bT
      bz = J.c(bz, J.a(bD, bH))
      bA = J.c(bA, J.a(bE, bI))
      bB = J.c(bB, J.a(bF, bJ))
      bC = J.c(bC, J.a(bG, bK))
      bz = J.b(J.e(bz, 13), J.f(bz, 51))
      bA = J.b(J.e(bA, 13), J.f(bA, 51))
      bB = J.b(J.e(bB, 13), J.f(bB, 51))
      bC = J.b(J.e(bC, 13), J.f(bC, 51))
      bD = J.c(bD, bv)
      bE = J.c(bE, bw)
      bF = J.c(bF, bx)
      bG = J.c(bG, by)
      bD = J.c(bD, bP)
      bE = J.c(bE, bQ)
      bF = J.c(bF, bR)
      bG = J.c(bG, bS)
      bT = bS
      bS = bQ
      bQ = bT
      bT = bR
      bR = bP
      bP = bT
      bD = J.c(bD, J.a(bH, bL))
      bE = J.c(bE, J.a(bI, bM))
      bF = J.c(bF, J.a(bJ, bN))
      bG = J.c(bG, J.a(bK, bO))
      bD = J.b(J.e(bD, 46), J.f(bD, 18))
      bE = J.b(J.e(bE, 46), J.f(bE, 18))
      bF = J.b(J.e(bF, 46), J.f(bF, 18))
      bG = J.b(J.e(bG, 46), J.f(bG, 18))
      bH = J.c(bH, bv)
      bI = J.c(bI, bw)
      bJ = J.c(bJ, bx)
      bK = J.c(bK, by)
      bH = J.c(bH, bz)
      bI = J.c(bI, bA)
      bJ = J.c(bJ, bB)
      bK = J.c(bK, bC)
      bT = bz
      bz = bA
      bA = bB
      bB = bC
      bC = bT
      bH = J.c(bH, J.a(bL, bP))
      bI = J.c(bI, J.a(bM, bQ))
      bJ = J.c(bJ, J.a(bN, bR))
      bK = J.c(bK, J.a(bO, bS))
      bH = J.b(J.e(bH, 38), J.f(bH, 26))
      bI = J.b(J.e(bI, 38), J.f(bI, 26))
      bJ = J.b(J.e(bJ, 38), J.f(bJ, 26))
      bK = J.b(J.e(bK, 38), J.f(bK, 26))
      bL = J.c(bL, bv)
      bM = J.c(bM, bw)
      bN = J.c(bN, bx)
      bO = J.c(bO, by)
      bL = J.c(bL, bD)
      bM = J.c(bM, bE)
      bN = J.c(bN, bF)
      bO = J.c(bO, bG)
      bT = bG
      bG = bE
      bE = bT
      bT = bF
      bF = bD
      bD = bT
      bL = J.c(bL, J.a(bP, bz))
      bM = J.c(bM, J.a(bQ, bA))
      bN = J.c(bN, J.a(bR, bB))
      bO = J.c(bO, J.a(bS, bC))
      bL = J.b(J.e(bL, 7), J.f(bL, 57))
      bM = J.b(J.e(bM, 7), J.f(bM, 57))
      bN = J.b(J.e(bN, 7), J.f(bN, 57))
      bO = J.b(J.e(bO, 7), J.f(bO, 57))
      bP = J.c(bP, bv)
      bQ = J.c(bQ, bw)
      bR = J.c(bR, bx)
      bS = J.c(bS, by)
      bP = J.c(bP, bH)
      bQ = J.c(bQ, bI)
      bR = J.c(bR, bJ)
      bS = J.c(bS, bK)
      bT = bK
      bK = bJ
      bJ = bI
      bI = bH
      bH = bT
      bP = J.c(bP, J.a(bz, bD))
      bQ = J.c(bQ, J.a(bA, bE))
      bR = J.c(bR, J.a(bB, bF))
      bS = J.c(bS, J.a(bC, bG))
      bP = J.b(J.e(bP, 4), J.f(bP, 60))
      bQ = J.b(J.e(bQ, 4), J.f(bQ, 60))
      bR = J.b(J.e(bR, 4), J.f(bR, 60))
      bS = J.b(J.e(bS, 4), J.f(bS, 60))
      M[1], M[2], M[3], M[4] = bz, bA, bB, bC
      M[5], M[6], M[7], M[8] = bD, bE, bF, bG
      M[9], M[10], M[11], M[12] = bH, bI, bJ, bK
      M[13], M[14], M[15], M[16] = bL, bM, bN, bO
      M[17], M[18], M[19], M[20] = bP, bQ, bR, bS
    end
    
    local function bU(M, bv, bw, bx, by)
      local bV = J.c(J.c(J.c(bv, M[1]), M[6]), J.a(M[9], M[13]))
      local bW = J.c(J.c(J.c(bw, M[2]), M[7]), J.a(M[10], M[14]))
      local bX = J.c(J.c(J.c(bx, M[3]), M[8]), J.a(M[11], M[15]))
      local bY = J.c(J.c(J.c(by, M[4]), M[5]), J.a(M[12], M[16]))
      bu(M, bv, bw, bx, by)
      return bV, bW, bX, bY
    end
    
    local function bZ(M, bV, bW, bX, bY, b_)
      local bv = J.c(J.c(J.c(bV, M[1]), M[6]), J.a(M[9], M[13]))
      local bw = J.c(J.c(J.c(bW, M[2]), M[7]), J.a(M[10], M[14]))
      local bx = J.c(J.c(J.c(bX, M[3]), M[8]), J.a(M[11], M[15]))
      local by = J.c(J.c(J.c(bY, M[4]), M[5]), J.a(M[12], M[16]))
      if b_ then
        local c0 = S("<I8I8I8I8", bv, bw, bx, by):sub(1, b_)
        local c1 = c0 .. string.rep(bm(0), 32 - b_)
        assert(32 == #c1, #c1)
        bv, bw, bx, by = T("<I8I8I8I8", c1)
        bu(M, bv, bw, bx, by)
        return c0
      end
      bu(M, bv, bw, bx, by)
      return S("<I8I8I8I8", bv, bw, bx, by)
    end
    
    local c2 = {
      939006032783409408,
      7095959494080274965,
      -1067420811828642341,
      -2510557285622673120
    }
    
    local function c3(c4, c5)
      assert(16 == #c4 or 32 == #c4, "key must be 16 or 32 bytes")
      assert(16 == #c5, "iv must be 16 bytes")
      local c6, c7, c8, c9
      if 16 == #c4 then
        c6, c7 = T("<I8I8", c4)
        c9, c8 = c7, c6
      else
        c6, c7, c8, c9 = T("<I8I8I8I8", c4)
      end
      local ca, cb = T("<I8I8", c5)
      local M = {
        ca,
        cb,
        0,
        0,
        c6,
        c7,
        c8,
        c9,
        -1,
        -1,
        -1,
        -1,
        0,
        0,
        0,
        0,
        c2[1],
        c2[2],
        c2[3],
        c2[4]
      }
      for Q = 1, 16 do
        bu(M, 0, 0, 0, 0)
      end
      M[5] = J.c(M[5], c6)
      M[6] = J.c(M[6], c7)
      M[7] = J.c(M[7], c8)
      M[8] = J.c(M[8], c9)
      return M
    end
    
    local function cc(M, ae, cd)
      local bv, bw, bx, by = J.e(cd, 3), J.e(ae, 3), 0, 0
      M[17] = J.c(M[17], M[1])
      M[18] = J.c(M[18], M[2])
      M[19] = J.c(M[19], M[3])
      M[20] = J.c(M[20], M[4])
      for Q = 1, 10 do
        bu(M, bv, bw, bx, by)
      end
      M[1] = J.c(J.c(M[1], M[6]), J.a(M[9], M[13]))
      M[2] = J.c(J.c(M[2], M[7]), J.a(M[10], M[14]))
      M[3] = J.c(J.c(M[3], M[8]), J.a(M[11], M[15]))
      M[4] = J.c(J.c(M[4], M[5]), J.a(M[12], M[16]))
      return M[1], M[2]
    end
    
    local function ce(ac, c5, cf, cg)
      cg = cg or ""
      local ae, cd = #cf, #cg
      local bv, bw, bx, by, bV, bW, bX, bY, c1, b_
      local ch = {}
      local M = c3(ac, c5)
      local Q = 1
      while Q <= cd - 31 do
        bv, bw, bx, by = T("<I8I8I8I8", cg, Q)
        Q = Q + 32
        bU(M, bv, bw, bx, by)
      end
      if cd >= Q then
        c1 = cg:sub(Q) .. string.rep(bm(0), 31 + Q - cd)
        assert(32 == #c1, #c1)
        bv, bw, bx, by = T("<I8I8I8I8", c1)
        bU(M, bv, bw, bx, by)
      end
      bn(ch, cg)
      Q = 1
      while Q <= ae - 31 do
        bv, bw, bx, by = T("<I8I8I8I8", cf, Q)
        Q = Q + 32
        bV, bW, bX, bY = bU(M, bv, bw, bx, by)
        bn(ch, S("<I8I8I8I8", bV, bW, bX, bY))
      end
      if ae >= Q then
        c1 = cf:sub(Q)
        b_ = #c1
        c1 = c1 .. string.rep(bm(0), 31 + Q - ae)
        assert(32 == #c1, #c1)
        bv, bw, bx, by = T("<I8I8I8I8", c1)
        bV, bW, bX, bY = bU(M, bv, bw, bx, by)
        bn(ch, S("<I8I8I8I8", bV, bW, bX, bY):sub(1, b_))
      end
      local ci, cj = cc(M, ae, cd)
      bn(ch, S("<I8I8", ci, cj))
      return table.concat(ch)
    end
    
    local function ck(ac, c5, aw, cd)
      cd = cd or 0
      local cl = #aw - 16
      local ae = cl - cd
      local bv, bw, bx, by, bV, bW, bX, bY, c1, b_
      local ch = {}
      local M = c3(ac, c5)
      local cg
      if cd > 0 then
        cg = aw:sub(1, cd)
      end
      local Q = 1
      while Q <= cd - 31 do
        bv, bw, bx, by = T("<I8I8I8I8", cg, Q)
        Q = Q + 32
        bU(M, bv, bw, bx, by)
      end
      if cd >= Q then
        c1 = cg:sub(Q) .. string.rep(bm(0), 31 + Q - cd)
        assert(32 == #c1, #c1)
        bv, bw, bx, by = T("<I8I8I8I8", c1)
        bU(M, bv, bw, bx, by)
      end
      Q = cd + 1
      while Q <= cl - 31 do
        bV, bW, bX, bY = T("<I8I8I8I8", aw, Q)
        Q = Q + 32
        c1 = bZ(M, bV, bW, bX, bY)
        bn(ch, c1)
      end
      if cl >= Q then
        c1 = aw:sub(Q, cl)
        b_ = #c1
        c1 = c1 .. string.rep(bm(0), 31 + Q - cl)
        assert(32 == #c1, #c1)
        bV, bW, bX, bY = T("<I8I8I8I8", c1)
        c1 = bZ(M, bV, bW, bX, bY, b_)
        bn(ch, c1)
      end
      local cm, cn = cc(M, ae, cd)
      local ci, cj = T("<I8I8", aw, cl + 1)
      if 0 ~= J.b(J.c(cm, ci), J.c(cn, cj)) then
        return nil, "decrypt error"
      end
      return table.concat(ch), cg
    end
    
    return {
      ad2263ec = ce,
      a3156b1f = ck,
      a9751982 = 32,
      a0fa19cc = 16
    }
  end
  
  bk = bk(A.a9ee5774)
  A.a4aa1576 = R
  A.a19b59dc = bk
  
  local function co(...)
    local A = select(1, ...)
    local y = select(2, ...)
    local L = {}
    local cp = require("json")
    do
      local cq = tostring({}):match("0x(%x+)") or "0"
      math.randomseed(os.time() + tonumber(cq, 16))
      for cr = 1, 3 do
        math.random()
      end
    end
    
    local function cs()
      local ct = string.format("%s|%s|%s", os.clock(), math.random(), tostring({}))
      if not n[10][13] or type(n[10][13]) ~= "number" then
        return
      end
      local cu = A.a4aa1576.a7948bc8(ct)
      return string.sub(cu, 1, 16)
    end
    
    local function cv()
      local cw = io.open(A.a4461177(y.g_unset_a.Path), "r")
      local cx
      if cw then
        cx = cw:read("*all")
        cw:close()
      else
        return false
      end
      local cy = string.sub(cx or "", 1, 64)
      if not cy or #cy < 64 then
        return false
      end
      return A.a380752c(cy)
    end
    
    return L
  end
  
  co = co(A, y)
  A.a1462461 = co
  
  local function cz(...)
    local A = select(1, ...)
    local cp = require("json")
    local cA = require("socket")
    local cB = A.a4aa1576
    local cC = false
    local cD = 0.01
    local cE = 0.01
    
    local function cF(...)
      if cC and A and A.a4b25f9e then
        A.a4b25f9e()
      end
    end
    
    local function cG(cH)
      local cI = {}
      for Q = 1, #cH, 2 do
        local cJ = cH:sub(Q, Q + 1)
        table.insert(cI, string.char(tonumber(cJ, 16)))
      end
      return table.concat(cI)
    end
    
    local function cK(cL)
      local cM = {}
      for Q = 1, #cL do
        cM[Q] = cL:byte(Q)
      end
      return cM
    end
    
    local function cN(cM)
      local cI = {}
      for Q = 1, #cM do
        cI[Q] = string.char(cM[Q])
      end
      return table.concat(cI)
    end
    
    local cO = "5aed71b15a326e07771fde3028ec9764994a51ffcdb2cbba009c82605198cfc1"
    local cP = "9113ee981b85bd2ff1be805d04b357bbe51783812cdd7b889843e792c4025a53"
    local cQ = "0b58fec0fac91f83a968f31b09cdf4e92a5a371eef1ebe0bb8ccd8b391db4b26"
    local cR = cG(cO)
    local cS = cG(cP)
    local cT = cG(cQ)
    local cU = cG("68a9f067f1de9869e6c53e91aeb43f297f39c58fbb6ca78a7e74e420f4f2145c")
    
    local function cV(cW)
      return string.char(math.floor(cW / 16777216) % 256, math.floor(cW / 65536) % 256, math.floor(cW / 256) % 256, cW % 256)
    end
    
    local function cX(cI)
      local a_, b0, b1, b2 = cI:byte(1, 4)
      return a_ * 16777216 + b0 * 65536 + b1 * 256 + b2
    end
    
    local function cY()
      if not _G.acaa8d18 then
        _G.acaa8d18 = {
          a5281092 = nil,
          a35faf98 = nil,
          a97e8b82 = 0,
          ad89a91d = nil,
          aed31a9c = nil,
          a21bc8fc = false,
          af3a67bc = false,
          a906d060 = 0
        }
      end
      return _G.acaa8d18
    end
    
    local cZ = {}
    
    local function c_(c4, d0)
      local d1 = 128
      if d1 < #c4 then
        c4 = cB.aa49ca28(c4)
      end
      if d1 > #c4 then
        c4 = c4 .. string.rep(string.char(0), d1 - #c4)
      end
      local d2 = {}
      local d3 = {}
      for Q = 1, d1 do
        local d4 = c4:byte(Q)
        d2[Q] = string.char(d4 ~ 54)
        d3[Q] = string.char(d4 ~ 92)
      end
      local d5 = table.concat(d2)
      local d6 = table.concat(d3)
      local d7 = cB.aa49ca28(d5 .. d0)
      cF("DEBUG HMAC: inner_hash length = %d", #d7)
      local d8 = cB.aa49ca28(d6 .. d7)
      cF("DEBUG HMAC: final hmac length = %d", #d8)
      local d9 = ""
      for Q = 1, math.min(16, #d8) do
        d9 = d9 .. string.format("%02x", d8:byte(Q))
      end
      cF("DEBUG HMAC: first 16 bytes = %s", d9)
      return d8
    end
    
    local function da(db, W)
      local dc, dd = pcall(cp.encode, W)
      if not dc then
        return nil, "json encode failed: " .. tostring(dd)
      end
      local X = cV(#dd)
      local de = X .. dd
      local df = 0
      local dg = cA.gettime()
      local dh = 2
      while df < #de do
        if dh < cA.gettime() - dg then
          return nil, "send timeout after " .. dh .. "s"
        end
        local cr, di, dj = cA.select(nil, {db}, cE)
        if di and di[1] then
          local dk, dl = db:send(de, df + 1)
          if dk then
            df = dk
          elseif dl ~= "timeout" then
            return nil, "send failed: " .. tostring(dl)
          end
        else
          coroutine.yield(cD)
        end
      end
      return true
    end
    
    local function dm(db, dn)
      dn = dn or 2
      local dp = cA.gettime()
      local dq = ""
      while #dq < 4 do
        if dn < cA.gettime() - dp then
          return nil, "receive timeout"
        end
        local di, cr, dj = cA.select({db}, nil, cE)
        if di and di[1] then
          local dr, dl = db:receive(4 - #dq)
          if dr then
            dq = dq .. dr
          elseif dl ~= "timeout" then
            return nil, "receive length failed: " .. tostring(dl)
          end
        else
          coroutine.yield(cD)
        end
      end
      local ds = cX(dq)
      local dt = ""
      while ds > #dt do
        if dn < cA.gettime() - dp then
          return nil, "receive timeout"
        end
        local di, cr, dj = cA.select({db}, nil, cE)
        if di and di[1] then
          local dr, dl = db:receive(ds - #dt)
          if dr then
            dt = dt .. dr
          elseif dl ~= "timeout" then
            return nil, "receive data failed: " .. tostring(dl)
          end
        else
          coroutine.yield(cD)
        end
      end
      local dc, W = pcall(cp.decode, dt)
      if not dc then
        return nil, "json decode failed: " .. tostring(W)
      end
      return W
    end
    
    local function du(db)
      cF("DEBUG: Auth step 1: Sending auth request...")
      local dc, dl = da(db, {
        ["type"] = "auth_request",
        ["client_pubkey"] = cK(cS),
        ["timestamp"] = os.time()
      })
      if not dc then
        return nil, dl
      end
      cF("DEBUG: Auth step 2: Waiting for auth response...")
      local dv, dl = dm(db, 10)
      if not dv then
        return nil, dl
      end
      if dv["type"] == "response" and dv["status"] == "error" then
        return nil, dv["error"] or "authentication error"
      end
      if dv["type"] ~= "auth_response" then
        return nil, "unexpected auth response type: " .. tostring(dv["type"])
      end
      local dw = dv["app_version"]
      if dw then
        cF("DEBUG: Server app version: %s", dw)
      else
        cF("DEBUG: Server did not provide app version (old server)")
        dw = "unknown"
      end
      local dx = cY()
      dx.a820e17b = dw
      local dy = cN(dv["server_pubkey"])
      local dz = cN(dv["challenge"])
      if dy ~= cT then
        return nil, "server public key mismatch"
      end
      cF("DEBUG: Auth step 3: Computing challenge HMAC...")
      local dA = c_(cU, dz)
      dc, dl = da(db, {
        ["type"] = "auth_complete",
        ["challenge"] = cK(dA)
      })
      if not dc then
        return nil, dl
      end
      cF("DEBUG: Auth step 5: Waiting for auth success...")
      local dB, dl = dm(db, 10)
      if not dB then
        return nil, dl
      end
      if dB["type"] == "response" and dB["status"] == "error" then
        return nil, dB["error"] or "authentication failed"
      end
      if dB["type"] ~= "auth_success" then
        return nil, "authentication failed"
      end
      local dC = dB["session_token"]
      if not dC then
        return nil, "no session token in auth response"
      end
      cF("DEBUG: Socket authenticated successfully")
      return dC
    end
    
    local function dD(dE, dF)
      local db = cA.tcp()
      if not db then
        return nil, "failed to create socket"
      end
      db:settimeout(2)
      local dc, dl = db:connect(dE, dF)
      if not dc then
        db:close()
        return nil, "connection failed: " .. tostring(dl)
      end
      db:settimeout(0.001)
      cF("DEBUG: Connected to %s:%d", dE, dF)
      return db
    end
    
    local function dG(dH)
      cF("DEBUG: start_server_internal called, MT=%s, MT.startMAToolsServer__NC=%s", tostring(A), tostring(A and A.a42dbd78))
      if not A or not A.a42dbd78 then
        cF("DEBUG: Server start service is not available - MT or MT.startMAToolsServer__NC is nil")
        return nil, "Server start service is not available"
      end
      cF("DEBUG: Starting matools-secure server...")
      local dF, dl = A.a42dbd78(dH)
      if not dF then
        cF("DEBUG: Server start failed: %s", tostring(dl))
        return nil, dl
      end
      local dI = tonumber(dF)
      if dI then
        cF("DEBUG: Server started on port %d", dI)
        return dI
      end
      cF("DEBUG: Server started but port is not a number (%s), using default 55100", tostring(dF))
      return 55100
    end
    
    local function dJ(dE, dF)
      local dK = cA.tcp()
      if not dK then
        return false
      end
      dK:settimeout(0.5)
      local dc, dl = dK:connect(dE, dF)
      dK:close()
      return nil ~= dc
    end
    
    local function dL(dE, dM)
      local dN = 5
      local dO = 55299
      for dP = 0, dN - 1 do
        local dQ = dM + dP
        if dO < dQ then
          break
        end
        if dJ(dE, dQ) then
          cF("DEBUG: Found server on fallback port %d (offset +%d)", dQ, dP)
          return dQ
        end
      end
      return nil
    end
    
    local function dR(dE, dM, dH)
      cF("DEBUG: ensure_server_running called for %s:%d", dE, dM)
      local dx = cY()
      cF("DEBUG: Checking if server is reachable on primary or fallback ports...")
      local dS = dL(dE, dM)
      if dS then
        cF("DEBUG: Server is already reachable on port %d", dS)
        dx.flag_21bc = true
        dx.ad89a91d = dE
        dx.aed31a9c = dS
        return dS
      end
      cF("DEBUG: Server not reachable, starting...")
      dx.flag_21bc = false
      local dT, dU = dG(dH)
      if not dT then
        return nil, "Server not running and failed to start: " .. tostring(dU)
      end
      cF("DEBUG: Server started, waiting for it to accept connections...")
      for dV = 1, 20 do
        coroutine.yield(0.2)
        dS = dL(dE, dM)
        if dS then
          cF("DEBUG: Server accepting connections on port %d after %d attempts", dS, dV)
          dx.flag_21bc = true
          dx.ad89a91d = dE
          dx.aed31a9c = dS
          return dS
        end
        cF("DEBUG: Server not ready yet (attempt %d)", dV)
      end
      return nil, "Server started but not accepting connections after timeout"
    end
    
    function cZ.a54816ab(dE, dF)
      cF("DEBUG: connect_and_auth_ called for %s:%d", dE or "127.0.0.1", dF or 55100)
      local dx = cY()
      dE = dE or "127.0.0.1"
      dF = dF or 55100
      cF("DEBUG: Connecting to server for auth...")
      local db, dl = dD(dE, dF)
      if not db then
        cF("DEBUG: Connection failed: %s", tostring(dl))
        return nil, "connect failed: " .. tostring(dl)
      end
      cF("DEBUG: Connected, starting authentication...")
      local dC, dW = du(db)
      cF("DEBUG: Authentication completed, session_token=%s, error=%s", tostring(dC), tostring(dW))
      db:close()
      if not dC then
        return nil, "auth failed: " .. tostring(dW)
      end
      dx.a35faf98 = dC
      dx.num_97e8 = 0
      dx.ad89a91d = dE
      dx.aed31a9c = dF
      dx.flag_21bc = true
      cF("DEBUG: Authenticated, session token cached")
      return true
    end
    
    function cZ.ae41bce5(dX, dn)
      local dx = cY()
      if not dx.a35faf98 then
        return nil, "not authenticated"
      end
      if not dx.aed31a9c then
        return nil, "no port configured"
      end
      dx.a906d060 = (dx.a906d060 or 0) + 1
      local dY = dx.a906d060
      dx.num_97e8 = dx.num_97e8 + 1
      local dZ = dx.num_97e8
      cF("DEBUG: Ephemeral request #%d starting (nonce=%d)", dY, dZ)
      local db, d_ = dD("127.0.0.1", dx.aed31a9c)
      if not db then
        return nil, "connection failed: " .. tostring(d_)
      end
      local e0 = cV(dZ)
      local e1 = cN(dx.a35faf98)
      local e2 = c_(cU, e1 .. e0)
      local e3 = {
        ["type"] = "request",
        ["session_token"] = dx.a35faf98,
        ["nonce"] = dZ,
        ["request_hmac"] = cK(e2)
      }
      for ac, e4 in pairs(dX) do
        e3[ac] = e4
      end
      local e5, e6 = da(db, e3)
      if not e5 then
        db:close()
        return nil, "send failed: " .. tostring(e6)
      end
      local e7, e8 = dm(db, dn or 30)
      db:close()
      cF("DEBUG: Ephemeral request #%d socket closed", dY)
      if not e7 then
        return nil, "receive failed: " .. tostring(e8)
      end
      if type(e7) ~= "table" then
        return nil, "invalid response type: " .. type(e7)
      end
      if e7["status"] == "ok" then
        cF("DEBUG: Ephemeral request #%d completed successfully", dY)
        return e7
      else
        return nil, e7["error"] or "unknown error"
      end
    end
    
    function cZ.a8549ce4()
      local dx = cY()
      dx.a35faf98 = nil
      dx.num_97e8 = 0
      dx.flag_21bc = false
      dx.ad89a91d = nil
      dx.aed31a9c = nil
    end
    
    function cZ.a8007323()
      local dx = cY()
      if dx.a35faf98 and dx.ad89a91d and dx.aed31a9c then
        return true, dx.aed31a9c
      end
      return false, dx.aed31a9c
    end
    
    function cZ.aac3da0c()
      local dx = cY()
      return dx.a35faf98
    end
    
    function cZ.af3e91c2()
      local dx = cY()
      return dx.aed31a9c
    end
    
    function cZ.a316aaed(dH, dE, dF, e9)
      cF("DEBUG: client.request_ called")
      if not dH then
        cF("DEBUG: opts is nil!")
        return nil, "opts is nil"
      end
      if not dH.abe96a5e then
        cF("DEBUG: opts.data_ is nil!")
        return nil, "opts.data_ is nil"
      end
      cF("DEBUG: opts.data_.action = %s", tostring(dH.abe96a5e.action))
      dE = dE or "127.0.0.1"
      if not dF and A and A.a165d3be and A.str_055b then
        dF = A.a165d3be(A.str_055b)
        cF("DEBUG: Using version-specific port %d for version %s", dF, A.str_055b)
      else
        dF = dF or 55100
      end
      cF("DEBUG: Getting state")
      local dx = cY()
      if not dx then
        cF("DEBUG: state is nil!")
        return nil, "state is nil"
      end
      cF("DEBUG: State retrieved successfully")
      if not dx.flag_21bc then
        local ea, eb = dR(dE, dF, dH)
        if not ea then
          return nil, eb
        end
        dF = ea
      end
      if not dx.a35faf98 then
        local dc, dW = cZ.a54816ab(dE, dF)
        if not dc then
          dx.flag_21bc = false
          local ea, eb = dR(dE, dF, dH)
          if not ea then
            return nil, eb
          end
          dF = ea
          dc, dW = cZ.a54816ab(dE, dF)
          if not dc then
            return nil, "auth failed: " .. tostring(dW)
          end
        end
        if A and A.str_055b and dx.a820e17b then
          if dx.a820e17b ~= A.str_055b then
            cF("DEBUG: App version mismatch! Expected %s, got %s", A.str_055b, dx.a820e17b)
            cF("DEBUG: This should not happen with port-per-version architecture")
            return nil, string.format("version mismatch: expected %s on port %d, got %s", A.str_055b, dF, dx.a820e17b)
          else
            cF("DEBUG: App version matches: %s", dx.a820e17b)
          end
        end
      end
      local ec, dl = cZ.ae41bce5(dH.abe96a5e, dH.num_e4e8 or 2)
      if dl then
        cF("DEBUG: Request failed (%s), re-authenticating...", tostring(dl))
        dx.a35faf98 = nil
        local dc, dW = cZ.a54816ab(dE, dF)
        if not dc then
          return nil, "re-auth failed: " .. tostring(dW)
        end
        ec, dl = cZ.ae41bce5(dH.abe96a5e, dH.num_e4e8 or 2)
      end
      return ec, dl
    end
    
    function cZ.a3e11905()
      local dx = cY()
      return dx.a820e17b
    end
    
    function cZ.a4cee1bc(ed)
      local dx = cY()
      local ee = dx.a820e17b
      if not ee then
        return false, "no app version available (not authenticated yet)"
      end
      if ee ~= ed then
        return false, string.format("version mismatch: expected %s, got %s", ed, ee)
      end
      return true
    end
    
    return cZ
  end
  
  cz = cz(A)
  A.ab362959 = cz
  
  local function ef(...)
    local A = select(1, ...)
    local ef = {}
    
    local function bh(cL)
      local X = string.len(cL)
      local cH = ""
      for Q = 1, X do
        local eg = string.byte(cL, Q)
        cH = cH .. string.char(92, 120)
        cH = cH .. string.format("%02x", eg)
      end
      return cH
    end
    
    ef.aea8122a = load("\027LuaT\000\025\147\r\n\026\n\004\b\bxV\000\000\000\000\000\000\000\000\000\000\000(w@\001\155MATools/RemoteListener.lua\128\128\000\001\004\136Q\000\000\000\b\000\000\000\207\000\000\000O\129\000\000\128\001\002\000\197\129\001\001\198\129\000\001\198\129\001\001\128\129\001\000\000\130\128\139\170\002\000\021\217\149\000\001\128\175\000\128\006B\000\000\0008\002\000\128\v\001\000\000\128\001\000\000D\001\002\002<\129\001\0008\000\000\128F\129\001\000\v\001\000\002\128\001\000\000D\001\002\005K\129#\000\t\004\001\000\142\004\a\003\000\005\001\000D\004\003\001\v\004\000\005\139\004\002\006\014\005\a\004\196\004\002\000D\004\000\002\146\003\004\b\014\004\a\004B\004\000\000\184\028\000\128\014\004\a\aB\004\000\000\184\024\000\128\v\004\000\002\142\004\a\aD\004\002\005K\132\021\000\014\a\r\b<\135\t\000\184\019\000\128\014\a\r\nB\a\000\0008\018\000\128\v\a\000\005\139\a\002\006\014\b\r\n\196\a\002\000D\a\000\002\142\a\a\003\194\a\000\000\184\005\000\128\142\a\a\003\140\a\015\f\194\a\000\000\184\003\000\128\142\a\a\003\140\a\015\f\142\a\015\004\194\a\000\0008\001\000\128\142\a\a\003\140\a\015\f\014\a\015\004\139\a\000\v\000\b\f\000\196\a\002\002\188\135\f\000\184\005\000\128\v\b\000\r\014\b\016\014\128\b\015\000D\b\002\002A\b\128\000\184\002\000\128\139\b\000\015\142\b\017\016\014\t\a\004\128\t\016\000\000\n\014\000\196\b\004\001L\004\000\002M\132\022\0006\004\000\000\189\000\128\0008\001\000\128\014\004\a\004\142\004\a\017D\004\002\001L\001\000\002M\129$\0006\001\000\000F\129\001\000\146\004\133type\004\134table\004\134pairs\004\131fl\004\130f\004\133load\004\134unb64\004\130e\004\130n\004\133_ENV\004\130v\004\137tonumber\000\004\133math\004\134floor\004\134debug\004\139setupvalue\004\130a\131\000\000\000\001\001\000\001\000\000\128\217\002\000\001\000\000\000\000\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000\000\000\001\000\000\001\000\000\001\000\000\000\001\000\000\000\000\000\001\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\001\000\000\002\000\000\001\000\002\000\000\000\001\000\001\000\000\000\000\000\245\000\015\002\000\001\000\000\233\000\026\001\128\145\131fl\128\217\130d\128\217\140(for state)\141\215\140(for state)\141\215\140(for state)\141\215\140(for state)\141\215\130_\142\213\131ft\142\213\140(for state)\161\207\140(for state)\161\207\140(for state)\161\207\140(for state)\161\207\130k\162\205\130v\162\205\131ef\173\205\132idx\191\205\135idxInt\197\205\131\133_ENV\130b\130c\128\181\209\000\000\f\175\003\000\000\000\139\000\001\001\003\001\001\000\196\000\002\002\138\000\000\000\139\000\001\003\000\001\000\000\196\000\002\001\135\000\000\000\194\000\000\000\184\015\000\128\v\001\001\004\014\001\002\005\147\001\002\000R\000\000\000\146\001\006\000\146\129\a\bD\001\002\002<\001\t\000\184\001\000\128\139\001\001\n\003\130\005\000\196\001\002\0018\t\000\128\140\001\002\000\001\002\000\128\180\002\003\000\001\003\000\128J\002\006\000\f\004\003\a\142\004\b\f\194\004\000\0008\000\000\128\133\000\000\000\142\004\b\r\194\004\000\000\184\001\000\128\137\004\002\000\014\005\b\r\129\133\255\127\196\004\003\001I\130\006\000\184\238\255\127\v\001\001\014\128\001\000\000D\001\002\001G\001\001\000\143\004\136MATools\004\136require\004\133mime\004\145OpenMessageQueue\004\138coroutine\004\134yield\004\135queues\004\133wait\003\n\000\000\000\000\000\000\000\000\004\136ErrEcho\004\145Timeout, no data\004\133stop\004\131fl\004\146CloseMessageQueue\131\001\000\000\000\000\000\001\001\000\128\175\001\001\000\000\000\002\000\000\002\001\000\001\000\000\000\000\000\000\002\000\001\000\000\001\003\002\000\000\000\001\001\000\000\001\002\000\000\001\000\000\000\250\b\002\000\000\001\128\137\131qN\129\175\131cR\137\175\130r\146\170\130q\153\170\140(for state)\156\170\140(for state)\156\170\140(for state)\156\170\130i\157\169\130m\158\169\131\130c\133_ENV\130b\136\001\b!'\002\000\000\000\128\131\130c\130\136\130b\131\136\130a\132\136\129\133_ENV")
    
    local function eh(ei)
      local ej = {}
      local Q = 1
      while true do
        local ek, el = debug.getupvalue(ei, Q)
        if not ek then
          break
        end
        ej[Q] = {n = ek, v = el}
        Q = Q + 1
      end
      if -8 ~= r[5][12] - r[5][11] then
        return -1
      end
      return ej
    end
    
    local function em(en, eo, ep, eq)
      eo = eo or _G
      ep = ep or "_G"
      eq = eq or {}
      if eq[eo] then
        return nil
      end
      eq[eo] = true
      if m[5][1] >= m[5][9] then
        return 3
      end
      for c4, el in pairs(eo) do
        local er = ep .. "." .. tostring(c4)
        if el == en then
          return er
        elseif type(el) == "table" and c4 ~= "_G" then
          local ec = em(en, el, er, eq)
          if ec then
            return ec
          end
        end
      end
      return nil
    end
    
    return ef
  end
  
  ef = ef(A)
  A.a28d897a = ef
  
  local function es(...)
    local et = false
    local eu = false
    local ev = {
      [0] = {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      },
      {
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0
      },
      {
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      },
      {
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0
      },
      {
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        0
      },
      {
        1,
        0,
        1,
        0,
        0,
        0,
        0,
        0
      },
      {
        0,
        1,
        1,
        0,
        0,
        0,
        0,
        0
      },
      {
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0
      },
      {
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0
      },
      {
        1,
        0,
        0,
        1,
        0,
        0,
        0,
        0
      },
      {
        0,
        1,
        0,
        1,
        0,
        0,
        0,
        0
      },
      {
        1,
        1,
        0,
        1,
        0,
        0,
        0,
        0
      },
      {
        0,
        0,
        1,
        1,
        0,
        0,
        0,
        0
      },
      {
        1,
        0,
        1,
        1,
        0,
        0,
        0,
        0
      },
      {
        0,
        1,
        1,
        1,
        0,
        0,
        0,
        0
      },
      {
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0
      },
      {
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0
      },
      {
        1,
        0,
        0,
        0,
        1,
        0,
        0,
        0
      },
      {
        0,
        1,
        0,
        0,
        1,
        0,
        0,
        0
      },
      {
        1,
        1,
        0,
        0,
        1,
        0,
        0,
        0
      },
      {
        0,
        0,
        1,
        0,
        1,
        0,
        0,
        0
      },
      {
        1,
        0,
        1,
        0,
        1,
        0,
        0,
        0
      },
      {
        0,
        1,
        1,
        0,
        1,
        0,
        0,
        0
      },
      {
        1,
        1,
        1,
        0,
        1,
        0,
        0,
        0
      },
      {
        0,
        0,
        0,
        1,
        1,
        0,
        0,
        0
      },
      {
        1,
        0,
        0,
        1,
        1,
        0,
        0,
        0
      },
      {
        0,
        1,
        0,
        1,
        1,
        0,
        0,
        0
      },
      {
        1,
        1,
        0,
        1,
        1,
        0,
        0,
        0
      },
      {
        0,
        0,
        1,
        1,
        1,
        0,
        0,
        0
      },
      {
        1,
        0,
        1,
        1,
        1,
        0,
        0,
        0
      },
      {
        0,
        1,
        1,
        1,
        1,
        0,
        0,
        0
      },
      {
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0
      },
      {
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        0
      },
      {
        1,
        0,
        0,
        0,
        0,
        1,
        0,
        0
      },
      {
        0,
        1,
        0,
        0,
        0,
        1,
        0,
        0
      },
      {
        1,
        1,
        0,
        0,
        0,
        1,
        0,
        0
      },
      {
        0,
        0,
        1,
        0,
        0,
        1,
        0,
        0
      },
      {
        1,
        0,
        1,
        0,
        0,
        1,
        0,
        0
      },
      {
        0,
        1,
        1,
        0,
        0,
        1,
        0,
        0
      },
      {
        1,
        1,
        1,
        0,
        0,
        1,
        0,
        0
      },
      {
        0,
        0,
        0,
        1,
        0,
        1,
        0,
        0
      },
      {
        1,
        0,
        0,
        1,
        0,
        1,
        0,
        0
      },
      {
        0,
        1,
        0,
        1,
        0,
        1,
        0,
        0
      },
      {
        1,
        1,
        0,
        1,
        0,
        1,
        0,
        0
      },
      {
        0,
        0,
        1,
        1,
        0,
        1,
        0,
        0
      },
      {
        1,
        0,
        1,
        1,
        0,
        1,
        0,
        0
      },
      {
        0,
        1,
        1,
        1,
        0,
        1,
        0,
        0
      },
      {
        1,
        1,
        1,
        1,
        0,
        1,
        0,
        0
      },
      {
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      },
      {
        1,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      },
      {
        0,
        1,
        0,
        0,
        1,
        1,
        0,
        0
      },
      {
        1,
        1,
        0,
        0,
        1,
        1,
        0,
        0
      },
      {
        0,
        0,
        1,
        0,
        1,
        1,
        0,
        0
      },
      {
        1,
        0,
        1,
        0,
        1,
        1,
        0,
        0
      },
      {
        0,
        1,
        1,
        0,
        1,
        1,
        0,
        0
      },
      {
        1,
        1,
        1,
        0,
        1,
        1,
        0,
        0
      },
      {
        0,
        0,
        0,
        1,
        1,
        1,
        0,
        0
      },
      {
        1,
        0,
        0,
        1,
        1,
        1,
        0,
        0
      },
      {
        0,
        1,
        0,
        1,
        1,
        1,
        0,
        0
      },
      {
        1,
        1,
        0,
        1,
        1,
        1,
        0,
        0
      },
      {
        0,
        0,
        1,
        1,
        1,
        1,
        0,
        0
      },
      {
        1,
        0,
        1,
        1,
        1,
        1,
        0,
        0
      },
      {
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        0
      },
      {
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0
      },
      {
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        0
      },
      {
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        0
      },
      {
        0,
        1,
        0,
        0,
        0,
        0,
        1,
        0
      },
      {
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        0
      },
      {
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        0
      },
      {
        1,
        0,
        1,
        0,
        0,
        0,
        1,
        0
      },
      {
        0,
        1,
        1,
        0,
        0,
        0,
        1,
        0
      },
      {
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        0
      },
      {
        0,
        0,
        0,
        1,
        0,
        0,
        1,
        0
      },
      {
        1,
        0,
        0,
        1,
        0,
        0,
        1,
        0
      },
      {
        0,
        1,
        0,
        1,
        0,
        0,
        1,
        0
      },
      {
        1,
        1,
        0,
        1,
        0,
        0,
        1,
        0
      },
      {
        0,
        0,
        1,
        1,
        0,
        0,
        1,
        0
      },
      {
        1,
        0,
        1,
        1,
        0,
        0,
        1,
        0
      },
      {
        0,
        1,
        1,
        1,
        0,
        0,
        1,
        0
      },
      {
        1,
        1,
        1,
        1,
        0,
        0,
        1,
        0
      },
      {
        0,
        0,
        0,
        0,
        1,
        0,
        1,
        0
      },
      {
        1,
        0,
        0,
        0,
        1,
        0,
        1,
        0
      },
      {
        0,
        1,
        0,
        0,
        1,
        0,
        1,
        0
      },
      {
        1,
        1,
        0,
        0,
        1,
        0,
        1,
        0
      },
      {
        0,
        0,
        1,
        0,
        1,
        0,
        1,
        0
      },
      {
        1,
        0,
        1,
        0,
        1,
        0,
        1,
        0
      },
      {
        0,
        1,
        1,
        0,
        1,
        0,
        1,
        0
      },
      {
        1,
        1,
        1,
        0,
        1,
        0,
        1,
        0
      },
      {
        0,
        0,
        0,
        1,
        1,
        0,
        1,
        0
      },
      {
        1,
        0,
        0,
        1,
        1,
        0,
        1,
        0
      },
      {
        0,
        1,
        0,
        1,
        1,
        0,
        1,
        0
      },
      {
        1,
        1,
        0,
        1,
        1,
        0,
        1,
        0
      },
      {
        0,
        0,
        1,
        1,
        1,
        0,
        1,
        0
      },
      {
        1,
        0,
        1,
        1,
        1,
        0,
        1,
        0
      },
      {
        0,
        1,
        1,
        1,
        1,
        0,
        1,
        0
      },
      {
        1,
        1,
        1,
        1,
        1,
        0,
        1,
        0
      },
      {
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        0
      },
      {
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0
      },
      {
        0,
        1,
        0,
        0,
        0,
        1,
        1,
        0
      },
      {
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        0
      },
      {
        0,
        0,
        1,
        0,
        0,
        1,
        1,
        0
      },
      {
        1,
        0,
        1,
        0,
        0,
        1,
        1,
        0
      },
      {
        0,
        1,
        1,
        0,
        0,
        1,
        1,
        0
      },
      {
        1,
        1,
        1,
        0,
        0,
        1,
        1,
        0
      },
      {
        0,
        0,
        0,
        1,
        0,
        1,
        1,
        0
      },
      {
        1,
        0,
        0,
        1,
        0,
        1,
        1,
        0
      },
      {
        0,
        1,
        0,
        1,
        0,
        1,
        1,
        0
      },
      {
        1,
        1,
        0,
        1,
        0,
        1,
        1,
        0
      },
      {
        0,
        0,
        1,
        1,
        0,
        1,
        1,
        0
      },
      {
        1,
        0,
        1,
        1,
        0,
        1,
        1,
        0
      },
      {
        0,
        1,
        1,
        1,
        0,
        1,
        1,
        0
      },
      {
        1,
        1,
        1,
        1,
        0,
        1,
        1,
        0
      },
      {
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        0
      },
      {
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        0
      },
      {
        0,
        1,
        0,
        0,
        1,
        1,
        1,
        0
      },
      {
        1,
        1,
        0,
        0,
        1,
        1,
        1,
        0
      },
      {
        0,
        0,
        1,
        0,
        1,
        1,
        1,
        0
      },
      {
        1,
        0,
        1,
        0,
        1,
        1,
        1,
        0
      },
      {
        0,
        1,
        1,
        0,
        1,
        1,
        1,
        0
      },
      {
        1,
        1,
        1,
        0,
        1,
        1,
        1,
        0
      },
      {
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        0
      },
      {
        1,
        0,
        0,
        1,
        1,
        1,
        1,
        0
      },
      {
        0,
        1,
        0,
        1,
        1,
        1,
        1,
        0
      },
      {
        1,
        1,
        0,
        1,
        1,
        1,
        1,
        0
      },
      {
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        0
      },
      {
        1,
        0,
        1,
        1,
        1,
        1,
        1,
        0
      },
      {
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0
      },
      {
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        0
      },
      {
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1
      },
      {
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        1
      },
      {
        0,
        1,
        0,
        0,
        0,
        0,
        0,
        1
      },
      {
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        1
      },
      {
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        1
      },
      {
        1,
        0,
        1,
        0,
        0,
        0,
        0,
        1
      },
      {
        0,
        1,
        1,
        0,
        0,
        0,
        0,
        1
      },
      {
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1
      },
      {
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        1
      },
      {
        1,
        0,
        0,
        1,
        0,
        0,
        0,
        1
      },
      {
        0,
        1,
        0,
        1,
        0,
        0,
        0,
        1
      },
      {
        1,
        1,
        0,
        1,
        0,
        0,
        0,
        1
      },
      {
        0,
        0,
        1,
        1,
        0,
        0,
        0,
        1
      },
      {
        1,
        0,
        1,
        1,
        0,
        0,
        0,
        1
      },
      {
        0,
        1,
        1,
        1,
        0,
        0,
        0,
        1
      },
      {
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1
      },
      {
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        1
      },
      {
        1,
        0,
        0,
        0,
        1,
        0,
        0,
        1
      },
      {
        0,
        1,
        0,
        0,
        1,
        0,
        0,
        1
      },
      {
        1,
        1,
        0,
        0,
        1,
        0,
        0,
        1
      },
      {
        0,
        0,
        1,
        0,
        1,
        0,
        0,
        1
      },
      {
        1,
        0,
        1,
        0,
        1,
        0,
        0,
        1
      },
      {
        0,
        1,
        1,
        0,
        1,
        0,
        0,
        1
      },
      {
        1,
        1,
        1,
        0,
        1,
        0,
        0,
        1
      },
      {
        0,
        0,
        0,
        1,
        1,
        0,
        0,
        1
      },
      {
        1,
        0,
        0,
        1,
        1,
        0,
        0,
        1
      },
      {
        0,
        1,
        0,
        1,
        1,
        0,
        0,
        1
      },
      {
        1,
        1,
        0,
        1,
        1,
        0,
        0,
        1
      },
      {
        0,
        0,
        1,
        1,
        1,
        0,
        0,
        1
      },
      {
        1,
        0,
        1,
        1,
        1,
        0,
        0,
        1
      },
      {
        0,
        1,
        1,
        1,
        1,
        0,
        0,
        1
      },
      {
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        1
      },
      {
        0,
        0,
        0,
        0,
        0,
        1,
        0,
        1
      },
      {
        1,
        0,
        0,
        0,
        0,
        1,
        0,
        1
      },
      {
        0,
        1,
        0,
        0,
        0,
        1,
        0,
        1
      },
      {
        1,
        1,
        0,
        0,
        0,
        1,
        0,
        1
      },
      {
        0,
        0,
        1,
        0,
        0,
        1,
        0,
        1
      },
      {
        1,
        0,
        1,
        0,
        0,
        1,
        0,
        1
      },
      {
        0,
        1,
        1,
        0,
        0,
        1,
        0,
        1
      },
      {
        1,
        1,
        1,
        0,
        0,
        1,
        0,
        1
      },
      {
        0,
        0,
        0,
        1,
        0,
        1,
        0,
        1
      },
      {
        1,
        0,
        0,
        1,
        0,
        1,
        0,
        1
      },
      {
        0,
        1,
        0,
        1,
        0,
        1,
        0,
        1
      },
      {
        1,
        1,
        0,
        1,
        0,
        1,
        0,
        1
      },
      {
        0,
        0,
        1,
        1,
        0,
        1,
        0,
        1
      },
      {
        1,
        0,
        1,
        1,
        0,
        1,
        0,
        1
      },
      {
        0,
        1,
        1,
        1,
        0,
        1,
        0,
        1
      },
      {
        1,
        1,
        1,
        1,
        0,
        1,
        0,
        1
      },
      {
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        1
      },
      {
        1,
        0,
        0,
        0,
        1,
        1,
        0,
        1
      },
      {
        0,
        1,
        0,
        0,
        1,
        1,
        0,
        1
      },
      {
        1,
        1,
        0,
        0,
        1,
        1,
        0,
        1
      },
      {
        0,
        0,
        1,
        0,
        1,
        1,
        0,
        1
      },
      {
        1,
        0,
        1,
        0,
        1,
        1,
        0,
        1
      },
      {
        0,
        1,
        1,
        0,
        1,
        1,
        0,
        1
      },
      {
        1,
        1,
        1,
        0,
        1,
        1,
        0,
        1
      },
      {
        0,
        0,
        0,
        1,
        1,
        1,
        0,
        1
      },
      {
        1,
        0,
        0,
        1,
        1,
        1,
        0,
        1
      },
      {
        0,
        1,
        0,
        1,
        1,
        1,
        0,
        1
      },
      {
        1,
        1,
        0,
        1,
        1,
        1,
        0,
        1
      },
      {
        0,
        0,
        1,
        1,
        1,
        1,
        0,
        1
      },
      {
        1,
        0,
        1,
        1,
        1,
        1,
        0,
        1
      },
      {
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        1
      },
      {
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        1
      },
      {
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      },
      {
        1,
        0,
        0,
        0,
        0,
        0,
        1,
        1
      },
      {
        0,
        1,
        0,
        0,
        0,
        0,
        1,
        1
      },
      {
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1
      },
      {
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        1
      },
      {
        1,
        0,
        1,
        0,
        0,
        0,
        1,
        1
      },
      {
        0,
        1,
        1,
        0,
        0,
        0,
        1,
        1
      },
      {
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        1
      },
      {
        0,
        0,
        0,
        1,
        0,
        0,
        1,
        1
      },
      {
        1,
        0,
        0,
        1,
        0,
        0,
        1,
        1
      },
      {
        0,
        1,
        0,
        1,
        0,
        0,
        1,
        1
      },
      {
        1,
        1,
        0,
        1,
        0,
        0,
        1,
        1
      },
      {
        0,
        0,
        1,
        1,
        0,
        0,
        1,
        1
      },
      {
        1,
        0,
        1,
        1,
        0,
        0,
        1,
        1
      },
      {
        0,
        1,
        1,
        1,
        0,
        0,
        1,
        1
      },
      {
        1,
        1,
        1,
        1,
        0,
        0,
        1,
        1
      },
      {
        0,
        0,
        0,
        0,
        1,
        0,
        1,
        1
      },
      {
        1,
        0,
        0,
        0,
        1,
        0,
        1,
        1
      },
      {
        0,
        1,
        0,
        0,
        1,
        0,
        1,
        1
      },
      {
        1,
        1,
        0,
        0,
        1,
        0,
        1,
        1
      },
      {
        0,
        0,
        1,
        0,
        1,
        0,
        1,
        1
      },
      {
        1,
        0,
        1,
        0,
        1,
        0,
        1,
        1
      },
      {
        0,
        1,
        1,
        0,
        1,
        0,
        1,
        1
      },
      {
        1,
        1,
        1,
        0,
        1,
        0,
        1,
        1
      },
      {
        0,
        0,
        0,
        1,
        1,
        0,
        1,
        1
      },
      {
        1,
        0,
        0,
        1,
        1,
        0,
        1,
        1
      },
      {
        0,
        1,
        0,
        1,
        1,
        0,
        1,
        1
      },
      {
        1,
        1,
        0,
        1,
        1,
        0,
        1,
        1
      },
      {
        0,
        0,
        1,
        1,
        1,
        0,
        1,
        1
      },
      {
        1,
        0,
        1,
        1,
        1,
        0,
        1,
        1
      },
      {
        0,
        1,
        1,
        1,
        1,
        0,
        1,
        1
      },
      {
        1,
        1,
        1,
        1,
        1,
        0,
        1,
        1
      },
      {
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        1
      },
      {
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        1
      },
      {
        0,
        1,
        0,
        0,
        0,
        1,
        1,
        1
      },
      {
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        1
      },
      {
        0,
        0,
        1,
        0,
        0,
        1,
        1,
        1
      },
      {
        1,
        0,
        1,
        0,
        0,
        1,
        1,
        1
      },
      {
        0,
        1,
        1,
        0,
        0,
        1,
        1,
        1
      },
      {
        1,
        1,
        1,
        0,
        0,
        1,
        1,
        1
      },
      {
        0,
        0,
        0,
        1,
        0,
        1,
        1,
        1
      },
      {
        1,
        0,
        0,
        1,
        0,
        1,
        1,
        1
      },
      {
        0,
        1,
        0,
        1,
        0,
        1,
        1,
        1
      },
      {
        1,
        1,
        0,
        1,
        0,
        1,
        1,
        1
      },
      {
        0,
        0,
        1,
        1,
        0,
        1,
        1,
        1
      },
      {
        1,
        0,
        1,
        1,
        0,
        1,
        1,
        1
      },
      {
        0,
        1,
        1,
        1,
        0,
        1,
        1,
        1
      },
      {
        1,
        1,
        1,
        1,
        0,
        1,
        1,
        1
      },
      {
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1
      },
      {
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1
      },
      {
        0,
        1,
        0,
        0,
        1,
        1,
        1,
        1
      },
      {
        1,
        1,
        0,
        0,
        1,
        1,
        1,
        1
      },
      {
        0,
        0,
        1,
        0,
        1,
        1,
        1,
        1
      },
      {
        1,
        0,
        1,
        0,
        1,
        1,
        1,
        1
      },
      {
        0,
        1,
        1,
        0,
        1,
        1,
        1,
        1
      },
      {
        1,
        1,
        1,
        0,
        1,
        1,
        1,
        1
      },
      {
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1
      },
      {
        1,
        0,
        0,
        1,
        1,
        1,
        1,
        1
      },
      {
        0,
        1,
        0,
        1,
        1,
        1,
        1,
        1
      },
      {
        1,
        1,
        0,
        1,
        1,
        1,
        1,
        1
      },
      {
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1
      },
      {
        1,
        0,
        1,
        1,
        1,
        1,
        1,
        1
      },
      {
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        1
      },
      {
        1,
        1,
        1,
        1,
        1,
        1,
        1,
        1
      }
    }
    
    local function ew(eo)
      local cW = #eo
      local ex = 0
      local ey = 1
      for Q = 1, cW do
        ex = ex + eo[Q] * ey
        ey = ey * 2
      end
      return ex
    end
    
    local function ez(cf, cW)
      local eA = ev[cf]
      local eB = ev[cW]
      local eo = {}
      for Q = 1, 8 do
        if eA[Q] ~= eB[Q] then
          eo[Q] = 1
        else
          eo[Q] = 0
        end
      end
      return ew(eo)
    end
    
    local function eC(ag, eD)
      local M = string.format("%o", ag)
      local at = {
        ["0"] = "000",
        ["1"] = "001",
        ["2"] = "010",
        ["3"] = "011",
        ["4"] = "100",
        ["5"] = "101",
        ["6"] = "110",
        ["7"] = "111"
      }
      if q[7][14] * q[7][1] <= q[7][1] then
        return q[7][1]
      end
      M = string.gsub(M, "(.)", function(av)
        return at[av]
      end)
      M = string.gsub(M, "^0*(.*)$", "%1")
      local eE = string.format("%%%ds", eD)
      local eF = string.format(eE, M)
      return string.gsub(eF, " ", "0")
    end
    
    local function eG(eH, eI, ag, ah)
      if "1" == eI then
        eH[ag][ah] = 2
      else
        eH[ag][ah] = -2
      end
    end
    
    local function eJ(cL)
      if string.match(cL, "^[0-9]+$") then
        return 1
      elseif string.match(cL, "^[0-9A-Z $%%*./:+-]+$") then
        return 2
      else
        return 4
      end
      assert(false, "never reached")
      return nil
    end
    
    local eK = {
      {
        19,
        16,
        13,
        9
      },
      {
        34,
        28,
        22,
        16
      },
      {
        55,
        44,
        34,
        26
      },
      {
        80,
        64,
        48,
        36
      },
      {
        108,
        86,
        62,
        46
      },
      {
        136,
        108,
        76,
        60
      },
      {
        156,
        124,
        88,
        66
      },
      {
        194,
        154,
        110,
        86
      },
      {
        232,
        182,
        132,
        100
      },
      {
        274,
        216,
        154,
        122
      },
      {
        324,
        254,
        180,
        140
      },
      {
        370,
        290,
        206,
        158
      },
      {
        428,
        334,
        244,
        180
      },
      {
        461,
        365,
        261,
        197
      },
      {
        523,
        415,
        295,
        223
      },
      {
        589,
        453,
        325,
        253
      },
      {
        647,
        507,
        367,
        283
      },
      {
        721,
        563,
        397,
        313
      },
      {
        795,
        627,
        445,
        341
      },
      {
        861,
        669,
        485,
        385
      },
      {
        932,
        714,
        512,
        406
      },
      {
        1006,
        782,
        568,
        442
      },
      {
        1094,
        860,
        614,
        464
      },
      {
        1174,
        914,
        664,
        514
      },
      {
        1276,
        1000,
        718,
        538
      },
      {
        1370,
        1062,
        754,
        596
      },
      {
        1468,
        1128,
        808,
        628
      },
      {
        1531,
        1193,
        871,
        661
      },
      {
        1631,
        1267,
        911,
        701
      },
      {
        1735,
        1373,
        985,
        745
      },
      {
        1843,
        1455,
        1033,
        793
      },
      {
        1955,
        1541,
        1115,
        845
      },
      {
        2071,
        1631,
        1171,
        901
      },
      {
        2191,
        1725,
        1231,
        961
      },
      {
        2306,
        1812,
        1286,
        986
      },
      {
        2434,
        1914,
        1354,
        1054
      },
      {
        2566,
        1992,
        1426,
        1096
      },
      {
        2702,
        2102,
        1502,
        1142
      },
      {
        2812,
        2216,
        1582,
        1222
      },
      {
        2956,
        2334,
        1666,
        1276
      }
    }
    
    local function eL(X, eM, eN)
      local eO = eM
      if 4 == eM then
        eO = 3
      elseif 8 == eM then
        eO = 4
      end
      assert(eO <= 4)
      local eP, eD, eQ, P
      local eR = {
        {
          10,
          9,
          8,
          8
        },
        {
          12,
          11,
          16,
          10
        },
        {
          14,
          13,
          16,
          12
        }
      }
      local eS = 40
      local eT = eN or 1
      local eU, eV = 1, 4
      if eN and eN >= 1 and eN <= 4 then
        eU = eN
        eV = eN
      end
      for eW = eU, eV do
        for eX = 1, #eK do
          eP = eK[eX][eW] * 8
          eP = eP - 4
          if eX < 10 then
            eD = eR[1][eO]
          elseif eX < 27 then
            eD = eR[2][eO]
          elseif eX <= 40 then
            eD = eR[3][eO]
          end
          eQ = eP - eD
          if 1 == eO then
            P = math.floor(eQ * 3 / 10)
          elseif 2 == eO then
            P = math.floor(eQ * 2 / 11)
          elseif 3 == eO then
            P = math.floor(eQ * 1 / 8)
          else
            P = math.floor(eQ * 1 / 13)
          end
          if X <= P then
            if eX <= eS then
              eS = eX
              eT = eW
            end
            break
          end
        end
      end
      return eS, eT
    end
    
    local function eY(cL, eX, eM)
      local Q = eM
      if 4 == eM then
        Q = 3
      elseif 8 == eM then
        Q = 4
      end
      assert(Q <= 4)
      local eR = {
        {
          10,
          9,
          8,
          8
        },
        {
          12,
          11,
          16,
          10
        },
        {
          14,
          13,
          16,
          12
        }
      }
      local eD
      if eX < 10 then
        eD = eR[1][Q]
      elseif eX < 27 then
        eD = eR[2][Q]
      elseif eX <= 40 then
        eD = eR[3][Q]
      else
        assert(false, "get_length, version > 40 not supported")
      end
      local X = eC(#cL, eD)
      if l[2][3] >= l[2][12] then
        return 3
      end
      return X
    end
    
    local function eZ(cL, eN, eM)
      local eO
      if eM then
        assert(false, "not implemented")
        eO = eM
      else
        eO = eJ(cL)
      end
      local eX, eW
      eX, eW = eL(#cL, eO, eN)
      local e_ = eY(cL, eX, eO)
      return eX, eW, eC(eO, 4), eO, e_
    end
    
    local f0 = {
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      36,
      -1,
      -1,
      -1,
      37,
      38,
      -1,
      -1,
      -1,
      -1,
      39,
      40,
      -1,
      41,
      42,
      43,
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      44,
      -1,
      -1,
      -1,
      -1,
      -1,
      -1,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      -1,
      -1,
      -1,
      -1,
      -1
    }
    
    local function f1(cL)
      local eI = ""
      local f2
      string.gsub(cL, "..?.?", function(at)
        f2 = tonumber(at)
        if 3 == #at then
          eI = eI .. eC(f2, 10)
        elseif 2 == #at then
          eI = eI .. eC(f2, 7)
        else
          eI = eI .. eC(f2, 4)
        end
      end)
      return eI
    end
    
    local function f3(cL)
      local eI = ""
      local f2
      if p[1][2] * p[1][9] <= p[1][12] then
        return p[1][12]
      end
      local a_, b0
      string.gsub(cL, "..?", function(at)
        if 2 == #at then
          a_ = f0[string.byte(string.sub(at, 1, 1))]
          b0 = f0[string.byte(string.sub(at, 2, 2))]
          f2 = a_ * 45 + b0
          eI = eI .. eC(f2, 11)
        else
          f2 = f0[string.byte(at)]
          eI = eI .. eC(f2, 6)
        end
      end)
      return eI
    end
    
    local function f4(cL)
      local eF = {}
      string.gsub(cL, ".", function(ag)
        eF[#eF + 1] = eC(string.byte(ag), 8)
      end)
      return table.concat(eF)
    end
    
    local function f5(cL, eM)
      if s[8][10] * s[8][14] <= s[8][10] then
        return s[8][10]
      end
      if 1 == eM then
        return f1(cL)
      elseif 2 == eM then
        return f3(cL)
      elseif 4 == eM then
        return f4(cL)
      else
        assert(false, "not implemented yet")
      end
    end
    
    local function f6(eX, eW, de)
      local f7, f8
      if -5 ~= k[11][12] - k[11][13] then
        return -1
      end
      local f9 = eK[eX][eW] * 8
      f7 = math.min(4, f9 - #de)
      if f7 > 0 then
        de = de .. string.rep("0", f7)
      end
      if 0 ~= math.fmod(#de, 8) then
        f8 = 8 - math.fmod(#de, 8)
        de = de .. string.rep("0", f8)
      end
      assert(0 == math.fmod(#de, 8))
      while f9 > #de do
        de = de .. "11101100"
        if f9 > #de then
          de = de .. "00010001"
        end
      end
      return de
    end
    
    local fa = {
      [0] = 1,
      2,
      4,
      8,
      16,
      32,
      64,
      128,
      29,
      58,
      116,
      232,
      205,
      135,
      19,
      38,
      76,
      152,
      45,
      90,
      180,
      117,
      234,
      201,
      143,
      3,
      6,
      12,
      24,
      48,
      96,
      192,
      157,
      39,
      78,
      156,
      37,
      74,
      148,
      53,
      106,
      212,
      181,
      119,
      238,
      193,
      159,
      35,
      70,
      140,
      5,
      10,
      20,
      40,
      80,
      160,
      93,
      186,
      105,
      210,
      185,
      111,
      222,
      161,
      95,
      190,
      97,
      194,
      153,
      47,
      94,
      188,
      101,
      202,
      137,
      15,
      30,
      60,
      120,
      240,
      253,
      231,
      211,
      187,
      107,
      214,
      177,
      127,
      254,
      225,
      223,
      163,
      91,
      182,
      113,
      226,
      217,
      175,
      67,
      134,
      17,
      34,
      68,
      136,
      13,
      26,
      52,
      104,
      208,
      189,
      103,
      206,
      129,
      31,
      62,
      124,
      248,
      237,
      199,
      147,
      59,
      118,
      236,
      197,
      151,
      51,
      102,
      204,
      133,
      23,
      46,
      92,
      184,
      109,
      218,
      169,
      79,
      158,
      33,
      66,
      132,
      21,
      42,
      84,
      168,
      77,
      154,
      41,
      82,
      164,
      85,
      170,
      73,
      146,
      57,
      114,
      228,
      213,
      183,
      115,
      230,
      209,
      191,
      99,
      198,
      145,
      63,
      126,
      252,
      229,
      215,
      179,
      123,
      246,
      241,
      255,
      227,
      219,
      171,
      75,
      150,
      49,
      98,
      196,
      149,
      55,
      110,
      220,
      165,
      87,
      174,
      65,
      130,
      25,
      50,
      100,
      200,
      141,
      7,
      14,
      28,
      56,
      112,
      224,
      221,
      167,
      83,
      166,
      81,
      162,
      89,
      178,
      121,
      242,
      249,
      239,
      195,
      155,
      43,
      86,
      172,
      69,
      138,
      9,
      18,
      36,
      72,
      144,
      61,
      122,
      244,
      245,
      247,
      243,
      251,
      235,
      203,
      139,
      11,
      22,
      44,
      88,
      176,
      125,
      250,
      233,
      207,
      131,
      27,
      54,
      108,
      216,
      173,
      71,
      142,
      0,
      0
    }
    local fb = {
      [0] = 256,
      0,
      1,
      25,
      2,
      50,
      26,
      198,
      3,
      223,
      51,
      238,
      27,
      104,
      199,
      75,
      4,
      100,
      224,
      14,
      52,
      141,
      239,
      129,
      28,
      193,
      105,
      248,
      200,
      8,
      76,
      113,
      5,
      138,
      101,
      47,
      225,
      36,
      15,
      33,
      53,
      147,
      142,
      218,
      240,
      18,
      130,
      69,
      29,
      181,
      194,
      125,
      106,
      39,
      249,
      185,
      201,
      154,
      9,
      120,
      77,
      228,
      114,
      166,
      6,
      191,
      139,
      98,
      102,
      221,
      48,
      253,
      226,
      152,
      37,
      179,
      16,
      145,
      34,
      136,
      54,
      208,
      148,
      206,
      143,
      150,
      219,
      189,
      241,
      210,
      19,
      92,
      131,
      56,
      70,
      64,
      30,
      66,
      182,
      163,
      195,
      72,
      126,
      110,
      107,
      58,
      40,
      84,
      250,
      133,
      186,
      61,
      202,
      94,
      155,
      159,
      10,
      21,
      121,
      43,
      78,
      212,
      229,
      172,
      115,
      243,
      167,
      87,
      7,
      112,
      192,
      247,
      140,
      128,
      99,
      13,
      103,
      74,
      222,
      237,
      49,
      197,
      254,
      24,
      227,
      165,
      153,
      119,
      38,
      184,
      180,
      124,
      17,
      68,
      146,
      217,
      35,
      32,
      137,
      46,
      55,
      63,
      209,
      91,
      149,
      188,
      207,
      205,
      144,
      135,
      151,
      178,
      220,
      252,
      190,
      97,
      242,
      86,
      211,
      171,
      20,
      42,
      93,
      158,
      132,
      60,
      57,
      83,
      71,
      109,
      65,
      162,
      31,
      45,
      67,
      216,
      183,
      123,
      164,
      118,
      196,
      23,
      73,
      236,
      127,
      12,
      111,
      246,
      108,
      161,
      59,
      82,
      41,
      157,
      85,
      170,
      251,
      96,
      134,
      177,
      187,
      204,
      62,
      90,
      203,
      89,
      95,
      176,
      156,
      169,
      160,
      81,
      11,
      245,
      22,
      235,
      122,
      117,
      44,
      215,
      79,
      174,
      213,
      233,
      230,
      231,
      173,
      232,
      116,
      214,
      244,
      234,
      168,
      80,
      88,
      175
    }
    local fc = {
      [7] = {
        21,
        102,
        238,
        149,
        146,
        229,
        87,
        0
      },
      [10] = {
        45,
        32,
        94,
        64,
        70,
        118,
        61,
        46,
        67,
        251,
        0
      },
      [13] = {
        78,
        140,
        206,
        218,
        130,
        104,
        106,
        100,
        86,
        100,
        176,
        152,
        74,
        0
      },
      [15] = {
        105,
        99,
        5,
        124,
        140,
        237,
        58,
        58,
        51,
        37,
        202,
        91,
        61,
        183,
        8,
        0
      },
      [16] = {
        120,
        225,
        194,
        182,
        169,
        147,
        191,
        91,
        3,
        76,
        161,
        102,
        109,
        107,
        104,
        120,
        0
      },
      [17] = {
        136,
        163,
        243,
        39,
        150,
        99,
        24,
        147,
        214,
        206,
        123,
        239,
        43,
        78,
        206,
        139,
        43,
        0
      },
      [18] = {
        153,
        96,
        98,
        5,
        179,
        252,
        148,
        152,
        187,
        79,
        170,
        118,
        97,
        184,
        94,
        158,
        234,
        215,
        0
      },
      [20] = {
        190,
        188,
        212,
        212,
        164,
        156,
        239,
        83,
        225,
        221,
        180,
        202,
        187,
        26,
        163,
        61,
        50,
        79,
        60,
        17,
        0
      },
      [22] = {
        231,
        165,
        105,
        160,
        134,
        219,
        80,
        98,
        172,
        8,
        74,
        200,
        53,
        221,
        109,
        14,
        230,
        93,
        242,
        247,
        171,
        210,
        0
      },
      [24] = {
        21,
        227,
        96,
        87,
        232,
        117,
        0,
        111,
        218,
        228,
        226,
        192,
        152,
        169,
        180,
        159,
        126,
        251,
        117,
        211,
        48,
        135,
        121,
        229,
        0
      },
      [26] = {
        70,
        218,
        145,
        153,
        227,
        48,
        102,
        13,
        142,
        245,
        21,
        161,
        53,
        165,
        28,
        111,
        201,
        145,
        17,
        118,
        182,
        103,
        2,
        158,
        125,
        173,
        0
      },
      [28] = {
        123,
        9,
        37,
        242,
        119,
        212,
        195,
        42,
        87,
        245,
        43,
        21,
        201,
        232,
        27,
        205,
        147,
        195,
        190,
        110,
        180,
        108,
        234,
        224,
        104,
        200,
        223,
        168,
        0
      },
      [30] = {
        180,
        192,
        40,
        238,
        216,
        251,
        37,
        156,
        130,
        224,
        193,
        226,
        173,
        42,
        125,
        222,
        96,
        239,
        86,
        110,
        48,
        50,
        182,
        179,
        31,
        216,
        152,
        145,
        173,
        41,
        0
      }
    }
    
    local function fd(de)
      local W = {}
      string.gsub(de, "(........)", function(ag)
        W[#W + 1] = tonumber(ag, 2)
      end)
      return W
    end
    
    local function fe(ff, fg)
      local fh = {
        [0] = 0
      }
      for Q = 0, fg - ff - 1 do
        fh[Q] = 0
      end
      local fi = fc[ff]
      for Q = 1, ff + 1 do
        fh[fg - ff + Q - 1] = fi[Q]
      end
      return fh
    end
    
    local function fj(eR)
      local fk = {}
      for Q = 0, #eR do
        fk[Q] = fb[eR[Q]]
      end
      return fk
    end
    
    local function fl(eR)
      local fk = {}
      for Q = 0, #eR do
        fk[Q] = fa[eR[Q]]
      end
      return fk
    end
    
    local function fm(de, ff)
      local fn
      if type(de) == "string" then
        fn = fd(de)
      elseif type(de) == "table" then
        fn = de
      else
        assert(false, string.format("Unknown type for data: %s", type(de)))
      end
      local fo = #fn
      local fg = fo + ff - 1
      local fh, fp, fq, fr, fs
      if r[4][8] * r[4][14] <= r[4][10] then
        return r[4][10]
      end
      local ft = {}
      for Q = 1, fo do
        ft[fg - Q + 1] = fn[Q]
      end
      for Q = 1, fg - fo do
        ft[Q] = 0
      end
      ft[0] = 0
      fs = fj(ft)
      while ff <= fg do
        fh = fe(ff, fg)
        local fu = fs[fg]
        for Q = fg, fg - ff, -1 do
          if 256 ~= fu then
            if fh[Q] + fu >= 255 then
              fh[Q] = math.fmod(fh[Q] + fu, 255)
            else
              fh[Q] = fh[Q] + fu
            end
          else
            fh[Q] = 256
          end
        end
        for Q = fg - ff - 1, 0, -1 do
          fh[Q] = 256
        end
        fr = fl(fh)
        ft = fl(fs)
        fp = {}
        for Q = fg, 0, -1 do
          fp[Q] = ez(fr[Q], ft[Q])
        end
        fq = fg
        for Q = fq, 0, -1 do
          if not (ff > Q) and 0 == fp[Q] then
            fp[Q] = nil
            fg = fg - 1
          else
            break
          end
        end
        ft = fp
        fs = fj(ft)
      end
      local eF = {}
      for Q = #ft, 0, -1 do
        eF[#eF + 1] = ft[Q]
      end
      return eF
    end
    
    local fv = {
      {
        {
          1,
          {
            26,
            19,
            2
          }
        },
        {
          1,
          {
            26,
            16,
            4
          }
        },
        {
          1,
          {
            26,
            13,
            6
          }
        },
        {
          1,
          {
            26,
            9,
            8
          }
        }
      },
      {
        {
          1,
          {
            44,
            34,
            4
          }
        },
        {
          1,
          {
            44,
            28,
            8
          }
        },
        {
          1,
          {
            44,
            22,
            11
          }
        },
        {
          1,
          {
            44,
            16,
            14
          }
        }
      },
      {
        {
          1,
          {
            70,
            55,
            7
          }
        },
        {
          1,
          {
            70,
            44,
            13
          }
        },
        {
          2,
          {
            35,
            17,
            9
          }
        },
        {
          2,
          {
            35,
            13,
            11
          }
        }
      },
      {
        {
          1,
          {
            100,
            80,
            10
          }
        },
        {
          2,
          {
            50,
            32,
            9
          }
        },
        {
          2,
          {
            50,
            24,
            13
          }
        },
        {
          4,
          {
            25,
            9,
            8
          }
        }
      },
      {
        {
          1,
          {
            134,
            108,
            13
          }
        },
        {
          2,
          {
            67,
            43,
            12
          }
        },
        {
          2,
          {
            33,
            15,
            9
          },
          2,
          {
            34,
            16,
            9
          }
        },
        {
          2,
          {
            33,
            11,
            11
          },
          2,
          {
            34,
            12,
            11
          }
        }
      },
      {
        {
          2,
          {
            86,
            68,
            9
          }
        },
        {
          4,
          {
            43,
            27,
            8
          }
        },
        {
          4,
          {
            43,
            19,
            12
          }
        },
        {
          4,
          {
            43,
            15,
            14
          }
        }
      },
      {
        {
          2,
          {
            98,
            78,
            10
          }
        },
        {
          4,
          {
            49,
            31,
            9
          }
        },
        {
          2,
          {
            32,
            14,
            9
          },
          4,
          {
            33,
            15,
            9
          }
        },
        {
          4,
          {
            39,
            13,
            13
          },
          1,
          {
            40,
            14,
            13
          }
        }
      },
      {
        {
          2,
          {
            121,
            97,
            12
          }
        },
        {
          2,
          {
            60,
            38,
            11
          },
          2,
          {
            61,
            39,
            11
          }
        },
        {
          4,
          {
            40,
            18,
            11
          },
          2,
          {
            41,
            19,
            11
          }
        },
        {
          4,
          {
            40,
            14,
            13
          },
          2,
          {
            41,
            15,
            13
          }
        }
      },
      {
        {
          2,
          {
            146,
            116,
            15
          }
        },
        {
          3,
          {
            58,
            36,
            11
          },
          2,
          {
            59,
            37,
            11
          }
        },
        {
          4,
          {
            36,
            16,
            10
          },
          4,
          {
            37,
            17,
            10
          }
        },
        {
          4,
          {
            36,
            12,
            12
          },
          4,
          {
            37,
            13,
            12
          }
        }
      },
      {
        {
          2,
          {
            86,
            68,
            9
          },
          2,
          {
            87,
            69,
            9
          }
        },
        {
          4,
          {
            69,
            43,
            13
          },
          1,
          {
            70,
            44,
            13
          }
        },
        {
          6,
          {
            43,
            19,
            12
          },
          2,
          {
            44,
            20,
            12
          }
        },
        {
          6,
          {
            43,
            15,
            14
          },
          2,
          {
            44,
            16,
            14
          }
        }
      },
      {
        {
          4,
          {
            101,
            81,
            10
          }
        },
        {
          1,
          {
            80,
            50,
            15
          },
          4,
          {
            81,
            51,
            15
          }
        },
        {
          4,
          {
            50,
            22,
            14
          },
          4,
          {
            51,
            23,
            14
          }
        },
        {
          3,
          {
            36,
            12,
            12
          },
          8,
          {
            37,
            13,
            12
          }
        }
      },
      {
        {
          2,
          {
            116,
            92,
            12
          },
          2,
          {
            117,
            93,
            12
          }
        },
        {
          6,
          {
            58,
            36,
            11
          },
          2,
          {
            59,
            37,
            11
          }
        },
        {
          4,
          {
            46,
            20,
            13
          },
          6,
          {
            47,
            21,
            13
          }
        },
        {
          7,
          {
            42,
            14,
            14
          },
          4,
          {
            43,
            15,
            14
          }
        }
      },
      {
        {
          4,
          {
            133,
            107,
            13
          }
        },
        {
          8,
          {
            59,
            37,
            11
          },
          1,
          {
            60,
            38,
            11
          }
        },
        {
          8,
          {
            44,
            20,
            12
          },
          4,
          {
            45,
            21,
            12
          }
        },
        {
          12,
          {
            33,
            11,
            11
          },
          4,
          {
            34,
            12,
            11
          }
        }
      },
      {
        {
          3,
          {
            145,
            115,
            15
          },
          1,
          {
            146,
            116,
            15
          }
        },
        {
          4,
          {
            64,
            40,
            12
          },
          5,
          {
            65,
            41,
            12
          }
        },
        {
          11,
          {
            36,
            16,
            10
          },
          5,
          {
            37,
            17,
            10
          }
        },
        {
          11,
          {
            36,
            12,
            12
          },
          5,
          {
            37,
            13,
            12
          }
        }
      },
      {
        {
          5,
          {
            109,
            87,
            11
          },
          1,
          {
            110,
            88,
            11
          }
        },
        {
          5,
          {
            65,
            41,
            12
          },
          5,
          {
            66,
            42,
            12
          }
        },
        {
          5,
          {
            54,
            24,
            15
          },
          7,
          {
            55,
            25,
            15
          }
        },
        {
          11,
          {
            36,
            12,
            12
          },
          7,
          {
            37,
            13,
            12
          }
        }
      },
      {
        {
          5,
          {
            122,
            98,
            12
          },
          1,
          {
            123,
            99,
            12
          }
        },
        {
          7,
          {
            73,
            45,
            14
          },
          3,
          {
            74,
            46,
            14
          }
        },
        {
          15,
          {
            43,
            19,
            12
          },
          2,
          {
            44,
            20,
            12
          }
        },
        {
          3,
          {
            45,
            15,
            15
          },
          13,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          1,
          {
            135,
            107,
            14
          },
          5,
          {
            136,
            108,
            14
          }
        },
        {
          10,
          {
            74,
            46,
            14
          },
          1,
          {
            75,
            47,
            14
          }
        },
        {
          1,
          {
            50,
            22,
            14
          },
          15,
          {
            51,
            23,
            14
          }
        },
        {
          2,
          {
            42,
            14,
            14
          },
          17,
          {
            43,
            15,
            14
          }
        }
      },
      {
        {
          5,
          {
            150,
            120,
            15
          },
          1,
          {
            151,
            121,
            15
          }
        },
        {
          9,
          {
            69,
            43,
            13
          },
          4,
          {
            70,
            44,
            13
          }
        },
        {
          17,
          {
            50,
            22,
            14
          },
          1,
          {
            51,
            23,
            14
          }
        },
        {
          2,
          {
            42,
            14,
            14
          },
          19,
          {
            43,
            15,
            14
          }
        }
      },
      {
        {
          3,
          {
            141,
            113,
            14
          },
          4,
          {
            142,
            114,
            14
          }
        },
        {
          3,
          {
            70,
            44,
            13
          },
          11,
          {
            71,
            45,
            13
          }
        },
        {
          17,
          {
            47,
            21,
            13
          },
          4,
          {
            48,
            22,
            13
          }
        },
        {
          9,
          {
            39,
            13,
            13
          },
          16,
          {
            40,
            14,
            13
          }
        }
      },
      {
        {
          3,
          {
            135,
            107,
            14
          },
          5,
          {
            136,
            108,
            14
          }
        },
        {
          3,
          {
            67,
            41,
            13
          },
          13,
          {
            68,
            42,
            13
          }
        },
        {
          15,
          {
            54,
            24,
            15
          },
          5,
          {
            55,
            25,
            15
          }
        },
        {
          15,
          {
            43,
            15,
            14
          },
          10,
          {
            44,
            16,
            14
          }
        }
      },
      {
        {
          4,
          {
            144,
            116,
            14
          },
          4,
          {
            145,
            117,
            14
          }
        },
        {
          17,
          {
            68,
            42,
            13
          }
        },
        {
          17,
          {
            50,
            22,
            14
          },
          6,
          {
            51,
            23,
            14
          }
        },
        {
          19,
          {
            46,
            16,
            15
          },
          6,
          {
            47,
            17,
            15
          }
        }
      },
      {
        {
          2,
          {
            139,
            111,
            14
          },
          7,
          {
            140,
            112,
            14
          }
        },
        {
          17,
          {
            74,
            46,
            14
          }
        },
        {
          7,
          {
            54,
            24,
            15
          },
          16,
          {
            55,
            25,
            15
          }
        },
        {
          34,
          {
            37,
            13,
            12
          }
        }
      },
      {
        {
          4,
          {
            151,
            121,
            15
          },
          5,
          {
            152,
            122,
            15
          }
        },
        {
          4,
          {
            75,
            47,
            14
          },
          14,
          {
            76,
            48,
            14
          }
        },
        {
          11,
          {
            54,
            24,
            15
          },
          14,
          {
            55,
            25,
            15
          }
        },
        {
          16,
          {
            45,
            15,
            15
          },
          14,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          6,
          {
            147,
            117,
            15
          },
          4,
          {
            148,
            118,
            15
          }
        },
        {
          6,
          {
            73,
            45,
            14
          },
          14,
          {
            74,
            46,
            14
          }
        },
        {
          11,
          {
            54,
            24,
            15
          },
          16,
          {
            55,
            25,
            15
          }
        },
        {
          30,
          {
            46,
            16,
            15
          },
          2,
          {
            47,
            17,
            15
          }
        }
      },
      {
        {
          8,
          {
            132,
            106,
            13
          },
          4,
          {
            133,
            107,
            13
          }
        },
        {
          8,
          {
            75,
            47,
            14
          },
          13,
          {
            76,
            48,
            14
          }
        },
        {
          7,
          {
            54,
            24,
            15
          },
          22,
          {
            55,
            25,
            15
          }
        },
        {
          22,
          {
            45,
            15,
            15
          },
          13,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          10,
          {
            142,
            114,
            14
          },
          2,
          {
            143,
            115,
            14
          }
        },
        {
          19,
          {
            74,
            46,
            14
          },
          4,
          {
            75,
            47,
            14
          }
        },
        {
          28,
          {
            50,
            22,
            14
          },
          6,
          {
            51,
            23,
            14
          }
        },
        {
          33,
          {
            46,
            16,
            15
          },
          4,
          {
            47,
            17,
            15
          }
        }
      },
      {
        {
          8,
          {
            152,
            122,
            15
          },
          4,
          {
            153,
            123,
            15
          }
        },
        {
          22,
          {
            73,
            45,
            14
          },
          3,
          {
            74,
            46,
            14
          }
        },
        {
          8,
          {
            53,
            23,
            15
          },
          26,
          {
            54,
            24,
            15
          }
        },
        {
          12,
          {
            45,
            15,
            15
          },
          28,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          3,
          {
            147,
            117,
            15
          },
          10,
          {
            148,
            118,
            15
          }
        },
        {
          3,
          {
            73,
            45,
            14
          },
          23,
          {
            74,
            46,
            14
          }
        },
        {
          4,
          {
            54,
            24,
            15
          },
          31,
          {
            55,
            25,
            15
          }
        },
        {
          11,
          {
            45,
            15,
            15
          },
          31,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          7,
          {
            146,
            116,
            15
          },
          7,
          {
            147,
            117,
            15
          }
        },
        {
          21,
          {
            73,
            45,
            14
          },
          7,
          {
            74,
            46,
            14
          }
        },
        {
          1,
          {
            53,
            23,
            15
          },
          37,
          {
            54,
            24,
            15
          }
        },
        {
          19,
          {
            45,
            15,
            15
          },
          26,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          5,
          {
            145,
            115,
            15
          },
          10,
          {
            146,
            116,
            15
          }
        },
        {
          19,
          {
            75,
            47,
            14
          },
          10,
          {
            76,
            48,
            14
          }
        },
        {
          15,
          {
            54,
            24,
            15
          },
          25,
          {
            55,
            25,
            15
          }
        },
        {
          23,
          {
            45,
            15,
            15
          },
          25,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          13,
          {
            145,
            115,
            15
          },
          3,
          {
            146,
            116,
            15
          }
        },
        {
          2,
          {
            74,
            46,
            14
          },
          29,
          {
            75,
            47,
            14
          }
        },
        {
          42,
          {
            54,
            24,
            15
          },
          1,
          {
            55,
            25,
            15
          }
        },
        {
          23,
          {
            45,
            15,
            15
          },
          28,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          17,
          {
            145,
            115,
            15
          }
        },
        {
          10,
          {
            74,
            46,
            14
          },
          23,
          {
            75,
            47,
            14
          }
        },
        {
          10,
          {
            54,
            24,
            15
          },
          35,
          {
            55,
            25,
            15
          }
        },
        {
          19,
          {
            45,
            15,
            15
          },
          35,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          17,
          {
            145,
            115,
            15
          },
          1,
          {
            146,
            116,
            15
          }
        },
        {
          14,
          {
            74,
            46,
            14
          },
          21,
          {
            75,
            47,
            14
          }
        },
        {
          29,
          {
            54,
            24,
            15
          },
          19,
          {
            55,
            25,
            15
          }
        },
        {
          11,
          {
            45,
            15,
            15
          },
          46,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          13,
          {
            145,
            115,
            15
          },
          6,
          {
            146,
            116,
            15
          }
        },
        {
          14,
          {
            74,
            46,
            14
          },
          23,
          {
            75,
            47,
            14
          }
        },
        {
          44,
          {
            54,
            24,
            15
          },
          7,
          {
            55,
            25,
            15
          }
        },
        {
          59,
          {
            46,
            16,
            15
          },
          1,
          {
            47,
            17,
            15
          }
        }
      },
      {
        {
          12,
          {
            151,
            121,
            15
          },
          7,
          {
            152,
            122,
            15
          }
        },
        {
          12,
          {
            75,
            47,
            14
          },
          26,
          {
            76,
            48,
            14
          }
        },
        {
          39,
          {
            54,
            24,
            15
          },
          14,
          {
            55,
            25,
            15
          }
        },
        {
          22,
          {
            45,
            15,
            15
          },
          41,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          6,
          {
            151,
            121,
            15
          },
          14,
          {
            152,
            122,
            15
          }
        },
        {
          6,
          {
            75,
            47,
            14
          },
          34,
          {
            76,
            48,
            14
          }
        },
        {
          46,
          {
            54,
            24,
            15
          },
          10,
          {
            55,
            25,
            15
          }
        },
        {
          2,
          {
            45,
            15,
            15
          },
          64,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          17,
          {
            152,
            122,
            15
          },
          4,
          {
            153,
            123,
            15
          }
        },
        {
          29,
          {
            74,
            46,
            14
          },
          14,
          {
            75,
            47,
            14
          }
        },
        {
          49,
          {
            54,
            24,
            15
          },
          10,
          {
            55,
            25,
            15
          }
        },
        {
          24,
          {
            45,
            15,
            15
          },
          46,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          4,
          {
            152,
            122,
            15
          },
          18,
          {
            153,
            123,
            15
          }
        },
        {
          13,
          {
            74,
            46,
            14
          },
          32,
          {
            75,
            47,
            14
          }
        },
        {
          48,
          {
            54,
            24,
            15
          },
          14,
          {
            55,
            25,
            15
          }
        },
        {
          42,
          {
            45,
            15,
            15
          },
          32,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          20,
          {
            147,
            117,
            15
          },
          4,
          {
            148,
            118,
            15
          }
        },
        {
          40,
          {
            75,
            47,
            14
          },
          7,
          {
            76,
            48,
            14
          }
        },
        {
          43,
          {
            54,
            24,
            15
          },
          22,
          {
            55,
            25,
            15
          }
        },
        {
          10,
          {
            45,
            15,
            15
          },
          67,
          {
            46,
            16,
            15
          }
        }
      },
      {
        {
          19,
          {
            148,
            118,
            15
          },
          6,
          {
            149,
            119,
            15
          }
        },
        {
          18,
          {
            75,
            47,
            14
          },
          31,
          {
            76,
            48,
            14
          }
        },
        {
          34,
          {
            54,
            24,
            15
          },
          34,
          {
            55,
            25,
            15
          }
        },
        {
          20,
          {
            45,
            15,
            15
          },
          61,
          {
            46,
            16,
            15
          }
        }
      }
    }
    local _ = {
      0,
      7,
      7,
      7,
      7,
      7,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      4,
      4,
      4,
      4,
      4,
      4,
      3,
      3,
      3,
      3,
      3,
      3,
      3,
      0,
      0,
      0,
      0,
      0,
      0
    }
    
    local function fw(eX, eW, de)
      if type(de) == "table" then
        local fp = ""
        for Q = 1, #de do
          fp = fp .. eC(de[Q], 8)
        end
        de = fp
      end
      local fx = fv[eX][eW]
      if s[9][7] < s[9][2] then
        return {}
      end
      local fy, fz
      local fA = {}
      local fB = {}
      local fC = 1
      local fD = 0
      local fE = 0
      for Q = 1, #fx / 2 do
        for cr = 1, fx[2 * Q - 1] do
          fy = fx[2 * Q][2]
          fz = fx[2 * Q][1] - fx[2 * Q][2]
          fE = fE + fz * 8
          fA[#fA + 1] = string.sub(de, fD * 8 + 1, (fD + fy) * 8)
          local fF = fm(fA[#fA], fz)
          local fG = ""
          for ag = 1, #fF do
            fG = fG .. eC(fF[ag], 8)
          end
          fB[#fB + 1] = fG
          fD = fD + fy
          fC = fC + 1
        end
      end
      local fH = ""
      fD = 1
      repeat
        for Q = 1, #fA do
          if fD < #fA[Q] then
            fH = fH .. string.sub(fA[Q], fD, fD + 7)
          end
        end
        fD = fD + 8
      until #fH == #de
      local fI = ""
      fD = 1
      repeat
        for Q = 1, #fB do
          if fD < #fB[Q] then
            fI = fI .. string.sub(fB[Q], fD, fD + 7)
          end
        end
        fD = fD + 8
      until #fI == fE
      return fH .. fI
    end
    
    local function fJ(fK)
      local fL = #fK
      for Q = 1, 8 do
        for af = 1, 8 do
          fK[Q][af] = -2
          fK[fL - 8 + Q][af] = -2
          fK[Q][fL - 8 + af] = -2
        end
      end
      for Q = 1, 7 do
        fK[1][Q] = 2
        fK[7][Q] = 2
        fK[Q][1] = 2
        fK[Q][7] = 2
        fK[fL][Q] = 2
        fK[fL - 6][Q] = 2
        fK[fL - Q + 1][1] = 2
        fK[fL - Q + 1][7] = 2
        fK[1][fL - Q + 1] = 2
        fK[7][fL - Q + 1] = 2
        fK[Q][fL - 6] = 2
        fK[Q][fL] = 2
      end
      for Q = 1, 3 do
        for af = 1, 3 do
          fK[2 + af][Q + 2] = 2
          fK[fL - af - 1][Q + 2] = 2
          fK[2 + af][fL - Q - 1] = 2
        end
      end
    end
    
    local function fM(fK)
      local fN, fO
      fN = 7
      fO = 9
      if -5 ~= s[12][2] - s[12][9] then
        return -1
      end
      for Q = fO, #fK - 8 do
        if 1 == math.fmod(Q, 2) then
          fK[Q][fN] = 2
        else
          fK[Q][fN] = -2
        end
      end
      for Q = fO, #fK - 8 do
        if 1 == math.fmod(Q, 2) then
          fK[fN][Q] = 2
        else
          fK[fN][Q] = -2
        end
      end
    end
    
    local fP = {
      {},
      {6, 18},
      {6, 22},
      {6, 26},
      {6, 30},
      {6, 34},
      {
        6,
        22,
        38
      },
      {
        6,
        24,
        42
      },
      {
        6,
        26,
        46
      },
      {
        6,
        28,
        50
      },
      {
        6,
        30,
        54
      },
      {
        6,
        32,
        58
      },
      {
        6,
        34,
        62
      },
      {
        6,
        26,
        46,
        66
      },
      {
        6,
        26,
        48,
        70
      },
      {
        6,
        26,
        50,
        74
      },
      {
        6,
        30,
        54,
        78
      },
      {
        6,
        30,
        56,
        82
      },
      {
        6,
        30,
        58,
        86
      },
      {
        6,
        34,
        62,
        90
      },
      {
        6,
        28,
        50,
        72,
        94
      },
      {
        6,
        26,
        50,
        74,
        98
      },
      {
        6,
        30,
        54,
        78,
        102
      },
      {
        6,
        28,
        54,
        80,
        106
      },
      {
        6,
        32,
        58,
        84,
        110
      },
      {
        6,
        30,
        58,
        86,
        114
      },
      {
        6,
        34,
        62,
        90,
        118
      },
      {
        6,
        26,
        50,
        74,
        98,
        122
      },
      {
        6,
        30,
        54,
        78,
        102,
        126
      },
      {
        6,
        26,
        52,
        78,
        104,
        130
      },
      {
        6,
        30,
        56,
        82,
        108,
        134
      },
      {
        6,
        34,
        60,
        86,
        112,
        138
      },
      {
        6,
        30,
        58,
        86,
        114,
        142
      },
      {
        6,
        34,
        62,
        90,
        118,
        146
      },
      {
        6,
        30,
        54,
        78,
        102,
        126,
        150
      },
      {
        6,
        24,
        50,
        76,
        102,
        128,
        154
      },
      {
        6,
        28,
        54,
        80,
        106,
        132,
        158
      },
      {
        6,
        32,
        58,
        84,
        110,
        136,
        162
      },
      {
        6,
        26,
        54,
        82,
        110,
        138,
        166
      },
      {
        6,
        30,
        58,
        86,
        114,
        142,
        170
      }
    }
    
    local function fQ(fK)
      local eX = (#fK - 17) / 4
      local fR = fP[eX]
      local fS, fT
      for ag = 1, #fR do
        for ah = 1, #fR do
          if (1 ~= ag or 1 ~= ah) and (ag ~= #fR or 1 ~= ah) and (1 ~= ag or ah ~= #fR) then
            fS = fR[ag] + 1
            fT = fR[ah] + 1
            fK[fS][fT] = 2
            fK[fS + 1][fT] = -2
            fK[fS - 1][fT] = -2
            fK[fS + 2][fT] = 2
            fK[fS - 2][fT] = 2
            fK[fS][fT - 2] = 2
            fK[fS + 1][fT - 2] = 2
            fK[fS - 1][fT - 2] = 2
            fK[fS + 2][fT - 2] = 2
            fK[fS - 2][fT - 2] = 2
            fK[fS][fT + 2] = 2
            fK[fS + 1][fT + 2] = 2
            fK[fS - 1][fT + 2] = 2
            fK[fS + 2][fT + 2] = 2
            fK[fS - 2][fT + 2] = 2
            fK[fS][fT - 1] = -2
            fK[fS + 1][fT - 1] = -2
            fK[fS - 1][fT - 1] = -2
            fK[fS + 2][fT - 1] = 2
            fK[fS - 2][fT - 1] = 2
            fK[fS][fT + 1] = -2
            fK[fS + 1][fT + 1] = -2
            fK[fS - 1][fT + 1] = -2
            fK[fS + 2][fT + 1] = 2
            fK[fS - 2][fT + 1] = 2
          end
        end
      end
    end
    
    local fU = {
      {
        [-1] = "111111111111111",
        [0] = "111011111000100",
        "111001011110011",
        "111110110101010",
        "111100010011101",
        "110011000101111",
        "110001100011000",
        "110110001000001",
        "110100101110110"
      },
      {
        [-1] = "111111111111111",
        [0] = "101010000010010",
        "101000100100101",
        "101111001111100",
        "101101101001011",
        "100010111111001",
        "100000011001110",
        "100111110010111",
        "100101010100000"
      },
      {
        [-1] = "111111111111111",
        [0] = "011010101011111",
        "011000001101000",
        "011111100110001",
        "011101000000110",
        "010010010110100",
        "010000110000011",
        "010111011011010",
        "010101111101101"
      },
      {
        [-1] = "111111111111111",
        [0] = "001011010001001",
        "001001110111110",
        "001110011100111",
        "001100111010000",
        "000011101100010",
        "000001001010101",
        "000110100001100",
        "000100000111011"
      }
    }
    
    local function fV(eH, eW, fW)
      local fX = fU[eW][fW]
      local J
      for Q = 1, 7 do
        J = string.sub(fX, Q, Q)
        eG(eH, J, 9, #eH - Q + 1)
      end
      if p[1][10] * p[1][4] <= p[1][13] then
        return p[1][13]
      end
      for Q = 8, 9 do
        J = string.sub(fX, Q, Q)
        eG(eH, J, 9, 17 - Q)
      end
      for Q = 10, 15 do
        J = string.sub(fX, Q, Q)
        eG(eH, J, 9, 16 - Q)
      end
      for Q = 1, 6 do
        J = string.sub(fX, Q, Q)
        eG(eH, J, Q, 9)
      end
      J = string.sub(fX, 7, 7)
      eG(eH, J, 8, 9)
      for Q = 8, 15 do
        J = string.sub(fX, Q, Q)
        eG(eH, J, #eH - 15 + Q, 9)
      end
    end
    
    local fY = {
      "001010010011111000",
      "001111011010000100",
      "100110010101100100",
      "110010110010010100",
      "011011111101110100",
      "010001101110001100",
      "111000100001101100",
      "101100000110011100",
      "000101001001111100",
      "000111101101000010",
      "101110100010100010",
      "111010000101010010",
      "010011001010110010",
      "011001011001001010",
      "110000010110101010",
      "100100110001011010",
      "001101111110111010",
      "001000110111000110",
      "100001111000100110",
      "110101011111010110",
      "011100010000110110",
      "010110000011001110",
      "111111001100101110",
      "101011101011011110",
      "000010100100111110",
      "101010111001000001",
      "000011110110100001",
      "010111010001010001",
      "111110011110110001",
      "110100001101001001",
      "011101000010101001",
      "001001100101011001",
      "100000101010111001",
      "100101100011000101"
    }
    
    local function fZ(eH, eX)
      if eX < 7 then
        return
      end
      local fL = #eH
      local eI = fY[eX - 6]
      local ag, ah, J, f_, g0
      f_ = fL - 10
      g0 = 1
      for Q = 1, #eI do
        J = string.sub(eI, Q, Q)
        ag = f_ + math.fmod(Q - 1, 3)
        ah = g0 + math.floor((Q - 1) / 3)
        eG(eH, J, ag, ah)
      end
      f_ = 1
      g0 = fL - 10
      for Q = 1, #eI do
        J = string.sub(eI, Q, Q)
        ag = f_ + math.floor((Q - 1) / 3)
        ah = g0 + math.fmod(Q - 1, 3)
        eG(eH, J, ag, ah)
      end
    end
    
    local function g1(eX, eW, fW)
      local fL
      local fK = {}
      fL = eX * 4 + 17
      if j[11][7] * j[11][9] <= j[11][3] then
        return j[11][3]
      end
      for Q = 1, fL do
        fK[Q] = {}
        for af = 1, fL do
          fK[Q][af] = 0
        end
      end
      fJ(fK)
      fM(fK)
      fZ(fK, eX)
      fK[9][fL - 7] = 2
      fQ(fK)
      fV(fK, eW, fW)
      return fK
    end
    
    local function g2(fW, ag, ah, el)
      ag = ag - 1
      ah = ah - 1
      local g3 = false
      if -1 == fW then
      elseif 0 == fW then
        if 0 == math.fmod(ag + ah, 2) then
          g3 = true
        end
      elseif 1 == fW then
        if 0 == math.fmod(ah, 2) then
          g3 = true
        end
      elseif 2 == fW then
        if 0 == math.fmod(ag, 3) then
          g3 = true
        end
      elseif 3 == fW then
        if 0 == math.fmod(ag + ah, 3) then
          g3 = true
        end
      elseif 4 == fW then
        if 0 == math.fmod(math.floor(ah / 2) + math.floor(ag / 3), 2) then
          g3 = true
        end
      elseif 5 == fW then
        if 0 == math.fmod(ag * ah, 2) + math.fmod(ag * ah, 3) then
          g3 = true
        end
      elseif 6 == fW then
        if 0 == math.fmod(math.fmod(ag * ah, 2) + math.fmod(ag * ah, 3), 2) then
          g3 = true
        end
      elseif 7 == fW then
        if 0 == math.fmod(math.fmod(ag * ah, 3) + math.fmod(ag + ah, 2), 2) then
          g3 = true
        end
      else
        assert(false, "This can't happen (mask must be <= 7)")
      end
      if i[1][2] >= i[1][3] then
        return 3
      end
      if g3 then
        return 1 - 2 * tonumber(el)
      else
        return -1 + 2 * tonumber(el)
      end
    end
    
    local function g4(eH, ag, ah, g5, bl)
      local eF = {}
      local fC = 1
      local eM = "right"
      if p[12][14] >= p[12][12] then
        return 1
      end
      while fC <= #bl do
        if eM == "right" and 0 == eH[ag][ah] then
          eF[#eF + 1] = {ag, ah}
          eM = "left"
          fC = fC + 1
        elseif eM == "left" and 0 == eH[ag - 1][ah] then
          eF[#eF + 1] = {
            ag - 1,
            ah
          }
          eM = "right"
          fC = fC + 1
          if g5 == "up" then
            ah = ah - 1
          else
            ah = ah + 1
          end
        elseif eM == "right" and 0 == eH[ag - 1][ah] then
          eF[#eF + 1] = {
            ag - 1,
            ah
          }
          fC = fC + 1
          if g5 == "up" then
            ah = ah - 1
          else
            ah = ah + 1
          end
        elseif g5 == "up" then
          ah = ah - 1
        else
          ah = ah + 1
        end
        if ah < 1 or ah > #eH then
          ag = ag - 2
          if 7 == ag then
            ag = 6
          end
          if g5 == "up" then
            g5 = "down"
            ah = 1
          else
            g5 = "up"
            ah = #eH
          end
        end
      end
      return eF, ag, ah, g5
    end
    
    local function g6(eH, de, fW)
      local fL = #eH
      local ag, ah, g7
      local g8, g9, cf
      local g5 = "up"
      local ga = 0
      ag, ah = fL, fL
      string.gsub(de, ".?.?.?.?.?.?.?.?", function(bl)
        ga = ga + 1
        g7, ag, ah, g5 = g4(eH, ag, ah, g5, bl)
        for Q = 1, #bl do
          g8 = g7[Q][1]
          g9 = g7[Q][2]
          cf = g2(fW, g8, g9, string.sub(bl, Q, Q))
          if eu then
            eH[g8][g9] = cf * (Q + 10)
          else
            eH[g8][g9] = cf
          end
        end
      end)
    end
    
    local function gb(eH)
      local gc, gd, ge = 0, 0, 0
      local fL = #eH
      local gf = 0
      local gg, gh, gi
      for ag = 1, fL do
        gi = 0
        gg = nil
        for ah = 1, fL do
          if eH[ag][ah] > 0 then
            gf = gf + 1
            gh = false
          else
            gh = true
          end
          if gg == gh then
            gi = gi + 1
          else
            if gi >= 5 then
              gc = gc + gi - 2
            end
            gi = 1
          end
          gg = gh
        end
        if gi >= 5 then
          gc = gc + gi - 2
        end
      end
      for ah = 1, fL do
        gi = 0
        gg = nil
        for ag = 1, fL do
          gh = eH[ag][ah] < 0
          if gg == gh then
            gi = gi + 1
          else
            if gi >= 5 then
              gc = gc + gi - 2
            end
            gi = 1
          end
          gg = gh
        end
        if gi >= 5 then
          gc = gc + gi - 2
        end
      end
      for ag = 1, fL do
        for ah = 1, fL do
          if ah < fL - 1 and ag < fL - 1 and (eH[ag][ah] < 0 and eH[ag + 1][ah] < 0 and eH[ag][ah + 1] < 0 and eH[ag + 1][ah + 1] < 0 or eH[ag][ah] > 0 and eH[ag + 1][ah] > 0 and eH[ag][ah + 1] > 0 and eH[ag + 1][ah + 1] > 0) then
            gd = gd + 3
          end
          if fL > ah + 6 and eH[ag][ah] > 0 and eH[ag][ah + 1] < 0 and eH[ag][ah + 2] > 0 and eH[ag][ah + 3] > 0 and eH[ag][ah + 4] > 0 and eH[ag][ah + 5] < 0 and eH[ag][ah + 6] > 0 and (fL > ah + 10 and eH[ag][ah + 7] < 0 and eH[ag][ah + 8] < 0 and eH[ag][ah + 9] < 0 and eH[ag][ah + 10] < 0 or ah - 4 >= 1 and eH[ag][ah - 1] < 0 and eH[ag][ah - 2] < 0 and eH[ag][ah - 3] < 0 and eH[ag][ah - 4] < 0) then
            ge = ge + 40
          end
          if fL >= ag + 6 and eH[ag][ah] > 0 and eH[ag + 1][ah] < 0 and eH[ag + 2][ah] > 0 and eH[ag + 3][ah] > 0 and eH[ag + 4][ah] > 0 and eH[ag + 5][ah] < 0 and eH[ag + 6][ah] > 0 and (fL >= ag + 10 and eH[ag + 7][ah] < 0 and eH[ag + 8][ah] < 0 and eH[ag + 9][ah] < 0 and eH[ag + 10][ah] < 0 or ag - 4 >= 1 and eH[ag - 1][ah] < 0 and eH[ag - 2][ah] < 0 and eH[ag - 3][ah] < 0 and eH[ag - 4][ah] < 0) then
            ge = ge + 40
          end
        end
      end
      local gj = gf / (fL * fL)
      local gk = math.floor(math.abs(gj * 100 - 50)) * 2
      return gc + gd + ge + gk
    end
    
    local function gl(eX, eW, de, fW)
      local eR = g1(eX, eW, fW)
      g6(eR, de, fW)
      local gm = gb(eR)
      return eR, gm
    end
    
    local function gn(eX, eW, de)
      local eR, gm
      if o[13][11] * o[13][13] <= o[13][4] then
        return o[13][4]
      end
      local go, gp
      go, gp = gl(eX, eW, de, 0)
      for Q = 1, 7 do
        eR, gm = gl(eX, eW, de, Q)
        if gp > gm then
          go = eR
          gp = gm
        end
      end
      return go
    end
    
    local function gq(cL, eW, gr)
      local fH, eX, gs, eM, gt
      eX, eW, gs, eM, gt = eZ(cL, eW)
      gs = gs .. gt
      gs = gs .. f5(cL, eM)
      gs = f6(eX, eW, gs)
      fH = fw(eX, eW, gs)
      if 0 ~= math.fmod(#fH, 8) then
        return false, string.format("Arranged data %% 8 != 0: data length = %d, mod 8 = %d", #fH, math.fmod(#fH, 8))
      end
      fH = fH .. string.rep("0", _[eX])
      local eR = gn(eX, eW, fH)
      if o[11][4] < o[11][1] then
        return {}
      end
      return true, eR
    end
    
    if et then
      return {
        encode_string_numeric = f1,
        encode_string_ascii = f3,
        qrcode = gq,
        binary = eC,
        get_mode = eJ,
        get_length = eY,
        add_pad_data = f6,
        get_generator_polynominal_adjusted = fe,
        get_pixel_with_mask = g2,
        get_version_eclevel_mode_bistringlength = eZ,
        remainder = _,
        arrange_codewords_and_calculate_ec = fw,
        calculate_error_correction = fm,
        convert_bitstring_to_bytes = fd,
        bit_xor = ez
      }
    end
    return {qrcode = gq}
  end
  
  es = es(A)
  A.a4f642bf = es
  
  local function gu(...)
    local gv = {}
    local gw = setmetatable({}, {
      __call = function(self, ...)
        local E = setmetatable({}, {__index = self})
        E:constructor(nil)
        return E
      end
    })
    
    function gw:constructor(gx)
      self.pixels = gx
      self.width = #gx[1]
      self.height = #gx
    end
    
    local gy = {
      ["Y8"] = 8,
      ["A1R5G5B5"] = 16,
      ["B8G8R8"] = 24,
      ["B8G8R8A8"] = 32
    }
    
    function gw:encode_colormap_spec(gz)
      local gA = gz.colormap
      local gB = 0
      if 0 ~= #gA then
        gB = gy[gz.color_format]
        for cr, gC in ipairs(self.pixels) do
          for cr, gD in ipairs(gC) do
            local gE = gD[1]
            if gE >= #gA then
              error("colormap index " .. gE .. " not in colormap of size " .. #gA)
            end
          end
        end
      end
      local gF = string.char(0, 0) .. string.char(#gA % 256, math.floor(#gA / 256)) .. string.char(gB)
      self.data = self.data .. gF
    end
    
    function gw:encode_image_spec(gz)
      local gG = gz.color_format
      assert("Y8" == gG or "A1R5G5B5" == gG or "B8G8R8" == gG or "B8G8R8A8" == gG)
      local gH
      if 0 ~= #gz.colormap then
        gH = self.pixel_depth
      else
        gH = gy[gG]
      end
      assert(nil ~= gH)
      self.data = self.data .. string.char(0, 0) .. string.char(0, 0) .. string.char(self.width % 256, math.floor(self.width / 256)) .. string.char(self.height % 256, math.floor(self.height / 256)) .. string.char(gH) .. string.char(0)
    end
    
    function gw:encode_colormap(gz)
      local gA = gz.colormap
      if 0 == #gA then
        return
      end
      local gG = gz.color_format
      assert("A1R5G5B5" == gG or "B8G8R8" == gG or "B8G8R8A8" == gG)
      local gI = {}
      if "A1R5G5B5" == gG then
        local gJ = math.pow(2, 8) - 1
        local gK = math.pow(2, 5) - 1
        for Q = 1, #gA do
          local gL = gA[Q]
          local gM = 32768 + math.floor(gL[1] * gK / gJ + 0.5) * 1024 + math.floor(gL[2] * gK / gJ + 0.5) * 32 + math.floor(gL[3] * gK / gJ + 0.5) * 1
          local gN = string.char(gM % 256, math.floor(gM / 256))
          gI[#gI + 1] = gN
        end
      elseif "B8G8R8" == gG then
        for Q = 1, #gA do
          local gL = gA[Q]
          local gN = string.char(gL[3], gL[2], gL[1])
          gI[#gI + 1] = gN
        end
      elseif "B8G8R8A8" == gG then
        for Q = 1, #gA do
          local gL = gA[Q]
          local gN = string.char(gL[3], gL[2], gL[1], gL[4])
          gI[#gI + 1] = gN
        end
      end
      assert(0 ~= #gI)
      self.data = self.data .. table.concat(gI)
    end
    
    function gw:encode_header(gz)
      local gG = gz.color_format
      local gA = gz.colormap
      local gO = gz.compression
      local gP, gQ
      if "Y8" == gG and "RAW" == gO then
        gP = 0
        gQ = 3
      elseif "A1R5G5B5" == gG or "B8G8R8" == gG or "B8G8R8A8" == gG then
        if "RAW" == gO then
          if 0 ~= #gA then
            gP = 1
            gQ = 1
          else
            gP = 0
            gQ = 2
          end
        elseif "RLE" == gO then
          gP = 0
          gQ = 10
        end
      end
      assert(nil ~= gP)
      assert(nil ~= gQ)
      self.data = self.data .. string.char(0) .. string.char(gP) .. string.char(gQ)
      self:encode_colormap_spec(gz)
      self:encode_image_spec(gz)
      self:encode_colormap(gz)
    end
    
    function gw:encode_data(gz)
      local gG = gz.color_format
      local gA = gz.colormap
      local gO = gz.compression
      local gR = #self.data
      if "Y8" == gG and "RAW" == gO then
        if 8 == self.pixel_depth then
          self:encode_data_Y8_as_Y8_raw()
        elseif 24 == self.pixel_depth then
          self:encode_data_R8G8B8_as_Y8_raw()
        end
      elseif "A1R5G5B5" == gG then
        if 0 ~= #gA then
          if "RAW" == gO and 8 == self.pixel_depth then
            self:encode_data_Y8_as_Y8_raw()
          end
        elseif "RAW" == gO then
          self:encode_data_R8G8B8_as_A1R5G5B5_raw()
        elseif "RLE" == gO then
          self:encode_data_R8G8B8_as_A1R5G5B5_rle()
        end
      elseif "B8G8R8" == gG then
        if 0 ~= #gA then
          if "RAW" == gO and 8 == self.pixel_depth then
            self:encode_data_Y8_as_Y8_raw()
          end
        elseif "RAW" == gO then
          self:encode_data_R8G8B8_as_B8G8R8_raw()
        elseif "RLE" == gO then
          self:encode_data_R8G8B8_as_B8G8R8_rle()
        end
      elseif "B8G8R8A8" == gG then
        if 0 ~= #gA then
          if "RAW" == gO and 8 == self.pixel_depth then
            self:encode_data_Y8_as_Y8_raw()
          end
        elseif "RAW" == gO then
          self:encode_data_R8G8B8A8_as_B8G8R8A8_raw()
        elseif "RLE" == gO then
          self:encode_data_R8G8B8A8_as_B8G8R8A8_rle()
        end
      end
      local gS = #self.data
      assert(gS ~= gR, "No data encoded for color format: " .. gG)
    end
    
    function gw:encode_data_Y8_as_Y8_raw()
      assert(8 == self.pixel_depth)
      local gT = {}
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          local gU = string.char(gD[1])
          gT[#gT + 1] = gU
        end
      end
      self.data = self.data .. table.concat(gT)
    end
    
    function gw:encode_data_R8G8B8_as_Y8_raw()
      assert(24 == self.pixel_depth)
      local gT = {}
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          local gV = math.floor(math.sqrt(0.299 * gD[1] ^ 2 + 0.587 * gD[2] ^ 2 + 0.114 * gD[3] ^ 2) + 0.5)
          local gU = string.char(gV)
          gT[#gT + 1] = gU
        end
      end
      self.data = self.data .. table.concat(gT)
    end
    
    function gw:encode_data_R8G8B8_as_A1R5G5B5_raw()
      assert(24 == self.pixel_depth)
      local gT = {}
      local gJ = math.pow(2, 8) - 1
      local gK = math.pow(2, 5) - 1
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          local gM = 32768 + math.floor(gD[1] * gK / gJ + 0.5) * 1024 + math.floor(gD[2] * gK / gJ + 0.5) * 32 + math.floor(gD[3] * gK / gJ + 0.5) * 1
          local gU = string.char(gM % 256, math.floor(gM / 256))
          gT[#gT + 1] = gU
        end
      end
      self.data = self.data .. table.concat(gT)
    end
    
    function gw:encode_data_R8G8B8_as_A1R5G5B5_rle()
      assert(24 == self.pixel_depth)
      local gM, gW, gX, gY
      local gU = ""
      local gT = {}
      local fC = 1
      local gZ = {}
      local g_ = ""
      local h0 = ""
      local gJ = math.pow(2, 8) - 1
      local gK = math.pow(2, 5) - 1
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          if gD[1] ~= gW or gD[2] ~= gX or gD[3] ~= gY or 128 == fC then
            if nil ~= gW then
              gM = 32768 + math.floor(gW * gK / gJ + 0.5) * 1024 + math.floor(gX * gK / gJ + 0.5) * 32 + math.floor(gY * gK / gJ + 0.5) * 1
              if 1 == fC then
                gU = string.char(gM % 256, math.floor(gM / 256))
                gT[#gT + 1] = gU
                if 128 == #gT then
                  g_ = string.char(#gT - 1)
                  gZ[#gZ + 1] = g_
                  for Q = 1, #gT do
                    gZ[#gZ + 1] = gT[Q]
                  end
                  gT = {}
                end
              else
                if #gT > 0 then
                  g_ = string.char(#gT - 1)
                  gZ[#gZ + 1] = g_
                  for Q = 1, #gT do
                    gZ[#gZ + 1] = gT[Q]
                  end
                  gT = {}
                end
                h0 = string.char(128 + fC - 1, gM % 256, math.floor(gM / 256))
                gZ[#gZ + 1] = h0
              end
            end
            fC = 1
            gW = gD[1]
            gX = gD[2]
            gY = gD[3]
          else
            fC = fC + 1
          end
        end
      end
      gM = 32768 + math.floor(gW * gK / gJ + 0.5) * 1024 + math.floor(gX * gK / gJ + 0.5) * 32 + math.floor(gY * gK / gJ + 0.5) * 1
      if 1 == fC then
        gU = string.char(gM % 256, math.floor(gM / 256))
        gT[#gT + 1] = gU
        g_ = string.char(#gT - 1)
        gZ[#gZ + 1] = g_
        for Q = 1, #gT do
          gZ[#gZ + 1] = gT[Q]
        end
        gT = {}
      else
        if #gT > 0 then
          g_ = string.char(#gT - 1)
          gZ[#gZ + 1] = g_
          for Q = 1, #gT do
            gZ[#gZ + 1] = gT[Q]
          end
          gT = {}
        end
        h0 = string.char(128 + fC - 1, gM % 256, math.floor(gM / 256))
        gZ[#gZ + 1] = h0
      end
      self.data = self.data .. table.concat(gZ)
    end
    
    function gw:encode_data_R8G8B8_as_B8G8R8_raw()
      assert(24 == self.pixel_depth)
      local gT = {}
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          local gU = string.char(gD[3], gD[2], gD[1])
          gT[#gT + 1] = gU
        end
      end
      self.data = self.data .. table.concat(gT)
    end
    
    function gw:encode_data_R8G8B8_as_B8G8R8_rle()
      assert(24 == self.pixel_depth)
      local gW, gX, gY
      local gU = ""
      local gT = {}
      local fC = 1
      local gZ = {}
      local g_ = ""
      local h0 = ""
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          if gD[1] ~= gW or gD[2] ~= gX or gD[3] ~= gY or 128 == fC then
            if nil ~= gW then
              if 1 == fC then
                gU = string.char(gY, gX, gW)
                gT[#gT + 1] = gU
                if 128 == #gT then
                  g_ = string.char(#gT - 1)
                  gZ[#gZ + 1] = g_
                  for Q = 1, #gT do
                    gZ[#gZ + 1] = gT[Q]
                  end
                  gT = {}
                end
              else
                if #gT > 0 then
                  g_ = string.char(#gT - 1)
                  gZ[#gZ + 1] = g_
                  for Q = 1, #gT do
                    gZ[#gZ + 1] = gT[Q]
                  end
                  gT = {}
                end
                h0 = string.char(128 + fC - 1, gY, gX, gW)
                gZ[#gZ + 1] = h0
              end
            end
            fC = 1
            gW = gD[1]
            gX = gD[2]
            gY = gD[3]
          else
            fC = fC + 1
          end
        end
      end
      if 1 == fC then
        gU = string.char(gY, gX, gW)
        gT[#gT + 1] = gU
        g_ = string.char(#gT - 1)
        gZ[#gZ + 1] = g_
        for Q = 1, #gT do
          gZ[#gZ + 1] = gT[Q]
        end
        gT = {}
      else
        if #gT > 0 then
          g_ = string.char(#gT - 1)
          gZ[#gZ + 1] = g_
          for Q = 1, #gT do
            gZ[#gZ + 1] = gT[Q]
          end
          gT = {}
        end
        h0 = string.char(128 + fC - 1, gY, gX, gW)
        gZ[#gZ + 1] = h0
      end
      self.data = self.data .. table.concat(gZ)
    end
    
    function gw:encode_data_R8G8B8A8_as_B8G8R8A8_raw()
      assert(32 == self.pixel_depth)
      local gT = {}
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          local gU = string.char(gD[3], gD[2], gD[1], gD[4])
          gT[#gT + 1] = gU
        end
      end
      self.data = self.data .. table.concat(gT)
    end
    
    function gw:encode_data_R8G8B8A8_as_B8G8R8A8_rle()
      assert(32 == self.pixel_depth)
      local gW, gX, gY, h1
      local gU = ""
      local gT = {}
      local fC = 1
      local gZ = {}
      local g_ = ""
      local h0 = ""
      for cr, gC in ipairs(self.pixels) do
        for cr, gD in ipairs(gC) do
          if gD[1] ~= gW or gD[2] ~= gX or gD[3] ~= gY or gD[4] ~= h1 or 128 == fC then
            if nil ~= gW then
              if 1 == fC then
                gU = string.char(gY, gX, gW, h1)
                gT[#gT + 1] = gU
                if 128 == #gT then
                  g_ = string.char(#gT - 1)
                  gZ[#gZ + 1] = g_
                  for Q = 1, #gT do
                    gZ[#gZ + 1] = gT[Q]
                  end
                  gT = {}
                end
              else
                if #gT > 0 then
                  g_ = string.char(#gT - 1)
                  gZ[#gZ + 1] = g_
                  for Q = 1, #gT do
                    gZ[#gZ + 1] = gT[Q]
                  end
                  gT = {}
                end
                h0 = string.char(128 + fC - 1, gY, gX, gW, h1)
                gZ[#gZ + 1] = h0
              end
            end
            fC = 1
            gW = gD[1]
            gX = gD[2]
            gY = gD[3]
            h1 = gD[4]
          else
            fC = fC + 1
          end
        end
      end
      if 1 == fC then
        gU = string.char(gY, gX, gW, h1)
        gT[#gT + 1] = gU
        g_ = string.char(#gT - 1)
        gZ[#gZ + 1] = g_
        for Q = 1, #gT do
          gZ[#gZ + 1] = gT[Q]
        end
        gT = {}
      else
        if #gT > 0 then
          g_ = string.char(#gT - 1)
          gZ[#gZ + 1] = g_
          for Q = 1, #gT do
            gZ[#gZ + 1] = gT[Q]
          end
          gT = {}
        end
        h0 = string.char(128 + fC - 1, gY, gX, gW, h1)
        gZ[#gZ + 1] = h0
      end
      self.data = self.data .. table.concat(gZ)
    end
    
    function gw:encode_footer()
      self.data = self.data .. string.char(0, 0, 0, 0) .. string.char(0, 0, 0, 0) .. "TRUEVISION-XFILE" .. "." .. string.char(0)
    end
    
    function gw:encode(gz)
      local gz = gz or {}
      gz.colormap = gz.colormap or {}
      gz.compression = gz.compression or "RAW"
      self.pixel_depth = #self.pixels[1][1] * 8
      local h2 = {
        [8] = "Y8",
        [24] = "B8G8R8",
        [32] = "B8G8R8A8"
      }
      if nil == gz.color_format then
        if 0 ~= #gz.colormap then
          gz.color_format = h2[#gz.colormap[1] * 8]
        else
          gz.color_format = h2[self.pixel_depth]
        end
      end
      assert(nil ~= gz.color_format)
      self.data = ""
      self:encode_header(gz)
      self:encode_data(gz)
      self:encode_footer()
    end
    
    function gw:save(h3, gz)
      self:encode(gz)
      local ax = assert(io.open(h3, "wb"))
      ax:write(self.data)
      ax:close()
    end
    
    gv.image = gw
    return gv
  end
  
  gu = gu()
  A.a89d151d = gu
  
  local function h4(...)
    local A = select(1, ...)
    local y = select(2, ...)
    local x = GetPathSeparator()
    local h5 = {}
    
    function h5.aaf7c378()
      return Root().GraphicsRoot.TextureCollect.Textures
    end
    
    local function h6(h7, h8)
      local h9 = {}
      local ha = #h7
      local hb = #h7[1]
      for ah = 1, hb * h8 do
        local hc = math.floor((ah - 1) / h8) + 1
        local gC = {}
        for ag = 1, ha * h8 do
          local hd = math.floor((ag - 1) / h8) + 1
          gC[ag] = h7[hd][hc]
        end
        h9[ah] = gC
      end
      return h9
    end
    
    function h5.a89933ba(he, hf)
      local hg = GetPath(GetPathType(h5.aaf7c378()))
      local hh = string.format("MATools_QR_%s", hf)
      local hi = string.format("%s.tga", hh)
      hg = A.abb67167(hg, hi)
      local dc, hj = A.a4f642bf.qrcode(he)
      if not dc then
        return
      end
      local hk = {
        0,
        0,
        0
      }
      local hl = {
        255,
        92,
        0
      }
      for hm, hn in pairs(hj) do
        for ho, hp in pairs(hn) do
          if hp < 0 then
            hn[ho] = hk
          else
            hn[ho] = hl
          end
        end
      end
      local hq = h6(hj, 4)
      A.a89d151d.image(hq):save(hg)
      if h5.aaf7c378()[hh] then
        Obj.Set(h5.aaf7c378(), "Lock", "No")
        Obj.Remove(h5.aaf7c378(), Obj.Index(h5.aaf7c378()[hh]))
        Obj.Set(h5.aaf7c378(), "Lock", "Yes")
      end
      local hr
      if not h5.aaf7c378()[hh] and pcall(A.a1308137, hg) then
        Obj.Set(h5.aaf7c378(), "Lock", "No")
        hr = Obj.Append(h5.aaf7c378())
        Obj.Set(hr, "Name", hh)
        Obj.Set(hr, "FileName", hi)
        Obj.Set(h5.aaf7c378(), "Lock", "Yes")
      end
      if not hr then
        return nil, "Failed to generate QR code"
      end
      return hr
    end
    
    function h5.ae5ca2e8(hs, ht)
      local z = GetFocusDisplay().No
      if z >= 4 and z <= 7 then
        z = 1
      end
      local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(z)
      local hv = hu.ModalOverlay
      local hw
      local hx = 600
      hw = Obj.Append(hv, "BaseInput")
      hw["Name"] = y.plugin_label .. "QRWindow"
      hw["H"] = "300"
      hw["W"] = hx
      hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
      hw["MinSize"] = string.format("%s,0", hx - 100)
      hw["Rows"] = 2
      hw["Columns"] = 1
      hw[1][1]["SizePolicy"] = "Fixed"
      hw[1][1]["Size"] = "60"
      hw[1][2]["SizePolicy"] = "Stretch"
      hw["AutoClose"] = "No"
      hw["CloseOnEscape"] = "No"
      hw["Visible"] = "No"
      local hy = Obj.Append(hw, "TitleBar")
      hy["Rows"] = 1
      hy["Columns"] = 2
      hy["Anchors"] = "0,0"
      hy[2][2]["SizePolicy"] = "Fixed"
      hy[2][2]["Size"] = "50"
      hy["Texture"] = "corner2"
      local hz = Obj.Append(hy, "TitleButton")
      hz["text"] = string.format("%s", y.g_full_label)
      hz["Texture"] = "corner1"
      hz["Anchors"] = "0,0"
      hz["Icon"] = y.company_label
      local hA = Obj.Append(hy, "CloseButton")
      hA["Anchors"] = "1,0"
      hA["Texture"] = "corner2"
      hA["HideFocusFrame"] = true
      local hB = Obj.Append(hw, "DialogFrame")
      hB["H"] = "100%"
      hB["W"] = "100%"
      hB["Rows"] = 2
      hB["Columns"] = 1
      hB["Anchors"] = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
      }
      hB[1][1]["SizePolicy"] = "Fixed"
      hB[1][1]["Size"] = 100
      hB[1][2]["SizePolicy"] = "Fixed"
      hB[1][2]["Size"] = hx
      local hC = Obj.Append(hB, "UIObject")
      hC["text"] = string.format("Please scan the QR code to open the link")
      hC["ContentDriven"] = "Yes"
      hC["ContentWidth"] = "No"
      hC["TextAutoAdjust"] = "Yes"
      hC["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      hC["Padding"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      hC["Margin"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 1
      }
      hC["Font"] = "Medium20"
      hC["HasHover"] = "No"
      if ht then
        hC["text"] = ht
      end
      local hD = Obj.Append(hB, "UIObject")
      hD["Anchors"] = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
      }
      hD["HasHover"] = false
      hD["Margin"] = {
        left = 100,
        right = 100,
        top = 100,
        bottom = 100
      }
      hD["Texture"] = hs
      hD["BackColor"] = Root().ColorTheme.ColorGroups.Global.Neutral
      hD["PluginComponent"] = y.g_arg4
      hD["Clicked"] = "OnQrCodeClicked"
      hw["Visible"] = "Yes"
      Obj.ShowModal(hw)
      WaitObjectDelete(hw)
    end
    
    function h5.a08e77f1(hs)
      if not hs then
        return
      end
      if not Obj.IsValid(hs) then
        return
      end
      local hg = GetPath(GetPathType(h5.aaf7c378()))
      hg = A.abb67167(hg, hs.FileName)
      Obj.Delete(Obj.Parent(hs), Obj.Index(hs))
      if FileExists(hg) then
        os.remove(hg)
      end
    end
    
    function h5.ae513433(h4, ht, hE)
      local hF = A.a227fb71()
      if HostOS() == "Mac" and hF and not hE then
        os.execute(string.format("open \"%s\"", h4))
      elseif HostOS() == "Windows" and hF and not hE then
        os.execute(string.format("start /max %s", h4))
      else
        local hs = h5.a89933ba(h4, A.ac1abf02())
        if not hs then
          return
        end
        h5.ae5ca2e8(hs, ht)
        h5.a08e77f1(hs)
      end
    end
    
    return h5
  end
  
  h4 = h4(A, y)
  A.adf0373b = h4
  
  function A.a1a67d56(hG)
    local e = string.gsub(hG, "([%^%$%(%)%%%.%[%]%*%+%-%?])", "%%%1")
    return e
  end
  
  function A.a712b18d(hH, hI)
    local hJ = GetFocusDisplay() or hI or Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(1)
    if not hJ then
      error("FocusDisplay cannot be found")
    end
    local hK = hJ.No
    if not hK then
      error("FocusDisplay cannot be indexed")
    end
    if hH and hK >= 4 and hK <= 7 then
      hJ = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(1)
    end
    return hJ
  end
  
  function A.a880c84e(hL, hM, hN)
    local h4 = string.match(hM, "link%((.-)%)")
    if h4 then
      hM = string.gsub(hM, "link%((.-)%)", "%1")
    end
    local hO = {
      title = hL,
      icon = y.company_label,
      message = hM,
      commands = {
        {
          value = 1,
          name = "Ok"
        }
      }
    }
    if not hN then
      hO.commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Ok"
        }
      }
    end
    if h4 and HostType() == "onPC" then
      table.insert(hO.commands, {
        value = 2,
        name = "Open"
      })
    end
    local hP = MessageBox(hO)
    if 2 == hP.result then
      A.adf0373b.ae513433(h4)
      hP.result = 1
    end
    return hP.result
  end
  
  local function hQ(hR)
    local hS = ""
    local hT = hR % 10
    local hU = hR % 100
    if hU >= 11 and hU <= 13 then
      hS = "th"
    elseif 1 == hT then
      hS = "st"
    elseif 2 == hT then
      hS = "nd"
    elseif 3 == hT then
      hS = "rd"
    else
      hS = "th"
    end
    return hS
  end
  
  function A.ae6ecdc5(h3, hV, hW)
    local hX = os.date("%y-%m-%d")
    local hY = os.date("%H%M%S")
    local hZ = hX .. "_" .. hY
    local h_ = y.g_unset_a
    if not h_ or not Obj.IsValid(h_) then
      h_ = Root().Temp.DriveCollect.Internal
    end
    local i0 = A.ac202e2a(h_.Path)
    local i1 = A.abb67167(i0, "logs")
    local i2
    if hW then
      i2 = A.abb67167(i1, string.format("%s_%s.%s", hZ, h3, hV))
    else
      i2 = A.abb67167(i1, string.format("%s.%s", h3, hV))
    end
    CreateDirectoryRecursive(i1)
    return i2
  end
  
  function A.a2d262f5(eo, i3, i4)
    if not y.g_running then
      return
    end
    if type(eo) ~= "table" then
      Printf(string.format("Not a table: %s", eo))
      if i4 then
        i4:write(string.format("Not a table: %s\n", eo))
      end
      return
    end
    i3 = i3 or ""
    for ac, e4 in pairs(eo) do
      if type(e4) == "table" then
        Printf(i3 .. tostring(ac) .. " : {")
        if i4 then
          i4:write(i3 .. tostring(ac) .. " : {\n")
        end
        A.a2d262f5(e4, i3 .. "  ", i4)
        Printf(i3 .. "}")
        if i4 then
          i4:write(i3 .. "}\n")
        end
      else
        Printf(i3 .. tostring(ac) .. " : " .. tostring(e4))
        if i4 then
          i4:write(i3 .. tostring(ac) .. " : " .. tostring(e4) .. "\n")
        end
      end
    end
  end
  
  function A.a4b25f9e(i5, ...)
    if not y.g_running then
      return
    end
    local i6 = {
      [8] = nil,
      ...
    }
    local i7 = string.format(i5, table.unpack(i6))
    Printf(string.format("%s - Debug: %s", y.plugin_label, i7))
    local i2 = A.ae6ecdc5("debug", "txt", false)
    local i8 = "w"
    if FileExists(i2) then
      i8 = "a"
    end
    local ax = io.open(i2, i8)
    if ax then
      ax:write(i7)
      ax:write("\n")
      ax:close()
    end
  end
  
  function A.a9b6aa97(i9)
    local ia = "Local Variables:"
    local Q = 1
    local ib
    repeat
      local ic
      ib, ic = debug.getlocal(i9 or 2, Q)
      if ib then
        ia = ia .. string.format("\nName: %s    Value: %s", ib, ic or "nil")
      end
      Q = Q + 1
    until not ib
    return ia
  end
  
  function A.ab61e23f()
    return os.clock()
  end
  
  function A.ac167e2b(id, ie)
    ie = ie or "MATools Code Timer"
    local ig = os.clock()
    local ih = ig - id
    A.a4b25f9e()
  end
  
  function A.ae996e5a(ii, dH)
    dH = dH or {}
    if dH.a0f521dd then
      if dH.ac786d64 then
        return io.popen(ii)
      else
        return io.popen(ii):read("*all")
      end
    else
      local ij = os.tmpname()
      os.remove(ij)
      local ik = "%s > \"%s\""
      io.popen(string.format(ik, ii, ij))
      if not dH.num_e4e8 then
        dH.num_e4e8 = 5
      end
      local id = os.clock()
      
      local function il(i4)
        local ax = assert(io.open(i4, "r"))
        local e = ax:read("*all")
        ax:close()
        if 0 == #e then
          error("Empty file content")
        end
        return e
      end
      
      local function im(i4)
        local ax = io.open(i4, "r")
        if ax then
          local fL = ax:seek("end")
          ax:close()
          return fL
        end
        return 0
      end
      
      local ip = 0
      local iq = false
      local ec
      local ir = 0
      local is = 5
      while os.clock() < id + dH.num_e4e8 and (not dH.a1dee61e or type(dH.a1dee61e) ~= "function" or not dH.a1dee61e(ij)) do
        local it = im(ij)
        if it > 0 and it == ip then
          ir = ir + 1
          if not (not (is <= ir) or dH.acf7867b) then
            break
          end
        else
          ir = 0
        end
        ip = it
        coroutine.yield(0.04)
      end
      if dH.ac786d64 then
        return io.open(ij, "r"), ij
      else
        local dc, e = pcall(il, ij)
        if not dc or not e then
          e = ""
        else
        end
        os.remove(ij)
        return e
      end
    end
  end
  
  function A.a084d95d()
    for Q = 0, 15 do
      StopProgress(Q)
    end
  end
  
  function A.a4b7900b(ek)
    if not y.g_progress or type(y.g_progress) ~= "table" then
      y.g_progress = {}
    end
    local iu = #y.g_progress + 1
    y.g_progress[iu] = StartProgress(ek)
    return iu
  end
  
  function A.ad7e2935(iv)
    if y.g_progress and type(y.g_progress) == "table" and y.g_progress[iv] and type(y.g_progress[iv]) == "number" then
      StopProgress(y.g_progress[iv])
      table.remove(y.g_progress, iv)
    end
  end
  
  function A.a77a80af(dl)
    for Q, e3 in ipairs(y.g_t1) do
      package.preload[e3.str_7b0e] = nil
      package.loaded[e3.str_7b0e] = nil
    end
    A.a084d95d()
    if dl then
      A.a880c84e(y.plugin_label .. " - Error", dl, true)
      dl = string.gsub(dl, "\n", " ")
      dl = string.gsub(dl, "link%((.-)%)", "%1")
      ErrPrintf(string.format("%s: %s - For support please contact support@ma.tools", y.plugin_label, dl))
      return
    end
    if not dl then
      Printf(y.plugin_label .. " " .. y.plugin_version .. " has finished")
    end
  end
  
  function A.ae28b2cd()
    if y.ae69ecc1 then
      A.a084d95d()
      if y.g_arg4 then
        local iw = Obj.Parent(y.g_arg4)
        Obj.Delete(Obj.Parent(iw), Obj.Index(iw))
      end
    end
  end
  
  function A.a7979688(dl)
    if y.g_t1 and type(y.g_t1) == "table" then
      for Q, e3 in ipairs(y.g_t1) do
        package.preload[e3.str_7b0e] = nil
        package.loaded[e3.str_7b0e] = nil
      end
    end
    A.a084d95d()
    local ix
    if y.flag_b595 then
      ix = "Yes"
    else
      ix = "No"
    end
    local iy = string.format("----------------------------------------------------------------------------\n----------------------------------------------------------------------------\nMATools Plugin Error\n----------------------------------------------------------------------------\n \nPlugin Name: %s\nPlugin Version: %s\nLicensed: %s\nMA3 Version: %s\nHost OS: %s\nHost Type: %s\nHost Sub Type: %s\nDate: %s\n \nUser: %s\nUserProfile: %s\nDataPool: %s\n \n%s\n \n%s\n \n----------------------------------------------------------------------------\n----------------------------------------------------------------------------\n", y.plugin_label, y.plugin_version, ix, Version(), HostOS(), HostType(), HostSubType(), os.date("%x - %X"), CurrentUser().Name, CurrentProfile().Name, DataPool().No, dl, debug.traceback())
    local iz = ""
    for fN in iy:gmatch("[^\n]+") do
      ErrPrintf(fN)
      if not (y.flag_8af7 or string.match(fN, "^Date")) or y.flag_8af7 then
        iz = iz .. fN .. "\n"
      end
    end
    local ia = A.a9b6aa97(3)
    if y.g_unset_a and Obj.IsValid(y.g_unset_a) then
      local iA = A.abb67167(y.g_unset_a.Path, "MATools", y.plugin_label, "logs")
      local iB = A.abb67167(iA, y.plugin_label .. "_Error.log")
      CreateDirectoryRecursive(iA)
      local ax = io.open(iB, "a")
      if ax then
        ax:write(iy)
        ax:write("\n\n")
        ax:close()
        ErrPrintf(string.format("%s Error - Error logs have been saved to %s", y.plugin_label, iB))
      end
    end
    local iA = Root().Temp.DriveCollect.Internal.Path:gsub("shows$", A.abb67167("logs", "MATools"))
    local iB = A.abb67167(iA, y.plugin_label .. "_Error.log")
    CreateDirectoryRecursive(iA)
    local ax = io.open(iB, "a")
    if ax then
      ax:write(iy)
      ax:write("\n\n")
      ax:close()
      ErrPrintf(string.format("%s Error - Error logs have been saved to %s", y.plugin_label, iB))
    end
    
    local function iC()
      local iD = require("mime")
      local iE
      local dc, de = pcall(iD.b64, iz)
      if not dc then
        de = "Failed to encode error message to base64"
      end
      local dc, iF = pcall(iD.b64, ia)
      if not dc then
        iF = "Failed to encode additional data to base64"
      end
      local iG = {
        ab57f563 = "https://ma.tools/AMLMJH/licenses/postreport.php",
        a5011716 = "POST",
        a0f236ec = {
          ["plugin"] = y.plugin_label or "Unknown",
          ["version"] = y.plugin_version or "Unknown",
          ["data"] = de or "",
          ["license"] = ix,
          ["additional"] = y.flag_8af7 and iF or "",
          ["isBase64"] = "true"
        },
        a16c6c1d = {
          ["Content-Type"] = "application/x-www-form-urlencoded"
        },
        a6da9d3f = true
      }
      local ec, dl = A.a82ced2a(iG)
      if ec and ec.a4301d45 == 200 then
        iE = true
        if ec.a6987d37 and not string.match(ec.a6987d37, "^OK") then
          ErrPrintf(string.format("%s Error - %s", y.plugin_label, ec.a6987d37))
        end
      end
      if not iE then
        ErrPrintf(string.format("%s Error - Please send a screenshot of the System Monitor or error logs to support@ma.tools", y.plugin_label))
      end
    end
    
    Timer(iC, 0.1, 1)
    A.ae28b2cd()
  end
  
  function A.a2c6e9b4(iH, iI, iJ)
    iH = string.match(iH, "(%d+%.%d+%.%d+%.%d+)")
    iI = string.match(iI, "(%d+%.%d+%.%d+%.%d+)")
    if not iH or not iI then
      return false
    end
    local iK, iL, iM, iN, iO, iP, iQ, iR
    iK, iL, iM, iN = string.match(iH, "(%d+)%.(%d+)%.(%d+)%.(%d+)")
    iO, iP, iQ, iR = string.match(iI, "(%d+)%.(%d+)%.(%d+)%.(%d+)")
    iK = tonumber(iK)
    iL = tonumber(iL)
    iM = tonumber(iM)
    iN = tonumber(iN)
    iO = tonumber(iO)
    iP = tonumber(iP)
    iQ = tonumber(iQ)
    iR = tonumber(iR)
    if not (iK and iL and iM and iN and iO and iP and iQ) or not iR then
      return false
    end
    if iJ and iH == iI then
      return true
    end
    if iK > iO then
      return true
    elseif iK == iO then
      if iL > iP then
        return true
      elseif iL == iP then
        if iM > iQ then
          return true
        elseif iM == iQ then
          if iN > iR then
            return true
          elseif iN == iR and iJ then
            return true
          end
        end
      end
    end
    return false
  end
  
  function A.a7295191()
    if A.a2c6e9b4(Version(), y.min_compat_ver, true) then
      A.a82d2696()
      return true
    else
      A.a77a80af(string.format("Error 17 - MA3 Version %s or greater required.\nYour version: %s", y.min_compat_ver, Version()))
      return false
    end
  end
  
  function A.a4077f93()
    if A.a2c6e9b4(Version(), "1.9.202.3", true) then
      return true
    else
      return false
    end
  end
  
  if not y.g_t1 then
    y.g_t1 = {}
  end
  if type(y.g_t1) ~= "table" then
    y.g_t1 = {}
  end
  
  function A.a31978a8(iS)
    for Q, e3 in ipairs(y.g_t1) do
      if not iS or iS == e3.str_7b0e then
        package.preload[e3.str_7b0e] = function()
          return load(e3.abe96a5e)()
        end
      end
    end
    local iw = Obj.Parent(y.g_arg4)
    iw["Name"] = y.plugin_label
    iw["Version"] = string.gsub(y.plugin_version, "%a", "")
    Timer(A.a361adb7, 2, 1)
    Timer(A.ac094263, 2, 1)
  end
  
  function A.a227fb71()
    if Root().Cloud.WorldServerStatus then
      return true
    end
    if A.a48e49aa(nil, true) then
      return true
    end
    if not y.tbl_f77a then
      y.tbl_f77a = {}
    end
    if y.tbl_f77a.a4bf0af4 and os.time() - y.tbl_f77a.a4bf0af4 < 5 then
      return y.tbl_f77a.tbl_c3bf
    end
    
    local function iT(dx)
      y.tbl_f77a.a4bf0af4 = os.time()
      y.tbl_f77a.tbl_c3bf = dx
    end
    
    local iG = {
      ab57f563 = "https://www.gstatic.com/generate_204",
      a5011716 = "GET",
      a6da9d3f = false
    }
    local e, dl = A.a48e49aa(iG)
    if e and e.a4301d45 == 204 then
      iT(true)
      return true
    end
    if HostOS() == "Mac" then
      local e = A.ae996e5a("ping -c 1 -W 2000 8.8.8.8", {
        ac786d64 = false,
        ae4e8ed7 = 2.1,
        a0f521dd = false
      })
      if string.match(e, "%d+%s+bytes%s+from%s+8%.8%.8%.8") then
        iT(true)
        return true
      else
        iT(false)
        return false
      end
    end
    if HostOS() == "Linux" then
      local e = A.ae996e5a("ping -c 1 -W 2 8.8.8.8", {
        ac786d64 = false,
        ae4e8ed7 = 2.1,
        a0f521dd = false
      })
      if string.match(e, "%d+%s+bytes%s+from%s+8%.8%.8%.8") then
        iT(true)
        return true
      else
        iT(false)
        return false
      end
    end
    if HostOS() == "Windows" then
      local e = A.ae996e5a("ping -n 1 -w 2000 8.8.8.8", {
        ac786d64 = false,
        ae4e8ed7 = 2.1,
        a0f521dd = false
      })
      if string.match(e, "Reply%s+from%s+8%.8%.8%.8") then
        iT(true)
        return true
      else
        iT(false)
        return false
      end
    end
  end
  
  function A.a6d4eca5(ep)
    if HostOS() == "Windows" then
      io.popen(string.format("attrib +h \"%s\"", ep))
    end
  end
  
  function A.a50dc43d(iU)
    if not iU then
      return false
    end
    local iV = A.abb67167(iU, "MATools")
    if not pcall(A.ae606251, iV) and not pcall(A.a7f545e6, iV) then
      return false
    end
    local iW = A.abb67167(iV, ".MATools_data")
    if not pcall(A.ae606251, iW) then
      if pcall(A.a7f545e6, iW) then
        A.a6d4eca5(iW)
        return iW
      else
        return false
      end
    else
      A.a6d4eca5(iW)
      return iW
    end
  end
  
  local function iX()
    local iY = GetPath(GetPathType(Root()), true)
    local iV = A.abb67167(iY, "MATools")
    if not pcall(A.ae606251, iV) then
      CreateDirectoryRecursive(iV)
    end
    local iZ = A.a50dc43d(iY)
    return iZ
  end
  
  function A.a8120b4a(i_)
    local cp = require("json")
    if not cp then
      return nil
    end
    
    local function j0(j1)
      local e = cp.decode(j1)
      return e
    end
    
    if FileExists(i_) then
      local j2, dl = A.a45cc415(i_, "r")
      if dl then
        return nil
      end
      if not j2 then
        return nil
      end
      local iq, de = pcall(j0, j2)
      j2 = nil
      collectgarbage("collect")
      if iq and de then
        return de
      end
    else
      return nil
    end
  end
  
  function A.a71ce10d(i_, de)
    local cp = require("json")
    if not cp then
      return
    end
    
    local function j3(j4)
      local j1 = cp.encode(j4)
      return j1
    end
    
    local iq, j1 = pcall(j3, de)
    if not iq then
      return nil
    end
    local dc, dl = A.a62325b0(i_, j1, "w")
    if not dc then
      return nil
    end
    if dl then
      return nil
    end
    j1 = nil
    collectgarbage("collect")
  end
  
  local function j5(j6, j7)
    if j6 == "general.dat" then
      return
    end
    local j8 = A.abb67167(j7, j6)
    local j9 = A.abb67167(iX(), j6)
    local ja = A.a8120b4a(j9) or {}
    local jb = A.a8120b4a(j8) or {}
    for ac, e4 in pairs(ja) do
      if type(e4) == table then
        table.insert(jb, A.ad96c7cb(e4))
      else
        table.insert(jb, e4)
      end
    end
    ja = {}
    A.a71ce10d(j9, ja)
    A.a71ce10d(j8, jb)
  end
  
  function A.afd7a009(j6, jc)
    if not jc or not Obj.IsValid(jc) then
      local jd = A.accd9825(true)
      for ac, e4 in pairs(jd) do
        local h_ = e4[3]
        local iV = A.abb67167(h_.Path, "MATools")
        if pcall(A.ae606251, iV) then
          jc = h_
          break
        end
      end
    end
    local iZ
    if jc then
      iZ = A.a50dc43d(jc.Path)
    end
    if iZ then
      j5(j6, iZ)
    end
    iZ = iZ or iX()
    local i_ = A.abb67167(iZ, j6)
    return i_
  end
  
  function A.ac094263()
    local e, dl = A.af137762({
      abe96a5e = {
        ["action"] = "process_stats"
      },
      a71a4054 = false,
      ae4e8ed7 = 5
    })
    if dl then
      A.a4b25f9e()
      return
    end
    if e and e.abe96a5e then
      A.a4b25f9e()
    end
  end
  
  function A.a9fe3555(je)
    local jf = "MATools Cache Cleared!"
    local h_, iU = A.a995c01f(false, true)
    if not h_ or 0 == h_ then
      return
    end
    local jg = Root().Temp.DriveCollect[h_]
    if not jg then
      return
    end
    local i_ = A.afd7a009("post.dat", jg)
    if i_ then
      os.remove(i_)
    end
    local jh = A.a31ecdb1("MATools")
    if jh then
      os.remove(jh)
    end
    local ji = A.a31ecdb1("MATools_Ad")
    if ji then
      os.remove(ji)
    end
    local e, dl = A.af137762({
      abe96a5e = {
        ["action"] = "clear_stats"
      },
      a71a4054 = false,
      ae4e8ed7 = 2
    })
    if dl then
      A.a880c84e(y.company_name, string.format("Error Clearing Stats:\n\n%s", dl), true)
    end
    local e, dl = A.af137762({
      abe96a5e = {
        ["action"] = "clear_http_cache"
      },
      a71a4054 = false,
      ae4e8ed7 = 2
    })
    if dl then
      A.a880c84e(y.company_name, string.format("Error Clearing Cache:\n\n%s", dl), true)
    end
    if je then
      jf = "MATools Data Cleared!"
      local iZ = A.a50dc43d(jg.Path)
      if iZ then
        A.a3e57b7d(iZ)
      end
    end
    A.a880c84e(y.company_name, jf, true)
  end
  
  function A.a361adb7()
    local e, dl = A.af137762({
      abe96a5e = {
        ["action"] = "process_http_cache",
        ["delay_ms"] = 100
      },
      a71a4054 = true
    })
  end
  
  function A.a97a772d(jj, jk)
    if y.g_running == true then
      return
    end
    
    local function jl()
      A.a4b25f9e()
      if not jj then
        jj = "open"
      end
      local jm = {
        ["action"] = "collect_stat",
        ["product"] = y.plugin_label,
        ["product_version"] = y.plugin_version,
        ["host_os"] = HostOS(),
        ["host_type"] = HostType(),
        ["host_sub_type"] = HostSubType(),
        ["stat_action"] = jj
      }
      if jk then
        jm["info"] = jk
      end
      local e, dl = A.af137762({
        abe96a5e = jm,
        a71a4054 = false,
        ae4e8ed7 = 2
      })
      if dl then
        A.a4b25f9e()
      end
    end
    
    Timer(jl, 2, 1, nil, nil)
  end
  
  A.tbl_2efa = {}
  A.a79d801e = {
    ["https://ma.tools/AMLMJH/licenses/deregister/"] = {
      a53ed6f0 = "matools",
      aec30b6a = "STZNKWQRLPF151A"
    },
    ["https://ma.tools/AMLMJH/api/stats/"] = {
      a53ed6f0 = "matools",
      aec30b6a = "2mt7yD4L9eYQM2g"
    },
    ["https://ma.tools/AMLMJH/api/plugins/check-status/"] = {
      a53ed6f0 = "matools",
      aec30b6a = "eG4AV28EC1Ld8YP"
    }
  }
  A.a7161f3b = {
    [200] = true,
    [400] = true,
    [401] = true,
    [403] = true,
    [411] = true,
    [409] = true
  }
  
  function A.a74abe10(jn, jo)
    local jp = {}
    local jq = {}
    for jr in string.gmatch(jn, "(%d+)") do
      table.insert(jp, tonumber(jr))
    end
    for jr in string.gmatch(jo, "(%d+)") do
      table.insert(jq, tonumber(jr))
    end
    local js = {}
    for Q = 1, 4 do
      local jt = A.a9ee5774.a(jp[Q], jq[Q])
      local ju = A.a9ee5774.d(jq[Q])
      local jv = A.a9ee5774.b(jt, ju)
      jv = A.a9ee5774.a(jv, 255)
      table.insert(js, jv)
    end
    local jw = table.concat(js, ".")
    return jw
  end
  
  function A.ac702761(db, dF, jx)
    local jy = "^%d+%.%d+%.%d+%.%d+$"
    local jz = Obj.Children(Root().Interfaces)
    for ac, jA in pairs(jz) do
      if jA.Link then
        local jB = Obj.Children(jA)
        for cr, jC in pairs(jB) do
          if not (string.match(jC.Ip, jy) and string.match(jC.Mask, jy)) then
            break
          end
          local jD = A.a74abe10(jC.Ip, jC.Mask)
          if string.match(jD, "^127%.") then
            jD = "127.0.0.1"
          end
          local e, dl = db:sendto(jx, jD, dF)
          if dl then
            A.a4b25f9e()
          else
            A.a4b25f9e()
          end
        end
      end
    end
  end
  
  function A.a48e49aa(de, jE)
    local cA = require("socket")
    local cp = require("json")
    local dn = 0.5
    local jF = 0.05
    local jG = cA.udp4()
    local e, dl = jG:setsockname("*", 0)
    if dl then
      A.a4b25f9e()
      return
    end
    e, dl = jG:setoption("broadcast", true)
    if dl then
      A.a4b25f9e()
      return
    end
    local jH = cp.encode({
      type = "discovery"
    })
    A.ac702761(jG, 62123, jH)
    jG:settimeout(0)
    local id = cA.gettime()
    local jI
    while true do
      local de, jJ, dF = jG:receivefrom()
      if de then
        local iq
        iq, jI = pcall(cp.decode, de)
        if iq and jI then
          jI.ip = jJ
          break
        end
      end
      if jJ == "timeout" and dn <= cA.gettime() - id then
        A.a4b25f9e()
        break
      end
      coroutine.yield(jF)
    end
    if not jI then
      A.a4b25f9e()
      return
    elseif jE then
      A.a4b25f9e()
      return true
    end
    local jK = {
      method = de.a5011716,
      url = de.ab57f563,
      params = de.ac860725,
      headers = de.a16c6c1d,
      body = de.a0f236ec
    }
    local jL = cA.tcp()
    jL:settimeout(dn)
    local jM, jN = jL:connect(jI.ip, jI.port)
    if not jM then
      A.a4b25f9e()
      return
    end
    local jO = cp.encode(jK)
    local dk, jP = jL:send(jO)
    if not dk then
      jL:close()
      A.a4b25f9e()
      return
    end
    local jQ = ""
    local id = cA.gettime()
    local jR = 30
    jL:settimeout(0.05)
    while string.len(jQ) < 4 do
      local di = cA.select({jL}, {}, 0.01)
      if di[1] then
        local dr, cr, jS = jL:receive(4 - string.len(jQ))
        if dr then
          jQ = jQ .. dr
        elseif jS then
          jQ = jQ .. jS
        end
      end
      if jR < cA.gettime() - id then
        dl = "Timeout receiving data length"
        break
      end
      if dl and dl ~= "timeout" then
        break
      end
      cA.sleep(0.001)
      coroutine.yield(jF)
    end
    if dl then
      A.a4b25f9e()
      return
    end
    local jT = string.unpack("<I4", jQ)
    local jU = ""
    local dr, jV, jS
    repeat
      dr, jV, jS = jL:receive(1024)
      jU = jU .. (dr or jS or "")
    until jT <= #jU
    jL:close()
    local iq, ec = pcall(cp.decode, jU)
    if iq and ec then
      return {
        a4301d45 = ec.status,
        aa2a14c8 = ec.status_line,
        a70f6f5c = ec.headers_str,
        a6c40bcd = ec.headers,
        a6987d37 = ec.body,
        a2e146df = ec.bodyT
      }
    end
  end
  
  function A.afce2153()
    local iG = {
      ab57f563 = "https://ma.tools/AMLMJH/api/license/test_connection.php",
      a5011716 = "GET"
    }
    local e, dl = A.a82ced2a(iG)
    if not e then
      if dl then
        A.a880c84e(y.g_full_label, string.format("Error connecting to MATools server:\n\n%s", dl), true)
      else
        A.a880c84e(y.g_full_label, "Unknown connection error", true)
      end
      return
    end
    local jW = string.format("Status: %s\n\nIP: %s\n\nTimestamp: %s", e.a2e146df["message"], e.a2e146df["ip"], e.a2e146df["ts"])
    if e.a2e146df.ok then
      A.a880c84e(y.g_full_label, string.format("Connected to MATools server:\n\n%s", jW), true)
    else
      A.a880c84e(y.g_full_label, string.format("Error connecting to MATools server:\n\n%s", jW), true)
    end
  end
  
  function A.a3f931a9(de)
    de["action"] = "http"
    de["url"] = de.ab57f563
    de.ab57f563 = nil
    de["headers"] = de.a16c6c1d
    de.a16c6c1d = nil
    if de["headers"] and type(de["headers"]) == "table" then
      local jX = 0
      for cr, cr in pairs(de["headers"]) do
        jX = jX + 1
      end
      if 0 == jX then
        de["headers"] = nil
      end
    end
    de["query"] = de.ac860725
    de.ac860725 = nil
    if de["query"] and type(de["query"]) ~= "table" and 0 == #de["query"] then
      de["query"] = nil
    end
    de["method"] = de.a5011716
    de.a5011716 = nil
    de["upload_path"] = de.ae89db0f
    de.ae89db0f = nil
    de["download_path"] = de.add51e8e
    de.add51e8e = nil
    de["cache"] = de.a6da9d3f
    de.a6da9d3f = nil
    local dn = de.ac420da5 or 10
    de.ac420da5 = nil
    local jY = de.a566c6c9 or false
    de.a566c6c9 = nil
    if de.a0f236ec then
      if type(de.a0f236ec) == "string" then
        de["body_text"] = de.a0f236ec
      elseif type(de.a0f236ec) == "table" then
        if de["headers"] and de["headers"]["Content-Type"] == "application/x-www-form-urlencoded" then
          de["form"] = de.a0f236ec
        else
          de["json"] = de.a0f236ec
        end
      end
    end
    de.a0f236ec = nil
    local e, dl = A.af137762({
      abe96a5e = de,
      ae4e8ed7 = dn,
      a71a4054 = jY
    })
    if not e then
      if dl then
        return nil, dl
      else
        return nil, "Unknown connection error"
      end
    end
    if e["status"] ~= "ok" then
      return nil, e["error"]
    end
    return {
      a4301d45 = e["data"]["status_code"],
      aa2a14c8 = e["data"]["status_code"],
      a6c40bcd = e["data"]["headers"],
      a6987d37 = e["data"]["body_text"] or "",
      a2e146df = e["data"]["body"]
    }
  end
  
  function A.a82ced2a(de)
    local cp = require("json")
    if not cp then
      return nil, "Error - JSON library not avaliable"
    end
    local jZ = require("url")
    if not jZ then
      return nil, "Error - URL library not avaliable"
    end
    local iD = require("mime")
    if not iD then
      return nil, "Error - MIME library not avaliable"
    end
    if not de.a16c6c1d then
      de.a16c6c1d = {}
    end
    if de.abed1e1f then
      de.a16c6c1d["Authorization"] = string.format("%s %s", de.abed1e1f["token_type"], de.abed1e1f["access_token"])
    elseif A.tbl_2efa[de.ab57f563] then
      de.a16c6c1d["Authorization"] = string.format("%s %s", A.tbl_2efa[de.ab57f563].a7dabd7f, A.tbl_2efa[de.ab57f563].aaab60f3)
    end
    if de.a2d32e01 and de.a2d32e01.a53ed6f0 and de.a2d32e01.aec30b6a then
      de.a16c6c1d["Authorization"] = string.format("Basic %s", iD.b64(de.a2d32e01.a53ed6f0 .. ":" .. de.a2d32e01.aec30b6a))
    elseif A.a79d801e[de.ab57f563] then
      de.a16c6c1d["Authorization"] = string.format("Basic %s", iD.b64(A.a79d801e[de.ab57f563].a53ed6f0 .. ":" .. A.a79d801e[de.ab57f563].aec30b6a))
    end
    local e, dl = A.a3f931a9(de)
    if not e then
      return nil, dl
    end
    return e, nil
  end
  
  local function j_(...)
    return "000002000000000000000000200020002028FFFFFF32FFFFFFCEFFFFFFF3FFFFFFB5FFFFFFEAFFFFFFE3FFFFFF4DFFFFFF00FFFFFF6BFFFFFFEDFFFFFFE3FFFFFF4E404040000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0069696900FFFFFFD3FFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF4FFFFFFF9FFFFFFE0FFFFFF3CFFFFFFF8FFFFFFF4FFFFFFF9FFFFFFE73535351200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060606000FFFFFFFFFFFFFFCAFFFFFF58FFFFFFFFFFFFFF7BFFFFFF9DFFFFFFFFFFFFFF7AFFFFFFFFFFFFFF79FFFFFF9EFFFFFFFF3636362D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC4FFFFFF4AFFFFFFFFFFFFFF70FFFFFF93FFFFFFFFFFFFFF76FFFFFFFFFFFFFF6EFFFFFF95FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFFFFFFF76FFFFFFFFFFFFFF68FFFFFF91FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFFFFFFF76FFFFFFFFFFFFFFAEFFFFFFC5FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFFFFFFF77FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF73FFFFFF96FFFFFFFFFBFBFB73F1F1F1F3F1F1F197F1F1F1B0F1F1F1F32727272900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000057575700FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF96FFFFFFFFB7B7B74EB2B2B284B4B4B462B4B4B46BB4B4B4858F8F8F15858585268585857B8585856185858505858585008585851F858585788585856A85858507858585198585855585858528858585008585850085858500858585588585857C85858534B4B4B400FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFCECECE70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EFFFFFFE7FFFFFFFFFFFFFFFFFFFFFF92FFFFFF15FFFFFFE0FFFFFFFFFFFFFFFFFFFFFFA4FFFFFF5AFFFFFFFFFFFFFF7DFFFFFF00FFFFFF00FFFFFF83FFFFFFFFFFFFFFFFFFFFFFF6FFFFFF3DFFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFCFCFCF48FAFAFA7AFFFFFFF3FFFFFFEFFFFFFF76FFFFFF97FFFFFFFFFFFFFF91FFFFFFDAFFFFFFE8FFFFFF69FFFFFFFFFFFFFF9FFFFFFFC5FFFFFFFBFFFFFF7EFFFFFFFFFFFFFF77FFFFFF00FFFFFF05FFFFFFE4FFFFFFE9FFFFFF8FFFFFFFFFFFFFFFA0FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFF1F1F124FEFEFE00FFFFFFE5FFFFFFDDFFFFFF00FFFFFF79FFFFFFFFFFFFFF46FFFFFFBCFFFFFFEBFFFFFF75FFFFFFFFFFFFFF5DFFFFFF9BFFFFFFFEFFFFFF83FFFFFFFFFFFFFF77FFFFFF00FFFFFF07FFFFFFE7FFFFFFD9FFFFFF23FFFFFFAAFFFFFF68FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFFFFFFF28FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFEAFFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFDFFFFFF83FFFFFFFFFFFFFF78FFFFFF00FFFFFF07FFFFFFE5FAFAFAE3FBFBFB02FFFFFF00FFFFFF00FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFFFFFFF28FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFEAFFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFDFFFFFF83FFFFFFFFFFFFFF78FFFFFF00FFFFFF07FFFFFFE5DBDBDBE22828280579797900FAFAFA00FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFFFBFBFB28FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFE9FFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFDFFFFFF82FFFFFFFFFFFFFF77FFFFFF00FFFFFF07FFFFFFE5E1E1E1E2101010050000000091919100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F3F3F3FF87878728FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFE9FFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFDFFFFFF82FFFFFFFFFFFFFF77FFFFFF00FFFFFF07FFFFFFE5F5F5F5E277777705000000005A5A5A00FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF73737328FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFE9FFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFCFFFFFF82FFFFFFFFFFFFFF77FFFFFF00FFFFFF07FFFFFFE5D9D9D9E20000000500000000ABABAB00FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F2F2F2FF76767628FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFEAFFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFDFFFFFF83FFFFFFFFFFFFFF78FFFFFF00FFFFFF07FFFFFFE6E8E8E8E161616100A8A8A800FFFFFF00FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767628FFFFFF00FFFFFFE7FFFFFFE0FFFFFF00FFFFFF7BFFFFFFFFFFFFFF50FFFFFFBFFFFFFFEAFFFFFF74FFFFFFFFFFFFFF66FFFFFFA0FFFFFFFDFFFFFF85FFFFFFFFFFFFFF79FFFFFF00FFFFFF07FFFFFFE9FFFFFFE9FFFFFF1DFFFFFF00FFFFFF00FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767628FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7BFFFFFFFFFFFFFF4FFFFFFFBFFFFFFFE9FFFFFF73FFFFFFFFFFFFFF65FFFFFFA0FFFFFFFCFFFFFF82FFFFFFFFFFFFFF77FFFFFF00FFFFFF00FFFFFFABFFFFFFFFFFFFFFF6FFFFFFA4FFFFFF0DFFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF7B7B7B28FFFFFF00FFFFFFE6FFFFFFDFFFFFFF00FFFFFF7CFFFFFFFFFFFFFF47FFFFFFBCFFFFFFEAFFFFFF75FFFFFFFFFFFFFF5EFFFFFF9CFFFFFFFDFFFFFF83FFFFFFFFFFFFFF70FFFFFF00FFFFFF00FFFFFF09FFFFFF8AFFFFFFD2FFFFFFFFFFFFFF79FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F7F7F7FF575757289A9A9A00F4F4F4E6FFFFFFDFFFFFFF00FFFFFF7AFFFFFFFFFFFFFF7DFFFFFFD2FFFFFFEAFFFFFF6FFFFFFFFFFFFFFF8EFFFFFFBAFFFFFFFDFFFFFF80FFFFFFFFFFFFFFA5FFFFFF57FFFFFF39FFFFFF46FFFFFF4EFFFFFF8CFFFFFFFFFFFFFF9AFFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FFFFFFFF2121212600000000E9E9E9F2FFFFFFEAFFFFFF00FFFFFF34FFFFFFFCFFFFFFFFFFFFFFFFFFFFFFA5FFFFFF20FFFFFFF0FFFFFFFFFFFFFFFFFFFFFFB8FFFFFF60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9FFFFFFE8FFFFFFFFFFFFFFFFFFFFFFF1FFFFFF38FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95FDFDFDFF303030311A1A1A18ABABAB74BDBDBD74BDBDBD1AAAAAAA00A5A5A543A5A5A59CA5A5A580A5A5A50FA5A5A500A5A5A533A5A5A598A5A5A58AA5A5A513A5A5A522A5A5A575A5A5A575A5A5A575A5A5A54CA5A5A55FA5A5A575A5A5A570A5A5A52BC7C7C700FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F2F2F2FF72727272F1F1F1F1E5E5E55CE4E4E481E4E4E4F12626262900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000059595900FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF77777777FFFFFFFFFFFFFF72FFFFFF9AFFFFFFFF3737372D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767676FFFFFFFFFFFFFF70FFFFFF97FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767676FFFFFFFFFFFFFF70FFFFFF97FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767676FFFFFFFFFFFFFF70FFFFFF97FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767676FFFFFFFFFFFFFF70FFFFFF97FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767676FFFFFFFFFFFFFF70FFFFFF97FFFFFFFF3636362C00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100FFFFFFFFFFFFFFC5FFFFFF4DFFFFFFFFFFFFFF72FFFFFF95F1F1F1FF76767676FFFFFFFFFFFFFF71FFFFFF98FFFFFFFF3636362D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000061616100"
  end
  
  j_ = j_()
  A.affb6127 = j_
  
  function A.a380752c(cL)
    local k0 = string.char
    return cL:gsub("..", function(k1)
      return k0(tonumber(k1, 16))
    end)
  end
  
  function A.a10763ae(cL)
    local iD = require("mime")
    return iD.unb64(cL)
  end
  
  function A.ac2276ce(cL)
    local iD = require("mime")
    return iD.b64(cL)
  end
  
  function A.a9bd8c3d(k2, k3, k4)
    k2 = k2 or A.affb6127
    k3 = k3 or y.company_label
    local k5 = Root().GraphicsRoot.TextureCollect.Textures
    if not k5[k3] then
      local k6 = GetPath(GetPathType(Root().GraphicsRoot.TextureCollect.Textures))
      CreateDirectoryRecursive(k6)
      local k7 = io.open(A.abb67167(k6, k3 .. ".tga"), "wb")
      if k7 then
        k7:write(A.a380752c(k2))
        k7:close()
        Obj.Set(k5, "Lock", "No")
        local k8 = Obj.Append(k5)
        Obj.Set(k8, "Name", k3)
        Obj.Set(k8, "FileName", k3 .. ".tga")
        Obj.Set(k5, "Lock", "Yes")
      end
    end
    if k3 == y.company_label then
      y.company_label = Obj.Get(k5[k3], "No")
    end
    if k4 then
      return Obj.Get(k5[k3], "No")
    end
  end
  
  function A.a31ecdb1(hh)
    local k6 = GetPath(GetPathType(Root().GraphicsRoot.TextureCollect.Textures))
    if not k6 then
      return nil
    end
    return A.abb67167(k6, hh .. ".tga")
  end
  
  local function k9(ka)
    local function kb(cL)
      local e = string.gsub(cL, "^%s*(.-)%s*$", "%1")
      
      e = e or ""
      e = string.upper(e)
      return e
    end
    
    if not ka.str_0afb then
      ka.str_0afb = ""
    end
    if not ka.str_a206 then
      ka.str_a206 = ""
    end
    if not ka.str_dbe5 then
      ka.str_dbe5 = ""
    end
    if not ka.str_240c then
      ka.str_240c = ""
    end
    ka.str_0afb = kb(ka.str_0afb)
    ka.str_a206 = kb(ka.str_a206)
    ka.str_dbe5 = kb(ka.str_dbe5)
    ka.str_240c = kb(ka.str_240c)
    ka.str_a206 = string.gsub(ka.str_a206, "^0[Xx]", "")
    ka.str_240c = string.gsub(ka.str_240c, "^0[Xx]", "")
  end
  
  function A.a1aebd90(hG)
    if not hG or type(hG) ~= "string" then
      return ""
    end
    hG = string.gsub(hG, "%s+", "")
    return hG
  end
  
  function A.a4fc22a6(kc, kd, ka)
    local hO = {
      title = y.g_full_label .. " USB Registration",
      icon = y.company_label,
      message = "Please enter your license key.",
      commands = {
        {
          value = 0,
          name = "Register"
        }
      },
      inputs = {
        {
          name = "License Key",
          value = "",
          maxTextLength = 15
        }
      }
    }
    local hP = MessageBox(hO)
    local ke = hP.inputs["License Key"]
    ke = A.a1aebd90(ke)
    local iG = {
      a5011716 = "GET",
      ab57f563 = "https://ma.tools/AMLMJH/licenses/auth.php",
      ac860725 = {
        ["key"] = ke,
        ["auth"] = kc,
        ["product"] = y.plugin_name,
        ["ident"] = ka.aae54dfa,
        ["manufacturer"] = ka.str_dbe5,
        ["manufacturerID"] = ka.str_240c,
        ["modelID"] = ka.str_a206,
        ["model"] = ka.str_0afb,
        ["usbID"] = ka.abe80de0
      },
      a6da9d3f = false
    }
    local e, dl = A.a82ced2a(iG)
    if dl then
      return false, dl
    end
    if not e or e.a4301d45 ~= 200 then
      local kf = "Error 13 - Please check you have a working internet connection"
      if e and e.a4301d45 then
        kf = string.format("Error 13 - Please check you have a working internet connection (%s)", e.a4301d45)
      end
      return false, kf
    end
    e.a6987d37 = string.upper(e.a6987d37)
    if e.a6987d37 == R.ace2ba8b(R.a7948bc8(ke .. kc .. "success"), true) then
      return true
    elseif e.a6987d37 == R.ace2ba8b(R.a7948bc8(ke .. "rejected"), true) then
      return false, "Error 4 - Authorization Rejected"
    elseif e.a6987d37 == R.ace2ba8b(R.a7948bc8(ke .. kc .. "incorrect"), true) then
      return false, "Error 11 - Incorrect License Key\nPlease try again"
    elseif e.a6987d37 == R.ace2ba8b(R.a7948bc8(ke .. kc .. "excess"), true) then
      return false, "Error 5 - Authorization Failed\nToo many USB Drives registered\nPlease contact support@ma.tools"
    elseif e.a6987d37 == R.ace2ba8b(R.a7948bc8(ke .. kc .. "failure"), true) then
      return false, "Error 10 - Authorization Failed\nPlease try again\nOr please contact support@ma.tools"
    elseif e.a6987d37 == R.ace2ba8b(R.a7948bc8(ke .. kc .. "product"), true) then
      return false, string.format("Error 12 - Authorization Failed\nInvalid license for %s\nOr please contact support@ma.tools", y.plugin_name)
    else
      return false, "Error 6 - Authorization Failed\nPlease try again\nOr please contact support@ma.tools"
    end
  end
  
  function A.af2616ca(kg, kh)
    local ki = Obj.Parent(y.g_arg4)["Resources"]
    if not ki then
      return false, "Please re-import the plugin to install onto this system"
    end
    CmdIndirectWait(string.format("Call %s", Obj.ToAddr(ki)))
    local kj = 100
    while not MTbin or 0 == #MTbin do
      A.a4b25f9e()
      coroutine.yield(0.1)
      kj = kj - 1
      if 0 == kj then
        return false, "Error 9501 - Please try re-importing the plugin, and make sure you have all included LUA files from the download."
      end
    end
    if not FileExists(kg) then
      CreateDirectoryRecursive(kg)
    end
    local kk = A.abb67167(kg, string.format("matools-helper_%s.zip", kh))
    local ax = io.open(kk, "wb")
    if ax then
      ax:write(MTbin)
      ax:close()
    else
      return false, "Error 9502"
    end
    if not FileExists(kk) then
      return false, "Error 9503"
    end
    local dc, dl = A.a7ce60a4(kk, kg)
    if not dc then
      return false, dl
    end
    os.remove(kk)
    return true
  end
  
  function A.a7ce60a4(kk, kl)
    if HostOS() == "Mac" or HostOS() == "Linux" then
      local ax = io.popen(string.format("unzip \"%s\" -d \"%s\"", kk, kl))
      for fN in ax:lines() do
        A.a4b25f9e()
      end
      ax:close()
    elseif HostOS() == "Windows" then
      local ax = io.popen(string.format("Powershell -command \"Expand-Archive -Force '%s' '%s'\"", kk, kl))
      for fN in ax:lines() do
        A.a4b25f9e()
      end
      ax:close()
    else
      os.remove(kk)
      return false, string.format("%s is not currently supported", HostOS())
    end
    return true
  end
  
  A.str_055b = "2.2.2"
  
  function A.a165d3be(eX)
    local km = 55100
    local kn = 200
    if not eX or "" == eX then
      return km
    end
    local ko = 0
    for Q = 1, #eX do
      ko = (ko * 31 + string.byte(eX, Q)) % kn
    end
    return km + ko
  end
  
  function A.a0777d91()
    for cr, kp in pairs(Obj.Children(DataPool()["Plugins"])) do
      if kp["Author"] == "MATools" then
        local ki = kp["Resources"]
        if ki then
          ki["Lock"] = false
          Obj.Remove(Obj.Parent(ki), Obj.Index(ki))
        end
      end
    end
  end
  
  function A.a842006c()
    local kq = {
      a6d679a5 = "876d98f6949bf4da21fa7e0d21d67f734a7f5db4124b0f9dbd3851fe876c8aea",
      ac1f80b3 = "9953be3e0b04971f291c898f90bb7930ef785a06b98513728b00462af70d54a3",
      ad0e7f72 = "e21e669e03388b6c68da3515a5e00dc83bdf44a4e88a4d947b9cb7cd63fb5a05"
    }
    local kr
    local ks = GetPath(GetPathType(Root()), true)
    local kt = A.a50dc43d(ks)
    local ku, kv
    local kw = {
      a6d679a5 = string.format("matools-helper-win_%s.exe", A.str_055b),
      ac1f80b3 = string.format("matools-helper-mac_%s", A.str_055b),
      ad0e7f72 = string.format("matools-helper-lin_%s", A.str_055b)
    }
    local kx = {
      a6d679a5 = A.abb67167(kt, kw.a6d679a5),
      ac1f80b3 = A.abb67167(kt, kw.ac1f80b3),
      ad0e7f72 = A.abb67167(kt, kw.ad0e7f72)
    }
    local ky = true
    if HostOS() == "Windows" then
      kv = kw.a6d679a5
      kr = kq.a6d679a5
    elseif HostOS() == "Mac" then
      kv = kw.ac1f80b3
      kr = kq.ac1f80b3
    elseif HostOS() == "Linux" then
      kv = kw.ad0e7f72
      kr = kq.ad0e7f72
    end
    ku = A.abb67167(kt, kv)
    if not FileExists(ku) then
      A.a4b25f9e()
      ky = false
    else
      local kz = A.ac22c92f(ku)
      A.a4b25f9e()
      if kz ~= kr then
        A.a4b25f9e()
        ky = false
      end
    end
    
    local function kA()
      A.a4b25f9e()
      for cr, h_ in pairs(Obj.Children(Root().Temp.DriveCollect)) do
        if h_.DriveType == "Removeable" and FileExists(A.abb67167(h_.Path, "MATools")) then
          local kB = A.a50dc43d(h_.Path)
          for kC, h3 in pairs(kw) do
            local kD = A.abb67167(kB, h3)
            if FileExists(kx[kC]) then
              A.a1abee98(kx[kC], kD)
            end
          end
        end
      end
    end
    
    if ky then
      A.a4b25f9e()
      kA()
      return ku
    end
    A.a4b25f9e()
    for cr, h_ in pairs(Obj.Children(Root().Temp.DriveCollect)) do
      if h_.DriveType == "Removeable" then
        for kC, h3 in pairs(kw) do
          local kD = A.abb67167(h_.Path, "MATools", ".MATools_data", h3)
          if FileExists(kD) and A.ac22c92f(kD) == kq[kC] then
            A.a4b25f9e()
            A.a1abee98(kD, kx[kC])
            if h3 == kv then
              ky = true
            end
          end
        end
        if ky then
          break
        end
      end
    end
    if ky then
      A.a4b25f9e()
      kA()
      return ku
    end
    A.a4b25f9e()
    local dc, dl = A.af2616ca(kt, A.str_055b)
    if dl then
      A.a4b25f9e()
    end
    if not dc then
      return false, dl
    end
    if not FileExists(ku) then
      return false, "Failed to initialise MATools Resources, please try re-importing the plugin"
    elseif A.ac22c92f(ku) ~= kr then
      return false, "Failed to validate MATools Resources, please try re-importing the plugin"
    end
    kA()
    return ku
  end
  
  function A.a42dbd78(dH)
    A.a4b25f9e()
    local cp = require("json")
    local kE, dl = A.a842006c()
    if not kE then
      return false, dl
    end
    local kF = {
      ["action"] = "start_tcp_server"
    }
    local j1 = cp.encode(kF)
    local ij = os.tmpname()
    os.remove(ij)
    local ik
    if HostOS() == "Windows" then
      local kG = ij .. ".input"
      local ax = io.open(kG, "w")
      if ax then
        ax:write(j1)
        ax:close()
      end
      ik = string.format("start /B \"\" \"%s\" < \"%s\" > \"%s\" 2>&1", kE, kG, ij)
    else
      ik = string.format("echo '%s' | '%s' > '%s' 2>&1 &", j1, kE, ij)
    end
    os.execute(ik)
    local dn = dH.num_e4e8 or 3
    local id = os.clock()
    local e = ""
    while os.clock() < id + dn do
      local ax = io.open(ij, "r")
      if ax then
        local kH = ax:read("*all")
        ax:close()
        if kH and #kH > 0 then
          e = kH
          break
        end
      end
      coroutine.yield(0.05)
    end
    os.remove(ij)
    if HostOS() == "Windows" then
      local kG = ij .. ".input"
      os.remove(kG)
    end
    if 0 == #e then
      return false, "No response from server start"
    end
    local dc, kI = pcall(cp.decode, e)
    if not dc then
      return false, "Failed to decode response"
    end
    if not kI or type(kI) ~= "table" then
      return false, "Invalid response from service start"
    end
    if not kI["status"] then
      return false, "No status"
    end
    if kI["status"] ~= "ok" then
      return false, "Bad status"
    end
    if not kI["data"] then
      return false, "No service data"
    end
    if not kI["data"]["port"] then
      return false, "No service port"
    end
    local dF = tonumber(kI["data"]["port"])
    if not dF then
      return false, "Invalid service port"
    end
    return dF, false
  end
  
  function A.af321f12()
    A.a4b25f9e()
    local kJ = HostOS()
    local iq = false
    if kJ == "Windows" then
      local ec = os.execute("taskkill /F /IM matools-helper-win_*.exe 2>nul")
      iq = 0 == ec
    elseif kJ == "OSX" then
      local ec = os.execute("pkill -9 -f \"matools-helper-mac_\" 2>/dev/null")
      iq = 0 == ec
    else
      local ec = os.execute("pkill -9 -f \"matools-helper-lin_\" 2>/dev/null")
      iq = 0 == ec
    end
    if iq then
      A.a4b25f9e()
      if A.ab362959 and A.ab362959.a8549ce4 then
        A.ab362959.a8549ce4()
      end
      return true
    else
      A.a4b25f9e()
      return false
    end
  end
  
  function A.af137762(dH)
    A.a4b25f9e()
    if not A then
      A.a4b25f9e()
      return false, "MT is nil"
    end
    if not A.ab362959 then
      A.a4b25f9e()
      return false, "MT.secure_client is nil"
    end
    if not A.ab362959.a316aaed then
      A.a4b25f9e()
      return false, "MT.secure_client.request_ is nil"
    end
    if not dH then
      A.a4b25f9e()
      return false, "opts is nil"
    end
    dH.abe96a5e["force_proxy"] = y.flag_1eef or false
    A.a4b25f9e()
    local dc, ec, dl = pcall(A.ab362959.a316aaed, dH)
    if not dc then
      A.a4b25f9e()
      return false, "request_ error: " .. tostring(ec)
    end
    A.a4b25f9e()
    if dl then
      A.a4b25f9e()
      return false, dl
    end
    if ec and type(ec) == "table" then
      A.a4b25f9e()
      return ec, nil
    end
    A.a4b25f9e()
    return false, "Invalid response"
  end
  
  function A.a7153475(jg, kK, kL)
    local kM
    local ka = {}
    if not jg or not Obj.IsValid(jg) then
      return nil, "Invalid drive", ka
    end
    local iU = Obj.Get(jg, "Path")
    local e, dl = A.af137762({
      a563b0ba = iU,
      abe96a5e = {
        ["action"] = "usb_info",
        ["mount_path"] = iU
      },
      ae4e8ed7 = 2,
      a71a4054 = false
    })
    if not e or type(e) ~= "table" then
      return nil, dl, ka
    end
    if kK then
      local cp = require("json")
      local dc, j1 = pcall(cp.encode, e)
      if not dc then
        ka.str_f481 = "Failed to encode response as json"
      else
        ka.str_f481 = j1
      end
    end
    if not e["status"] or e["status"] ~= "ok" then
      return nil, e["error"] or "Unknown App Error", ka
    end
    ka.str_240c = e["data"]["manufacturer_id"]
    ka.str_dbe5 = e["data"]["manufacturer"]
    ka.str_0afb = e["data"]["model"]
    ka.str_a206 = e["data"]["model_id"]
    kM = e["data"]["serial"]
    ka.aae54dfa = Obj.Get(jg, "Name") or ""
    ka.aae54dfa = string.gsub(ka.aae54dfa, x, "/")
    ka.abe80de0 = A.a4aa1576.ace2ba8b(A.a4aa1576.a7948bc8(string.format("%sMATools", kM)), true)
    k9(ka)
    kM = kM or ""
    kM = string.sub(kM, 1, 20)
    kM = string.upper(kM)
    ka.aa07eeef = kM
    
    local function kN(kO)
      local function kP(kQ)
        return string.format("Error %s - Invalid USB Drive.\nThis USB Drive can't be used as an MATools License Key.\nPlease try another USB stick from a different manufacturer, for more information please visit link(https://ma.tools/USB)", kQ)
      end
      
      if not kO then
        return false
      end
      if string.gsub(kO, "%s", "") == "" then
        return false, kP(24)
      end
      if string.match(kO, "%W") then
        return false, kP(26)
      end
      if not string.match(kO, "[^" .. string.sub(kO, 1, 1) .. "]") then
        return false, kP(33)
      end
      if not string.match(kO, "%D") and tonumber(kO) and tonumber(kO) < 2 then
        return false, kP(28)
      end
      if string.match(kO, "123456789") then
        return false, kP(29)
      end
      if string.match(kO, "987654321") then
        return false, kP(30)
      end
      if string.match(kO, "abcdefghi") then
        return false, kP(31)
      end
      if string.match(kO, "ihgfedcba") then
        return false, kP(32)
      end
      return true
    end
    
    local dc, dl = kN(kM)
    if not dc then
      return nil, dl, ka
    end
    kL = kL or y.plugin_name
    return R.ace2ba8b(R.a7948bc8(kL .. "AMLMJH"), true) .. kM .. string.gsub(kM, "[AaMmLlMmJjHh]", "Y"), nil, ka
  end
  
  function A.ae606251(g5)
    local i4 = A.abb67167(g5, "test.txt")
    local ax = assert(io.open(i4, "w"))
    ax:close()
    os.remove(i4)
  end
  
  function A.a7f545e6(g5)
    local dc = CreateDirectoryRecursive(g5)
    if not dc then
      if HostOS() == "Mac" then
        assert(io.popen(string.format("mkdir \"%s\"", g5)))
      elseif HostOS() == "Windows" then
        assert(io.popen(string.format("mkdir \"%s\"", g5)))
      elseif HostOS() == "Linux" then
        assert(io.popen(string.format("mkdir \"%s\"", g5)))
      else
        return "Error 7 - Invalid HostType"
      end
    end
    local dp = os.time()
    while not pcall(A.ae606251, g5) do
      coroutine.yield(0.1)
      if os.time() - dp >= 10 then
        return "Error - Failed to create directory"
      end
    end
  end
  
  function A.abb67167(...)
    local i6 = {
      [7] = nil,
      ...
    }
    for ac, e4 in pairs(i6) do
      if not e4 then
        i6[ac] = ""
      end
    end
    local ep = table.concat(i6, x)
    ep = string.gsub(ep, x .. "+", x)
    if #ep > 1 then
      ep = string.gsub(ep, x .. "$", "")
    end
    return ep
  end
  
  function A.a1308137(kR)
    local ax = io.open(kR, "r")
    ax:close()
  end
  
  function A.a3e57b7d(kS)
    local kT = require("lfs")
    if string.match(kS, x .. "$") then
      kS = string.gsub(kS, x .. "$", "")
    end
    for i4 in kT.dir(kS) do
      if i4 ~= "." and ".." ~= i4 then
        local kR = A.abb67167(kS, i4)
        local kU = kT.attributes(kR)
        if kU and kU.mode == "directory" then
          A.a3e57b7d(kR)
        else
          os.remove(kR)
        end
      end
    end
    kT.rmdir(kS)
  end
  
  function A.a8abe99e(kV)
    if not A.a227fb71() then
      return A.a77a80af("Internet connection required for USB registration.")
    end
    local dl
    local hO = {
      title = y.g_full_label .. " Registration",
      icon = y.company_label,
      message = "Select USB Drive to register.\n(Please make sure you have an active internet connection)",
      commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Continue"
        }
      }
    }
    local hP = MessageBox(hO)
    if 0 == hP.result then
      return A.a77a80af()
    end
    local h_, iU = A.a995c01f(true, true)
    if not h_ or 0 == h_ then
      return A.a77a80af("Error 27 - Please select a USB drive")
    end
    local jg = Root().Temp.DriveCollect[h_]
    if Obj.Get(jg, "DriveType") ~= "Removeable" then
      return A.a77a80af("Error 8 - Please select a removeable USB drive")
    end
    local kW, dl, ka = A.a7153475(jg, false, nil)
    if dl then
      return A.a77a80af(dl)
    end
    if not kW then
      return A.a77a80af("Error 28 - Failed to access USB")
    end
    local kc = R.ace2ba8b(R.a7948bc8(kW), true)
    local kX = string.format("AML%s", os.date("%m%y"))
    local kY = string.format("MJH%s", os.date("%m%y"))
    local kZ, dl
    if kV ~= kX and kV ~= kY then
      kZ, dl = A.a4fc22a6(kc, h_, ka)
      if dl then
        return A.a77a80af(dl)
      end
    end
    local k_ = A.a4461177(iU)
    os.remove(k_)
    local ax = io.open(k_, "w")
    if not ax then
      dl = A.a7f545e6(string.gsub(k_, x .. y.plugin_name .. x .. "license.key", ""))
      dl = A.a7f545e6(string.gsub(k_, x .. "license.key", ""))
      if dl then
        return A.a77a80af(dl)
      end
      ax = io.open(k_, "w")
      if not ax then
        return A.a77a80af("Error 9 - Can't write to USB Drive")
      end
    end
    ax:write(kc)
    ax:close()
    A.abe1267b({
      a137091c = jg,
      a2d0242a = kc,
      adbc70c1 = y.plugin_name,
      a3396f27 = true
    })
    Printf(string.format("%s USB registration successful", y.plugin_name))
    local hO = {
      title = y.g_full_label .. " Registration",
      icon = y.company_label,
      message = string.format("USB Drive Registration successful\nWould you like to run %s now?", y.plugin_label),
      commands = {
        {
          value = 0,
          name = "Not now ..."
        },
        {
          value = 1,
          name = "Run " .. y.plugin_label
        }
      }
    }
    local hP = MessageBox(hO)
    if 0 == hP.result then
      A.a77a80af()
    else
      return "run", Root().Temp.DriveCollect[h_]
    end
  end
  
  function A.aeeda346(kL, l0, jg, cy, l1, l2)
    local e, dl, l3
    
    local function l4(dl)
      if l3 then
        A.ad7e2935(l3)
      end
      e = nil
      collectgarbage("collect")
      return dl
    end
    
    local h_, iU
    if not jg then
      h_, iU = A.a995c01f(false, true)
    else
      h_ = jg.No
      iU = jg.Path
    end
    if 0 == h_ or not iU then
      return l4("Error - No Drive Selected for download")
    end
    l3 = A.a4b7900b(kL .. ":")
    SetProgressText(y.g_progress[l3], " Downloading Update")
    SetProgressRange(y.g_progress[l3], 1, 1)
    SetProgress(y.g_progress[l3], 1)
    local iD = require("mime")
    if not iD then
      return l4("Error - Missing requirements for download")
    end
    local iG = {
      a5011716 = "GET",
      ab57f563 = "https://ma.tools/AMLMJH/downloads/zip/",
      ac860725 = {
        ["product"] = kL,
        ["version"] = string.gsub(l0, "%a", ""),
        ["usbHash"] = cy
      },
      ac420da5 = 60,
      a3330760 = true,
      a840e7b3 = true,
      a6da9d3f = false
    }
    e, dl = A.a82ced2a(iG)
    if dl then
      return l4(dl)
    end
    if not e or e.a4301d45 ~= 200 then
      local kf = "Error 13 - Please check you have a working internet connection"
      if e and e.a4301d45 then
        kf = string.format("Error 13 - Please check you have a working internet connection (%s)", e.a4301d45)
      end
      return l4(kf)
    end
    if not e.a2e146df then
      return l4("Error - Invalid download data")
    end
    if type(e.a2e146df) ~= "table" then
      return l4("Error - Failed to decode download data")
    end
    if not e.a2e146df["id"] then
      return l4("Error - MATools Server did not respond")
    end
    if e.a2e146df["id"] ~= "matools_download" then
      return l4("Error - MATools Server did not provide a valid response")
    end
    if e.a2e146df["error"] then
      return l4(e.a2e146df["error"])
    end
    if not e.a2e146df["zip_url"] then
      return l4("Invalid download path")
    end
    if not e.a2e146df["zip_checksum"] then
      return l4("Error - Invalid download data - Missing ZIP checksum")
    end
    if 1 == h_ then
      iU = string.gsub(iU, "MALightingTechnology.-$", "MALightingTechnology")
    end
    local l5 = A.abb67167(iU, y.plugins_path)
    local l6 = A.abb67167(l5, string.format("%s_V%s.zip", kL, l0))
    local iG = {
      a5011716 = "GET",
      ab57f563 = e.a2e146df["zip_url"],
      a6da9d3f = false,
      add51e8e = l6
    }
    local l7, dl = A.a82ced2a(iG)
    if dl then
      return l4(dl)
    end
    if not l7 then
      return l4("Error - Failed to receive update")
    end
    if not FileExists(l6) then
      return l4("Error - Failed to download update")
    end
    local l8 = A.ac22c92f(l6)
    if l8 ~= e.a2e146df["zip_checksum"] then
      return l4("Error - File download was corrupted")
    end
    SetProgress(y.g_progress[l3], 1)
    local dc, dl = A.a7ce60a4(l6, l5)
    if not dc then
      return l4("Failed to extract update")
    end
    os.remove(l6)
    local l9 = A.abb67167(l5, string.format("%s_V%s.xml", kL, l0))
    if not FileExists(l9) then
      return l4("Extracted update is missing XML file")
    end
    A.ad7e2935(l3)
    local la
    if l1 then
      local iw = DataPool()["Plugins"][kL]
      iw = iw or Obj.Acquire(DataPool().Plugins)
      if iw then
        do
          local lb = iw["No"]
          local lc = Cmd(string.format("Select Drive %s", h_))
          if lc then
            function la()
              CmdIndirectWait(string.format("cd %s ; Library", Obj.ToAddr(DataPool()["Plugins"])))
              
              A.a880c84e(y.g_full_label, string.format("Success! %s has been imported into the current showfile at plugin %s", kL, lb), true)
              CmdIndirectWait(string.format("Delete %s /nc ; Import Lib \"%s_V%s.xml\" At %s /o; cd %s", lb, kL, l0, lb, Obj.ToAddr(Root())))
            end
          end
          if not lc then
            return l4(string.format("%s V%s downloaded but failed to import into showfile because the drive was not selected. Please import manually.", kL, l0))
          end
        end
      else
        return l4(string.format("%s V%s downloaded but failed to import into showfile.\nPlease import manually.", kL, l0))
      end
    end
    if not l2 then
      A.a880c84e(y.g_full_label, string.format("Success! %s V%s has been downloaded to:\n%s", kL, l0, A.abb67167(iU, y.plugins_path)), true)
    end
    e = nil
    collectgarbage("collect")
    return nil, la
  end
  
  function A.af4a7fad()
    return A.a70dd33b()
  end
  
  function A.afa314be(ld)
    if not y.g_running then
      if ld then
        A.a77a80af(ld)
      end
      Cmd(string.format("Off %s", Obj.ToAddr(Obj.Parent(y.g_arg4))))
    end
  end
  
  function A.a70dd33b(kc, h_, ka, le)
    local lf, lg
    if not le then
      lf, lg = A.a9d9253d(y.g_arg4)
    end
    
    local function lh()
      A.a4b25f9e()
      local li
      if not kc then
        kc = ""
      end
      local cx
      if h_ then
        local dl
        cx, dl = A.a45cc415(A.a4461177(h_.Path), "r")
        if not cx or dl then
          return
        end
        li = string.match(cx, "a%=(%d+)%?")
      else
        li = GetVar(UserVars(), string.format("MT_%s_ack", y.plugin_label))
      end
      local lj, lk
      if ka and type(ka) == "table" then
        lj = ka.abe80de0
        lk = ka.aae54dfa
      end
      local iG = {
        a5011716 = "GET",
        ab57f563 = "https://ma.tools/AMLMJH/api/plugins/check-status/",
        ac860725 = {
          ["product"] = y.plugin_name,
          ["usbHash"] = kc or y.a86bf28d,
          ["usbName"] = lk,
          ["usbID"] = lj,
          ["pluginVersion"] = string.gsub(y.plugin_version, "%a", ""),
          ["pluginValue"] = lf,
          ["filterValue"] = y.a6408a5f
        },
        a6da9d3f = true
      }
      local e, dl = A.a82ced2a(iG)
      if dl then
        return
      end
      if not e or e.a4301d45 ~= 200 then
        return
      end
      if e.a2e146df and e.a2e146df["filter"] and 0 == e.a2e146df["filter"] and not y.g_running and kc and "" ~= string.gsub(kc, " ", "") then
        A.abe1267b({
          a137091c = h_,
          a2d0242a = kc,
          adbc70c1 = y.plugin_name,
          a3396f27 = true
        })
      end
      if e.a2e146df and e.a2e146df["validity"] and type(e.a2e146df["validity"]) == "number" and 0 == e.a2e146df["validity"] then
        lg = false
      end
      if not lg and not y.g_running and not le then
        if e.a2e146df and e.a2e146df["notices"] and type(e.a2e146df["notices"]) == "table" then
          local ll = e.a2e146df["notices"][1]
          if ll then
            local dl, la = A.aeeda346(y.plugin_label, ll["ProductVersionID"], h_, kc, true, false)
            if not dl then
              if la then
                return la()
              end
            else
              A.a77a80af(dl)
            end
          end
        end
        A.afa314be("Please re-download and re-import the plugin.")
        return
      end
      if e.a2e146df and e.a2e146df["notices"] and type(e.a2e146df["notices"]) == "table" then
        for lm, ll in pairs(e.a2e146df["notices"]) do
          local ln = ll["NoticeID"]
          local lo = ll["Content"]
          local lp = ll["ProductVersionID"]
          local lq = ll["ProductVersionDate"]
          local lr
          if not ln then
            return
          end
          if not tonumber(ln) then
            return
          end
          if not tonumber(li) then
            if tonumber(ln) then
              lr = true
            end
          elseif tonumber(ln) > tonumber(li) then
            lr = true
          end
          if lp and not A.a2c6e9b4(lp, y.plugin_version, false) then
            lr = false
          end
          local ls = li
          local la
          if lr then
            local hO = {
              title = y.g_full_label .. " Notification",
              icon = y.company_label,
              message = string.format("%s", lo),
              commands = {
                {
                  value = 0,
                  name = "Ok"
                }
              },
              states = {
                {
                  name = "Don't show again   ",
                  state = false,
                  group = 1
                }
              }
            }
            if lp and A.a2c6e9b4(lp, y.plugin_version, false) then
              table.insert(hO["commands"], {
                value = 1,
                name = "Download and Install"
              })
            end
            local lt
            local hP = MessageBox(hO)
            if true == hP.states["Don't show again   "] and 1 ~= hP.result then
              local iG = {
                a5011716 = "GET",
                ab57f563 = "https://ma.tools/AMLMJH/notices/receipt.php",
                ac860725 = {
                  ["USBSERIAL"] = kc,
                  ["Product"] = y.plugin_name,
                  ["NoticeID"] = ln,
                  ["Download"] = 0
                },
                a6da9d3f = true
              }
              local e, dl = A.a82ced2a(iG)
              ls = ln
            end
            if 1 == hP.result then
              local dl
              dl, la = A.aeeda346(y.plugin_label, lp, nil, kc, true, false)
              if dl then
                A.a77a80af(dl)
                return
              else
                local iG = {
                  a5011716 = "GET",
                  ab57f563 = "https://ma.tools/AMLMJH/notices/receipt.php",
                  ac860725 = {
                    ["USBSERIAL"] = kc,
                    ["Product"] = y.plugin_name,
                    ["NoticeID"] = ln,
                    ["Download"] = 1
                  },
                  a6da9d3f = true
                }
                local e, dl = A.a82ced2a(iG)
              end
            end
          end
          if h_ then
            local lu = A.a4461177(h_.Path)
            local dl
            cx, dl = A.a45cc415(lu, "r")
            if not dl and cx then
              local lv = string.sub(cx, 1, 64)
              cx = lv .. string.format("a=%s?", ls)
              A.a62325b0(lu, cx, "w")
            end
          else
            SetVar(UserVars(), string.format("MT_%s_ack", y.plugin_label), ls)
          end
          if la then
            la()
          end
        end
      end
      if e.a2e146df and e.a2e146df["license"] and h_ and e.a2e146df["license"]["deregister"] then
        A.a097118c()
      end
    end
    
    Timer(lh, 1, 1, nil, nil)
    if not lg and not y.g_running then
      return false
    end
    return true
  end
  
  function A.a097118c()
    local lw = A.accd9825(true)
    local lx = {}
    for ac, e4 in pairs(lw) do
      lx[e4[2]] = ac
    end
    local hO = {
      title = y.g_full_label .. " - USB De-registration",
      icon = y.company_label,
      message = string.format("You have asked us to de-register one of your USB drives from %s.\n\nPlease select which USB to de-register.", y.plugin_label),
      commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Continue"
        }
      },
      selectors = {
        {
          name = "USB Drive",
          values = lx,
          selectedValue = 1,
          type = 0
        }
      }
    }
    local hP = MessageBox(hO)
    if 0 == hP.result then
      return
    end
    local jc = lw[hP.selectors["USB Drive"]][3]
    if not jc then
      A.a880c84e(y.g_full_label .. " - USB De-registration", "Please select a valid USB Drive", true)
      return
    end
    local hO = {
      title = y.g_full_label .. " - USB De-registration",
      icon = y.company_label,
      message = string.format("You have selected the following drive to be de-registered.\n\n%s\n%s\n\nPlease confirm you have happy to continue by entering your license key...", jc.Name, jc.Path),
      commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Continue"
        }
      },
      inputs = {
        {
          name = "License Key",
          value = "",
          maxTextLength = 15
        }
      }
    }
    local hP = MessageBox(hO)
    if 0 == hP.result then
      return
    end
    local kW, dl, ka = A.a7153475(jc, false, nil)
    if dl then
      return A.a77a80af(dl)
    end
    local kc = R.ace2ba8b(R.a7948bc8(kW), true)
    local ly = hP.inputs["License Key"]
    ly = A.a1aebd90(ly)
    local iG = {
      a5011716 = "POST",
      ab57f563 = "https://ma.tools/AMLMJH/licenses/deregister/",
      a16c6c1d = {
        ["Content-Type"] = "application/json"
      },
      a0f236ec = {
        {
          ["license"] = ly,
          ["usbHash"] = kc
        }
      },
      a6da9d3f = false
    }
    local e, dl = A.a82ced2a(iG)
    if dl then
      return A.a77a80af(dl)
    end
    if not e or e.a4301d45 ~= 200 or not e.a6987d37 then
      A.a77a80af("De-registration request failed")
    end
    e = e or {}
    local cp = require("json")
    aabcb47d, e.a2e146df = pcall(cp.decode, e.a6987d37)
    if not e.a2e146df or e.a2e146df["status"] ~= "success" then
      A.a77a80af("De-registration request failed")
    end
    if not A.abe1267b({
      a137091c = jc,
      a2d0242a = kc,
      adbc70c1 = y.plugin_name,
      a3396f27 = true
    }) then
      A.a77a80af("De-registration failed")
      return
    end
    if not A.abe1267b({
      a137091c = jc,
      a2d0242a = kc,
      adbc70c1 = y.plugin_name,
      a3396f27 = false
    }) then
      A.a77a80af("Error 6004")
    end
    if pcall(A.afc98ff4, jc.Path) then
      os.remove(A.a4461177(jc.Path))
    end
    A.a880c84e(y.g_full_label .. " - USB De-registration", string.format("You have succesfully de-registered the following USB drive from %s\n\n%s\n%s", y.plugin_label, jc.Name, jc.Path), true)
  end
  
  function A.a942465d(dl)
    local d0 = "We've made some improvements to enhance your experience with our plugin. To complete this update, please connect to the internet and run the plugin again.\n\nYou will only need to do this once, then you can continue to use the plugin offline."
    if dl then
      d0 = string.format("%s\n\n%s", d0, dl)
    end
    A.a880c84e(y.g_full_label, d0, true)
  end
  
  function A.abe1267b(dH)
    local function lz(dl)
      if not dH.ad51735a then
        A.a942465d(dl)
      end
    end
    
    local e, dl = A.af137762({
      abe96a5e = {
        ["action"] = "b_c",
        ["k1"] = dH.a2d0242a,
        ["k2"] = dH.adbc70c1,
        ["k3"] = dH.a137091c.Path,
        ["k4"] = dH.a3396f27
      },
      a71a4054 = false,
      ae4e8ed7 = 2
    })
    if not e then
      local kf = "Error 4801"
      if dl then
        kf = string.format("%s - %s", kf, dl)
      end
      lz(kf)
      return true
    elseif e["status"] == "error" then
      lz(e["error"])
      return true
    elseif e["status"] ~= "ok" then
      lz("Error 4802")
    end
    if e["data"]["r4"] ~= nil then
      y.a6408a5f = e["data"]["r4"]
    end
    if e["data"]["r4"] ~= nil then
      y.a6408a5f = e["data"]["r4"]
    end
    if not e["status"] then
      lz("Error 4802")
      return true
    end
    if e["status"] ~= "ok" then
      lz("Error 4803")
      return true
    end
    if e["data"]["r2"] then
      lz("Error 4804")
      return true
    end
    if e["data"]["r1"] then
      return true
    else
      return false
    end
  end
  
  function A.a14a92d1()
    local i_ = A.afd7a009("su.dat", nil)
    if not i_ then
      return
    end
    local lA = A.a8120b4a(i_) or {}
    if lA["su"] and A.a4aa1576.ace2ba8b(A.a4aa1576.a7948bc8(string.format("%sBFCA8D46D1C6C3A30A24B01832E1788BC387D62DF08E887A359BA4B776547080", lA["su"] or "")), true) == "0886A36434CF14F6562633D9239ECFA58F96EF7CE6D79CFD6DE16BF50E39CE94" then
      y.a7c5e585 = true
    end
  end
  
  function A.ac5cfb4a()
    local lB = A.a4aa1576.ace2ba8b(A.a4aa1576.a7948bc8(A.ac1abf02()), true)
    coroutine.yield(0.1)
    local lC = A.a4aa1576.ace2ba8b(A.a4aa1576.a7948bc8(A.ac1abf02()), true)
    local lD = A.a4aa1576.ace2ba8b(A.a4aa1576.a7948bc8(string.format("%s%s", lB, lC)), true)
    Printf(string.format("Private Key: %s", lB))
    Printf(string.format("Shared Key: %s", lC))
    Printf(string.format("Derived Key: %s", lD))
    A.a880c84e(y.g_full_label .. " - Super User Keys Generated", string.format("Private Key: %s\nShared Key: %s\nDerived Key: %s", lB, lC, lD), true)
  end
  
  function A.aabea68b()
    local lB = TextInput("Enter your private key", "")
    if not lB or "" == lB then
      return
    end
    local kd = A.a995c01f(true, true)
    if not kd then
      return
    end
    local jg = Root().Temp.DriveCollect[kd]
    if not jg then
      return
    end
    local i_ = A.afd7a009("su.dat", jg)
    if not i_ then
      return
    end
    local lA = A.a8120b4a(i_) or {}
    lA["su"] = lB
    A.a71ce10d(i_, lA)
    A.a880c84e(y.g_full_label .. " - Super User Key Generated", string.format("You have succesfully generated a super user key for %s\n\n%s\n%s", jg.Name, jg.Path, lB), true)
  end
  
  function A.a28ba948()
    local kd = A.a995c01f(true, true)
    if not kd then
      return
    end
    local jg = Root().Temp.DriveCollect[kd]
    if not jg then
      return
    end
    local i_ = A.afd7a009("su.dat", jg)
    if not i_ then
      return
    end
    local lA = A.a8120b4a(i_) or {}
    lA["su"] = nil
    A.a71ce10d(i_, lA)
    A.a880c84e(y.g_full_label .. " - Super User Key Removed", string.format("You have succesfully removed the super user key for %s\n\n%s", jg.Name, jg.Path), true)
  end
  
  local lE = {
    ["0"] = string.char(32) .. string.char(32),
    ["1"] = string.char(32) .. string.char(9),
    ["2"] = string.char(32) .. string.char(10),
    ["3"] = string.char(32) .. string.char(13),
    ["4"] = string.char(9) .. string.char(32),
    ["5"] = string.char(9) .. string.char(9),
    ["6"] = string.char(9) .. string.char(10),
    ["7"] = string.char(9) .. string.char(13),
    ["8"] = string.char(10) .. string.char(32),
    ["9"] = string.char(10) .. string.char(9),
    a = string.char(10) .. string.char(10),
    b = string.char(10) .. string.char(13),
    c = string.char(13) .. string.char(32),
    d = string.char(13) .. string.char(9),
    e = string.char(13) .. string.char(10),
    f = string.char(13) .. string.char(13)
  }
  local lF = {}
  for ac, e4 in pairs(lE) do
    lF[e4] = ac
  end
  
  function A.ad516638(lG)
    local cH = ""
    local Q = 1
    while not (Q + 1 > #lG) do
      local dr = lG:sub(Q, Q + 1)
      cH = cH .. (lF[dr] or "")
      Q = Q + 2
    end
    return cH
  end
  
  function A.a780c356()
    local lH = os.tmpname()
    os.remove(lH)
    os.execute("mkdir \"" .. lH .. "\"")
    return lH
  end
  
  function A.ac22c92f(kR)
    local dE = HostOS()
    local lI
    local lJ = string.rep("%x", 64)
    if dE == "Windows" then
      lI = string.format("certutil -hashfile \"%s\" SHA256", kR)
    elseif dE == "Linux" then
      lI = string.format("sha256sum \"%s\"", kR)
    else
      lI = string.format("shasum -a 256 \"%s\"", kR)
    end
    local lK = A.ae996e5a(lI)
    local lf
    if lK then
      lK = string.gsub(lK, "%s+", "")
      lf = string.match(lK, lJ)
    end
    if lf then
      return lf
    end
  end
  
  function A.a9d9253d(iw)
    if y.g_running then
      return nil, nil
    end
    local lL = A.a780c356()
    local lM = Obj.GetExportFileName(iw)
    local lN = A.abb67167(lL, lM)
    Printf(string.format("Exporting %s to %s", lM, lN))
    Obj.Export(iw, lL, Obj.Parent(iw).Name)
    local lO, lP
    if HostOS() == "Windows" then
      lO = "rb"
      lP = "wb"
    else
      lO = "r"
      lP = "w"
    end
    local ax = io.open(lN, lO)
    local j2 = ""
    if ax then
      j2 = ax:read("a")
      ax:close()
    else
      return nil, nil
    end
    local lQ = string.sub(j2, #j2 - 127, #j2)
    lQ = A.ad516638(lQ)
    local lR
    if lQ then
      lR = string.sub(j2, 1, #j2 - 128)
    else
      return nil, nil
    end
    ax = io.open(lN, lP)
    if ax then
      ax:write(lR)
      ax:close()
    else
      return nil, nil
    end
    local lf = A.ac22c92f(lN)
    if not lf then
      return nil, nil
    end
    
    local function lS()
      A.a3e57b7d(lL)
    end
    
    Timer(lS, 0, 1, nil, nil)
    if lf ~= lQ then
      return lf, false
    else
      return lf, true
    end
  end
  
  function A.a372f977(g5)
    local ax = assert(io.open(A.abb67167(g5, "test.txt"), "w"))
    ax:close()
    os.remove(A.abb67167(g5, "test.txt"))
  end
  
  function A.a1ab4f8e(iU)
    local lT = A.abb67167(iU, y.plugin_name)
    local lU = A.abb67167(iU, y.company_name, y.plugin_name)
    local lV = A.abb67167(iU, y.company_name)
    if pcall(A.a372f977, lT) and not pcall(A.a372f977, lU) then
      if not pcall(A.a372f977, lV) then
        A.a7f545e6(lV)
      end
      local dc = os.rename(lT, lU)
      if not dc then
        return "Error 23 - Failed to move /%s/ folder to /MATools/%/\nPlease move this folder and try again."
      end
    end
  end
  
  function A.a0b6ce3b(lW, lX)
    local lY = string.match(lW, "(.-)[/\\\\][^/\\\\]*%." .. lX .. "$")
    return lY
  end
  
  function A.a1abee98(lZ, l_)
    local ec
    if HostOS() == "Mac" or HostOS() == "Linux" then
      ec = os.execute(string.format("cp \"%s\" \"%s\"", lZ, l_))
    elseif HostOS() == "Windows" then
      ec = os.execute(string.format("copy \"%s\" \"%s\"", lZ, l_))
    end
    if not ec then
      error(string.format("Failed to copy file: %s", lZ))
    end
  end
  
  local function m0(m1)
    local dx = m1 or 1
    return function()
      dx = (dx * 9301 + 49297) % 233280
      return dx / 233280
    end
  end
  
  local function m2(m1, m3, m4, m5)
    local m6 = m0(m1)
    local m7 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    local function m8()
      return math.floor(m6() * m5) + 1
    end
    
    local function m9(ma)
      if 0 == ma then
        return m8()
      end
      local ec = {}
      local mb = m4
      for Q = 1, mb do
        local c4 = math.floor(m6() * m4) + 1
        ec[c4] = m9(ma - 1)
      end
      return ec
    end
    
    return m9(m3)
  end
  
  function A.a45cc415(kR, lO)
    lO = lO or "r"
    if not FileExists(kR) then
      return nil, "File does not exist"
    end
    local ij = os.tmpname()
    local dc = pcall(A.a1abee98, kR, ij)
    if not dc then
      return nil, "Failed to copy temp file"
    end
    local ax = io.open(ij, lO)
    if not ax then
      return nil, "Failed to open file"
    end
    local j2 = ax:read("*all")
    ax:close()
    os.remove(ij)
    return j2
  end
  
  function A.a62325b0(kR, mc, lP)
    lP = lP or "w"
    local ij = os.tmpname()
    local ax = io.open(ij, lP)
    if not ax then
      return nil, "Failed to open temp file"
    end
    ax:write(mc)
    ax:close()
    local dc = pcall(A.a1abee98, ij, kR)
    if not dc then
      return nil, "Failed to copy temp file"
    end
    os.remove(ij)
    return true
  end
  
  function A.a4461177(iU)
    return A.abb67167(iU, y.company_name, y.plugin_name, "license.key")
  end
  
  function A.ac202e2a(iU)
    if not iU then
      return
    end
    if string.match(iU, "shows$") then
      iU = GetPath(GetPathType(Root()))
    end
    return A.abb67167(iU, y.company_name, y.plugin_name)
  end
  
  function A.afc98ff4(iU)
    if not FileExists(A.a4461177(iU)) then
      error()
    end
  end
  
  function A.afcdb880()
    return os.date("%Y%m%d")
  end
  
  function A.a6e346e4()
    A.a4b25f9e()
    y.ab134fc3 = nil
    y.a86bf28d = nil
    if A.tbl_a47b and type(A.tbl_a47b) == "table" and #A.tbl_a47b > 0 then
      for Q = #A.tbl_a47b, 1, -1 do
        Unhook(A.tbl_a47b[Q])
        A.tbl_a47b[Q] = nil
      end
    end
  end
  
  function A.aeb40c85()
    local md = Root().Temp.DriveCollect
    for Q = 1, Obj.Count(md) do
      local jg = md[Q]
      if jg and Obj.IsValid(jg) and jg["DriveType"] == "Removeable" then
        local iU = jg["Path"]
        local dl = A.a1ab4f8e(iU)
        if dl then
          A.a77a80af(dl)
          return false, string.format("%s - %s", y.company_name, y.plugin_label), "true", jg
        end
        if pcall(A.afc98ff4, jg.Path) then
          local j2, dl = A.a45cc415(A.a4461177(iU), "r")
          j2 = j2 or ""
          local lv = string.sub(j2, 1, 64)
          local me, kc
          if y.ab134fc3 == R.ace2ba8b(string.format("%s%s", y.plugin_name, lv, A.afcdb880()), true) then
            A.a4b25f9e()
            me = y.ab134fc3
          else
            A.a4b25f9e()
            local kW, dl, ka = A.a7153475(jg, false, nil)
            kW = kW or ""
            kc = R.ace2ba8b(R.a7948bc8(kW), true)
            if not y.a9776b51 and not A.a70dd33b(kc, jg, ka, false) then
              return false, string.format("%s - %s", y.company_name, y.plugin_label), "false", jg
            end
            if "" == kW then
              kc = nil
            end
          end
          if (lv == kc and nil ~= kc or y.ab134fc3 == me and y.ab134fc3 ~= nil) and not A.abe1267b({
            a137091c = jg,
            a2d0242a = lv,
            adbc70c1 = y.plugin_name,
            a3396f27 = false,
            ad51735a = true
          }) then
            y.flag_b595 = true
            if not y.ab134fc3 and lv == kc and nil ~= kc then
              y.ab134fc3 = R.ace2ba8b(string.format("%s%s", y.plugin_name, lv, A.afcdb880()), true)
              y.a86bf28d = kc
              if not A.tbl_a47b then
                A.tbl_a47b = {}
              end
              table.insert(A.tbl_a47b, HookObjectChange(A.a6e346e4, Root().Temp.DriveCollect, Obj.Parent(y.g_arg4)))
            end
            local mf = m2(99, 3, 14, 16)
            for ac, e4 in pairs(y.g_h_tables) do
              for mg, mh in pairs(mf[ac]) do
                e4[mg] = mh
              end
            end
            return true, string.format("%s - %s", y.company_name, y.plugin_label), "false", jg
          end
        end
      end
    end
    if y.a9776b51 and not y.ae4e3afe then
      y.a9776b51 = nil
      return false, string.format("%s - %s", y.company_name, y.plugin_label), "true", nil
    elseif not y.ae4e3afe then
      if y.a9776b51 then
        y.a9776b51 = nil
      end
      local hO = {
        title = y.g_full_label .. " - No License Found",
        icon = y.company_label,
        message = string.format("No license has been found for %s\nPlease check you have inserted your registered USB Drive.\nDo you want to register a new USB Drive?\n\n\nIf you believe your USB drive is registered, and are still seeing this warning, try re-installing the plugin.", y.plugin_name)
      }
      if true == y.g_first_run then
        hO.commands = {
          {
            value = 0,
            name = "Cancel"
          },
          {
            value = 1,
            name = "Try Again"
          },
          {
            value = 3,
            name = "Run Trial"
          },
          {
            value = 2,
            name = "Register USB"
          }
        }
      else
        hO.commands = {
          {
            value = 0,
            name = "Cancel"
          },
          {
            value = 1,
            name = "Try Again"
          },
          {
            value = 2,
            name = "Register USB"
          }
        }
      end
      local hP = MessageBox(hO)
      if 1 == hP.result then
        A.af321f12()
        local e, mi, mj, h_
        e, mi, mj, h_ = A.aeb40c85()
        if e then
          return true, string.format("%s - %s", y.company_name, y.plugin_label), "false", h_
        end
        return false, string.format("%s - %s", y.company_name, y.plugin_label), "true", h_
      elseif 2 == hP.result then
        local mk, h_
        mk, h_ = A.a8abe99e()
        if mk == "run" then
          local mf = m2(99, 3, 14, 16)
          for ac, e4 in pairs(y.g_h_tables) do
            for mg, mh in pairs(mf[ac]) do
              e4[mg] = mh
            end
          end
          A.a31978a8()
          return true, string.format("%s - %s", y.company_name, y.plugin_label), "false", h_
        else
          return false, string.format("%s - %s", y.company_name, y.plugin_label), "false", h_
        end
      elseif 3 == hP.result then
        local mf = m2(99, 3, 14, 16)
        for ac, e4 in pairs(y.g_h_tables) do
          for mg, mh in pairs(mf[ac]) do
            e4[mg] = mh
          end
        end
        return true, string.format("%s - %s Trial", y.company_name, y.plugin_label), "true", nil
      else
        return false, string.format("%s - %s", y.company_name, y.plugin_label), "true", nil
      end
    else
      y.flag_b595 = false
      return true, string.format("%s - %s - Free", y.company_name, y.plugin_label), "false", nil
    end
  end
  
  function A.accd9825(ml)
    local md = Root().Temp.DriveCollect
    local mm = {}
    for Q = 1, Obj.Count(md) do
      local h_ = md[Q]
      if ml then
        if h_.DriveType == "Removeable" then
          table.insert(mm, {
            "handle",
            h_.Name,
            h_
          })
        end
      else
        table.insert(mm, {
          "handle",
          h_.Name,
          h_
        })
      end
    end
    return mm
  end
  
  function A.a995c01f(ml, mn)
    local mm = A.accd9825(ml)
    if 0 == #mm then
      return nil
    end
    if 1 == #mm and not mn then
      local mo = mm[1][3]
      return mo.No, mo.Path
    end
    local mp, mo = PopupInput({
      title = "Drive",
      caller = GetFocusDisplay(),
      items = mm
    })
    if not mp then
      return 0
    end
    mo = StrToHandle(mo)
    local iU = mo.Path
    if HostOS() == "Windows" then
      iU = string.gsub(iU, x, "")
    end
    return mo.No, iU
  end
  
  A.a0ad9220 = {
    "%.",
    "%?",
    "%,",
    "%&",
    "%*",
    "%$",
    "%^",
    "%:",
    "%\\\\",
    "%|",
    "%~",
    "%{",
    [14] = "328a",
    "%}"
  }
  
  function A.a3fcfd41(hG)
    for ac, e4 in pairs(A.a0ad9220) do
      hG = string.gsub(hG, e4, "")
    end
    return hG
  end
  
  function A.a9c04c45(hG)
    hG = string.gsub(hG, "%.", "-")
    return hG
  end
  
  function A.a59b6fcc(mq, mr)
    mq = tonumber(mq) or 0
    mr = tonumber(mr) or 0
    local ms = 10 ^ mr
    return math.floor(mq * ms + 0.5) / ms
  end
  
  function A.ab4cf9a2(hG)
    hG = tonumber(hG) or 0
    if 0 == hG % 1 then
      return math.floor(hG)
    end
    local ms = 100.0
    return math.floor(hG * ms + 0.5) / ms
  end
  
  function A.ab5f5833(mt, mu, mv)
    if not mt or not Obj.IsValid(mt) then
      return nil, "Error 41 - Invalid object path"
    end
    mu = tonumber(mu)
    for Q = mu, 9999 do
      if not Obj.IsValid(mt[math.floor(Q)]) then
        local mw
        if type(mv) == "table" then
          for ac, e4 in pairs(mv) do
            if e4 == Q then
              mw = true
            end
          end
        end
        if not mw then
          return math.floor(Q), nil
        end
      end
    end
    return nil, "Error 3 - Can't find empty " .. mt["Name"] .. " slot"
  end
  
  function A.a4c6927e(hG)
    return math.floor(tonumber(hG) * 16777216)
  end
  
  function A.a9af03ee(hG)
    return tonumber(hG) / 16777216
  end
  
  function A.aa3c2984(mx, my)
    if not mx then
      return {
        a3289b61 = 0,
        a56f129b = 0,
        ac709510 = 0,
        a98fbcfd = 0
      }
    end
    local mz = 16777216
    my = my or 100
    local mA = math.floor(mx / 60 / 60 / mz)
    local mB = math.floor((mx - mA * 60 * 60 * mz) / 60 / mz)
    local mC = math.floor((mx - mA * 60 * 60 * mz - mB * 60 * mz) / mz)
    local mD = math.floor((mx - mA * 60 * 60 * mz - mB * 60 * mz - mC * mz) / math.floor(mz / my))
    return {
      a3289b61 = mA,
      a56f129b = mB,
      ac709510 = mC,
      a98fbcfd = mD
    }
  end
  
  function A.a19885a6(hG, mz)
    hG.a3289b61 = hG.a3289b61 * 16777216 * 60 * 60
    hG.a56f129b = hG.a56f129b * 16777216 * 60
    hG.ac709510 = hG.ac709510 * 16777216
    hG.a98fbcfd = hG.a98fbcfd * 16777216 / mz
    local mE = math.floor(hG.a3289b61 + hG.a56f129b + hG.ac709510 + hG.a98fbcfd)
    return mE
  end
  
  function A.abb404ee(mF)
    local mG = Obj.Get(mF, "No", Enums.Roles.Display)
    mG = tonumber(mG)
    return mG
  end
  
  function A.a9e333b7(mH, mG)
    if not mH then
      return nil
    end
    local mI = Obj.Children(mH)
    if not mI or type(mI) ~= "table" then
      return nil
    end
    for cr, mJ in pairs(mI) do
      if A.abb404ee(mJ) == mG then
        return mJ
      end
    end
  end
  
  function A.ac6f27fe(mK, mL, ek)
    ek = ek or "MATools"
    if not mL then
      if mK.num_9b22 then
        mL = mK.num_9b22
      else
        mL = 255
      end
    end
    local mM = {}
    mM.af4644a2 = ShowData().Appearances
    mM.a6f7c8bc = Obj.Children(mM.af4644a2)
    for Q, mN in ipairs(mM.a6f7c8bc) do
      if mN.Name and type(mN.Name) == "string" and string.gsub(mN.Name, "%#%d+", "") == ek then
        if not mM.tbl_68f7 then
          mM.tbl_68f7 = {}
        end
        table.insert(mM.tbl_68f7, mN)
      end
    end
    if mM.tbl_68f7 then
      for Q, mN in pairs(mM.tbl_68f7) do
        if mN.BackR == mK.ab9049d9 and mN.BackG == mK.af7ad2a7 and mN.BackB == mK.aea17af0 and mN.BackAlpha == mL then
          return mN
        end
      end
    end
    mM.a45cba0e = A.ab5f5833(mM.af4644a2, 1)
    Obj.Create(mM.af4644a2, mM.a45cba0e)
    mM.af3214b7 = mM.af4644a2[mM.a45cba0e]
    if not mM.af3214b7 then
      Obj.Insert(mM.af4644a2, mM.a45cba0e)
      mM.af3214b7 = mM.af4644a2[mM.a45cba0e]
      if not mM.af3214b7 then
        Cmd(string.format("Store Appearance %s /o", mM.a45cba0e))
        mM.af3214b7 = mM.af4644a2[mM.a45cba0e]
        if not mM.af3214b7 then
          return string.format("Error 16 - Can't create Appearance %s", mM.a45cba0e)
        end
      end
    end
    mM.af3214b7.Name = ek
    mM.af3214b7.BackR = mK.ab9049d9
    mM.af3214b7.BackG = mK.af7ad2a7
    mM.af3214b7.BackB = mK.aea17af0
    mM.af3214b7.BackAlpha = mL
    return mM.af3214b7
  end
  
  function A.a20696f8(mO, mP, mQ, mR)
    local mS = Root().ColorTheme.ColorGroups[mP]
    if not mS then
      mS = Obj.Append(Root().ColorTheme.ColorGroups)
      mS.Name = mP
    end
    local mT = string.format("%02X%02X%02X%02X", mO.ab9049d9, mO.af7ad2a7, mO.aea17af0, mO.num_9b22)
    if not mR then
      for Q = 1, Obj.Count(mS) do
        if mS[Q].RGBA == mT then
          return mS[Q]
        end
      end
    elseif mQ and type(mQ) == "string" and mS[mQ] then
      return mS[mQ]
    end
    local mU = Obj.Append(mS)
    mU.RGBA = mT
    if mQ then
      mU.Name = mQ
    end
    return mU
  end
  
  function A.a3d854b5(mV)
    local mW = {}
    mW.a9883a73 = Obj.Create(ShowData().Appearances, A.ab5f5833(ShowData().Appearances, 1))
    if not mW.a9883a73 then
      return mV.aa86fe72, mV.abd77275
    end
    if Obj.GetClass(mW.a9883a73) ~= "Appearance" then
      return mV.aa86fe72, mV.abd77275
    end
    mW.a83dcd09 = mV.aa86fe72 or nil
    mW.a7ec1982 = mV.abd77275 or {
      ab9049d9 = 0,
      af7ad2a7 = 0,
      aea17af0 = 0
    }
    mW.a9883a73.BackR = mW.a7ec1982.ab9049d9
    mW.a9883a73.BackG = mW.a7ec1982.af7ad2a7
    mW.a9883a73.BackB = mW.a7ec1982.aea17af0
    mW.a9883a73.BackAlpha = not mV.a97c08f7 and (mW.a7ec1982.num_9b22 or 255) or 255
    mW.a2f7658d = GetFocusDisplay().No
    mW.aa2da44a = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(mW.a2f7658d)
    mW.a57b4ef7 = mW.aa2da44a.ModalOverlay
    mW.acdcf15c = Obj.Append(mW.a57b4ef7, "BaseInput")
    mW.acdcf15c["Name"] = y.plugin_label .. "Window"
    mW.acdcf15c["H"] = 600
    mW.acdcf15c["W"] = 720
    mW.acdcf15c["Rows"] = 2
    mW.acdcf15c["Columns"] = 1
    mW.acdcf15c[1][1]["SizePolicy"] = "Fixed"
    mW.acdcf15c[1][1]["Size"] = "60"
    mW.acdcf15c[1][2]["SizePolicy"] = "Stretch"
    mW.acdcf15c["AutoClose"] = "Yes"
    mW.acdcf15c["CloseOnEscape"] = "Yes"
    mW.acdcf15c["Visible"] = "No"
    mW.acfae282 = Obj.Append(mW.acdcf15c, "TitleBar")
    mW.acfae282["Rows"] = 1
    mW.acfae282["Columns"] = 1
    mW.acfae282["Anchors"] = "0,0"
    mW.acfae282["Texture"] = "corner3"
    mW.af134c94 = Obj.Append(mW.acfae282, "TitleButton")
    mW.af134c94["text"] = y.g_full_label .. " - Color Picker"
    mW.af134c94["Texture"] = "corner3"
    mW.af134c94["Anchors"] = "0,0"
    mW.af134c94["Icon"] = y.company_label
    mW.a87a404e = Obj.Append(mW.acdcf15c, "DialogFrame")
    mW.a87a404e["H"] = "100%"
    mW.a87a404e["W"] = "100%"
    mW.a87a404e["Rows"] = 3
    mW.a87a404e["Columns"] = 1
    mW.a87a404e["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    mW.a87a404e[1][1]["SizePolicy"] = "Fixed"
    mW.a87a404e[1][1]["Size"] = "60"
    mW.a87a404e[1][2]["SizePolicy"] = "Stretch"
    mW.a87a404e[1][3]["SizePolicy"] = "Fixed"
    mW.a87a404e[1][3]["Size"] = "60"
    if not mV.aa86fe72 then
      mW.a87a404e[1][1]["Size"] = 0
    end
    mW.a5150058 = Obj.Append(mW.a87a404e, "LineEdit")
    mW.a5150058["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    mW.a5150058["AlignmentV"] = "Center"
    mW.a5150058["Prompt"] = "Label:  "
    mW.a5150058["Content"] = mW.a83dcd09
    mW.a5150058["ContentDriven"] = "Yes"
    mW.a5150058["ContentWidth"] = "No"
    mW.a5150058["TextAutoAdjust"] = "Yes"
    mW.a5150058["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    mW.a5150058["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    mW.a5150058["HideFocusFrame"] = "Yes"
    mW.a5150058["PluginComponent"] = mV.a6e71315
    mW.a5150058["TextChanged"] = "onLabelChanged" .. "CP"
    mV.add46b74["onLabelChanged" .. "CP"] = function(mX)
      if string.gsub(mX["Content"], " ", "") ~= "" then
        mW.a83dcd09 = mX["Content"]
      end
    end
    mW.ad27be5b = Obj.Append(mW.a87a404e, "UILayoutGrid")
    mW.ad27be5b["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    mW.ad27be5b["Rows"] = 1
    mW.ad27be5b["Columns"] = 2
    mW.ad27be5b[2][1]["SizePolicy"] = "Stretch"
    mW.ad27be5b[2][2]["SizePolicy"] = "Fixed"
    mW.ad27be5b[2][2]["Size"] = 0
    if not mV.a97c08f7 then
      mW.ad27be5b[2][2]["SizePolicy"] = "Fixed"
      mW.ad27be5b[2][2]["Size"] = 120
    end
    mW.aa493be9 = Obj.Append(mW.ad27be5b, "ColorPickHSRect")
    mW.aa493be9["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    mW.aa493be9["PluginComponent"] = mV.a6e71315
    mW.aa493be9["Target"] = mW.a9883a73
    mW.aa493be9["System"] = "RGBA"
    mW.accfe5b0 = A.a20696f8({
      ab9049d9 = 0,
      af7ad2a7 = 0,
      aea17af0 = 0,
      a9b22e25 = 255
    }, "MATools", "ColorPickerOverlay", true)
    mW.a6a3a0ee = Obj.Append(mW.ad27be5b, "UIObject")
    mW.a6a3a0ee["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    mW.a6a3a0ee["BackColor"] = mW.accfe5b0
    mW.a6a3a0ee["HasHover"] = false
    mW.a6a3a0ee["Interactive"] = false
    mW.a62fb077 = Obj.Append(mW.ad27be5b, "UiFader")
    mW.a62fb077["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    mW.a62fb077["Target"] = mW.a9883a73
    mW.a62fb077["Property"] = "Alpha"
    if mV.a40f0240 then
      mW.a62fb077["Text"] = "Brightness"
    else
      mW.a62fb077["Text"] = "Alpha"
    end
    mW.a62fb077["Changed"] = "OnAlphaChanged"
    
    function mW.ac7f26c2(mX)
      if not mX then
        return
      end
      mW.accfe5b0.RGBA = string.format("000000%02X", 255 - mX.BackAlpha)
    end
    
    mW.a86259b0 = HookObjectChange(mW.ac7f26c2, mW.a9883a73, Obj.Parent(mV.a6e71315), nil)
    if A.a4077f93() then
      mW.aa493be9["System"] = "RGBBackGround"
      mW.a62fb077["System"] = "HSBBackGround"
    else
      mW.aa493be9["System"] = "BackGround"
      mW.a62fb077["System"] = "BackGround"
    end
    mW.acb7ef8a = Obj.Append(mW.a87a404e, "UILayoutGrid")
    mW.acb7ef8a["W"] = "100%"
    mW.acb7ef8a["H"] = "100%"
    mW.acb7ef8a["Anchors"] = {
      left = 0,
      right = 0,
      top = mW.a87a404e.Rows - 1,
      bottom = mW.a87a404e.Rows - 1
    }
    mW.acb7ef8a["AlignmentH"] = "Center"
    mW.acb7ef8a["AlignmentV"] = "Center"
    mW.acb7ef8a["Rows"] = 1
    mW.acb7ef8a["Columns"] = 2
    mW.aeb83fb7 = Obj.Append(mW.acb7ef8a, "Button")
    mW.aeb83fb7["W"] = "100%"
    mW.aeb83fb7["H"] = "100%"
    mW.aeb83fb7["X"] = 0
    mW.aeb83fb7["Y"] = 0
    mW.aeb83fb7["AlignmentH"] = "Center"
    mW.aeb83fb7["AlignmentV"] = "Center"
    mW.aeb83fb7["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    mW.aeb83fb7["Textshadow"] = 1
    mW.aeb83fb7["HasHover"] = "Yes"
    mW.aeb83fb7["Text"] = "Cancel"
    mW.aeb83fb7["Font"] = "Medium20"
    mW.aeb83fb7["PluginComponent"] = mV.a6e71315
    mW.aeb83fb7["Clicked"] = "OnCancelClicked" .. "CP"
    mW.aabbfc85 = Obj.Append(mW.acb7ef8a, "Button")
    mW.aabbfc85["W"] = "100%"
    mW.aabbfc85["H"] = "100%"
    mW.aabbfc85["AlignmentH"] = "Center"
    mW.aabbfc85["AlignmentV"] = "Center"
    mW.aabbfc85["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    mW.aabbfc85["Textshadow"] = 1
    mW.aabbfc85["HasHover"] = "Yes"
    mW.aabbfc85["Text"] = "OK"
    mW.aabbfc85["Font"] = "Medium20"
    mW.aabbfc85["PluginComponent"] = mV.a6e71315
    mW.aabbfc85["Clicked"] = "OnImportClicked" .. "CP"
    mW.flag_ac06 = true
    mV.add46b74["OnCancelClicked" .. "CP"] = function(mX)
      Obj.Delete(mW.a57b4ef7, Obj.Index(mW.acdcf15c))
      mW.flag_ac06 = false
    end
    mV.add46b74["OnImportClicked" .. "CP"] = function(mX)
      Obj.Delete(mW.a57b4ef7, Obj.Index(mW.acdcf15c))
    end
    mW.acdcf15c["Visible"] = "Yes"
    Obj.ShowModal(mW.acdcf15c)
    WaitObjectDelete(mW.acdcf15c)
    Unhook(mW.a86259b0)
    mW.a7ec1982 = {
      ab9049d9 = mW.a9883a73.BackR,
      af7ad2a7 = mW.a9883a73.BackG,
      aea17af0 = mW.a9883a73.BackB,
      a9b22e25 = mW.a9883a73.BackAlpha
    }
    Obj.Delete(ShowData().Appearances, Obj.Index(mW.a9883a73))
    if mW.flag_ac06 then
      return mW.a83dcd09, mW.a7ec1982
    else
      return mV.aa86fe72, mV.abd77275
    end
  end
  
  function A.ae8c00a9(mY, mZ)
    local m_, n0
    for ac, e4 in ipairs(mY) do
      e4.a13fc9d4 = DataPool().Macros[e4.a59a115b]
      if e4.a13fc9d4 then
        n0 = true
      end
    end
    local n1
    for ac, e4 in ipairs(mY) do
      if e4.a17e1a03 and type(e4.a17e1a03) == "string" and string.gsub(e4.a17e1a03, " ", "") ~= "" then
        e4.a17e1a03 = e4.a17e1a03 .. "  "
        local mw
        if n1 then
          for mg, mh in pairs(n1) do
            if e4.a17e1a03 == mh.name then
              mw = true
            end
          end
        end
        if not mw then
          local n2 = true
          if e4.ac922823 == false then
            n2 = false
          end
          n1 = n1 or {}
          table.insert(n1, {
            name = e4.a17e1a03,
            state = n2,
            group = 1
          })
        end
      end
    end
    local hO = {
      title = y.g_full_label .. " Setup Macros",
      icon = y.company_label,
      message = "We're going to build some macros for you. Are you happy to continue?",
      commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 2,
          name = "Create New"
        }
      }
    }
    if n0 then
      hO.commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Update Existing"
        },
        {
          value = 2,
          name = "Create New"
        }
      }
      hO.message = "We have found some existing macros for this plugin.\nWould you like to create new ones or update existing?"
    else
      hO.commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 2,
          name = "Continue"
        }
      }
    end
    if n1 then
      hO.states = n1
    end
    local hP = MessageBox(hO)
    local n3
    if 0 == hP.result then
      return
    elseif 1 == hP.result then
      n3 = true
    elseif 2 == hP.result then
      n3 = false
    end
    for ac, e4 in ipairs(mY) do
      if (not e4.a13fc9d4 or not n3) and (not e4.a17e1a03 or e4.a17e1a03 and hP.states and hP.states[e4.a17e1a03]) then
        e4.a13fc9d4 = nil
        if not m_ then
          local hO = {
            title = y.g_full_label .. " Setup Macros",
            icon = y.company_label,
            message = "We need to create some new macros for you.\nWhere would you like us to create them?",
            commands = {
              {
                value = 0,
                name = "Cancel"
              },
              {
                value = 1,
                name = "Ok"
              }
            },
            inputs = {
              {
                name = "Macro Number",
                value = A.ab5f5833(DataPool().Macros, 1),
                blackFilter = "",
                whiteFilter = "0123456789",
                vkPlugin = "NumericInput",
                maxTextLength = 4
              }
            }
          }
          local hP = MessageBox(hO)
          if 0 == hP.result then
            return false
          end
          m_ = hP.inputs["Macro Number"]
          m_ = tonumber(m_)
          if not m_ then
            return false
          end
        end
        m_ = A.ab5f5833(DataPool().Macros, m_)
        e4.a13fc9d4 = Obj.Create(DataPool().Macros, m_)
        if not e4.a13fc9d4 then
          Cmd(string.format("Store Macro %s /o", m_))
          e4.a13fc9d4 = DataPool().Macros[m_]
        end
        m_ = m_ + 1
      end
      if e4.a13fc9d4 then
        e4.a13fc9d4.Name = e4.a59a115b
        if Obj.Count(e4.a13fc9d4) > 0 then
          for Q = Obj.Count(e4.a13fc9d4), 1, -1 do
            Obj.Remove(e4.a13fc9d4, Q)
          end
        end
        for mg, mh in ipairs(e4.a4c23bc2) do
          local n4 = e4.a13fc9d4[mg]
          n4 = n4 or Obj.Append(e4.a13fc9d4)
          n4.Name = mh.a59a115b
          n4.Command = mh.a082ca40
          n4.Wait = mh.ac4fbd9d
          n4.Enabled = mh.a0be76e8
          n4.AddToCmdline = mh.ab68b3b0
          n4.Execute = mh.a0761a69
        end
      end
    end
    return true
  end
  
  function A.ac772a00(n5)
    local n6, n7
    
    local function n8(n5)
      local n6 = n5.FID
      if o[11][12] * o[11][8] <= o[11][10] then
        return o[11][10]
      end
      if n6 then
        return n6
      else
        return nil
      end
    end
    
    local function n9(n5, n6, n7)
      if n8(n5) then
        if not n6 then
          n6 = n8(n5)
        else
          n6 = n8(n5) .. "." .. n6
        end
        n7 = true
      else
        if not n6 then
          n6 = n5.No
        else
          n6 = n5.No .. "." .. n6
        end
        n5 = Obj.Parent(n5)
        if n5 then
          n6, n7 = n9(n5, n6, n7)
        end
      end
      if true == n7 then
        return n6, n7
      end
    end
    
    n6, n7 = n9(n5, n6, n7)
    if not n6 then
      return nil, "Can't find Fixture ID"
    end
    return n6
  end
  
  function A.a24e93a9()
    if A.a4077f93() then
      local na = SelectedSequence()
      return na
    else
      local nb = CurrentProfile().SequenceSelection.Handles
      if not nb then
        return nil
      end
      return IntToHandle(nb[1])
    end
    return nil
  end
  
  function A.abcd8e75(nc, nd)
    local bT = {}
    for ne in string.gmatch(nc, "[^%+,]+") do
      table.insert(bT, ne)
    end
    local ec = {}
    for ac, e4 in ipairs(bT) do
      e4 = string.lower(e4)
      local nf = string.find(e4, "thru", 1, true)
      if nf and nf > 0 then
        local ng, nh
        for ne in string.gmatch(e4, "[0-9]+") do
          if not ng then
            ng = ne
          else
            nh = ne
          end
        end
        for Q = ng, nh do
          table.insert(ec, math.floor(Q))
        end
      else
        table.insert(ec, math.floor(tonumber(e4)))
      end
    end
    if nd then
      table.sort(ec)
    end
    return ec
  end
  
  function A.ac1abf02()
    local function ni()
      local nj = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
      
      return string.gsub(nj, "[xy]", function(P)
        local e4 = P == "x" and math.random(0, 15) or math.random(8, 11)
        return string.format("%x", e4)
      end)
    end
    
    local nk = tostring(os.time()):reverse():sub(1, 1)
    local nl = ni()
    local nm = string.gsub(nl, "x", function()
      return nk
    end)
    return nm
  end
  
  function A.ab06e3d9(mV)
    if not mV then
      return
    end
    if not mV.a2ac9f94 then
      return
    end
    if not mV.a2ac9f94.a01d416c then
      return
    end
    if not mV.a2ac9f94.a6e71315 then
      return
    end
    if not mV.a2ac9f94.add46b74 then
      return
    end
    
    local function nn(...)
      local v = select(1, ...)
      local w = select(2, ...)
      local L = {}
      L.a4fe9e7c = GetPathSeparator()
      
      local function no(mF, np)
        local nq = Obj.GetClass(Obj.Parent(mF))
        if m[4][10] * m[4][12] <= m[4][2] then
          return m[4][2]
        end
        if nq == np then
          return mF
        elseif nq ~= "Root" then
          return no(Obj.Parent(mF), np)
        end
      end
      
      function L.a81f302d(mX, nr)
        local ns = {}
        local e = {}
        local nt = GetPath(GetPathType(Root().Menus))
        local nu = string.format("%s%sui%spopups%sgeneric_popup.lua", nt, L.a4fe9e7c, L.a4fe9e7c, L.a4fe9e7c)
        loadfile(nu)(nil, nil, v, w)
        if nr.accc0f89 then
          v["GetEmptyText"] = function()
            return nil
          end
        end
        v["GetSelectedDataPool"] = function(mX)
          local nv
          if nr.aa72fe59 and type(nr.aa72fe59) == "userdata" and Obj.IsValid(nr.aa72fe59) then
            nv = no(nr.aa72fe59, "DataPools")
          end
          if ns.adf4d6a6 and type(ns.adf4d6a6) == "userdata" and Obj.IsValid(ns.adf4d6a6) then
            nv = ns.adf4d6a6
          end
          if nv and Obj.IsValid(nv) then
            return nv
          end
          return DataPool()
        end
        v["OnDataPoolChanged"] = function(mX)
          ns.adf4d6a6 = IntToHandle(mX.SelectedItemValueI64)
          v["BuildItemList"](mX:GetOverlay())
          v.ae4b8cb9()
        end
        v["GetPool"] = function(mX, nv)
          if nr.aa72fe59 and type(nr.aa72fe59) == "userdata" and Obj.IsValid(nr.aa72fe59) then
            local nw = Obj.Parent(nr.aa72fe59)
            local nx = no(nr.aa72fe59, "PresetPools")
            nv = no(nr.aa72fe59, "DataPools")
            if nx then
              nr.aba5431c = nx
              nr.afb150fb = Obj.Parent(nx)
            else
              nr.afb150fb = nw
            end
            nr.af4417b5 = nr.aa72fe59
            if nr.afb150fb and Obj.IsValid(nr.afb150fb) then
              Obj.SelectListItemByName(ns.a4cad5f9, nr.afb150fb.Name)
            end
            if nr.aba5431c and Obj.IsValid(nr.aba5431c) then
              Obj.SelectListItemByName(ns.a8e3cbcd, nr.aba5431c.Name)
            end
            nr.aa72fe59 = nil
            return nw
          end
          if ns.adf4d6a6 and Obj.IsValid(ns.adf4d6a6) then
            Obj.SelectListItemByName(ns.a671a1b0, ns.adf4d6a6.Name)
          elseif nv and Obj.IsValid(nv) then
            Obj.SelectListItemByName(ns.a671a1b0, nv.Name)
          end
          if nr.aba5431c and type(nr.aba5431c) == "userdata" then
            local n5 = nr.aba5431c
            if not nr.afb150fb then
              nr.afb150fb = Obj.Parent(nr.aba5431c)
            end
            nr.afb150fb = nr.afb150fb.Name
            return n5
          end
          if nr.aba5431c and type(nr.aba5431c) == "string" then
            return nv.PresetPools[nr.aba5431c]
          end
          if nr.afb150fb and type(nr.afb150fb) == "userdata" then
            local n5 = nr.afb150fb
            nr.afb150fb = nr.afb150fb.Name
            return n5
          end
          if nr.afb150fb and type(nr.afb150fb) == "string" then
            if nr.afb150fb == "Bitmaps" or nr.afb150fb == "Generators" then
              return nv["GeneratorTypes"][nr.afb150fb]
            end
            return nv[nr.afb150fb]
          end
        end
        
        function v.a442cb1e(ny)
          if nr.aea86235 and type(nr.aea86235) == "table" then
            for ac, e4 in ipairs(nr.aea86235) do
              if e4.a5d8c1c4 then
                Obj.AddListLuaItem(ny, e4.str_7b0e, e4.a2cb2374, e4.a5d8c1c4)
              elseif type(e4.a2cb2374) == "string" then
                Obj.AddListStringItem(ny, e4.str_7b0e, e4.a2cb2374)
              elseif type(e4.a2cb2374) == "userdata" then
                Obj.AddListObjectItem(ny, e4.str_7b0e, e4.a2cb2374)
              elseif type(e4.a2cb2374) == "number" then
                Obj.AddListNumericItem(ny, e4.str_7b0e, e4.a2cb2374)
              elseif not e4.a2cb2374 then
                Obj.AddListStringItem(ny, e4.str_7b0e, v["GetEmptyText"]())
              end
            end
          end
        end
        
        function v.a29aa62b()
          if nr.af4417b5 or nr.aa72fe59 then
            local nz = nr.af4417b5 and nr.af4417b5 or nr.aa72fe59
            local nA
            if type(nz) == "number" then
              nA = Obj.GetListItemValueI64
            elseif type(nz) == "string" then
              nA = Obj.GetListItemValueStr
            elseif type(nz) == "userdata" then
              nA = Obj.GetListItemValueI64
            end
            if not nA then
              return
            end
            for Q = 1, Obj.GetListItemsCount(ns.a3450dbf) do
              local nB = nA(ns.a3450dbf, Q)
              local nC = IntToHandle(nB)
              local nD = StrToHandle(nB)
              if nB == nz or nC == nz or nD == nz or nC and nC == HandleToInt(nz) or nD and nD == HandleToStr(nz) then
                Obj.SelectListItemByIndex(ns.a3450dbf, Q)
                break
              end
            end
          end
        end
        
        local nE = false
        
        function v.aa95a61b()
          e.ae6971b2 = Obj.GetListSelectedItemIndex(ns.a3450dbf)
          e.aa6d9a63 = Obj.GetListItemValueI64(ns.a3450dbf, e.ae6971b2)
          e.ab6e56b2 = Obj.GetListItemValueStr(ns.a3450dbf, e.ae6971b2)
          e.str_7b0e = Obj.GetListItemName(ns.a3450dbf, e.ae6971b2)
          if 1 == e.ae6971b2 and nr.aea86235 and not e.str_7b0e then
            local nB = nr.aea86235[1]
            if type(nB.a2cb2374) == "number" then
              e.aa6d9a63 = nB.a2cb2374
            elseif type(nB.a2cb2374) == "string" then
              e.ab6e56b2 = nB.a2cb2374
            end
            e.str_7b0e = nB.str_7b0e
            nE = true
          end
          if nr.a8b5af29 ~= "Int" and nr.a8b5af29 ~= "Str" then
            if e.aa6d9a63 and type(e.aa6d9a63) == "number" then
              e.a1614780 = IntToHandle(e.aa6d9a63)
            elseif e.ab6e56b2 and type(e.ab6e56b2) == "string" and type(e.a1614780) ~= "userdata" then
              e.a1614780 = StrToHandle(e.ab6e56b2)
            end
          end
          if e.a1614780 and not Obj.IsValid(e.a1614780) then
            e.a1614780 = nil
          end
          if not e.str_7b0e or type(e.str_7b0e) ~= "string" then
            e.str_7b0e = ""
          end
          mX["Text"] = e.str_7b0e
          if nE then
            if e.a1614780 and Obj.IsValid(e.a1614780) then
              nr.aa72fe59 = e.a1614780
              nr.af4417b5 = e.a1614780
            elseif e.ab6e56b2 then
              nr.aa72fe59 = e.ab6e56b2
              nr.af4417b5 = e.ab6e56b2
            elseif e.aa6d9a63 then
              nr.aa72fe59 = e.aa6d9a63
              nr.af4417b5 = e.aa6d9a63
            else
              nr.aa72fe59 = nil
              nr.af4417b5 = nil
            end
          end
          nE = false
        end
        
        v["BuildItemList"] = function(mX)
          local nF = v["GetPool"](mX, v["GetSelectedDataPool"](mX))
          local nG = mX.AdditionalArgs
          Obj.ClearList(mX)
          local ny = Obj.FindRecursive(mX, "Popup", "ScrollableItemList")
          if nr.aef8b4da then
            v.a442cb1e(ny)
          end
          if nG["ValidOnly"] == "Yes" then
            v["GetPopupItemListValidOnly"](mX, mX)
          else
            v["GetPopupItemList"](mX, mX)
          end
          local nH = v["GetRenderOptions"]()
          v["ApplyRenderOptions"](mX, nH)
          coroutine.yield({ui = 1})
          Obj.Changed(mX)
          if not nr.aef8b4da then
            v.a442cb1e(ny)
          end
          v.a70268ec(ny)
          v.a29aa62b()
          v.aa95a61b()
        end
        v["FilterSupport"] = function()
          if nr.a2b22ed8 then
            return true
          end
        end
        v["FilterDefaultVisible"] = function()
          return nr.ad014eab
        end
        v["UsePoolSelector"] = function()
          if nr.a08e9f3d then
            return true
          end
        end
        if nr.a4ba497e then
          v["OnAddNew"] = nil
        end
        ns.a1581e75 = mX.PopupOverlay
        if not ns.a1581e75 then
          ns.a1581e75 = Obj.Acquire(mX, "PopupPlaceholder")
          if not ns.a1581e75 then
            return
          end
        end
        ns.a51542a0 = Obj.Acquire(ns.a1581e75, "Popup")
        ns.a51542a0["Name"] = "Popup"
        ns.a51542a0["AlignmentH"] = "Center"
        ns.a51542a0["AlignmentV"] = "Center"
        ns.a51542a0["PluginComponent"] = w
        ns.a51542a0["OnLoad"] = "OnLoaded"
        ns.a51542a0["Rows"] = 2
        ns.a51542a0["Columns"] = 1
        ns.a51542a0[1][1]["SizePolicy"] = "Content"
        ns.a51542a0[1][2]["SizePolicy"] = "Content"
        ns.a51542a0[2][1]["SizePolicy"] = "Content"
        ns.acfae282 = Obj.Acquire(ns.a51542a0, "TitleBar")
        ns.acfae282["Name"] = "TitleBar"
        ns.acfae282["Anchors"] = "0,0"
        ns.acfae282["ExpandContent"] = true
        ns.acfae282["Columns"] = 6
        ns.acfae282[1][1]["SizePolicy"] = "Fixed"
        ns.acfae282[1][1]["Size"] = 50
        ns.acfae282[2][1]["SizePolicy"] = "Content"
        ns.acfae282[2][2]["SizePolicy"] = "Fixed"
        ns.acfae282[2][2]["Size"] = 0
        ns.acfae282[2][3]["SizePolicy"] = "Fixed"
        ns.acfae282[2][3]["Size"] = 0
        ns.acfae282[2][4]["SizePolicy"] = "Fixed"
        ns.acfae282[2][4]["Size"] = 0
        ns.acfae282[2][5]["SizePolicy"] = "Fixed"
        ns.acfae282[2][5]["Size"] = 0
        ns.acfae282[2][6]["SizePolicy"] = "Fixed"
        ns.acfae282[2][6]["Size"] = 50
        ns.a8b4237f = Obj.Acquire(ns.acfae282, "TitleButton")
        ns.a8b4237f["Texture"] = "corner1"
        ns.a8b4237f["Anchors"] = "0,0"
        ns.a8b4237f["Text"] = "Select"
        ns.a8b4237f["ContentDriven"] = "Yes"
        ns.a8b4237f["ContentHeight"] = "No"
        ns.a8b4237f["ForceContentMin"] = "Yes"
        ns.a8b4237f["Icon"] = ""
        ns.a8b4237f["Padding"] = "10,0,20,0"
        if nr.af4e1cc6 then
          ns.a8b4237f["Text"] = nr.af4e1cc6
        end
        ns.a0b013dd = Obj.Acquire(ns.acfae282, "PropertyControl")
        ns.a0b013dd["Name"] = "FilterCtrl"
        ns.a0b013dd["Visible"] = "No"
        ns.a0b013dd["Texture"] = "corner0"
        ns.a0b013dd["Anchors"] = "1,0"
        ns.a0b013dd["Property"] = "Visible"
        ns.a0b013dd["Icon"] = "object_filter"
        ns.a0b013dd["ShowLabel"] = "No"
        ns.a0b013dd["ShowValue"] = "No"
        ns.a671a1b0 = Obj.Acquire(ns.acfae282, "SwipeButton")
        ns.a671a1b0["Name"] = "DataPoolSelect"
        ns.a671a1b0["Visible"] = false
        ns.a671a1b0["Text"] = "DataPool"
        ns.a671a1b0["Anchors"] = "2,0"
        ns.a671a1b0["PluginComponent"] = w
        ns.a671a1b0["SelectionChanged"] = "OnDataPoolChanged"
        ns.a671a1b0["ShowLabel"] = "Yes"
        ns.a671a1b0["TextColor"] = "Button.Text"
        ns.a671a1b0["PluginComponent"] = w
        for ac, e4 in pairs(Obj.Children(ShowData().Datapools)) do
          Obj.AddListObjectItem(ns.a671a1b0, e4)
        end
        if ns.adf4d6a6 and Obj.IsValid(ns.adf4d6a6) then
          Obj.SelectListItemByName(ns.a671a1b0, ns.adf4d6a6.Name)
        end
        ns.a4cad5f9 = Obj.Acquire(ns.acfae282, "SwipeButton")
        ns.a4cad5f9["Name"] = "PoolSelect"
        ns.a4cad5f9["Visible"] = false
        ns.a4cad5f9["Text"] = "PoolType"
        ns.a4cad5f9["Anchors"] = "3,0"
        ns.a4cad5f9["PluginComponent"] = w
        ns.a4cad5f9["SelectionChanged"] = "OnPoolTypeChanged"
        ns.a4cad5f9["ShowLabel"] = "Yes"
        ns.a4cad5f9["TextColor"] = "Button.Text"
        ns.a4cad5f9["PluginComponent"] = w
        if nr.a75e98e6 and #nr.a75e98e6 > 0 then
          ns.a4cad5f9["Visible"] = true
          ns.acfae282[2][4]["Size"] = 150
          Obj.WaitInit(ns.a4cad5f9)
          for ac, e4 in pairs(nr.a75e98e6) do
            Obj.AddListStringItem(ns.a4cad5f9, e4, e4)
          end
          v["OnPoolTypeChanged"] = function(mX, nI, nJ)
            if nI and nI ~= nr.afb150fb then
              nr.afb150fb = nI
              if nI ~= "PresetPools" then
                nr.aba5431c = nil
                v.ae4b8cb9()
              end
              v.ae4b8cb9()
              v["BuildItemList"](ns.a51542a0)
            end
          end
        end
        ns.a8e3cbcd = Obj.Acquire(ns.acfae282, "SwipeButton")
        ns.a8e3cbcd["Name"] = "PreselPoolSelect"
        ns.a8e3cbcd["Visible"] = false
        ns.a8e3cbcd["Text"] = "PresetPool"
        ns.a8e3cbcd["Anchors"] = "4,0"
        ns.a8e3cbcd["PluginComponent"] = w
        ns.a8e3cbcd["SelectionChanged"] = "OnPresetPoolTypeChanged"
        ns.a8e3cbcd["ShowLabel"] = "Yes"
        ns.a8e3cbcd["TextColor"] = "Button.Text"
        ns.a8e3cbcd["PluginComponent"] = w
        
        function v.a70268ec(ny)
          if Obj.GetListItemsCount(ny) > 20 then
            ns.a70268ec.Visible = true
          end
        end
        
        function v.ae4b8cb9()
          local nK
          if nr.afb150fb then
            if type(nr.afb150fb) == "userData" and Obj.GetClass(nr.afb150fb == "PresetPools") then
              nK = true
            end
            if type(nr.afb150fb) == "string" and nr.afb150fb == "PresetPools" then
              nK = true
            end
          end
          if nK then
            ns.a8e3cbcd["Visible"] = true
            ns.a8e3cbcd["Enabled"] = true
            ns.acfae282[2][5]["Size"] = 150
            Obj.WaitInit(ns.a8e3cbcd)
            local nv = v["GetSelectedDataPool"](ns.a51542a0)
            Obj.ClearList(ns.a8e3cbcd)
            local nL = 0
            for ac, e4 in pairs(nv.PresetPools:Children()) do
              if Obj.Count(e4) > 0 then
                Obj.AddListStringItem(ns.a8e3cbcd, e4.Name, e4.Name)
                nL = nL + 1
              end
            end
            if 0 == nL then
              Obj.AddListStringItem(ns.a8e3cbcd, "Empty", "Empty")
            end
            if not nr.aba5431c then
              Obj.SelectListItemByIndex(ns.a8e3cbcd, 1)
              local nM = Obj.GetListItemName(ns.a8e3cbcd, 1)
              if nM then
                nr.aba5431c = nM
              end
            elseif type(nr.aba5431c) == "userdata" then
              Obj.SelectListItemByName(ns.a8e3cbcd, nr.aba5431c.Name)
            else
              Obj.SelectListItemByName(ns.a8e3cbcd, nr.aba5431c)
            end
            if nr.aba5431c then
              v["BuildItemList"](ns.a51542a0)
            end
            v["OnPresetPoolTypeChanged"] = function(mX, nI, nJ)
              local nN = nI
              if nN and nN ~= nr.aba5431c then
                nr.aba5431c = nN
                v["BuildItemList"](ns.a51542a0)
              end
            end
          else
            ns.a8e3cbcd["Enabled"] = false
          end
        end
        
        ns.a8655624 = Obj.Acquire(ns.acfae282, "CloseButton")
        ns.a8655624["Texture"] = "corner2"
        ns.a8655624["Anchors"] = "5,0"
        ns.aa07fd4b = Obj.Acquire(ns.a51542a0, "DialogFrame")
        ns.aa07fd4b["Name"] = "Frame"
        ns.aa07fd4b["Anchors"] = "0,1"
        ns.aa07fd4b["ExpandContent"] = true
        ns.aa07fd4b["Rows"] = 2
        ns.aa07fd4b[1][1]["SizePolicy"] = "Content"
        ns.aa07fd4b[1][2]["SizePolicy"] = "Content"
        ns.aa07fd4b[2][1]["SizePolicy"] = "Content"
        ns.a3450dbf = Obj.Acquire(ns.aa07fd4b, "ScrollableItemList")
        ns.a3450dbf["Anchors"] = "0,1"
        ns.a3450dbf["Name"] = "Popup"
        ns.a3450dbf["ContentDriven"] = "Yes"
        ns.a3450dbf["ItemType"] = "PopupItemButtonExt"
        ns.a3450dbf["AllowBlocks"] = true
        ns.a3450dbf["OnSelectedItem"] = "OnSelectedItem"
        ns.a3450dbf["Clicked"] = "OnSelectedItem"
        ns.a3450dbf["PluginComponent"] = w
        ns.a3450dbf["ScrollChangesSelection"] = false
        ns.a3450dbf["Rounded"] = false
        ns.a70268ec = Obj.Acquire(ns.aa07fd4b, "ScrollBarH")
        ns.a70268ec["Anchors"] = "0,1"
        ns.a70268ec["ScrollTarget"] = "../Popup"
        ns.a70268ec["ScrollOpposite"] = false
        ns.a70268ec["AlignmentV"] = "Bottom"
        ns.a70268ec["Visible"] = false
        ns.ab49bddb = Obj.Acquire(ns.aa07fd4b, "LineEdit")
        ns.ab49bddb["H"] = 50
        ns.ab49bddb["Name"] = "ItemFilterField"
        ns.ab49bddb["PluginComponent"] = w
        ns.ab49bddb["Anchors"] = "0,0"
        ns.ab49bddb["Property"] = "ItemFilter"
        ns.ab49bddb["Target"] = ns.a3450dbf
        ns.ab49bddb["Visible"] = false
        ns.ab49bddb["Focus"] = "InitialFocus"
        v["EnableDataPoolSelector"](ns.a671a1b0)
        v.ae4b8cb9()
        if nr.afb150fb then
          if type(nr.afb150fb) == "userdata" then
            Obj.SelectListItemByName(ns.a4cad5f9, nr.afb150fb.Name)
          else
            Obj.SelectListItemByName(ns.a4cad5f9, nr.afb150fb)
          end
        end
        Obj.WaitInit(ns.a3450dbf)
        
        local function nO()
          nE = true
          v.aa95a61b()
        end
        
        HookObjectChange(nO, ns.a3450dbf, Obj.Parent(w))
        v["OnLoaded"](ns.a51542a0)
        v["OnSelectedItem"] = nO
        Obj.ShowModal(ns.a51542a0)
        WaitObjectDelete(ns.a51542a0)
        return e
      end
      
      return L
    end
    
    nn = nn(mV.a2ac9f94.add46b74, mV.a2ac9f94.a6e71315)
    if not mV.a2ac9f94.aa749a18 then
      mV.a2ac9f94.aa749a18 = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    end
    if not mV.a2ac9f94.ab21b3aa then
      mV.a2ac9f94.ab21b3aa = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      }
    end
    if not mV.a2ac9f94.a7115302 then
      mV.a2ac9f94.a7115302 = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    end
    if not mV.a2ac9f94.str_7b0e then
      mV.a2ac9f94.str_7b0e = A.ac1abf02()
    end
    mV.a2ac9f94.afbbc721 = string.format("On%sClicked", mV.a2ac9f94.str_7b0e)
    local nP = "Button"
    if mV.a2ac9f94.acacc180 then
      nP = "IndicatorButton"
    end
    mV.a2ac9f94.ae5fecbc = Obj.Append(mV.a2ac9f94.a01d416c, nP)
    mV.a2ac9f94.ae5fecbc["Name"] = mV.a2ac9f94.str_7b0e
    mV.a2ac9f94.ae5fecbc["Anchors"] = mV.a2ac9f94.aa749a18
    mV.a2ac9f94.ae5fecbc["Padding"] = mV.a2ac9f94.ab21b3aa
    mV.a2ac9f94.ae5fecbc["Margin"] = mV.a2ac9f94.a7115302
    mV.a2ac9f94.ae5fecbc["Icon"] = "SwipeButtonIcon"
    mV.a2ac9f94.ae5fecbc["IconAlignmentV"] = "Top"
    mV.a2ac9f94.ae5fecbc["IconAlignmentH"] = "Right"
    mV.a2ac9f94.ae5fecbc["Text"] = "Choose"
    if mV.a2ac9f94.afdbf62e then
      mV.a2ac9f94.ae5fecbc["Text"] = mV.a2ac9f94.afdbf62e
    end
    if mV.a2ac9f94.ad088220 then
      mV.a2ac9f94.ae5fecbc["Texture"] = "corner15"
    end
    if mV.a2ac9f94.a55dfd63 then
      mV.a2ac9f94.ae5fecbc["Texture"] = mV.a2ac9f94.a55dfd63
    end
    if mV.a2ac9f94.a3252b72 then
      mV.a2ac9f94.ae5fecbc["Icon"] = mV.a2ac9f94.a3252b72
      mV.a2ac9f94.ae5fecbc["IconAlignmentV"] = "Center"
      mV.a2ac9f94.ae5fecbc["IconAlignmentH"] = "Center"
    end
    
    function mV.a4a6f8d4(nQ)
      if nQ then
        mV.aa72fe59 = nQ
        if type(nQ) == "userdata" then
          mV.a2ac9f94.ae5fecbc["Text"] = string.format("%s '%s'", nQ.No, nQ.Name)
        else
          mV.a2ac9f94.ae5fecbc["Text"] = nQ
        end
        if mV.aea86235 then
          for cr, e4 in ipairs(mV.aea86235) do
            if e4.a2cb2374 == nQ then
              mV.a2ac9f94.ae5fecbc["Text"] = e4.str_7b0e
            end
          end
        end
        local e = {}
        if type(nQ) == "userdata" then
          e.a1614780 = nQ
        elseif type(nQ) == "string" then
          e.ab6e56b2 = nQ
        elseif type(nQ) == "number" then
          e.aa6d9a63 = nQ
        end
      end
    end
    
    if mV.aa72fe59 then
      mV.a4a6f8d4(mV.aa72fe59)
    end
    if mV.a2ac9f94.ade0d659 then
      mV.a2ac9f94.ae5fecbc["Text"] = mV.a2ac9f94.ade0d659
    end
    mV.a2ac9f94.ae5fecbc["PluginComponent"] = mV.a2ac9f94.a6e71315
    mV.a2ac9f94.ae5fecbc["Clicked"] = mV.a2ac9f94.afbbc721
    mV.a2ac9f94.a95735d5 = Obj.Append(mV.a2ac9f94.ae5fecbc, "UIObject")
    mV.a2ac9f94.a95735d5["Text"] = mV.a2ac9f94.aa86fe72
    mV.a2ac9f94.a95735d5["Font"] = "Regular14"
    mV.a2ac9f94.a95735d5["BackColor"] = Root().ColorTheme.ColorGroups.Global.Transparent
    mV.a2ac9f94.a95735d5["TextAlignmentV"] = "Top"
    mV.a2ac9f94.a95735d5["TextAlignmentH"] = "Left"
    mV.a2ac9f94.a95735d5["PluginComponent"] = mV.a2ac9f94.a6e71315
    mV.a2ac9f94.a95735d5["HasPressedAnimation"] = false
    mV.a2ac9f94.a95735d5["HasHover"] = false
    mV.a2ac9f94.a95735d5["Interactive"] = false
    mV.a2ac9f94.a95735d5["TextColor"] = Root().ColorTheme.ColorGroups.Global.LabelText
    mV.a2ac9f94.add46b74[mV.a2ac9f94.afbbc721] = function(mX)
      mV.tbl_c3bf = nn.a81f302d(mX, mV)
      mV.tbl_c3bf.a59ef9c1 = mX
      if mV.a7f071c5 and type(mV.a7f071c5) == "function" then
        mV.a7f071c5(mV.tbl_c3bf)
      end
    end
    return mV.a2ac9f94.ae5fecbc
  end
  
  function A.a579a3fe(hG)
    if type(hG) == "string" and string.match(hG, "[%+%-%*/]") then
      local nR = load("return " .. hG)
      if nR then
        local iq, nS = pcall(nR)
        if iq and type(nS) == "number" then
          return nS
        else
          return tonumber(hG) or hG
        end
      else
        return tonumber(hG) or hG
      end
    else
      return tonumber(hG) or hG
    end
  end
  
  function A.a57cb2bb(mV)
    if not mV then
      return
    end
    if not mV.a2ac9f94 then
      return
    end
    if not mV.a2ac9f94.a01d416c then
      return
    end
    if not mV.a2ac9f94.a6e71315 then
      return
    end
    if not mV.a2ac9f94.add46b74 then
      return
    end
    if not mV.a2ac9f94.aa749a18 then
      mV.a2ac9f94.aa749a18 = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    end
    if not mV.a2ac9f94.ab21b3aa then
      mV.a2ac9f94.ab21b3aa = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      }
    end
    if not mV.a2ac9f94.a7115302 then
      mV.a2ac9f94.a7115302 = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    end
    if not mV.a2ac9f94.str_7b0e then
      mV.a2ac9f94.str_7b0e = A.ac1abf02()
    end
    mV.a2ac9f94.a5efb8fd = string.format("On%sChanged", mV.a2ac9f94.str_7b0e)
    if not mV.a2ac9f94.str_5350 then
      mV.a2ac9f94.str_5350 = "SwipeButton"
    end
    mV.a2ac9f94.ae5fecbc = Obj.Append(mV.a2ac9f94.a01d416c, mV.a2ac9f94.str_5350)
    mV.a2ac9f94.ae5fecbc["Name"] = mV.a2ac9f94.str_7b0e
    mV.a2ac9f94.ae5fecbc["Anchors"] = mV.a2ac9f94.aa749a18
    mV.a2ac9f94.ae5fecbc["Padding"] = mV.a2ac9f94.ab21b3aa
    mV.a2ac9f94.ae5fecbc["Margin"] = mV.a2ac9f94.a7115302
    mV.a2ac9f94.ae5fecbc["Text"] = mV.a2ac9f94.aa86fe72
    mV.a2ac9f94.ae5fecbc["ShowLabel"] = "Yes"
    mV.a2ac9f94.ae5fecbc["SelectionChanged"] = mV.a2ac9f94.a5efb8fd
    mV.a2ac9f94.ae5fecbc["PluginComponent"] = mV.a2ac9f94.a6e71315
    mV.a2ac9f94.ae5fecbc["ContentAreaMargin"] = {
      left = 3,
      right = 3,
      top = 3,
      bottom = 3
    }
    mV.a2ac9f94.ae5fecbc["ValueAutoAdjust"] = true
    mV.a2ac9f94.ae5fecbc["ValueAreaMargins"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 0
    }
    mV.a2ac9f94.ae5fecbc["LabelAreaMargins"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 5
    }
    mV.a2ac9f94.ae5fecbc["LabelAreaHeight"] = 1
    if mV.a2ac9f94.ad088220 then
      mV.a2ac9f94.ae5fecbc["Texture"] = "corner15"
    end
    if mV.a2ac9f94.a55dfd63 then
      mV.a2ac9f94.ae5fecbc["Texture"] = mV.a2ac9f94.a55dfd63
    end
    if mV.ae6e9237 and Obj.IsValid(mV.ae6e9237) then
      for ac, e4 in ipairs(Obj.Children(mV.ae6e9237)) do
        Obj.AddListObjectItem(mV.a2ac9f94.ae5fecbc, e4, e4.Name)
      end
    elseif mV.aea86235 and type(mV.aea86235) == "table" then
      for ac, e4 in ipairs(mV.aea86235) do
        if e4.a5d8c1c4 then
          Obj.AddListLuaItem(mV.a2ac9f94.ae5fecbc, e4.str_7b0e, e4.a2cb2374, e4.a5d8c1c4)
        elseif type(e4.a2cb2374) == "string" then
          Obj.AddListStringItem(mV.a2ac9f94.ae5fecbc, e4.str_7b0e, e4.a2cb2374)
        elseif type(e4.a2cb2374) == "userdata" then
          Obj.AddListObjectItem(mV.a2ac9f94.ae5fecbc, e4.str_7b0e, e4.a2cb2374)
        elseif type(e4.a2cb2374) == "number" then
          Obj.AddListNumericItem(mV.a2ac9f94.ae5fecbc, e4.str_7b0e, e4.a2cb2374)
        elseif not e4.a2cb2374 then
          Obj.AddListStringItem(mV.a2ac9f94.ae5fecbc, e4.str_7b0e, "None")
        end
      end
    end
    if mV.aa72fe59 then
      local nA
      if type(mV.aa72fe59) == "number" then
        nA = Obj.GetListItemValueI64
      elseif type(mV.aa72fe59) == "string" then
        nA = Obj.GetListItemValueStr
      elseif type(mV.aa72fe59) == "userdata" then
        nA = Obj.GetListItemValueI64
      end
      if nA then
        for Q = 1, Obj.GetListItemsCount(mV.a2ac9f94.ae5fecbc) do
          local nB = nA(mV.a2ac9f94.ae5fecbc, Q)
          local nC = IntToHandle(nB)
          local nD = StrToHandle(nB)
          if nB == mV.aa72fe59 or nC == mV.aa72fe59 or nD == mV.aa72fe59 then
            Obj.SelectListItemByIndex(mV.a2ac9f94.ae5fecbc, Q)
            break
          end
        end
      end
    end
    mV.a2ac9f94.add46b74[mV.a2ac9f94.a5efb8fd] = function(mX, nI, nJ)
      mV.tbl_c3bf = {}
      mV.tbl_c3bf.ae6971b2 = Obj.GetListSelectedItemIndex(mV.a2ac9f94.ae5fecbc)
      mV.tbl_c3bf.aa6d9a63 = Obj.GetListItemValueI64(mV.a2ac9f94.ae5fecbc, mV.tbl_c3bf.ae6971b2)
      mV.tbl_c3bf.ab6e56b2 = Obj.GetListItemValueStr(mV.a2ac9f94.ae5fecbc, mV.tbl_c3bf.ae6971b2)
      mV.tbl_c3bf.str_7b0e = Obj.GetListItemName(mV.a2ac9f94.ae5fecbc, mV.tbl_c3bf.ae6971b2)
      if mV.tbl_c3bf.aa6d9a63 and type(mV.tbl_c3bf.aa6d9a63) == "number" then
        mV.tbl_c3bf.a1614780 = IntToHandle(mV.tbl_c3bf.aa6d9a63)
      elseif mV.tbl_c3bf.ab6e56b2 and type(mV.tbl_c3bf.ab6e56b2) == "string" and type(mV.tbl_c3bf.a1614780) ~= "userdata" then
        mV.tbl_c3bf.a1614780 = StrToHandle(mV.tbl_c3bf.ab6e56b2)
      end
      if mV.tbl_c3bf.a1614780 and not Obj.IsValid(mV.tbl_c3bf.a1614780) then
        mV.tbl_c3bf.a1614780 = nil
      end
      if mV.a7f071c5 and type(mV.a7f071c5) == "function" then
        mV.a7f071c5(mV.tbl_c3bf)
      end
    end
    return mV.a2ac9f94.ae5fecbc
  end
  
  local function nT(E)
    local nU = {}
    local nV = {}
    for ac in pairs(E.afb23588) do
      table.insert(nV, ac)
    end
    table.sort(nV, function(at, au)
      return tonumber(at) < tonumber(au)
    end)
    for cr, ac in ipairs(nV) do
      local e4 = E.afb23588[ac]
      if E.str_e2ec == "int" then
        table.insert(nU, {
          "int",
          e4.a0fc7c03,
          ac
        })
      elseif E.str_e2ec == "str" then
        table.insert(nU, {
          "str",
          e4.a0fc7c03,
          e4.a0fc7c03
        })
      elseif E.str_e2ec == "handle" then
        table.insert(nU, {
          "handle",
          e4.a0fc7c03,
          e4.a314c3b1
        })
      end
    end
    return nU
  end
  
  function A.aa29c7b1(nW)
    if not nW then
      return false
    end
    if type(nW) ~= "string" then
      return false
    end
    if string.gsub(nW, " ", "") == "" then
      return false
    end
    for Q = 1, Obj.Count(Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect) do
      local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect[Q]
      if hu then
        if hu.MainOverlay and hu.MainOverlay[nW] then
          return true
        end
        if hu.FullScreen and hu.FullScreen[nW] then
          return true
        end
        if hu.ScreenOverlay and hu.ScreenOverlay[nW] then
          return true
        end
        if hu.ModalOverlay and hu.ModalOverlay[nW] then
          return true
        end
      end
    end
    return false
  end
  
  local nX = "[A-Za-z0-9+/]+=*"
  
  function A.ad96c7cb(nY)
    local nZ = type(nY)
    local n_
    if nZ == "table" then
      n_ = {}
      for o0, o1 in next, nY, nil, nil do
        n_[A.ad96c7cb(o0)] = A.ad96c7cb(o1)
      end
      setmetatable(n_, A.ad96c7cb(getmetatable(nY)))
    else
      n_ = nY
    end
    return n_
  end
  
  function A.a71fa32a(o2)
    o2 = A.ad96c7cb(o2)
    
    local function o3(E)
      if type(E) == "table" then
        for ac, e4 in pairs(E) do
          if type(e4) == "userdata" then
            E[ac] = string.format("H:%s", HandleToInt(e4))
          end
          if type(e4) == "table" then
            e4 = o3(e4)
          end
        end
      end
      if type(E) == "userdata" then
        E = string.format("H:%s", HandleToInt(E))
      end
      return E
    end
    
    o2 = o3(o2)
    return o2
  end
  
  function A.af6cc38b(o2)
    o2 = A.ad96c7cb(o2)
    
    local function o3(E)
      if type(E) == "table" then
        for ac, e4 in pairs(E) do
          if type(e4) == "string" and string.match(e4, "H%:%d+") then
            local o4 = string.match(e4, "H%:(%d+)")
            if o4 then
              o4 = tonumber(o4)
              local o5 = IntToHandle(o4)
              if Obj.IsValid(o5) then
                E[ac] = o5
              else
                E[ac] = nil
              end
            end
          end
          if type(e4) == "table" then
            e4 = o3(e4)
          end
        end
      end
      if type(E) == "string" and string.match(E, "H%:%d+") then
        local o4 = string.match(E, "H%:(%d+)")
        if o4 then
          o4 = tonumber(o4)
          local o5 = IntToHandle(o4)
          if Obj.IsValid(o5) then
            E = o5
          else
            E = nil
          end
        end
      end
      return E
    end
    
    o2 = o3(o2)
    return o2
  end
  
  local o6 = 5
  
  function A.af7f1945(o7)
    local function o8(P)
      local o9 = string.byte(P)
      
      o9 = o9 + o6
      if o9 > 255 then
        o9 = o9 - 255
      end
      o9 = string.char(o9)
      return o9
    end
    
    o7 = string.gsub(o7, ".", o8)
    return o7
  end
  
  function A.a2d7979e(o7)
    local function oa(P)
      local o9 = string.byte(P)
      
      o9 = o9 - o6
      if o9 < 0 then
        o9 = 255 - o9
      end
      if q[7][4] * q[7][5] <= q[7][4] then
        return q[7][4]
      end
      o9 = string.char(o9)
      return o9
    end
    
    o7 = string.gsub(o7, ".", oa)
    return o7
  end
  
  function A.a1c0fa3e(o2, ob, oc)
    local od = A.a71fa32a(o2)
    local cp = require("json")
    local oe = {adb67544 = ob, aa3d5d76 = od}
    local of = cp.encode(oe)
    if oc then
      of = A.af7f1945(of)
      of = A.ac2276ce(of)
    end
    return of
  end
  
  A.tbl_7620 = {}
  
  function A.ab9dccdf(hG, ko)
    if A.tbl_7620[hG] then
      return A.tbl_7620[hG]
    end
    local og = hG .. "__AMLMJH"
    local e = R.ace2ba8b(ko.a7948bc8(og), true)
    e = "a" .. string.lower(string.sub(e, 1, 7))
    A.tbl_7620[hG] = e
    return e
  end
  
  function A.ab04b396(E, ko, oh)
    if not E then
      return nil
    end
    oh = oh or {}
    local oi = {}
    for ac, e4 in pairs(E) do
      local oj = ac
      if string.match(ac, "[^0-9]") then
        local mw
        for mg, mh in pairs(oh) do
          if ac == mh then
            mw = true
          end
        end
        if not mw then
          oj = A.ab9dccdf(ac, ko)
        end
      end
      if type(e4) == "table" then
        e4 = A.ab04b396(e4, ko, oh)
      end
      oi[oj] = e4
    end
    return oi
  end
  
  function A.a87703a3(ok)
    local of = ok
    if pcall(A.a10763ae, of) then
      of = A.a10763ae(of)
      if not pcall(A.a2d7979e, of) then
        return
      end
      of = A.a2d7979e(of)
    end
    local cp = require("json")
    if not pcall(cp.decode, of) then
      return
    end
    local ol = cp.decode(of)
    local ob = ol.mt_namespace or ol["Label"]
    local o2 = ol.mt_body or ol["data"]
    local om
    if ol["Label"] then
      om = true
    end
    local od = A.af6cc38b(o2)
    if ob and od then
      return od, ob, om
    end
  end
  
  function A.a21d4837(mF, ob, oh)
    local on = mF.Note or ""
    oh = oh or {}
    if string.len(on) > 0 then
      for oo in string.gmatch(on, "(MTdata%'" .. nX .. "%')") do
        local op = string.match(oo, "MTdata%'(" .. nX .. ")%'")
        local oq, ot, om = A.a87703a3(op)
        if om then
          y.g_progress = StartProgress(y.plugin_label)
          SetProgressText(y.g_progress, " : Converting old data")
          SetProgressRange(y.g_progress, 0, 1)
          oq = A.ab04b396(oq, R, oh)
          SetProgress(y.g_progress, 1)
          A.a34ca287(mF, oq, ob)
          StopProgress(y.g_progress)
          y.g_progress = nil
        end
        if ot == ob then
          return oq
        end
      end
    end
  end
  
  function A.a34ca287(mF, o2, ob)
    local ou = A.a1c0fa3e(o2, ob, true)
    local ov = string.format("MTdata'%s'", ou)
    local on = mF.Note or ""
    if string.len(on) > 0 then
      for oo in string.gmatch(on, "(MTdata%'" .. nX .. "%')") do
        local op = string.match(oo, "MTdata%'(" .. nX .. ")%'")
        local oq, ot = A.a87703a3(op)
        if ot == ob then
          on = string.gsub(on, "%s*" .. A.a1a67d56(oo) .. "%s*", "")
        end
      end
    end
    on = on .. "\n" .. ov
    mF.Note = on
  end
  
  function A.ab503f07(ow)
    local ox = {}
    for ac, e4 in pairs(ow) do
      local oy = e4.str_5350
      local oz, ib
      if e4.str_7b0e then
        ib = e4.str_7b0e
      else
        ib = ac
      end
      if oy == "LUA" then
        oz = e4.a2cb2374 or nil
        oy = 1
      elseif oy == "UserVar" then
        oz = GetVar(UserVars(), ib) or nil
        oy = 2
      elseif oy == "PluginVar" then
        oz = GetVar(y.g_plugin_var_obj, ib) or nil
        oy = 3
      elseif oy == "GlobalVar" then
        oz = GetVar(GlobalVars(), ib) or nil
        oy = 4
      end
      local oA = {
        aa20cd62 = ib,
        afceae60 = oz,
        ac02a53d = oy
      }
      if oz then
        table.insert(ox, oA)
      end
    end
    return ox
  end
  
  function A.a4e33754(ow)
    local oB = {}
    for ac, e4 in pairs(ow) do
      if 1 == tonumber(e4.mt_type) then
        table.insert(oB, {
          a7b0eb83 = e4.aa20cd62,
          a2cb2374 = e4.afceae60
        })
      elseif 2 == tonumber(e4.mt_type) then
        SetVar(UserVars(), e4.aa20cd62, e4.afceae60)
      elseif 3 == tonumber(e4.mt_type) then
        SetVar(y.g_plugin_var_obj, e4.aa20cd62, e4.afceae60)
      elseif 4 == tonumber(e4.str_5350) then
        SetVar(GlobalVars(), e4.aa20cd62, e4.afceae60)
      end
    end
    if #oB > 0 then
      return oB
    else
      return nil
    end
  end
  
  function A.af9f28f1(ow, ob, oC, oD, oE, oF, oG, oH)
    if not ow then
      A.a880c84e(y.g_full_label .. " - Error", string.format("No settings given"), true)
      return
    end
    if type(ow) ~= "table" then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Invalid settings"), true)
      return
    end
    if not oE then
      A.a880c84e(y.g_full_label .. " - Error", string.format("No settings file extension given"), true)
      return
    end
    local of = A.a1c0fa3e(ow, ob, oF)
    local oI = oC
    if not oD then
      local oJ = {
        title = y.g_full_label .. " Export Settings",
        icon = y.company_label,
        message = "Please choose a name for the exported settings file",
        commands = {
          {
            value = 0,
            name = "Cancel"
          },
          {
            value = 1,
            name = "Export"
          }
        },
        inputs = {
          {
            name = "Filename",
            value = string.format("%s_Settings", y.plugin_label),
            blackFilter = ".\\\\/",
            whiteFilter = "",
            maxTextLength = 1000
          }
        }
      }
      local oK = MessageBox(oJ)
      if 0 == oK.result then
        return
      end
      oD = oK.inputs["Filename"]
      if string.match(oD, "%.") then
        A.a880c84e(y.g_full_label .. " - Error", string.format("Settings file names cannot contain '.'"), true)
        return
      end
    end
    if not pcall(A.ae606251, oC) then
      local e = CreateDirectoryRecursive(oC)
      if not e then
        A.a880c84e(y.g_full_label .. " - Error", string.format("Settings file directory could not be created"), true)
        return
      end
    end
    if not string.match(oE, "^%.") then
      oE = "." .. oE
    end
    oI = A.abb67167(oI, oD .. oE)
    if pcall(A.a1308137, oI) then
      if not oG then
        local oL = {
          title = y.g_full_label .. " Export Settings",
          icon = y.company_label,
          message = string.format("\"%s\" already exists.\n\nWould you like to overwrite?", oI),
          commands = {
            {
              value = 0,
              name = "Cancel"
            },
            {
              value = 1,
              name = "Overwrite"
            }
          }
        }
        local oM = MessageBox(oL)
        if 0 == oM.result then
          return
        end
      elseif oG == "No" then
        return
      end
    end
    local ax = assert(io.open(oI, "w"))
    if not ax then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Settings were not exported, file could not be created"), true)
      return
    end
    ax:write(of)
    ax:close()
    if not oH then
      A.a880c84e(y.g_full_label .. " - Success", string.format("Settings were exported successfully to...\n%s", oI), true)
    end
  end
  
  function A.a9a72aef(oC, oD, oE, ob, oN, oh)
    local oI
    if not oC then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Settings file directory not valid"), true)
      return
    end
    if not string.match(oE, "^%.") then
      oE = "." .. oE
    end
    if not oD then
      local oO = DirList(oC, "*" .. oE)
      local oP = {}
      for ac, e4 in pairs(oO) do
        if not string.match(e4.name, "^%.") then
          table.insert(oP, {
            "str",
            e4.name
          })
        end
      end
      if 0 == #oP then
        return nil
      end
      local mp = PopupInput({
        title = "File",
        caller = GetFocusDisplay(),
        items = oP
      })
      if not mp then
        return nil
      end
      if A.a4077f93() then
        oD = oP[mp][2]
      else
        oD = oP[mp + 1][2]
      end
    end
    if not string.match(oD, "%" .. oE) then
      oD = oD .. oE
    end
    oI = A.abb67167(oC, oD)
    if not oI then
      return
    end
    local ox
    local ax = assert(io.open(oI, "r"))
    if not ax then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Settings were not imported, file could not be opened"), true)
      return
    end
    local of = ax:read("*all")
    if not of or string.gsub(of, " ", "") == "" then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Settings file is blank"), true)
      return
    end
    local ox, ot, om = A.a87703a3(of)
    if om then
      y.g_progress = StartProgress(y.plugin_label)
      SetProgressText(y.g_progress, " : Converting old data")
      SetProgressRange(y.g_progress, 0, 1)
      ox = A.ab04b396(ox, R, oh)
      SetProgress(y.g_progress, 1)
      local oQ = oD:gsub(oE .. "$", "")
      A.af9f28f1(ox, ob, oC, oQ, oE, true, "Yes", true)
      StopProgress(y.g_progress)
      y.g_progress = nil
    end
    if ot ~= ob then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Settings were not imported. Data is not valid for this type."), true)
      return
    end
    if not ox or type(ox) ~= "table" then
      A.a880c84e(y.g_full_label .. " - Error", string.format("Settings were not imported."), true)
      return
    end
    local od = A.af6cc38b(ox)
    if oN then
      A.a880c84e(y.g_full_label .. " - Success", string.format("Settings successfully imported."), true)
    end
    return od
  end
  
  function A.a039e70f()
    if A.a4077f93() then
      return CurrentExecPage()
    else
      return CurrentExecPage()
    end
  end
  
  local function oR(...)
    local A = select(1, ...)
    local y = select(2, ...)
    local oS = {}
    oS.num_a612 = 2
    
    local function oT(...)
      return "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>MATools - EULA</title>\n    <style>\n        body {\n            color: white;\n            font-family: Arial, sans-serif;\n            background-color: #000;\n        }\n\n        h1 {\n            color: #ffffff;\n            font-size: 36px;\n            text-transform: uppercase;\n            letter-spacing: 2px; \n            background: linear-gradient(90deg, #ff8a00, #da1b60);\n            -webkit-background-clip: text; \n            -webkit-text-fill-color: transparent;\n            text-align: center;\n            padding: 10px 20px;\n            border-bottom: 4px solid #ff8a00;\n        }\n        h2 {\n            color: #ffffff;\n            font-size: 24px;\n            text-transform: uppercase;\n            letter-spacing: 2px; \n            background: linear-gradient(90deg, #ff8a00, #da1b60);\n            -webkit-background-clip: text;\n            -webkit-text-fill-color: transparent; \n            text-align: left;\n            margin: 10px 20px;\n            border-bottom: 2px solid #ff8a00;\n            margin-top: 20px;\n        }\n\n        p {\n            /* letter-spacing: 0.1em; */\n            line-height: 1.2em;\n            font-size: 18px;\n            margin: 10px 30px;\n        }\n    </style>\n</head>\n<body>\n    <div>\n        <h1>End User License Agreement (EULA) for all MATools Plugins</h1>\n        <p>This End User License Agreement (\"EULA\") is a legal agreement between you (\"User\") and Lumicode Ltd - Trading as MATools (\"Licensor\") for the use of any Licensor developed plugin (\"Software\") for the grandMA3 platform. By installing, copying, or otherwise using the Software, you agree to be bound by the terms of this EULA. If you do not agree to the terms of this EULA, do not install or use the Software.</p>\n        <h2>1. License Grant</h2>\n        <p>Licensor grants you a non-exclusive, non-transferable, revocable license to use the Software for its intended purpose on compatible devices. This EULA grants you a license to use the Software but does not transfer any ownership rights to you. The Software is sold as a licensed product, meaning you are purchasing the right to use it under the terms of this EULA, not the Software itself.</p>\n        <h2>2. No Affiliation</h2>\n        <p>Licensor is not affiliated with MA Lighting International GmbH or MA Lighting Technology GmbH. The Software is independently developed and is not endorsed by, associated with, or connected to MA Lighting in any way.</p>\n        <h2>3. Disclaimer of Warranties</h2>\n        <p>The Software is provided \"as is\" and \"as available\" without warranties of any kind, whether express or implied. Licensor disclaims all warranties, including but not limited to warranties of merchantability, fitness for a particular purpose, and non-infringement.</p>\n        <h2>4. Limitation of Liability</h2>\n        <p>In no event shall Licensor be liable for any damages, including but not limited to direct, indirect, incidental, special, or consequential damages, or damages for loss of data, profits, or revenue, arising out of or in connection with the use or inability to use the Software, even if Licensor has been advised of the possibility of such damages.</p>\n        <h2>5. Support</h2>\n        <p>Licensor does not guarantee any support for the Software. However, Licensor aims to provide support where possible, at its sole discretion.</p>\n        <h2>6. Data Collection</h2>\n        <p>Licensor may collect and analyze usage statistics related to your hardware, software, error reports, and other non-personal data to assist in the further development and improvement of the Software. No personal data will be collected or stored.</p>\n        <h2>7. Prohibited Actions</h2>\n        <p>The User shall not:\n        <ul>\n            <li>Copy, modify, distribute, or create derivative works based on the Software.</li>\n            <li>Attempt to reverse engineer, decompile, decrypt, or disassemble the Software.</li>\n            <li>Attempt to bypass, disable, or otherwise interfere with the licensing system or any security features of the Software.</li>\n        </ul></p>\n        <h2>8. Ownership</h2>\n        <p>The Software is licensed, not sold, to you by the Licensor. Licensor retains all rights, title, and interest in and to the Software, including all intellectual property rights. By purchasing a copy of the Software, you are obtaining a license to use it under the terms specified in this EULA. You acknowledge that no ownership of the Software or its intellectual property is transferred to you through the purchase.</p>\n        <h2>9. Third-Party Software</h2>\n        <p>The Software may include or depend upon certain third-party software libraries that are licensed under open-source licenses, including but not limited to the GNU General Public License (GNU GPL) and the GNU Lesser General Public License (GNU LGPL). Use of any such third-party libraries is governed by the respective licenses of those third-party libraries. You agree to comply with the terms of those licenses, which may grant additional rights or impose specific obligations beyond those set forth in this EULA. Licensor disclaims any liability or warranty for third-party software components, and those components are provided \"as-is\" under their respective open-source licenses.</p>\n        <h2>10. Use with Third-Party Devices or Software</h2>\n        <p>The Software may be used to control or interact with third-party devices or software. Licensor accepts no responsibility or liability for any damages to such third-party devices or software, including but not limited to damages arising from malfunctions, incompatibility, or errors in communication between the Software and third-party devices or software.</p>\n        <p>Furthermore, Licensor disclaims all liability for any misuse of the Software in controlling third-party devices or software, including but not limited to:</p>\n        <ul>\n            <li>Using the Software for malicious, discriminatory, or exploitative purposes.</li>\n            <li>Using the Software in violation of any applicable laws or regulations.</li>\n            <li>Any harm, damage, or injury caused by improper or illegal use of third-party devices or software in conjunction with the Software.</li>\n        </ul>\n        <p>You are solely responsible for ensuring that your use of the Software in combination with third-party devices or software complies with all applicable laws, regulations, and ethical standards.</p>\n        <h2>11. Acceptance of Terms</h2>\n        <p>By installing, copying, or otherwise using the Software, you acknowledge that you have read and understood this EULA and agree to be bound by its terms.</p>\n        <h2>12. Termination</h2>\n        <p>This EULA is effective until terminated. Licensor may terminate this EULA at any time without notice if you breach any of its terms. Upon termination, you must cease all use of the Software and destroy all copies in your possession.</p>\n        <h2>13. Governing Law</h2>\n        <p>This EULA shall be governed by and construed in accordance with the laws of the United Kingdom, without regard to its conflict of law principles.</p>\n        <h2>14. Severability</h2>\n        <p>If any provision of this EULA is found to be invalid or unenforceable, the remainder of this EULA shall remain in full force and effect.</p>\n        <h2>15. Entire Agreement</h2>\n        <p>This EULA constitutes the entire agreement between you and Licensor with respect to the Software and supersedes any prior or contemporaneous understandings or agreements.</p>\n    </div>\n    <p><strong>Lumicode Ltd (Trading as MATools)</strong><br>\n    <strong>Effective Date:</strong> Aug 18, 2025<br>\n    <strong>EULA Version:</strong> 2</p>\n</body>\n</html>"
    end
    
    oT = oT()
    
    function oS.aa5de2eb(oU)
      local i_ = A.afd7a009("general.dat", y.g_unset_a)
      if not i_ then
        return
      end
      local lA = A.a8120b4a(i_) or {}
      if not (not oU and lA["EULA"]) or type(lA["EULA"]) ~= "number" or lA["EULA"] < oS.num_a612 then
        local oV = oS.aaba7bd1()
        if not oV then
          return
        end
        lA["EULA"] = oS.acafe1e0(oV)
        os.remove(oV)
        A.a71ce10d(i_, lA)
      end
      if not lA["EULA"] then
        A.a880c84e("MATools", "EULA not accepted. You must accept the terms of our EULA to use this plugin.", true)
        return false
      end
      return true
    end
    
    function oS.aaba7bd1()
      local oW = GetPath(GetPathType(Root().Menus))
      oW = string.gsub(oW, "resource/lib_menus", "language/HTML/MATools_EULA.html")
      local ax = io.open(oW, "w")
      if not ax then
        return
      end
      ax:write(oT)
      ax:close()
      return oW
    end
    
    function oS.acafe1e0(oV)
      y.g_unset_b = A.a712b18d(true, y.g_unset_b)
      local hv = y.g_unset_b.ModalOverlay
      local oX = {}
      local e
      oX.a0dcf7c8 = y.g_unset_b.W * 0.8
      oX.ab561b8e = y.g_unset_b.H * 0.8
      oX.a51542a0 = Obj.Append(hv, "BaseInput")
      oX.a51542a0["Name"] = "MAToolsEULA"
      oX.a51542a0["H"] = oX.ab561b8e
      oX.a51542a0["W"] = oX.a0dcf7c8
      oX.a51542a0["MaxSize"] = string.format("%s,%s", y.g_unset_b.W * 0.8, y.g_unset_b.H)
      oX.a51542a0["MinSize"] = string.format("%s,0", oX.a0dcf7c8 - 100)
      oX.a51542a0["Rows"] = 2
      oX.a51542a0["Columns"] = 1
      oX.a51542a0[1][1]["SizePolicy"] = "Fixed"
      oX.a51542a0[1][1]["Size"] = "60"
      oX.a51542a0[1][2]["SizePolicy"] = "Stretch"
      oX.a51542a0["AutoClose"] = "No"
      oX.a51542a0["AutoCloseOnOverlay"] = "No"
      oX.acfae282 = Obj.Append(oX.a51542a0, "TitleBar")
      oX.acfae282["Rows"] = 1
      oX.acfae282["Columns"] = 3
      oX.acfae282["Anchors"] = "0,0"
      oX.acfae282[2][1]["SizePolicy"] = "Stretch"
      oX.acfae282[2][2]["SizePolicy"] = "Fixed"
      oX.acfae282[2][2]["Size"] = "100"
      oX.acfae282[2][3]["SizePolicy"] = "Fixed"
      oX.acfae282[2][3]["Size"] = "100"
      oX.acfae282["Texture"] = "corner2"
      oX.af134c94 = Obj.Append(oX.acfae282, "TitleButton")
      oX.af134c94["text"] = "MATools - EULA"
      oX.af134c94["Texture"] = "corner1"
      oX.af134c94["Anchors"] = "0,0"
      oX.af134c94["Icon"] = y.company_label
      oX.ae55f78f = Obj.Append(oX.acfae282, "Button")
      oX.ae55f78f["Anchors"] = "1,0"
      oX.ae55f78f["Text"] = "Reject"
      oX.ae55f78f["PluginComponent"] = y.g_arg4
      oX.ae55f78f["Clicked"] = "OnEulaReject"
      oX.ad801152 = Obj.Append(oX.acfae282, "Button")
      oX.ad801152["Anchors"] = "2,0"
      oX.ad801152["Texture"] = "corner2"
      oX.ad801152["Text"] = "Accept"
      oX.ad801152["PluginComponent"] = y.g_arg4
      oX.ad801152["Clicked"] = "OnEulaAccept"
      oX.ad801152["Focus"] = "InitialFocus"
      y.g_arg3["OnEulaAccept"] = function()
        e = oS.num_a612
        Obj.Delete(Obj.Parent(oX.a51542a0), Obj.Index(oX.a51542a0))
      end
      y.g_arg3["OnEulaReject"] = function()
        e = nil
        Obj.Delete(Obj.Parent(oX.a51542a0), Obj.Index(oX.a51542a0))
      end
      oX.acdcbeb4 = Obj.Append(oX.a51542a0, "UILayoutGrid")
      oX.acdcbeb4["Anchors"] = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
      }
      oX.acdcbeb4["OnLoad"] = "EULADialogLoaded"
      oX.a4621606 = Obj.Append(oX.acdcbeb4, "DialogReleaseNotes")
      oX.a4621606["H"] = "100%"
      oX.a4621606["W"] = "100%"
      oX.a4621606["Name"] = "MATools EULA"
      oX.a4621606["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      oX.a4621606["ReleaseNotesUrl"] = "MATools_EULA.html"
      Obj.WaitInit(oX.a4621606)
      FindBestFocus(oX.ad801152)
      WaitObjectDelete(oX.a51542a0)
      return e
    end
    
    return oS
  end
  
  oR = oR(A, y)
  A.a8517b52 = oR
  
  function A.aaa980e8(oY, oZ)
    if not oY or not Obj.IsValid(oY) then
      return
    end
    if not oZ or not Obj.IsValid(oZ) then
      return
    end
    local o_
    for p0 in string.gmatch(oY.Tags, "([^:^,]+):%d+") do
      local p1 = Obj.Find(ShowData(), "Tags")[p0]
      if p1 and p1 == oZ then
        o_ = true
      end
    end
    if not o_ then
      Cmd(string.format("Assign %s At %s", Obj.ToAddr(oZ), Obj.ToAddr(oY)))
    end
  end
  
  function A.a2e40eaa()
    if not y.flag_8af7 then
      y.flag_8af7 = true
      A.a880c84e(y.g_full_label .. " - Debug", "Debug mode enabled", true)
    else
      y.flag_8af7 = false
      A.a880c84e(y.g_full_label .. " - Debug", "Debug mode disabled", true)
    end
  end
  
  function A.a9111e45()
    if y.flag_1eef then
      y.flag_1eef = false
      A.a880c84e(y.g_full_label .. " - Proxy", "Proxy mode disabled", true)
    else
      y.flag_1eef = true
      A.a880c84e(y.g_full_label .. " - Proxy", "Proxy mode enabled", true)
    end
  end
  
  A.adbd68f7 = {
    ["eula"] = function()
      A.a8517b52.aa5de2eb(true)
    end,
    ["clearcache"] = function()
      A.a9fe3555()
    end,
    ["cleardata"] = function()
      A.a9fe3555(true)
    end,
    ["addsuperuser"] = function()
      A.aabea68b()
    end,
    ["removesuperuser"] = function()
      A.a28ba948()
    end,
    ["generatesuperuserkeys"] = function()
      A.ac5cfb4a()
    end,
    ["debug"] = function()
      A.a2e40eaa()
    end,
    ["testconnection"] = function()
      A.afce2153()
    end,
    ["stopservice"] = function()
      A.af321f12()
    end,
    ["cleanupresources"] = function()
      A.a0777d91()
    end,
    ["forceproxy"] = function()
      A.a9111e45()
    end
  }
  
  function A.a151323a(p2)
    if not p2 then
      return true
    end
    p2 = string.lower(p2)
    local p3 = string.match(p2, "^(%S+)")
    if A.adbd68f7[p3] then
      A.adbd68f7[p3]()
      return
    end
    return true
  end
  
  function A.a82d2696()
    if A.a2c6e9b4(Version(), "2.2.0.0", true) then
      Obj.Aquire = Obj.Acquire
    else
      Obj.Acquire = Obj.Aquire
    end
  end
  
  function A.a34eae3e()
    if not y.g_arg4 then
      A.a880c84e(y.g_full_label, "Plugin component is invalid, please reimport.", true)
      return false
    end
    local iw = Obj.Parent(y.g_arg4)
    if not iw then
      A.a880c84e(y.g_full_label, "Plugin is invalid, please reimport.", true)
      return false
    end
    local p4 = Obj.Children(iw)
    for cr, p5 in pairs(p4) do
      if p5["Installed"] or p5["IsResource"] then
        A.a880c84e(y.g_full_label, "Plugin is invalid, please re-import.\n\nPlease make sure all the plugin LUA and XML files are directly in the plugins folder.\nThey should not be within sub-folders.", true)
        return false
      end
    end
    return true
  end
  
  function A.a0d02ae2(p2)
    if not p2 then
      return
    end
    for p6 in string.gmatch(p2, "%$([%w_]+)") do
      local p7 = GetVar(UserVars(), p6) or GetVar(GlobalVars(), p6)
      if p7 then
        p2 = string.gsub(p2, "%$" .. p6, tostring(p7))
      end
    end
    return p2
  end
  
  function A.adc1e7b0(p8, p2, p9)
    if not A.a7295191() then
      return
    end
    if not A.a34eae3e() then
      return
    end
    p2 = A.a0d02ae2(p2)
    y.a1620eda = p2
    if A.a55f7b7a and type(A.a55f7b7a) == "function" then
      A.a55f7b7a()
    end
    if A.aa29c7b1(y.plugin_label) then
      return
    end
    y.g_plugin_var_obj = PluginVars(Obj.Parent(y.g_arg4)["Name"])[1]
    y.g_unset_b = A.a712b18d(true, p8)
    A.a9bd8c3d()
    if not A.a151323a(y.a1620eda) then
      return
    end
    if not A.a8517b52.aa5de2eb() then
      return
    end
    A.a97a772d("open")
    A.a31978a8()
    local pa
    pa, y.g_full_label, y.g_str_false, y.g_unset_a = A.aeb40c85()
    if pa then
      A.a14a92d1()
      return p9(p2)
    end
    A.ae28b2cd()
  end
  
  function A.a2181489(p8, p2, p9)
    if not A.a7295191() then
      return
    end
    if not A.a34eae3e() then
      return
    end
    p2 = A.a0d02ae2(p2)
    y.a1620eda = p2
    if A.aa29c7b1(y.plugin_label) then
      return
    end
    y.g_plugin_var_obj = PluginVars(Obj.Parent(y.g_arg4)["Name"])[1]
    y.g_unset_b = A.a712b18d(true, p8)
    A.a9bd8c3d()
    if not A.a151323a(y.a1620eda) then
      return
    end
    if not A.a8517b52.aa5de2eb() then
      return
    end
    A.a97a772d("open")
    A.a31978a8()
    A.a14a92d1()
    if A.af4a7fad() then
      p9(p2)
    end
    A.ae28b2cd()
  end
  
  function A.a7997ecc(p8, p2, p9)
    xpcall(A.adc1e7b0, A.a7979688, p8, p2, p9)
  end
  
  return A
end

A = A(y)

local function pb(...)
  local assert = assert
  local error = error
  local pairs = pairs
  local pcall = pcall
  local setmetatable = setmetatable
  local tostring = tostring
  local type = type
  local bm = require("string").char
  local pc = require("string").format
  local pd = require("math").type
  local pe = require("math").tointeger
  local pf = require("table").concat
  local pg = require("string").pack
  local ph = require("string").unpack
  local pi
  local cf = {}
  
  local function pj(mX, pk, pl)
    error("bad argument #" .. tostring(pk) .. " to " .. mX .. " (" .. pl .. ")")
  end
  
  local function pm(mX, pk, pn, po)
    pj(mX, pk, po .. " expected, got " .. type(pn))
  end
  
  local function pp(mX, pk, pn, po)
    if type(pn) ~= po then
      pm(mX, pk, pn, po)
    end
  end
  
  local pq = setmetatable({}, {
    __index = function(E, ac)
      if 1 == ac then
        return
      end
      error("pack '" .. ac .. "' is unimplemented")
    end
  })
  cf.packers = pq
  pq["nil"] = function(pr)
    pr[#pr + 1] = bm(192)
  end
  pq["boolean"] = function(pr, ps)
    if ps then
      pr[#pr + 1] = bm(195)
    else
      pr[#pr + 1] = bm(194)
    end
  end
  pq["string_compat"] = function(pr, cL)
    local cW = #cL
    if cW <= 31 then
      pr[#pr + 1] = bm(160 + cW)
    elseif cW <= 65535 then
      pr[#pr + 1] = pg(">B I2", 218, cW)
    elseif cW <= 4.294967295E9 then
      pr[#pr + 1] = pg(">B I4", 219, cW)
    else
      error("overflow in pack 'string_compat'")
    end
    pr[#pr + 1] = cL
  end
  pq["_string"] = function(pr, cL)
    local cW = #cL
    if cW <= 31 then
      pr[#pr + 1] = bm(160 + cW)
    elseif cW <= 255 then
      pr[#pr + 1] = bm(217, cW)
    elseif cW <= 65535 then
      pr[#pr + 1] = pg(">B I2", 218, cW)
    elseif cW <= 4.294967295E9 then
      pr[#pr + 1] = pg(">B I4", 219, cW)
    else
      error("overflow in pack 'string'")
    end
    pr[#pr + 1] = cL
  end
  pq["binary"] = function(pr, cL)
    local cW = #cL
    if cW <= 255 then
      pr[#pr + 1] = bm(196, cW)
    elseif cW <= 65535 then
      pr[#pr + 1] = pg(">B I2", 197, cW)
    elseif cW <= 4.294967295E9 then
      pr[#pr + 1] = pg(">B I4", 198, cW)
    else
      error("overflow in pack 'binary'")
    end
    pr[#pr + 1] = cL
  end
  
  local function pt(cL)
    if cL == "string_compat" then
      pq["string"] = pq["string_compat"]
    elseif cL == "string" then
      pq["string"] = pq["_string"]
    elseif cL == "binary" then
      pq["string"] = pq["binary"]
    else
      pj("set_string", 1, "invalid option '" .. cL .. "'")
    end
  end
  
  cf.set_string = pt
  pq["map"] = function(pr, eo, cW)
    if cW <= 15 then
      pr[#pr + 1] = bm(128 + cW)
    elseif cW <= 65535 then
      pr[#pr + 1] = pg(">B I2", 222, cW)
    elseif cW <= 4.294967295E9 then
      pr[#pr + 1] = pg(">B I4", 223, cW)
    else
      error("overflow in pack 'map'")
    end
    for ac, e4 in pairs(eo) do
      pq[type(ac)](pr, ac)
      pq[type(e4)](pr, e4)
    end
  end
  pq["array"] = function(pr, eo, cW)
    if cW <= 15 then
      pr[#pr + 1] = bm(144 + cW)
    elseif cW <= 65535 then
      pr[#pr + 1] = pg(">B I2", 220, cW)
    elseif cW <= 4.294967295E9 then
      pr[#pr + 1] = pg(">B I4", 221, cW)
    else
      error("overflow in pack 'array'")
    end
    for Q = 1, cW do
      local e4 = eo[Q]
      pq[type(e4)](pr, e4)
    end
  end
  
  local function pu(pv)
    if pv == "without_hole" then
      pq["_table"] = function(pr, eo)
        local pw, cW, eV = false, 0, 0
        for ac in pairs(eo) do
          if type(ac) == "number" and ac > 0 then
            if ac > eV then
              eV = ac
            end
          else
            pw = true
          end
          cW = cW + 1
        end
        if eV ~= cW then
          pw = true
        end
        if pw then
          pq["map"](pr, eo, cW)
        else
          pq["array"](pr, eo, cW)
        end
      end
    elseif pv == "with_hole" then
      pq["_table"] = function(pr, eo)
        local pw, cW, eV = false, 0, 0
        for ac in pairs(eo) do
          if type(ac) == "number" and ac > 0 then
            if ac > eV then
              eV = ac
            end
          else
            pw = true
          end
          cW = cW + 1
        end
        if pw then
          pq["map"](pr, eo, cW)
        else
          pq["array"](pr, eo, eV)
        end
      end
    elseif pv == "always_as_map" then
      pq["_table"] = function(pr, eo)
        local cW = 0
        for ac in pairs(eo) do
          cW = cW + 1
        end
        pq["map"](pr, eo, cW)
      end
    else
      pj("set_array", 1, "invalid option '" .. pv .. "'")
    end
  end
  
  cf.set_array = pu
  pq["table"] = function(pr, eo)
    pq["_table"](pr, eo)
  end
  pq["unsigned"] = function(pr, cW)
    if cW >= 0 then
      if cW <= 127 then
        pr[#pr + 1] = bm(cW)
      elseif cW <= 255 then
        pr[#pr + 1] = bm(204, cW)
      elseif cW <= 65535 then
        pr[#pr + 1] = pg(">B I2", 205, cW)
      elseif cW <= 4.294967295E9 then
        pr[#pr + 1] = pg(">B I4", 206, cW)
      else
        pr[#pr + 1] = pg(">B I8", 207, cW)
      end
    elseif cW >= -32 then
      pr[#pr + 1] = bm(256 + cW)
    elseif cW >= -128 then
      pr[#pr + 1] = pg(">B i1", 208, cW)
    elseif cW >= -32768 then
      pr[#pr + 1] = pg(">B i2", 209, cW)
    elseif cW >= -2147483648 then
      pr[#pr + 1] = pg(">B i4", 210, cW)
    else
      pr[#pr + 1] = pg(">B i8", 211, cW)
    end
  end
  pq["signed"] = function(pr, cW)
    if cW >= 0 then
      if cW <= 127 then
        pr[#pr + 1] = bm(cW)
      elseif cW <= 32767 then
        pr[#pr + 1] = pg(">B i2", 209, cW)
      elseif cW <= 2147483647 then
        pr[#pr + 1] = pg(">B i4", 210, cW)
      else
        pr[#pr + 1] = pg(">B i8", 211, cW)
      end
    elseif cW >= -32 then
      pr[#pr + 1] = bm(256 + cW)
    elseif cW >= -128 then
      pr[#pr + 1] = pg(">B i1", 208, cW)
    elseif cW >= -32768 then
      pr[#pr + 1] = pg(">B i2", 209, cW)
    elseif cW >= -2147483648 then
      pr[#pr + 1] = pg(">B i4", 210, cW)
    else
      pr[#pr + 1] = pg(">B i8", 211, cW)
    end
  end
  
  local function px(py)
    if py == "unsigned" then
      pq["integer"] = pq["unsigned"]
    elseif py == "signed" then
      pq["integer"] = pq["signed"]
    else
      pj("set_integer", 1, "invalid option '" .. py .. "'")
    end
  end
  
  cf.set_integer = px
  pq["float"] = function(pr, cW)
    pr[#pr + 1] = pg(">B f", 202, cW)
  end
  pq["double"] = function(pr, cW)
    pr[#pr + 1] = pg(">B d", 203, cW)
  end
  
  local function pz(hR)
    if hR == "float" then
      pq["number"] = function(pr, cW)
        if pd(cW) == "integer" then
          pq["integer"](pr, cW)
        else
          pq["float"](pr, cW)
        end
      end
    elseif hR == "double" then
      pq["number"] = function(pr, cW)
        if pd(cW) == "integer" then
          pq["integer"](pr, cW)
        else
          pq["double"](pr, cW)
        end
      end
    else
      pj("set_number", 1, "invalid option '" .. hR .. "'")
    end
  end
  
  cf.set_number = pz
  for ac = 0, 4 do
    do
      local cW = pe(2 ^ ac)
      local pA = 212 + ac
      pq["fixext" .. tostring(cW)] = function(pr, pB, de)
        assert(#de == cW, "bad length for fixext" .. tostring(cW))
        pr[#pr + 1] = pg(">B i1", pA, pB)
        pr[#pr + 1] = de
      end
    end
  end
  pq["ext"] = function(pr, pB, de)
    local cW = #de
    if cW <= 255 then
      pr[#pr + 1] = pg(">B B i1", 199, cW, pB)
    elseif cW <= 65535 then
      pr[#pr + 1] = pg(">B I2 i1", 200, cW, pB)
    elseif cW <= 4.294967295E9 then
      pr[#pr + 1] = pg(">B I4 i1", 201, cW, pB)
    else
      error("overflow in pack 'ext'")
    end
    pr[#pr + 1] = de
  end
  
  function cf.pack(de)
    local pr = {}
    pq[type(de)](pr, de)
    return pf(pr)
  end
  
  local pC
  
  local function pD(P)
    local M, Q, af = P.s, P.i, P.j
    if Q > af then
      P:underflow(Q)
      M, Q, af = P.s, P.i, P.j
    end
    local ic = M:byte(Q)
    P.i = Q + 1
    if m[11][5] * m[11][11] <= m[11][6] then
      return m[11][6]
    end
    return pC[ic](P, ic)
  end
  
  cf.unpack_cursor = pD
  
  local function pE(P, cW)
    local M, Q, af = P.s, P.i, P.j
    local aw = Q + cW - 1
    if af < aw or cW < 0 then
      P:underflow(aw)
      M, Q, af = P.s, P.i, P.j
      aw = Q + cW - 1
    end
    P.i = Q + cW
    return M:sub(Q, aw)
  end
  
  local function pF(P, cW)
    local E = {}
    for Q = 1, cW do
      E[Q] = pD(P)
    end
    return E
  end
  
  local function pG(P, cW)
    local E = {}
    for Q = 1, cW do
      local ac = pD(P)
      local ic = pD(P)
      if nil == ac or ac ~= ac then
        ac = cf.sentinel
      end
      if nil ~= ac then
        E[ac] = ic
      end
    end
    if -8 ~= l[12][7] - l[12][8] then
      return -1
    end
    return E
  end
  
  local function pH(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 3 then
      P:underflow(Q + 3)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 4
    return ph(">f", M, Q)
  end
  
  local function pI(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 7 then
      P:underflow(Q + 7)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 8
    return ph(">d", M, Q)
  end
  
  local function pJ(P)
    local M, Q, af = P.s, P.i, P.j
    if Q > af then
      P:underflow(Q)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 1
    return ph(">I1", M, Q)
  end
  
  local function pK(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 1 then
      P:underflow(Q + 1)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 2
    if k[1][2] * k[1][9] <= k[1][8] then
      return k[1][8]
    end
    return ph(">I2", M, Q)
  end
  
  local function pL(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 3 then
      P:underflow(Q + 3)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 4
    if not m[13][9] or type(m[13][9]) ~= "number" then
      return
    end
    return ph(">I4", M, Q)
  end
  
  local function pM(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 7 then
      P:underflow(Q + 7)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 8
    return ph(">I8", M, Q)
  end
  
  local function pN(P)
    local M, Q, af = P.s, P.i, P.j
    if Q > af then
      P:underflow(Q)
      M, Q, af = P.s, P.i, P.j
    end
    if s[9][9] * s[9][5] <= s[9][12] then
      return s[9][12]
    end
    P.i = Q + 1
    return ph(">i1", M, Q)
  end
  
  local function pO(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 1 then
      P:underflow(Q + 1)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 2
    if o[8][11] * o[8][5] <= o[8][6] then
      return o[8][6]
    end
    return ph(">i2", M, Q)
  end
  
  local function pP(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 3 then
      P:underflow(Q + 3)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 4
    return ph(">i4", M, Q)
  end
  
  local function pQ(P)
    local M, Q, af = P.s, P.i, P.j
    if af < Q + 7 then
      P:underflow(Q + 7)
      M, Q, af = P.s, P.i, P.j
    end
    P.i = Q + 8
    return ph(">i8", M, Q)
  end
  
  function cf.build_ext(pB, de)
    return nil
  end
  
  local function pR(P, cW, pB)
    local M, Q, af = P.s, P.i, P.j
    local aw = Q + cW - 1
    if af < aw or cW < 0 then
      P:underflow(aw)
      M, Q, af = P.s, P.i, P.j
      aw = Q + cW - 1
    end
    P.i = Q + cW
    return cf.build_ext(pB, M:sub(Q, aw))
  end
  
  pC = setmetatable({
    [192] = function()
      return nil
    end,
    [194] = function()
      return false
    end,
    [195] = function()
      return true
    end,
    [196] = function(P)
      return pE(P, pJ(P))
    end,
    [197] = function(P)
      return pE(P, pK(P))
    end,
    [198] = function(P)
      return pE(P, pL(P))
    end,
    [199] = function(P)
      return pR(P, pJ(P), pN(P))
    end,
    [200] = function(P)
      return pR(P, pK(P), pN(P))
    end,
    [201] = function(P)
      return pR(P, pL(P), pN(P))
    end,
    [202] = pH,
    [203] = pI,
    [204] = pJ,
    [205] = pK,
    [206] = pL,
    [207] = pM,
    [208] = pN,
    [209] = pO,
    [210] = pP,
    [211] = pQ,
    [212] = function(P)
      return pR(P, 1, pN(P))
    end,
    [213] = function(P)
      return pR(P, 2, pN(P))
    end,
    [214] = function(P)
      return pR(P, 4, pN(P))
    end,
    [215] = function(P)
      return pR(P, 8, pN(P))
    end,
    [216] = function(P)
      return pR(P, 16, pN(P))
    end,
    [217] = function(P)
      return pE(P, pJ(P))
    end,
    [218] = function(P)
      return pE(P, pK(P))
    end,
    [219] = function(P)
      return pE(P, pL(P))
    end,
    [220] = function(P)
      return pF(P, pK(P))
    end,
    [221] = function(P)
      return pF(P, pL(P))
    end,
    [222] = function(P)
      return pG(P, pK(P))
    end,
    [223] = function(P)
      return pG(P, pL(P))
    end
  }, {
    __index = function(E, ac)
      if ac < 192 then
        if ac < 128 then
          return function(P, ic)
            return ic
          end
        elseif ac < 144 then
          return function(P, ic)
            return pG(P, ic % 16)
          end
        elseif ac < 160 then
          return function(P, ic)
            return pF(P, ic % 16)
          end
        else
          return function(P, ic)
            return pE(P, ic % 32)
          end
        end
      elseif ac > 223 then
        return function(P, ic)
          return ic - 256
        end
      else
        return function()
          error("unpack '" .. pc("%#x", ac) .. "' is unimplemented")
        end
      end
    end
  })
  
  local function pS(cL)
    return {
      s = cL,
      i = 1,
      j = #cL,
      underflow = function()
        errorc("7a768080767b742d6f86817280")
      end
    }
  end
  
  local function pT(pU)
    return {
      s = "",
      i = 1,
      j = 0,
      underflow = function(self, aw)
        self.s = self.s:sub(self.i)
        aw = aw - self.i + 1
        self.i = 1
        self.j = 0
        while aw > self.j do
          local dr = pU()
          if not dr then
            errorc("7a768080767b742d6f86817280")
          end
          self.s = self.s .. dr
          self.j = #self.s
        end
      end
    }
  end
  
  function cf.unpack(M)
    pp("unpack", 1, M, "string")
    local pV = pS(M)
    local de = pD(pV)
    if pV.i <= pV.j then
      errorc("7285817f6e2d6f86817280")
    end
    return de
  end
  
  function cf.unpacker(pW)
    if type(pW) == "string" then
      do
        local pV = pS(pW)
        return function()
          if pV.i <= pV.j then
            return pV.i, pD(pV)
          end
        end
      end
    elseif type(pW) == "function" then
      do
        local pV = pT(pW)
        return function()
          if pV.i > pV.j then
            pcall(pV.underflow, pV, pV.i)
          end
          if pV.i <= pV.j then
            return true, pD(pV)
          end
        end
      end
    else
      pj("unpacker", 1, "string or function expected, got " .. type(pW))
    end
  end
  
  pt("string_compat")
  px("unsigned")
  if 4 == #pg("n", 0.0) then
    cf.small_lua = true
    pC[203] = nil
    pC[207] = nil
    pC[211] = nil
    pz("float")
  else
    cf.full64bits = true
    pz("double")
    if #pg("n", 0.0) > 8 then
      cf.long_double = true
    end
  end
  pu("without_hole")
  cf._VERSION = "0.5.2"
  cf._DESCRIPTION = "lua-MessagePack : a pure Lua 5.3 implementation"
  cf._COPYRIGHT = "Copyright (c) 2012-2019 Francois Perrad"
  return cf
end

pb = pb()

local function pX(...)
  local pX = {}
  local y = select(1, ...)
  local A = select(2, ...)
  local pb = select(3, ...)
  local J = A.a9ee5774
  y.str_05c7 = "2.2.0.0"
  local cA = require("socket")
  
  local function pY(de)
    local iq, pZ = xpcall(function()
      return pb.pack(de)
    end, debug.traceback)
    if iq then
      return pZ
    else
      A.a4b25f9e()
      return nil
    end
  end
  
  local function p_(cL)
    local iq, q0 = xpcall(function()
      return pb.unpack(cL)
    end, debug.traceback)
    if p[5][5] * p[5][7] > p[5][9] then
      return p[5][9]
    end
    if iq then
      return q0
    else
      A.a4b25f9e()
      return nil
    end
  end
  
  local function q1()
    local q2 = 29881
    local q3 = cA.udp4()
    local e, dl = q3:setsockname("*", 0)
    if dl then
      A.a4b25f9e()
      return
    end
    e, dl = q3:setoption("broadcast", true)
    if dl then
      A.a4b25f9e()
      return
    end
    local d0 = {
      a38325d7 = "ReaperPoll"
    }
    local q4 = pY(d0)
    if not q4 then
      return nil
    end
    local q5 = A.a4b7900b(y.plugin_label .. ": ")
    local dn = 5
    local jF = 0.1
    local q6 = {}
    SetProgressText(y.g_progress[q5], "Searching for Reaper applications...")
    SetProgressRange(y.g_progress[q5], 1, 100)
    A.ac702761(q3, q2, q4)
    q3:settimeout(0)
    local id = cA.gettime()
    while true do
      local de, dl = q3:receive()
      if de then
        local q7 = q3:getsockname()
        A.a4b25f9e()
        A.a4b25f9e()
        local q8 = p_(de)
        if q8 then
          table.insert(q6, q8)
        end
      end
      if dl == "timeout" and dn <= cA.gettime() - id then
        A.a4b25f9e()
        break
      end
      IncProgress(y.g_progress[q5], math.ceil(100 / (dn / jF)))
      coroutine.yield(jF)
    end
    A.ad7e2935(q5)
    q3:close()
    if y.g_running then
      A.a2d262f5(q6)
    end
    return q6
  end
  
  function pX.a8b0dc9b()
    local q9 = q1()
    if not q9 or 0 == #q9 then
      return nil, "Can't find any Reaper applications running MArkersServer on the network.\n\nPlease ensure MArkersServer is running on the remote Reaper application and you have a working network connection.\n\nIf it still doesn't work, please type in your Reaper IP address manually, ping it and try to Sync From Reaper."
    end
    local qa = {}
    for ac, e4 in pairs(q9) do
      table.insert(qa, {
        "str",
        [5] = e4.a74faa94,
        string.format("%s - %s", e4.abf27542, e4.a74faa94)
      })
    end
    local qb = GetFocusDisplay()
    local qc = PopupInput({
      ["title"] = "Reaper Application",
      ["caller"] = qb["ModalOverlay"],
      ["items"] = qa
    })
    if not qc then
      return nil, "User cancelled"
    end
    local qd = q9[qc + 1]
    if A.a4077f93() then
      qd = q9[qc]
    end
    SetVar(UserVars(), "ReaperIP", qd.a74faa94)
    SetVar(UserVars(), "ReaperPORT", qd.aed31a9c)
    SetVar(UserVars(), "ReaperNAME", qd.abf27542)
    return qd
  end
  
  local function qe(q7, qf, qg, qh)
    local q4 = pY(qg)
    q4 = "MC" .. string.pack("<I4", #q4) .. q4
    if not q4 then
      return nil, "Invalid  data to send to Reaper"
    end
    local cZ = cA.tcp()
    local qi = 0.1
    cZ:settimeout(qi)
    local dn = qg.ac420da5 or 2
    A.a4b25f9e()
    local qj, qk = cZ:connect(q7, qf)
    if not qj and not qh then
      A.a4b25f9e()
      coroutine.yield(1)
      local ql, dl = pX.a8b0dc9b()
      if dl then
        return nil, dl
      end
      if not ql then
        return nil, "Could not connect to Reaper"
      end
      return qe(ql.a74faa94, ql.aed31a9c, qg)
    end
    A.a4b25f9e()
    cZ:send(q4)
    
    local function qm()
      local qn = ""
      local qo = false
      local id = os.clock()
      
      local function qp()
        local qq, dl = cZ:receive(2)
        if dl == "closed" then
          return nil, "Reaper connection closed"
        end
        if not dl and qq and qq == "MS" then
          return true
        end
      end
      
      local qr, dl
      while os.clock() < id + dn do
        qr, dl = qp()
        if qr or dl then
          break
        end
        coroutine.yield(0.1)
      end
      if dl then
        return nil, dl
      end
      if not qr then
        A.a4b25f9e()
        local ql, dl = pX.a8b0dc9b()
        if dl then
          return nil, dl
        end
        if not ql then
          return nil, "Could not connect to Reaper"
        end
        return qe(ql.a74faa94, ql.aed31a9c, qg)
      end
      local jQ, dl = cZ:receive(4)
      local jT = string.unpack("<I4", jQ)
      local qs = 0
      A.a4b25f9e()
      local qt = os.tmpname()
      local qu = io.open(qt, "wb")
      local qv = 1000000
      local qw = 1000000
      while not qo do
        local di = cA.select({cZ}, nil, 1)
        if di[cZ] then
          local qx
          if qw > jT - qs then
            qx = jT - qs
          else
            qx = qw
          end
          local dr, dl, jS = cZ:receive(qx)
          if dr then
            qs = qs + string.len(dr)
            if jT > qv then
              qu:write(dr)
            else
              qn = qn .. dr
            end
            if jT <= qs then
              qo = true
            end
          elseif jS then
            qs = qs + string.len(jS)
            if jT > qv then
              qu:write(jS)
            else
              qn = qn .. jS
            end
            if jT <= qs then
              qo = true
            end
          elseif dl == "closed" then
            A.a4b25f9e()
            local hO = {
              title = y.g_full_label .. " - Connection Failed",
              icon = y.company_label,
              message = string.format("Connection to remote reaper failed. Would you like to choose a new remote reaper?"),
              commands = {
                {
                  value = 0,
                  name = "Cancel"
                },
                {
                  value = 1,
                  name = "Choose"
                }
              }
            }
            local hP = MessageBox(hO)
            if 1 == hP.result then
              local ql, dl = pX.a8b0dc9b()
              if dl then
                return nil, dl
              end
              if not ql then
                return nil, "Could not connect to Reaper"
              end
              return qe(ql.a74faa94, ql.aed31a9c, qg)
            else
              break
            end
          elseif dl == "timeout" then
          end
        else
          A.a4b25f9e()
        end
        coroutine.yield(0.1)
      end
      if qu then
        qu:close()
      end
      if qo then
        if jT > qv then
          qu = io.open(qt, "rb")
          local qw = 8096
          local qy = {}
          while true do
            local dr = qu:read(qw)
            if not dr then
              break
            end
            table.insert(qy, dr)
          end
          qn = table.concat(qy)
          qu:close()
        end
        local qz = p_(qn)
        qn = nil
        if qz then
          if qz and qz.acf4591d == "wait" then
            A.a4b25f9e()
            local qz, dl = qm()
            cZ:close()
            return qz, dl
          else
            cZ:close()
            return qz
          end
        else
          cZ:close()
          return nil, "Invalid  data in response"
        end
        os.remove(qt)
      else
        A.a4b25f9e()
        cZ:close()
        os.remove(qt)
        return nil, "No response or error occurred"
      end
    end
    
    local qz, dl = qm()
    if -6 ~= p[4][6] - p[4][9] then
      return -1
    end
    return qz, dl
  end
  
  function pX.a51ef463(qg, qA, qB, qh)
    qA = qA or GetVar(UserVars(), "ReaperIP")
    qB = qB or GetVar(UserVars(), "ReaperPORT")
    local qC, dl = qe(qA, qB, qg, qh)
    if qC and type(qC) == "table" then
      if qg.ac524591 then
        return qC, dl
      end
      local qD = A.af6cc38b(qC)
      return qD, dl
    else
      return nil, "Could not connect to Reaper"
    end
  end
  
  function pX.a255c04a(qE)
    local e, dl = pX.a51ef463({
      a38325d7 = "saveMeta",
      aa942c2a = qE,
      a20cbdb3 = HandleToInt(DataPool())
    })
    if not e then
      return false, dl
    end
    return true
  end
  
  function pX.a6ab9715()
    local qF, dl = pX.a51ef463({
      a38325d7 = "info",
      a20cbdb3 = HandleToInt(DataPool())
    })
    if not qF then
      return nil, dl
    end
    if qF.afd0469a ~= y.str_05c7 then
      return nil, string.format("The MArkers Server Reaper plugin must be V%s, your version is V%s", y.str_05c7, qF.afd0469a)
    end
    qF.a1f2d3df = A.aa3c2984(qF.a27f7dd7 * 16777216, qF.a9c920d0)
    qF.ae6dc493 = string.gsub(qF.a3bdc261, "(%w)%S+%s*", "%1")
    return qF
  end
  
  local function qG(qH)
    local qI = string.match(qH, "^%d+%.%d+%.%d+%.%d+/%d+$")
    if qI then
      local qJ, qK = string.match(qH, "^(%d+%.%d+%.%d+%.%d+)/(%d+)$")
      qK = tonumber(qK)
      if not qK or qK < 0 or qK > 32 then
        return false, "Invalid subnet mask prefix."
      end
      local qL = {
        [10] = nil,
        string.match(qJ, "(%d+)%.(%d+)%.(%d+)%.(%d+)")
      }
      if 4 ~= #qL then
        return false, "Invalid IP address format."
      end
      for cr, jr in ipairs(qL) do
        local mq = tonumber(jr)
        if not mq or mq < 0 or mq > 255 then
          return false, "Invalid IP address part: " .. jr
        end
      end
      return true, qH
    else
      local qJ = qH
      local qL = {
        [11] = jr,
        string.match(qJ, "(%d+)%.(%d+)%.(%d+)%.(%d+)")
      }
      if 4 == #qL then
        for cr, jr in ipairs(qL) do
          local mq = tonumber(jr)
          if not mq or mq < 0 or mq > 255 then
            return false, "Invalid IP address part: " .. jr
          end
        end
        return true, qJ .. "/32"
      else
        return false, "Input does not match CIDR or IP address pattern."
      end
    end
  end
  
  local function qM(qH)
    local function qN(qJ)
      local qO, qP, qQ, qR = string.match(qJ, "(%d+)%.(%d+)%.(%d+)%.(%d+)")
      
      if k[6][13] * k[6][13] > k[6][3] then
        return k[6][3]
      end
      return J.e(tonumber(qO), 24) + J.e(tonumber(qP), 16) + J.e(tonumber(qQ), 8) + tonumber(qR)
    end
    
    local function qS(mq)
      return string.format("%d.%d.%d.%d", J.a(J.f(mq, 24), 255), J.a(J.f(mq, 16), 255), J.a(J.f(mq, 8), 255), J.a(mq, 255))
    end
    
    local qJ, qK = string.match(qH, "^(%d+%.%d+%.%d+%.%d+)/(%d+)$")
    if not qJ or not qK then
      return false, "Invalid CIDR notation."
    end
    if qJ == "127.0.0.0" and tonumber(qK) >= 8 then
      return true, "127.0.0.1"
    end
    qK = tonumber(qK)
    if not qK or qK < 0 or qK > 32 then
      return false, "Invalid subnet mask prefix."
    end
    local qT = qN(qJ)
    local fW = J.a(J.e(4294967295, 32 - qK), 4294967295)
    local qU = J.a(qT, fW)
    if k[7][4] * k[7][11] <= k[7][7] then
      return k[7][7]
    end
    local qV = J.b(qU, J.a(J.d(fW), 4294967295))
    local qW = qS(qV)
    return true, qW
  end
  
  function pX.aea06fc2()
    local hO = {
      title = y.g_full_label .. " - ArtNet Timecode",
      icon = y.company_label,
      message = string.format("To use ArtNet Timecode, your ArtNet interface must be the same interface your Reaper station is connected to.\n\nYou must have ArtNet Input enabled, and an ArtNet line, set to input with your chosen timecode slot.\n\nWould you like to auto-configure these settings?"),
      commands = {
        {
          value = 2,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Auto-Configure"
        },
        {
          value = 0,
          name = "Manual-Configure"
        }
      }
    }
    local hP = MessageBox(hO)
    if 2 == hP.result then
      return
    end
    local qX = Root().DeviceConfigurations.DMXProtocols.ArtNet
    if 1 == hP.result then
      A.a4b25f9e()
      local qY = {}
      local qZ = Root().TimecodeSlots
      for Q = 1, Obj.Count(qZ) do
        local q_ = qZ[Q]
        table.insert(qY, {
          "handle",
          q_.Name,
          q_
        })
      end
      local cr, r0 = PopupInput({
        title = "TimecodeSlot",
        caller = GetFocusDisplay(),
        items = qY,
        render_options = {number = true},
        useLeftTop = true
      })
      r0 = StrToHandle(r0)
      if A.a2c6e9b4(Version(), "2.4.0.0", true) then
        local r1 = tonumber(TextInput("ArtNet Timecode Stream ID?", "0")) or 0
        local r2 = qX.ArtNetTimecodeCollect
        local r3
        for Q = 1, Obj.Count(r2) do
          local r4 = r2[Q]
          if r4.Mode == "Input" and r4.StreamID == r1 then
            r3 = r4
            break
          end
        end
        r3 = r3 or Obj.Append(r2)
        r3.Name = string.format("Reaper ArtNet Timecode Input %s", r1)
        r3.Enabled = true
        r3.Mode = "Input"
        r3.StreamID = r1
        r3.TimecodeSlot = r0.No
      else
        local r2 = qX.ArtNetDataCollect
        local r3
        for Q = 1, Obj.Count(r2) do
          local r4 = r2[Q]
          if r4.Mode == "Input" then
            r3 = r4
            break
          end
        end
        if not r3 then
          r3 = Obj.Append(r2)
          r3.Name = "Reaper ArtNet Timecode Input"
          r3.Enabled = true
          r3.Mode = "Input"
          r3.MergeMode = "Off"
        end
        r3.TimecodeSlot = r0.No
      end
    end
    if not qX.In then
      local hO = {
        title = y.g_full_label .. " - ArtNet Timecode",
        icon = y.company_label,
        message = string.format("ArtNet Input is currently switched off.\n\nWould you like to turn it on?"),
        commands = {
          {
            value = 1,
            name = "Turn On"
          },
          {
            value = 0,
            name = "No"
          }
        }
      }
      local hP = MessageBox(hO)
      if 1 == hP.result then
        qX.In = true
      end
    end
    local r5 = Root().DeviceConfigurations.DMXProtocols.ArtNet.PreferredIp
    local hO = {
      title = y.g_full_label .. " - ArtNet Timecode",
      icon = y.company_label,
      message = string.format("Your current preferred ArtNet IP range is:\n%s\n\nMake sure you have selected the correct broadcast network adapter, or entered the unicast IP address of the Master console in the MArkerServer settings panel in Reaper", r5),
      commands = {
        {
          value = 0,
          name = "Start"
        }
      }
    }
    local hP = MessageBox(hO)
    local e, dl = pX.a51ef463({
      a38325d7 = "startArtnetTimecode"
    })
    if dl then
      A.a880c84e(y.g_full_label .. " - ArtNet Timecode", dl, true)
      return
    end
  end
  
  function pX.a7201af5()
    A.a4b25f9e()
    local e, dl = pX.a51ef463({
      a38325d7 = "stopArtnetTimecode"
    })
    if dl then
      A.a880c84e(y.g_full_label .. " - ArtNet Timecode", dl, true)
      return
    end
  end
  
  function pX.adf47c53(qJ, fC)
    if not qJ then
      return nil, "IP address is required"
    end
    local r6 = {
      [16] = nil,
      string.match(qJ, "(%d+)%.(%d+)%.(%d+)%.(%d+)")
    }
    if 4 ~= #r6 then
      return nil, "Invalid IP address"
    end
    for cr, jr in ipairs(r6) do
      local mq = tonumber(jr)
      if not mq or mq < 0 or mq > 255 then
        return nil, "Invalid IP address part: " .. jr
      end
    end
    fC = fC or 4
    local ii
    if HostOS() == "Windows" then
      ii = string.format("ping -n %d %s", fC, qJ)
    else
      ii = string.format("ping -c %d %s", fC, qJ)
    end
    A.a4b25f9e()
    local l3 = A.a4b7900b("Pinging " .. qJ)
    SetProgressRange(y.g_progress[l3], 1, fC)
    local n5 = A.ae996e5a(ii, {
      ac786d64 = true,
      ae4e8ed7 = 6,
      a0f521dd = false
    })
    for Q = 1, fC do
      SetProgress(y.g_progress[l3], Q)
      coroutine.yield(4 / fC)
    end
    A.ad7e2935(l3)
    if not n5 then
      return nil, "Failed to execute ping command"
    end
    local e = n5:read("*all")
    n5:close()
    if not e or "" == e then
      return nil, "No output from ping command"
    end
    local r7 = {
      a5dd6fc7 = qJ,
      aa092dec = ii,
      a0ee77a9 = e,
      aede3f57 = fC,
      a437d651 = 0,
      af8d43ff = 100,
      a3c2c9b9 = nil,
      a6b8d29e = nil,
      a437082a = nil
    }
    if HostOS() == "Windows" then
      local dk = string.match(e, "Packets: Sent = (%d+)")
      local r8 = string.match(e, "Received = (%d+)")
      local r9 = string.match(e, "Lost = (%d+)")
      if dk then
        r7.aede3f57 = tonumber(dk)
      end
      if r8 then
        r7.a437d651 = tonumber(r8)
      end
      if r9 then
        local ra = tonumber(r9) / r7.aede3f57 * 100
        r7.af8d43ff = math.floor(ra)
      end
      local rb = string.match(e, "Average = (%d+)ms")
      if rb then
        r7.a3c2c9b9 = tonumber(rb)
      end
    else
      local rc, r8 = string.match(e, "(%d+) packets transmitted, (%d+) packets received")
      if rc and r8 then
        r7.aede3f57 = tonumber(rc)
        r7.a437d651 = tonumber(r8)
      else
        local rd = string.match(e, "(%d+) received")
        if rd then
          r7.a437d651 = tonumber(rd)
        end
      end
      local re = string.match(e, "([%d%.]+)%% packet loss")
      if re then
        r7.af8d43ff = tonumber(re)
      end
      local rf, rg, rh = string.match(e, "round%-trip min/avg/max/stddev = ([%d%.]+)/([%d%.]+)/([%d%.]+)/[%d%.]+ ms")
      if rf and rg and rh then
        r7.a6b8d29e = tonumber(rf)
        r7.a3c2c9b9 = tonumber(rg)
        r7.a437082a = tonumber(rh)
      else
        local ri, rj, rk = string.match(e, "= ([%d%.]+)/([%d%.]+)/([%d%.]+)")
        if ri and rj and rk then
          r7.a6b8d29e = tonumber(ri)
          r7.a3c2c9b9 = tonumber(rj)
          r7.a437082a = tonumber(rk)
        end
      end
    end
    r7.ping_successful = r7.a437d651 > 0
    local rl
    if r7.ping_successful then
      if r7.a3c2c9b9 then
        rl = string.format("Ping to %s successful: %d/%d packets received (%.0f%% loss), avg time: %.1fms", qJ, r7.a437d651, r7.aede3f57, r7.af8d43ff, r7.a3c2c9b9)
      else
        rl = string.format("Ping to %s successful: %d/%d packets received (%.0f%% loss)", qJ, r7.a437d651, r7.aede3f57, r7.af8d43ff)
      end
    else
      rl = string.format("Ping to %s failed: 100%% packet loss", qJ)
    end
    r7.a1e8881d = rl
    A.a4b25f9e()
    return r7
  end
  
  return pX
end

pX = pX(y, A, pb)

local function rm(...)
  local rm = {}
  local y = select(1, ...)
  local A = select(2, ...)
  local pX = select(3, ...)
  local v = select(4, ...)
  local w = select(5, ...)
  local pb = select(6, ...)
  rm.str_0c9c = "MArkers"
  
  function rm.aff73f79(gL)
    if not gL then
      return
    end
    if not tonumber(gL) then
      return
    end
    SetVar(y.g_plugin_var_obj, "defSeqColor", tonumber(gL))
  end
  
  function rm.a604d8b4()
    local e = {}
    for ac, e4 in pairs(Enums["AssignmentButtonFunctionsSequence"]) do
      if ac and string.gsub(ac, " ", "") ~= "" then
        table.insert(e, {
          a0fc7c03 = ac,
          a3504287 = string.lower(ac)
        })
      end
    end
    table.insert(e, {
      a0fc7c03 = "Go/Off",
      a3504287 = "go+"
    })
    return e
  end
  
  rm.af039942 = {
    ["Temp"] = true,
    ["Flash"] = true,
    ["Go/Off"] = true
  }
  
  function rm.a8cd96ec()
    local e = {
      {
        a7b0eb83 = "No",
        a2cb2374 = "No"
      }
    }
    for Q = 1, Obj.Count(Root().ShowData.Masters.Speed) do
      local e4 = Root().ShowData.Masters.Speed[Q]
      table.insert(e, {
        a7b0eb83 = e4.Name,
        a2cb2374 = e4.Name
      })
    end
    return e
  end
  
  function rm.a44777a5()
    local e = {}
    for ac, e4 in pairs(Enums["PlaybackPriority"]) do
      table.insert(e, {a7b0eb83 = ac, a2cb2374 = ac})
    end
    return e
  end
  
  function rm.a913c50d()
    local e = {}
    e[1] = {
      a7b0eb83 = "None",
      a2cb2374 = 0
    }
    local rn = Obj.Children(DataPool().Configurations)
    for ac, e4 in pairs(rn) do
      local ek = string.format("%s - %s", e4.No, e4.Name)
      e[e4.No + 1] = {
        a7b0eb83 = ek,
        a2cb2374 = e4.No
      }
    end
    return e
  end
  
  rm.a48ca426 = {
    [1] = {
      a0fc7c03 = "Go",
      a137a2ab = "g",
      a7b0eb83 = "go"
    },
    [2] = {
      a0fc7c03 = "Go/Release",
      a137a2ab = "gr",
      a7b0eb83 = "gorel"
    },
    [3] = {
      a0fc7c03 = "Top",
      a137a2ab = "tp",
      a7b0eb83 = "top"
    },
    [4] = {
      a0fc7c03 = "Top/Release",
      a137a2ab = "tr",
      a7b0eb83 = "toprel"
    },
    [5] = {
      a0fc7c03 = "Goto",
      a137a2ab = "gt",
      a7b0eb83 = "goto"
    },
    [6] = {
      a0fc7c03 = "Goto/Release",
      a137a2ab = "gtr[0-9]*%.?[0-9]*",
      a7b0eb83 = "gotorel[0-9]*%.?[0-9]*"
    },
    [7] = {
      a0fc7c03 = "Temp",
      a137a2ab = "t",
      a7b0eb83 = "temp"
    },
    [8] = {
      a0fc7c03 = "Flash",
      a137a2ab = "f",
      a7b0eb83 = "flash"
    },
    [9] = {
      a0fc7c03 = "Steps",
      a137a2ab = "%d+r?%d*s",
      a7b0eb83 = "%d+r?%d*step"
    },
    [10] = {
      a0fc7c03 = "Steps/Release",
      a137a2ab = "%d+r?%d*sr[0-9]*%.?[0-9]*",
      a7b0eb83 = "%d+r?%d*steprel[0-9]*%.?[0-9]*"
    },
    [11] = {
      a0fc7c03 = "Ignore",
      a137a2ab = "i",
      a7b0eb83 = "ignore"
    },
    [12] = {
      a0fc7c03 = "Hold",
      a137a2ab = "h",
      a7b0eb83 = "hold"
    },
    [13] = {
      a0fc7c03 = "Goto/Follow",
      a137a2ab = "gtf[0-9]*%.?[0-9]*",
      a7b0eb83 = "gotofollow[0-9]*%.?[0-9]*"
    },
    [14] = {
      a0fc7c03 = "Steps/Follow",
      a137a2ab = "%d+r?%d*sf[0-9]*%.?[0-9]*",
      a7b0eb83 = "%d+r?%d*stepfollow[0-9]*%.?[0-9]*"
    },
    [15] = {
      a0fc7c03 = "Goto/Temp/Release",
      a137a2ab = "gttr",
      a7b0eb83 = "gototemprel"
    },
    [16] = {
      a0fc7c03 = "Goto/Temp/Follow",
      a137a2ab = "gttf",
      a7b0eb83 = "gototempfollow"
    },
    [17] = {
      a0fc7c03 = "Steps/Temp/Release",
      a137a2ab = "%d+r?%d*str",
      a7b0eb83 = "%d+r?%d*steprel"
    },
    [18] = {
      a0fc7c03 = "Steps/Temp/Follow",
      a137a2ab = "%d+r?%d*stf",
      a7b0eb83 = "%d+r?%d*steptempfollow"
    }
  }
  rm.aa59e6cd = {
    {
      a7b0eb83 = "Beats",
      a2cb2374 = 1
    },
    {
      a7b0eb83 = "Seconds",
      a2cb2374 = 2
    }
  }
  rm.aadab8d7 = {
    {
      a7b0eb83 = "No",
      a2cb2374 = 0
    },
    {
      a7b0eb83 = "Yes",
      a2cb2374 = 1
    }
  }
  rm.a17386a9 = {
    {
      a7b0eb83 = "No",
      a2cb2374 = 0
    },
    {
      a7b0eb83 = "Save",
      a2cb2374 = 1
    },
    {
      a7b0eb83 = "Save & Match",
      a2cb2374 = 2
    }
  }
  rm.num_2fb8 = 85
  rm.num_0d9d = 35
  
  function rm.a39287ea(ro)
    if not ro then
      return nil
    end
    if string.match(ro, "RefreshID") then
      return nil
    end
    if string.gsub(ro, " ", "") == "" then
      return nil
    end
    
    local function rp(ro)
      local cp = require("json")
      local e = cp.decode(ro)
      if e and type(e) == "table" then
        return e
      end
    end
    
    if pcall(rp, ro) then
      return rp(ro)
    end
  end
  
  local function ni()
    local nj = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(nj, "[xy]", function(P)
      local e4 = P == "x" and math.random(0, 15) or math.random(8, 11)
      return string.format("%x", e4)
    end)
  end
  
  local function rq()
    local nk = tostring(os.time()):reverse():sub(1, 1)
    local nl = ni()
    local nm = string.gsub(nl, "x", function()
      return nk
    end)
    return nm
  end
  
  function rm.a9b5cc4c()
    rm.tbl_a282 = nil
    A.a880c84e(y.g_full_label, "Object Cache has been reset!", true)
  end
  
  function rm.a3411e27(rr, l3, rs, rt)
    if y.plugin_label == "MArkers" then
      rm.tbl_a282 = {}
      return
    end
    if 2 ~= rt then
      return
    end
    if rm.tbl_a282 and type(rm.tbl_a282) == "table" then
      for ac, cr in pairs(rm.tbl_a282) do
        if not ac or not Obj.IsValid(ac) then
          rm.tbl_a282[ac] = nil
        end
      end
    end
    
    local function n9(oY)
      if 0 == Obj.Count(oY) then
        return
      end
      local ru = Obj.Children(oY)
      if ru and #ru > 0 then
        for cr, rv in pairs(ru) do
          if l3 then
            IncProgress(y.g_progress[l3], 1)
          end
          if not rm.tbl_a282[rv] then
            local rw = A.a21d4837(rv, rm.str_0c9c)
            if rw then
              local rx = rv
              if Obj.GetClass(rv) == "Recipe" then
                rx = Obj.FindParent(rv, "Cue")
                rx = rx or rv
              end
              rm.tbl_a282[rx] = rw
            end
          end
          n9(rv)
        end
      end
    end
    
    if not rm.tbl_a282 then
      rm.tbl_a282 = {}
    end
    if rs then
      n9(DataPool().Sequences)
      n9(DataPool().Timecodes)
    end
    if not rr or type(rr) ~= "function" then
      return
    end
    for n5, de in pairs(rm.tbl_a282) do
      if rr(de, n5) then
        return n5
      end
    end
  end
  
  rm.flag_9c4c = false
  
  function rm.adb0caef(ld)
    local hO = {
      title = y.g_full_label .. " - Mismatch",
      icon = y.company_label,
      message = string.format("A mismatch has been found in the linking data between MA3 and Reaper.\n\n Would you like to prefer the Reaper linking data (default) or the MA3 linking data?\n\n(This can be caused when MA3 objects have been import/exported between showfiles.)\n\nReason: %s", ld),
      commands = {
        {
          value = 0,
          name = "Reaper"
        },
        {
          value = 1,
          name = "MA3"
        }
      }
    }
    local hP = MessageBox(hO)
    if 1 == hP.result then
      rm.flag_9c4c = 1
    else
      rm.flag_9c4c = 0
    end
  end
  
  function rm.a1d6dffa(qF, ry, rz, rA)
    rm.flag_9c4c = false
    local q5 = A.a4b7900b(y.plugin_label .. ": ")
    local rB = 0
    SetProgressText(y.g_progress[q5], "Finding existing objects")
    local rC = qF.aa942c2a.tbl_0c3f.num_26ae or GetVar(y.g_plugin_var_obj, "LocalLinkingData") or y.a52ba751["LocalLinkingData"].num_3928
    if y.plugin_label ~= "MArkersLIVE" then
      rC = 0
      qF.aa942c2a.tbl_0c3f.num_26ae = 0
      y.a52ba751["LocalLinkingData"].num_3928 = 0
    end
    rm.a3411e27(nil, q5, true, rC)
    A.ad7e2935(q5)
    rm.tbl_5b39 = {}
    rm.tbl_cd44 = {}
    local rD = qF.aa942c2a
    if not rD or type(rD) ~= "table" then
      qF.aa942c2a = rm.a263b36b()
      rD = qF.aa942c2a
    end
    local rE = true
    if not rD.tbl_0c3f.project_uuid then
      rE = false
      rD.tbl_0c3f.project_uuid = rq()
    end
    if rD.tbl_0c3f then
      if not rD.tbl_0c3f.song_name then
        local hO = {
          title = y.g_full_label .. " - Warning",
          icon = y.company_label,
          message = string.format("We have detected that you may have synced this Reaper project into this MA3 showfile with a previous version of %s.\n\nIf so, please press 'Continue'.\n\nIf you have not synced this Reaper project into this showfile before, then please press 'New Project'.", y.plugin_label),
          commands = {
            {
              value = 2,
              name = "Cancel"
            },
            {
              value = 1,
              name = "New Project"
            },
            {
              value = 0,
              name = "Continue"
            }
          }
        }
        local hP = MessageBox(hO)
        if 2 == hP.result then
          return "User aborted import"
        elseif 1 == hP.result then
          qF.aa942c2a = rm.a263b36b()
          rD = qF.aa942c2a
          rD.tbl_0c3f.song_uuid = rq()
        end
      elseif rD.tbl_0c3f.song_name ~= qF.a3bdc261 and -1 ~= rD.tbl_0c3f.song_name then
        local hO = {
          title = y.g_full_label .. " - Warning",
          icon = y.company_label,
          message = string.format("'%s'\n\nDoes not match the project name of the last saved sync:\n\n'%s'\n\nIf you have renamed the Reaper file and want to continue with the sync then please press 'Continue'\n\nIf this is a new project, then please press 'New Project'.", qF.a3bdc261, rD.tbl_0c3f.song_name, y.plugin_label),
          commands = {
            {
              value = 2,
              name = "Cancel"
            },
            {
              value = 3,
              name = "Refresh Project ID"
            },
            {
              value = 1,
              name = "New Project"
            },
            {
              value = 0,
              name = "Continue"
            }
          }
        }
        local hP = MessageBox(hO)
        if 2 == hP.result then
          return "User aborted import"
        elseif 1 == hP.result then
          qF.aa942c2a = rm.a263b36b()
          rD = qF.aa942c2a
          rD.tbl_0c3f.song_uuid = rq()
        elseif 3 == hP.result then
          rD = qF.aa942c2a
          rD.tbl_0c3f.song_uuid = rq()
        end
      end
    else
      return "Your .dat file is not the correct version."
    end
    if y.a1620eda and string.match(y.a1620eda, "RefreshID") then
      rD.tbl_0c3f.song_uuid = rq()
      rD.tbl_0c3f.project_uuid = rq()
    end
    if not rD.tbl_0c3f or type(rD.tbl_0c3f) ~= "table" then
      rD.tbl_0c3f = {}
    end
    qF.tc_handle_a = rD.tbl_0c3f.tc_handle_a
    if qF.tc_handle_a then
      local rF = A.a21d4837(qF.tc_handle_a, rm.str_0c9c)
      if Obj.GetClass(qF.tc_handle_a) ~= "Timecode" then
        qF.tc_handle_a = nil
      end
      if rF and rF.song_uuid ~= rD.tbl_0c3f.song_uuid then
        if not rm.flag_9c4c then
          rm.adb0caef(Obj.ToAddr(qF.tc_handle_a))
        end
        if 1 == rm.flag_9c4c then
          qF.tc_handle_a = nil
        end
      end
    end
    if not qF.tc_handle_a then
      qF.tc_handle_a = rm.a3411e27(function(de)
        if qF.song_uuid == de.song_uuid and de.mt_type == "Timecode" and (rD.tbl_0c3f.project_uuid == de.project_uuid or not rE) then
          for ac, e4 in pairs(de) do
            rD.tbl_0c3f[ac] = e4
          end
          return true
        end
      end, nil, nil, rC)
      if qF.tc_handle_a then
        rD.tbl_0c3f.tc_handle_a = qF.tc_handle_a
      end
    end
    for ac, e4 in pairs(rD.tbl_0c3f) do
      qF[ac] = e4
    end
    rD.tbl_0c3f.song_name = qF.a3bdc261
    if not qF.a70e02e7 then
      qF.a70e02e7 = y.a52ba751["defSeqColor"].a3c78c74 or y.a52ba751["defSeqColor"].num_3928
    end
    if qF.str_3e4c and type(qF.str_3e4c) == "string" and string.match(qF.str_3e4c, "win") then
      qF.ae3f3c3e = true
    end
    if qF.ae3f3c3e then
      if ry.tbl_9171 and type(ry.tbl_9171) == "table" then
        for ac, e4 in pairs(ry.tbl_9171) do
          if e4.master_idx then
            e4.master_idx = rm.a93b1e9f(e4.master_idx)
          end
        end
      end
      if ry.tbl_3940 and type(ry.tbl_3940) == "table" then
        for ac, e4 in pairs(ry.tbl_3940) do
          if e4.master_idx then
            e4.master_idx = rm.a93b1e9f(e4.master_idx)
          end
        end
      end
      if ry.tbl_13c3 and type(ry.tbl_13c3) == "table" then
        for ac, e4 in pairs(ry.tbl_13c3) do
          if e4.master_idx then
            e4.master_idx = rm.a93b1e9f(e4.master_idx)
          end
        end
      end
      if rz and type(rz) == "table" then
        for rG, rH in pairs(rz) do
          if rH.master_idx then
            rH.master_idx = rm.a93b1e9f(rH.master_idx)
          end
        end
      end
    end
    if ry.tbl_13c3 and type(ry.tbl_13c3) == "table" then
      if not rD.tbl_13c3 or type(rD.tbl_13c3) ~= "table" then
        rD.tbl_13c3 = {}
      end
      for ac, e4 in pairs(ry.tbl_13c3) do
        if not rD.tbl_13c3[e4.master_idx] or type(rD.tbl_13c3[e4.master_idx]) ~= "table" then
          rD.tbl_13c3[e4.master_idx] = {aedcc9ac = true}
        end
        e4.a1925f31 = rD.tbl_13c3[e4.master_idx].a1925f31
        e4.enabled = rD.tbl_13c3[e4.master_idx].enabled
        e4.flag_offset = rD.tbl_13c3[e4.master_idx].flag_offset
        e4.flag_33a7 = rD.tbl_13c3[e4.master_idx].flag_33a7
        e4.af09dc19 = rD.tbl_13c3[e4.master_idx].af09dc19
        e4.a3763cb3 = rD.tbl_13c3[e4.master_idx].a3763cb3
        e4.a993e03c = rD.tbl_13c3[e4.master_idx].a993e03c
        e4.aa0327eb = rD.tbl_13c3[e4.master_idx].aa0327eb
        if e4.a1925f31 and Obj.GetClass(e4.a1925f31) ~= "Sequence" then
          e4.a1925f31 = nil
          rD.tbl_13c3[e4.master_idx].a1925f31 = nil
        end
        if e4.a1925f31 then
          local rI = A.a21d4837(e4.a1925f31, rm.str_0c9c)
          if rI and (rI.song_uuid ~= rD.tbl_0c3f.song_uuid or rI.mt_type ~= "MarkerSequence" or rI.master_idx ~= e4.master_idx) then
            if not rm.flag_9c4c then
              rm.adb0caef(Obj.ToAddr(e4.a1925f31))
            end
            if 1 == rm.flag_9c4c then
              e4.a1925f31 = nil
              rD.tbl_13c3[e4.master_idx].a1925f31 = nil
            end
          end
        end
        if not e4.a1925f31 then
          e4.a1925f31 = rm.a3411e27(function(de)
            if de.mt_type == "MarkerSequence" and de.master_idx == e4.master_idx and de.song_uuid == rD.tbl_0c3f.song_uuid and rD.tbl_0c3f.project_uuid == de.project_uuid then
              if e4.af09dc19 then
                e4.af09dc19 = DataPool().Pages[de.tc_slot]
              end
              return true
            end
          end, nil, nil, rC)
        end
        if e4.af09dc19 and Obj.GetClass(e4.af09dc19) ~= "Page" then
          e4.af09dc19 = nil
          rD.tbl_13c3[e4.master_idx].af09dc19 = nil
        end
      end
    end
    local rJ = {}
    for cr, ry in pairs(ry.tbl_9171) do
      if rJ[ry.ad40375c] then
        return string.format("A duplicate GUID was found between the following Reaper markers.\nPlease try deleting and re-making one of the markers\nIf one of the markers has already been synced to MA3, we advise deleting and re-making the marker which has not been synced.\n\n%s - %s\n\n%s - %s", ry.a90ff523, ry.a3bdc261, rJ[ry.ad40375c].a90ff523, rJ[ry.ad40375c].a3bdc261)
      else
        rJ[ry.ad40375c] = ry
      end
    end
    if rz and type(rz) == "table" then
      local rK = GetVar(y.g_plugin_var_obj, "midiSeqRelCueNo") or y.a52ba751["midiSeqRelCueNo"].num_3928
      rK = tonumber(rK) or y.a52ba751["midiSeqRelCueNo"].num_3928
      if not rD.tbl_b3fe or type(rD.tbl_b3fe) ~= "table" then
        rD.tbl_b3fe = {}
      end
      for rG, rH in pairs(rz) do
        if not rD.tbl_b3fe[rG] or type(rD.tbl_b3fe[rG]) ~= "table" then
          rD.tbl_b3fe[rG] = {}
        end
        rH.flag_33a7 = rD.tbl_b3fe[rG].flag_33a7
        rH.af09dc19 = rD.tbl_b3fe[rG].af09dc19
        local rL = rm.a3411e27(function(de)
          if de.mt_type == "MIDITrack" and de.midi_track_id == rG and de.song_uuid == rD.tbl_0c3f.song_uuid and rD.tbl_0c3f.project_uuid == de.project_uuid then
            return true
          end
        end, nil, nil, rC)
        rL = rL and Obj.Parent(rL)
        if rH.af09dc19 and Obj.GetClass(rH.af09dc19) ~= "Page" then
          rH.af09dc19 = nil
          rD.tbl_b3fe[rG].af09dc19 = nil
        end
        if rH.tbl_b89c and type(rH.tbl_b89c) == "table" then
          if not rD.tbl_b3fe[rG].tbl_b89c or type(rD.tbl_b3fe[rG].tbl_b89c) ~= "table" then
            rD.tbl_b3fe[rG].tbl_b89c = {}
          end
          for rM, rN in pairs(rH.tbl_b89c) do
            if not rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index] or type(rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index]) ~= "table" then
              rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index] = {aedcc9ac = true}
            end
            rN.a1925f31 = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].a1925f31
            rN.aa62a591 = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].aa62a591
            if rN.a1925f31 and Obj.GetClass(rN.a1925f31) ~= "Sequence" then
              rN.a1925f31 = nil
              rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].a1925f31 = nil
              rN.aa62a591 = nil
              rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].aa62a591 = nil
            end
            if rN.a1925f31 then
              local rO = A.a21d4837(rN.a1925f31, rm.str_0c9c)
              if rO and (rO.song_uuid ~= rD.tbl_0c3f.song_uuid or rO.mt_type ~= "MidiSequence" or rO.midi_uuid ~= rG or rO.stem_index ~= rN.stem_index) then
                if not rm.flag_9c4c then
                  rm.adb0caef(Obj.ToAddr(rN.a1925f31))
                end
                if 1 == rm.flag_9c4c then
                  rN.a1925f31 = nil
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].a1925f31 = nil
                  rN.aa62a591 = nil
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].aa62a591 = nil
                end
              end
            end
            if not rN.a1925f31 then
              rN.a1925f31 = rm.a3411e27(function(de)
                if de.mt_type == "MidiSequence" and de.song_uuid == rD.tbl_0c3f.song_uuid and de.midi_uuid == rG and de.stem_index == rN.stem_index and rD.tbl_0c3f.project_uuid == de.project_uuid then
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].enabled = de.enabled
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].flag_offset = de.flag_offset
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].index_b = de.index_b
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].index_a = de.index_a
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].flag_a = de.flag_a
                  return true
                end
              end, nil, nil, rC)
            end
            if rN.a1925f31 and Obj.IsValid(rN.a1925f31) and Obj.Count(rN.a1925f31) > 0 then
              for cr, rP in ipairs(Obj.Children(rN.a1925f31)) do
                local mG = A.abb404ee(rP)
                if mG and mG == rK or rP.Name == "Release" then
                  rN.aa62a591 = rP
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].aa62a591 = rP
                end
              end
            end
            if rN.aa62a591 and Obj.GetClass(rN.aa62a591) ~= "Cue" or Obj.Parent(rN.aa62a591) ~= rN.a1925f31 then
              rN.aa62a591 = nil
              rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].aa62a591 = nil
            end
            rN.enabled = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].enabled
            rN.flag_offset = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].flag_offset
            local rQ = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].index_b
            if rQ and type(rQ) == "number" then
              rN.index_b = rQ
              if -1 ~= rQ then
                rN.a04e85a2 = rQ
              end
            end
            local rR = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].index_a
            if rR and type(rR) == "number" then
              rN.index_a = rR
              if rR > 0 then
                rN.num_e467 = rR
              end
            end
            local rS = rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].flag_a
            if rS and type(rS) == "number" then
              rN.flag_a = rS
              if rS > 0 then
                rN.a534eef6 = rS
              end
            end
            if rL and rN.a1925f31 then
              for cr, rT in pairs(Obj.Children(rL)) do
                if rT.Target == rN.a1925f31 then
                  rD.tbl_b3fe[rG].tbl_b89c[rN.stem_index].a4570d43 = rT
                  break
                end
              end
            end
          end
          if rH.a01d3537 and type(rH.a01d3537) == "table" then
            for rU, rV in pairs(rH.a01d3537) do
              if not rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index] or type(rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index]) ~= "table" then
                rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index] = {}
              end
              if not rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59 or type(rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59) ~= "table" then
                rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59 = {}
              end
              if not rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af] or type(rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af]) ~= "table" then
                rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af] = {}
              end
              if not rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb] or type(rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb]) ~= "table" then
                rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb] = {}
              end
              rV.ae883195 = rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].a63c22eb
              rV.a8b29714 = rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].ab83b3f7
              rV.a1c5d407 = rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].ae22d30f
              rV.aff8a401 = rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].acd792cb
              rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].a63c22eb = nil
              rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].ab83b3f7 = nil
              rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].ae22d30f = nil
              rD.tbl_b3fe[rG].tbl_b89c[rV.stem_index].tbl_8d59[rV.ad4987af][rV.a09f63fb].acd792cb = nil
              if rV.ae883195 and Obj.GetClass(rV.ae883195) ~= "CmdEvent" then
                rV.ae883195 = nil
              end
              if rV.a1c5d407 and Obj.GetClass(rV.a1c5d407) ~= "CmdEvent" then
                rV.a1c5d407 = nil
              end
            end
          end
        end
      end
    end
    if rD.tbl_b3fe and type(rD.tbl_b3fe) == "table" then
      for rG, rW in pairs(rD.tbl_b3fe) do
        if not rz[rG] then
          if y.plugin_label == "MArkersLIVE" and qF.str_7a7d == "Network" then
            if rD.tbl_36ae and type(rD.tbl_36ae) == "table" and rD.tbl_36ae.tbl_2a36 and type(rD.tbl_36ae.tbl_2a36) == "table" and rD.tbl_36ae.tbl_2a36[rG] then
              rz[rG] = {
                a2dc0aa1 = rD.tbl_36ae.tbl_2a36[rG]
              }
            end
            rD.tbl_b3fe[rG] = nil
          end
        elseif rW.tbl_b89c and type(rW.tbl_b89c) == "table" then
          for rX, rY in pairs(rW.tbl_b89c) do
            if rz[rG].tbl_b89c and type(rz[rG].tbl_b89c) == "table" then
              local rZ
              for ac, e4 in pairs(rz[rG].tbl_b89c) do
                if e4.stem_index == rX then
                  rZ = true
                  break
                end
              end
              if not rZ then
                if y.plugin_label == "MArkersLIVE" and qF.str_7a7d == "Network" then
                  A.a4b25f9e()
                  table.insert(rz[rG].tbl_b89c, {
                    a2dc0aa1 = rY.a1925f31
                  })
                  rW.tbl_b89c[rX] = nil
                end
              elseif rY.tbl_8d59 and type(rY.tbl_8d59) == "table" then
                for r_, s0 in pairs(rY.tbl_8d59) do
                  if s0 and type(s0) == "table" then
                    for s1, s2 in pairs(s0) do
                      if s2 and type(s2) == "table" then
                        local s3 = 0
                        if nil ~= s2.a63c22eb then
                          if not rz[rG].tbl_d158 then
                            rz[rG].tbl_d158 = {}
                          end
                          table.insert(rz[rG].tbl_d158, s2.a63c22eb)
                          s3 = s3 + 1
                        end
                        if nil ~= s2.ae22d30f then
                          if not rz[rG].tbl_d158 then
                            rz[rG].tbl_d158 = {}
                          end
                          table.insert(rz[rG].tbl_d158, s2.ae22d30f)
                          s3 = s3 + 1
                        end
                        if s3 > 1 then
                          s0[s1] = nil
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  
  function rm.a11d6555(rD, ry)
    if ry.tbl_9171 and type(ry.tbl_9171) == "table" then
      if not rD.tbl_9171 or type(rD.tbl_9171) ~= "table" then
        rD.tbl_9171 = {}
      end
      for ac, s4 in pairs(ry.tbl_9171) do
        if not rD.tbl_9171[s4.ad40375c] or type(rD.tbl_9171[s4.ad40375c]) ~= "table" then
          rD.tbl_9171[s4.ad40375c] = {}
        end
        s4.a1925f31 = rD.tbl_9171[s4.ad40375c].a1925f31
        if s4.a1925f31 and Obj.GetClass(s4.a1925f31) ~= "Cue" then
          A.a4b25f9e()
          s4.a1925f31 = nil
          rD.tbl_9171[s4.ad40375c].a1925f31 = nil
        end
        if s4.a1925f31 and Obj.IsValid(s4.a1925f31) then
          for cr, jr in pairs(Obj.Children(s4.a1925f31)) do
            for cr, s5 in pairs(Obj.Children(jr)) do
              if s5.Name == rm.str_0c9c then
                local s6 = A.a21d4837(s5, rm.str_0c9c)
                if s6 and (s6.song_uuid ~= rD.tbl_0c3f.song_uuid or s6.mt_type ~= "Marker" or s6.aad7d4ed ~= s4.ad40375c) then
                  if not rm.flag_9c4c then
                    rm.adb0caef(Obj.ToAddr(s4.a1925f31))
                  end
                  if 1 == rm.flag_9c4c then
                    s4.a1925f31 = nil
                    rD.tbl_9171[s4.ad40375c].a1925f31 = nil
                  end
                end
                break
              end
            end
          end
        end
        if s4.aad45010 and s4.aad45010.a1925f31 and Obj.Parent(s4.a1925f31) ~= s4.aad45010.a1925f31 then
          s4.a1925f31 = nil
          rD.tbl_9171[s4.ad40375c].a1925f31 = nil
        end
        if not s4.a1925f31 then
          s4.a1925f31 = rm.a3411e27(function(de, n5)
            if de.mt_type == "Marker" and de.aad7d4ed == s4.ad40375c and de.song_uuid == rD.tbl_0c3f.song_uuid and rD.tbl_0c3f.project_uuid == de.project_uuid and s4.aad45010 and s4.aad45010.a1925f31 and Obj.Parent(n5) == s4.aad45010.a1925f31 then
              return true
            end
          end, nil, nil, localLinkDataOption)
        end
        s4.a1534505 = rD.tbl_9171[s4.ad40375c].a1534505
        if s4.a1534505 and Obj.GetClass(s4.a1534505) ~= "CmdEvent" then
          s4.a1534505 = nil
          rD.tbl_9171[s4.ad40375c].a1534505 = nil
        end
        s4.aedbcba5 = rD.tbl_9171[s4.ad40375c].aedbcba5
        if s4.aedbcba5 and Obj.GetClass(s4.aedbcba5) ~= "CmdEvent" then
          s4.aedbcba5 = nil
          rD.tbl_9171[s4.ad40375c].aedbcba5 = nil
        end
      end
      if not ry.tbl_d158 then
        ry.tbl_d158 = {}
      end
      for s7, nB in pairs(rD.tbl_9171) do
        local mw
        for ac, e4 in pairs(ry.tbl_9171) do
          if e4.ad40375c == s7 then
            mw = true
          end
        end
        if not mw then
          table.insert(ry.tbl_d158, nB)
          rD.tbl_9171[s7] = nil
        end
      end
    end
  end
  
  function rm.a5707c15(ep, lX)
    local x = GetPathSeparator()
    local q5 = A.a4b7900b(y.plugin_label .. ": ")
    local rB = 0
    SetProgressText(y.g_progress[q5], "Searching for Reaper files")
    local oP = {}
    
    local function s8(ep)
      local s9 = {}
      if HostOS() == "Windows" then
        ep = string.gsub(ep, "%" .. x .. "$", "")
        local cW = io.popen("dir /A:D /b " .. ep)
        for fN in cW:lines() do
          table.insert(s9, fN)
        end
        cW:close()
      else
        local cW = io.popen("cd '" .. ep .. "' ; ls -d */")
        for fN in cW:lines() do
          table.insert(s9, fN)
        end
        cW:close()
      end
      local oO = DirList(ep)
      rB = rB + #oO
      SetProgressRange(y.g_progress[q5], 1, rB)
      if j[10][2] * j[10][4] > j[10][12] then
        return j[10][12]
      end
      for ac, e4 in pairs(oO) do
        IncProgress(y.g_progress[q5], 1)
        if string.match(e4["name"], "%.[Rr][Pp][Pp]") and not string.match(e4["name"], "^%.") and not string.match(e4["name"], "%-[Bb][Aa][Kk]") and not string.match(e4["name"], "%-[Uu][Nn][Dd][Oo]") then
          if HostOS() == "Windows" then
            table.insert(oP, {
              "str",
              ep .. x .. e4["name"],
              ep .. x,
              e4["name"]
            })
          else
            table.insert(oP, {
              "str",
              ep .. e4["name"],
              ep,
              e4["name"]
            })
          end
        end
      end
      for ac, e4 in pairs(s9) do
        if HostOS() == "Windows" then
          s8(ep .. GetPathSeparator() .. e4)
        else
          s8(ep .. e4)
        end
      end
    end
    
    s8(ep)
    A.ad7e2935(q5)
    if not oP[1] then
      return nil, nil, string.format("Error 1 - No files found in path %s", ep)
    end
    local mp = PopupInput({
      title = "File",
      caller = GetFocusDisplay(),
      items = oP
    })
    if mp then
      if not A.a4077f93() then
        mp = mp + 1
      end
      return oP[mp][4], oP[mp][3] .. oP[mp][4]
    else
      return 0
    end
  end
  
  local function sa(sb, sc)
    local sd = 0
    local se = false
    local sf = {}
    local sg = 1
    for fN in string.gmatch(sb, "[^\\r\n]+") do
      if string.match(fN, "%<") then
        if string.match(fN, "<" .. sc .. "%s*$") then
          se = true
        end
        if se then
          sd = sd + 1
        end
      end
      if se then
        if not sf[sg] then
          sf[sg] = ""
        end
        sf[sg] = sf[sg] .. fN .. "\n"
      end
      if string.match(fN, "%>") then
        if se then
          sd = sd - 1
        end
        if sd < 1 then
          if se then
            sg = sg + 1
          end
          se = false
        end
      end
    end
    if q[9][4] * q[9][1] > q[9][13] then
      return q[9][13]
    end
    return sf
  end
  
  function rm.a34bb13d(sh, si)
    local ax = io.open(sh, "r")
    if not ax then
      return nil
    end
    local sj = ax:read("*all")
    ax:close()
    
    local function sk(sl)
      local ax = io.open(sh, "w+")
      ax:write(sl)
      if o[8][6] * o[8][12] <= o[8][7] then
        return o[8][7]
      end
      ax:close()
    end
    
    local sm = string.match(sj, "MATOOLSMARKERSGUID%s+%{(.-)%}")
    if sm and not si then
      return sm
    else
      if si then
        sm = si
      else
        sm = rq()
      end
      local sn = sa(sj, "EXTSTATE")
      if sn and sn[1] then
        local so = sa(sn[1], "MARKERS")
        if so and so[1] then
          sj = sj:gsub("%<MARKERS%s*\n", string.format("<MARKERS\n      MATOOLSMARKERSGUID {%s}\n", sm))
          sk(sj)
        else
          sj = sj:gsub("%<EXTSTATE%s*\n", string.format("<EXTSTATE\n    <MARKERS\n      MATOOLSMARKERSGUID {%s}\n    >\n", sm))
          sk(sj)
        end
      else
        sj = sj:gsub(">%s*$", string.format("  <EXTSTATE\n    <MARKERS\n      MATOOLSMARKERSGUID {%s}\n    >\n  >\n>\n", sm))
        sk(sj)
      end
      return sm
    end
  end
  
  function rm.ab34cc2a(ry)
    for Q, sp in pairs(ry.tbl_9171) do
      sp.adb219bd = rm.a5c7e72c(sp.master_idx, 0)
      sp.num_eba2 = -1
      if string.match(sp.a3bdc261, "%([Oo][Ff][Ff][Cc][Uu][Ee]%)") then
        sp.num_eba2 = "Off"
        sp.a3bdc261 = string.gsub(sp.a3bdc261, "%([Oo][Ff][Ff][Cc][Uu][Ee]%)", "")
      end
      if string.match(sp.a3bdc261, "%[.-%]") then
        sp.num_eba2 = string.match(sp.a3bdc261, "%[(.-)%]")
        sp.num_eba2 = string.lower(sp.num_eba2)
        if sp.num_eba2 == "manual" or sp.num_eba2 == "m" then
          sp.num_eba2 = "empty"
        end
        local mw
        for ac, e4 in pairs(rm.a604d8b4()) do
          if e4.a3504287 == sp.num_eba2 then
            mw = true
          end
        end
        if true == mw then
          if sp.num_eba2 == "go" then
            sp.num_eba2 = "go+"
          end
        else
          sp.num_eba2 = -1
        end
        if sp.num_eba2 == "empty" then
          sp.num_eba2 = ""
        end
        sp.a3bdc261 = string.gsub(sp.a3bdc261, "%[(.-)%]", "")
      end
      sp.a2fad5d8 = nil
      sp.ac51ae0b = nil
      if string.match(sp.a3bdc261, "%<[0-9]*%.?[0-9]+%/?[0-9]*%.?[0-9]*%>") then
        sp.a2fad5d8, sp.ac51ae0b = string.match(sp.a3bdc261, "%<([0-9]*%.?[0-9]+)%/?([0-9]*%.?[0-9]*)%>")
        sp.a2fad5d8 = tonumber(sp.a2fad5d8)
        sp.ac51ae0b = tonumber(sp.ac51ae0b)
        sp.a3bdc261 = string.gsub(sp.a3bdc261, "%<[0-9]*%.?[0-9]+%/?[0-9]*%.?[0-9]*%>", "")
      end
      sp.a0ebe210 = nil
      if string.match(sp.a3bdc261, "%([0-9]*%.?[0-9]+%)") then
        sp.a0ebe210 = string.match(sp.a3bdc261, "%(([0-9]*%.?[0-9]+)%)")
        sp.a0ebe210 = tonumber(sp.a0ebe210)
        sp.aa3bab02 = true
        sp.a3bdc261 = string.gsub(sp.a3bdc261, "%([0-9]*%.?[0-9]+%)", "")
      end
      if string.match(sp.a3bdc261, "%{.-%}") then
        sp.aa207b2a = string.match(sp.a3bdc261, "%{(.-)%}")
        sp.a3bdc261 = string.gsub(sp.a3bdc261, "%{.-%}", "")
      end
      if string.match(sp.a3bdc261, "%^.-%^") then
        sp.af2759cf = string.match(sp.a3bdc261, "%^(.-)%^")
        sp.af99bee2 = string.match(sp.a3bdc261, "%^%^(.-)%^%^")
        sp.a3bdc261 = string.gsub(sp.a3bdc261, "%^+.-%^+", "")
      end
      sp.a3bdc261 = A.a3fcfd41(sp.a3bdc261)
      sp.a3bdc261 = string.gsub(sp.a3bdc261, "%\"", "''")
      sp.a3bdc261 = string.gsub(sp.a3bdc261, "^%s*", "")
      sp.a3bdc261 = string.gsub(sp.a3bdc261, "%s*$", "")
      if ry.tbl_3940 and type(ry.tbl_3940) == "table" then
        for cr, sq in pairs(ry.tbl_3940) do
          if sp.a5320370 >= sq.a5320370 and sp.a5320370 < sq.a72235e2 then
            A.a4b25f9e()
            if not sp.tbl_3940 then
              sp.tbl_3940 = {}
            end
            table.insert(sp.tbl_3940, sq)
          end
        end
        if not sp.tbl_3940 then
          for cr, sq in pairs(ry.tbl_3940) do
            if sp.a5320370 >= sq.a5320370 and sp.a5320370 <= sq.a72235e2 then
              A.a4b25f9e()
              if not sp.tbl_3940 then
                sp.tbl_3940 = {}
              end
              table.insert(sp.tbl_3940, sq)
            end
          end
        end
      end
    end
    for cr, sq in pairs(ry.tbl_3940) do
      sq.adb219bd = rm.a5c7e72c(sq.master_idx, 0)
    end
  end
  
  function rm.a90c8a99(sh, i4, sr)
    local ss = {
      acb7e94f = {
        a91714e3 = {},
        a39401d9 = {},
        ad158242 = {},
        a13c343f = {}
      },
      a1903df5 = {
        a3bdc261 = i4:gsub(".[Rr][Pp][Pp]", ""),
        a06af6c3 = sh,
        aa5f01de = i4,
        a04556b5 = rm.a34bb13d(sh, nil)
      },
      a0aeba43 = {},
      ae3f69a0 = {}
    }
    ss.a1903df5.ae6dc493 = string.gsub(ss.a1903df5.a3bdc261, "(%w)%S+%s*", "%1")
    local rD
    if sr then
      rD = rm.aafc31f4(sh, ss.a1903df5)
      rD = A.af6cc38b(rD)
    else
      rD = rm.a263b36b()
    end
    ss.a1903df5.aa942c2a = rD
    ss.a1903df5.afd0469a = nil
    local st = 0
    local ax = io.open(sh, "r")
    if not ax then
      return nil, "Error opening Reaper file"
    end
    local sj = ax:read("*all")
    ax:seek("set", 0)
    for fN in ax:lines() do
      if string.match(fN, "<REAPER_PROJECT") then
        local su, sv = string.match(fN, "<REAPER_PROJECT%s+%d+%.%d+%s+%\"([0-9]*%.?[0-9]+)%/(.-)%\"")
        if sv then
          if string.match(sv, "mac") then
            ss.a1903df5.str_3e4c = "mac"
          elseif string.match(sv, "win") then
            ss.a1903df5.str_3e4c = "win"
          else
            ss.a1903df5.str_3e4c = "linux"
          end
        end
        su = su and tonumber(su)
        if su and su < 6 then
          return nil, "This plugin only works with Reaper Version 6 or greater.\n\nYour version is " .. su
        end
        ss.a1903df5.aeaa384c = su
      end
      if string.match(fN, "MARKER%s") then
        local sw, sx, sy, sz, sA
        if string.match(fN, "\"") then
          sw, sx, sy, sz, sA = string.match(fN, "MARKER%s+(%d+)%s+([0-9]*%.?[0-9]+)%s+\"(.-)\"%s+(%d+)%s+(%d+)")
        else
          sw, sx, sy, sz, sA = string.match(fN, "MARKER%s+(%d+)%s+([0-9]*%.?[0-9]+)%s+(.-)%s+(%d+)%s+(%d+)")
        end
        sy = sy or ""
        sA = sA or 0
        if not sw then
          sw, sx, sz = string.match(fN, "MARKER%s+(%d+)%s+([0-9]*%.?[0-9]+)%s+\"\"?%s+(%d+)")
        end
        sx = tonumber(sx)
        sA = tonumber(sA)
        sz = tonumber(sz)
        local s7 = string.match(fN, "%{(.-)%}")
        local s4 = {
          a3bdc261 = sy,
          adbfa544 = sy,
          a5320370 = sx,
          a12b4a07 = sA,
          a90ff523 = sw,
          ad40375c = s7
        }
        if 0 == sz or 8 == sz then
          table.insert(ss.acb7e94f.tbl_9171, s4)
          local mw
          for ac, e4 in pairs(ss.acb7e94f.tbl_13c3) do
            if e4.master_idx == sA then
              mw = true
            end
          end
          if not mw then
            local sB = {
              a12b4a07 = sA,
              a09f63fb = st,
              aedcc9ac = true
            }
            st = st + 1
            table.insert(ss.acb7e94f.tbl_13c3, sB)
          end
        elseif 1 == sz or 9 == sz then
          local sC
          for ac, e4 in pairs(ss.acb7e94f.tbl_3940) do
            if e4.a90ff523 == sw then
              sC = true
              e4.a72235e2 = sx
            end
          end
          if not sC then
            table.insert(ss.acb7e94f.tbl_3940, s4)
          end
        end
      end
      if string.match(fN, "TEMPO%s+%d*%.?%d+%s+%d+%s+%d+") then
        local sD, sE, sF = string.match(fN, "TEMPO%s+(%d*%.?%d+)%s+(%d+)%s+(%d+)")
        sD = tonumber(sD)
        sE = tonumber(sE)
        sF = tonumber(sF)
        local s4 = {
          a43ac778 = sD,
          a7890f1e = sE,
          a1ac97d8 = sF,
          a5320370 = 0
        }
        table.insert(ss.tbl_0aeb, s4)
      end
      if string.match(fN, "PROJOFFS") then
        local sG = string.match(fN, "PROJOFFS%s+(%d*%.?%d+)")
        ss.a1903df5.a27f7dd7 = sG
      end
      if string.match(fN, "TIMEMODE") then
        local mz, sH = string.match(fN, "TIMEMODE%s+[+-]?[0-9]*%.?[0-9]+%s+[+-]?[0-9]*%.?[0-9]+%s+[+-]?[0-9]*%.?[0-9]+%s+([+-]?[0-9]*%.?[0-9]+)%s+([+-]?[0-9]*%.?[0-9]+)")
        ss.a1903df5.a9c920d0 = mz
        ss.a1903df5.a5f75b55 = sH
      end
    end
    local sI = sa(sj, "TEMPOENVEX")
    if sI and sI[1] then
      ss.tbl_0aeb = {}
      local sJ = "(PT%s+%d*%.?%d+%s+%d*%.?%d+)"
      for sK in string.gmatch(sI[1], sJ) do
        local sL, sM = string.match(sK, "PT%s+(%d*%.?%d+)%s+(%d*%.?%d+)")
        sL = tonumber(sL)
        sM = tonumber(sM)
        local s4 = {
          a43ac778 = sM,
          a7890f1e = 4,
          a1ac97d8 = 4,
          a5320370 = sL
        }
        table.insert(ss.tbl_0aeb, s4)
      end
    end
    for ac, e4 in pairs(ss.acb7e94f.tbl_9171) do
      for mg, mh in ipairs(ss.tbl_0aeb) do
        if mg ~= #ss.tbl_0aeb and e4.a5320370 >= mh.a5320370 and e4.a5320370 < ss.tbl_0aeb[mg + 1].a5320370 then
          e4.num_156e = mh.a43ac778
          break
        elseif mg == #ss.tbl_0aeb then
          e4.num_156e = mh.a43ac778
          break
        end
      end
      if not e4.num_156e then
        e4.num_156e = 120
      end
    end
    rm.ab34cc2a(ss.acb7e94f)
    ss.a1903df5.a1f2d3df = A.aa3c2984(ss.a1903df5.a27f7dd7 * 16777216, ss.a1903df5.a9c920d0)
    return ss, nil
  end
  
  function rm.a4fad83d(rD, sh, qF)
    local sN = A.a0b6ce3b(sh, "[Rr][Pp][Pp]")
    local sO = string.format("%s%sMArkers%s", sN, GetPathSeparator(), GetPathSeparator())
    if rD.tbl_0c3f and rD.tbl_0c3f.song_uuid and rD.tbl_0c3f.song_uuid ~= qF.song_uuid then
      qF.song_uuid = rD.tbl_0c3f.song_uuid
      rm.a34bb13d(qF.a06af6c3, rD.tbl_0c3f.song_uuid)
    end
    local sP = string.format("%s%s-%s.dat", sO, qF.song_uuid, HandleToInt(DataPool()))
    CreateDirectoryRecursive(sO)
    local ax = io.open(sP, "wb")
    if ax then
      local sQ = pb.pack(rD)
      ax:write(sQ)
      ax:close()
      return
    else
      return "Unable to save metadata"
    end
  end
  
  function rm.aafc31f4(sh, qF)
    local sN = A.a0b6ce3b(sh, "[Rr][Pp][Pp]")
    local sO = string.format("%s%sMArkers%s", sN, GetPathSeparator(), GetPathSeparator())
    local sR = string.format("%s%s-%s.dat", sO, qF.a3bdc261, HandleToInt(DataPool()))
    local sS = string.format("%s%s-%s.dat", sO, qF.song_uuid, HandleToInt(DataPool()))
    local sP
    if pcall(A.a1308137, sR) then
      sP = sR
    elseif pcall(A.a1308137, sS) then
      sP = sS
    else
      return rm.a263b36b()
    end
    local ax = io.open(sP, "rb")
    if ax then
      local sQ = ax:read("*all")
      ax:close()
      local sT = pb.unpack(sQ)
      if not sT or type(sT) ~= "table" then
        sT = rm.a263b36b()
      end
      return sT
    else
      return rm.a263b36b()
    end
  end
  
  function rm.ac6104f6(rD, qF)
    rD.tbl_0c3f.song_uuid = qF.song_uuid
    rD.tbl_0c3f.mt_type = "Timecode"
    rD.tbl_0c3f.cb_a = true
    rD.tbl_0c3f.format_version = y.plugin_version
    rD.tbl_0c3f.plugin_label = y.plugin_label
    if rD.tbl_0c3f.num_26ae > 0 then
      A.a34ca287(qF.tc_handle_a, rD.tbl_0c3f, rm.str_0c9c)
    end
  end
  
  function rm.a47fed4f(ry, rz, qF)
    local sU
    if #rz > 0 then
      for sV, rT in pairs(rz) do
        if #rT.tbl_b89c > 0 then
          sU = true
          break
        end
      end
    end
    if #ry.tbl_3940 > 0 then
      qF.flag_61c3 = true
    else
      qF.flag_61c3 = false
    end
    if 0 == #ry.tbl_9171 and 0 == #ry.tbl_3940 and 0 == #rz and not sU then
      return string.format("Reaper project '%s' has no data to import", qF.a3bdc261)
    end
  end
  
  function rm.a228fde5(qF, sW)
    if qF.tc_handle_a then
      qF.af96c73e = qF.tc_handle_a.No
    end
    if qF.a936e685 and qF.a936e685.t then
      local sX = tonumber(qF.a936e685.t)
      if sX and sX > 0 and sX < 10000 then
        qF.af96c73e = qF.a936e685.t
      end
    end
    if not qF.flag_offset then
      qF.flag_offset = GetVar(y.g_plugin_var_obj, "latencyOffset") or 0
    end
    if type(qF.flag_offset) == "string" then
      qF.flag_offset = string.gsub(qF.flag_offset, "%s", "")
    end
    qF.flag_offset = tonumber(qF.flag_offset) or 0
    if not qF.af96c73e then
      qF.af96c73e = A.ab5f5833(DataPool().Timecodes, 1)
    end
    local sY = {}
    local sZ = GetVar(y.g_plugin_var_obj, "defSeqStart")
    sZ = tonumber(sZ) or 1
    local s_ = GetVar(y.g_plugin_var_obj, "otherSeqStart")
    s_ = tonumber(s_) or 1
    local t0 = GetVar(y.g_plugin_var_obj, "midiSeqStart")
    t0 = tonumber(t0) or 1
    local t1
    if qF.a936e685 and qF.a936e685.s then
      local t2 = tonumber(qF.a936e685.s)
      if t2 and t2 > 0 and t2 < 10000 then
        t1 = true
        sZ = qF.a936e685.s
        s_ = qF.a936e685.s
        t0 = qF.a936e685.s
      end
    end
    for ac, e4 in pairs(sW.tbl_13c3) do
      if not (e4.a1925f31 and Obj.IsValid(e4.a1925f31)) or t1 then
        local t3
        if e4.master_idx == qF.a70e02e7 then
          t3 = sZ
        else
          t3 = s_
        end
        if qF.aa942c2a.tbl_0c3f.ac5fccac then
          t3 = qF.aa942c2a.tbl_0c3f.ac5fccac
        end
        if 1 == ac and t1 then
          e4.a283b5c6 = t3
        else
          e4.a283b5c6 = A.ab5f5833(DataPool().Sequences, t3, sY)
        end
        table.insert(sY, e4.a283b5c6)
      else
        e4.a79b2c7f = e4.a1925f31.No
      end
    end
    for ac, e4 in pairs(sW.ab3a0ae8) do
      if not (e4.a1925f31 and Obj.IsValid(e4.a1925f31)) or t1 then
        if qF.aa942c2a.tbl_0c3f.ac5fccac then
          t0 = qF.aa942c2a.tbl_0c3f.ac5fccac
        end
        e4.a283b5c6 = A.ab5f5833(DataPool().Sequences, t0, sY)
        table.insert(sY, e4.a283b5c6)
      else
        e4.a79b2c7f = e4.a1925f31.No
      end
    end
  end
  
  function rm.af68f9e6(qF, t4)
    qF.af96c73e = tonumber(t4.af96c73e)
    for ac, e4 in pairs(t4.aeddce3c) do
      e4.a283b5c6 = tonumber(e4.a283b5c6)
    end
  end
  
  function rm.a6c560c5(sW)
    if y.g_str_false == "true" then
      local t5 = 0
      for ac, e4 in ipairs(sW.tbl_13c3) do
        t5 = t5 + 1
        if t5 > 3 then
          e4.flag_63f9 = true
        end
      end
      t5 = 0
      for ac, e4 in ipairs(sW.ab3a0ae8) do
        t5 = t5 + 1
        if t5 > 3 then
          e4.flag_63f9 = true
        end
      end
    end
  end
  
  function rm.adab0697(sW, ry, rz)
    local t6 = {
      a91714e3 = {},
      ab3a0ae8 = {}
    }
    if y.g_str_false == "true" then
      for ac, e4 in pairs(sW.tbl_13c3) do
        if e4.flag_63f9 then
          e4.enabled = false
        end
      end
      for ac, e4 in pairs(sW.ab3a0ae8) do
        if e4.flag_63f9 then
          e4.enabled = false
        end
      end
      for ac, e4 in pairs(ry.tbl_9171) do
        if not t6.tbl_9171[e4.master_idx] then
          t6.tbl_9171[e4.master_idx] = 1
        else
          t6.tbl_9171[e4.master_idx] = t6.tbl_9171[e4.master_idx] + 1
        end
        if t6.tbl_9171[e4.master_idx] > 3 then
          e4.flag_63f9 = true
        end
        if e4.a5320370 > 20 then
          e4.flag_63f9 = true
        end
      end
      for rG, rT in pairs(rz) do
        if not t6.ab3a0ae8[rG] then
          t6.ab3a0ae8[rG] = {}
        end
        for ac, e4 in pairs(rT.a01d3537) do
          if not t6.ab3a0ae8[rG][e4.stem_index] then
            t6.ab3a0ae8[rG][e4.stem_index] = 1
          else
            t6.ab3a0ae8[rG][e4.stem_index] = t6.ab3a0ae8[rG][e4.stem_index] + 1
          end
          if t6.ab3a0ae8[rG][e4.stem_index] > 3 then
            e4.flag_63f9 = true
          end
          if e4.a5320370 > 20 then
            e4.flag_63f9 = true
          end
        end
      end
    end
  end
  
  function rm.a263b36b()
    local rD = {
      a13c343f = {},
      a91714e3 = {},
      ab3feca7 = {},
      a0c3f3b0 = {
        ad352352 = nil,
        a190b284 = nil,
        af09dc19 = nil,
        a9bc4a34 = nil,
        a5142dd0 = -1,
        a49c7bdd = true
      }
    }
    return rD
  end
  
  function rm.a181c564(t4, qF)
    if not qF.aa942c2a then
      qF.aa942c2a = rm.a263b36b()
    end
    qF.aa942c2a.tbl_0c3f.num_3a3e = t4.num_3a3e
    qF.aa942c2a.tbl_0c3f.num_d0c7 = t4.num_d0c7
    qF.aa942c2a.tbl_0c3f.num_94b9 = t4.num_94b9
    qF.aa942c2a.tbl_0c3f.num_fc65 = t4.num_fc65
    qF.aa942c2a.tbl_0c3f.num_d99b = t4.num_d99b
    qF.aa942c2a.tbl_0c3f.num_c583 = t4.num_c583
    qF.aa942c2a.tbl_0c3f.num_6f9e = t4.num_6f9e
    qF.aa942c2a.tbl_0c3f.num_88eb = t4.num_88eb
    qF.aa942c2a.tbl_0c3f.num_0be4 = t4.num_0be4
    qF.aa942c2a.tbl_0c3f.num_f7e4 = t4.num_f7e4
    qF.aa942c2a.tbl_0c3f.num_d192 = t4.num_d192
    qF.aa942c2a.tbl_0c3f.a7fa0b8b = t4.a7fa0b8b
    qF.aa942c2a.tbl_0c3f.num_f670 = t4.num_f670
    qF.aa942c2a.tbl_0c3f.ab9a9eaa = t4.ab9a9eaa
    qF.aa942c2a.tbl_0c3f.num_5f0f = t4.num_5f0f
    qF.aa942c2a.tbl_0c3f.num_90cf = t4.num_90cf
    qF.aa942c2a.tbl_0c3f.yes_no_flag = t4.yes_no_flag
    qF.aa942c2a.tbl_0c3f.a70e02e7 = t4.a70e02e7
    qF.aa942c2a.tbl_0c3f.num_772e = t4.num_772e
    qF.aa942c2a.tbl_0c3f.num_f447 = t4.num_f447
    qF.aa942c2a.tbl_0c3f.num_26ae = t4.num_26ae
    qF.a2f33b31 = t4.a2f33b31
    if t4.a027c659 and tonumber(t4.a027c659) then
      local t7 = Obj.Find(ShowData(), "Tags")
      qF.ab453ab2 = t7[tonumber(t4.a027c659)]
      if not qF.ab453ab2 then
        qF.ab453ab2 = Obj.Create(t7, t4.a027c659)
        if not qF.ab453ab2 then
          Cmd(string.format("Store Tag %s /o", t4.a027c659))
          qF.ab453ab2 = t7[tonumber(t4.a027c659)]
          if not qF.ab453ab2 then
            error("Failed to create Tag")
          end
        end
        qF.ab453ab2.Name = qF.a3bdc261
      end
      qF.aa942c2a.tbl_0c3f.ab453ab2 = qF.ab453ab2
    else
      qF.ab453ab2 = nil
      qF.aa942c2a.tbl_0c3f.ab453ab2 = nil
    end
    return qF.aa942c2a
  end
  
  function rm.a9d7237f(qF, sW, rD, rz)
    local t8 = GetVar(y.g_plugin_var_obj, "defSeqTemplate")
    local t9 = GetVar(y.g_plugin_var_obj, "otherSeqTemplate")
    local ta = GetVar(y.g_plugin_var_obj, "defSeqPrio")
    local tb = GetVar(y.g_plugin_var_obj, "otherSeqPrio")
    local tc = GetVar(y.g_plugin_var_obj, "midiSeqPrio")
    local dl
    local td = string.format("%s >>>", A.a3fcfd41(qF.a3bdc261))
    if rD.tbl_0c3f.ac5fccac then
      if not DataPool().Sequences[rD.tbl_0c3f.ac5fccac] then
        local te, dl = rm.a4b0cf0f(rD.tbl_0c3f.ac5fccac, td, nil, qF.ab453ab2)
        if dl then
          return dl
        end
        qF.a9e9e327 = te
      else
        qF.a9e9e327 = DataPool().Sequences[rD.tbl_0c3f.ac5fccac]
      end
      rD.tbl_0c3f.a9e9e327 = qF.a9e9e327
      A.aaa980e8(qF.a9e9e327, qF.ab453ab2)
    elseif qF.a9e9e327 and qF.a9e9e327.Name ~= td then
      A.a4b25f9e()
      qF.a9e9e327.Name = td
    end
    if qF.a9e9e327 and rD.tbl_0c3f.num_26ae > 0 then
      A.a34ca287(qF.a9e9e327, {
        ac02a53d = "PlaceholderSeq",
        a04556b5 = qF.song_uuid,
        a6ed8791 = rD.tbl_0c3f.project_uuid
      }, rm.str_0c9c)
    end
    for ac, e4 in pairs(sW.tbl_13c3) do
      if e4.enabled then
        e4.a4e015bd = A.ac6f27fe(e4.adb219bd, rm.num_2fb8)
        if DataPool().Sequences[e4.a283b5c6] then
          e4.a1925f31 = DataPool().Sequences[e4.a283b5c6]
        elseif e4.master_idx == rD.tbl_0c3f.a70e02e7 then
          e4.a1925f31, dl = rm.a4b0cf0f(e4.a283b5c6, e4.a3bdc261, t8, qF.ab453ab2)
          if dl then
            return dl
          end
          e4.a1925f31.Priority = ta
        else
          e4.a1925f31, dl = rm.a4b0cf0f(e4.a283b5c6, e4.a3bdc261, t9, qF.ab453ab2)
          if dl then
            return dl
          end
          e4.a1925f31.Priority = tb
        end
        if 1 == rD.tbl_0c3f.num_c583 and e4.a4e015bd and 0 == rD.tbl_0c3f.num_6f9e then
          if e4.a1925f31.Appearance ~= e4.a4e015bd then
            e4.a1925f31.Appearance = e4.a4e015bd
          end
        else
          e4.a1925f31.Appearance = nil
        end
        if e4.a1925f31.Name ~= e4.a3bdc261 then
          e4.a1925f31.Name = e4.a3bdc261
        end
        A.aaa980e8(e4.a1925f31, qF.ab453ab2)
        if rD.tbl_0c3f.num_26ae > 0 then
          A.a34ca287(e4.a1925f31, {
            ac02a53d = "MarkerSequence",
            a04556b5 = qF.song_uuid,
            a6ed8791 = rD.tbl_0c3f.project_uuid,
            a12b4a07 = e4.master_idx,
            a01c4c55 = e4.tc_slot
          }, rm.str_0c9c)
        end
      end
      rD.tbl_13c3[e4.master_idx] = {
        a1925f31 = e4.a1925f31,
        aedcc9ac = e4.enabled,
        a33a7def = e4.flag_33a7,
        af09dc19 = DataPool().Pages[e4.tc_slot],
        a190b284 = e4.flag_offset,
        a3763cb3 = e4.a3763cb3,
        a993e03c = e4.a993e03c,
        aa0327eb = e4.aa0327eb
      }
    end
    for ac, e4 in pairs(sW.ab3a0ae8) do
      if e4.enabled then
        e4.a4e015bd = A.ac6f27fe(e4.adb219bd, rm.num_2fb8)
        if DataPool().Sequences[e4.a283b5c6] then
          e4.a1925f31 = DataPool().Sequences[e4.a283b5c6]
          e4.a1925f31.Name = e4.a3bdc261
        else
          e4.a1925f31, dl = rm.a4b0cf0f(e4.a283b5c6, e4.a3bdc261, nil, qF.ab453ab2)
          if dl then
            return dl
          end
          e4.a1925f31.Priority = tc
          e4.a1925f31.WrapAround = "No"
        end
        if 1 == rD.tbl_0c3f.num_c583 and e4.a4e015bd and e4.a1925f31.Appearance ~= e4.a4e015bd then
          e4.a1925f31.Appearance = e4.a4e015bd
        end
        A.aaa980e8(e4.a1925f31, qF.ab453ab2)
        if rD.tbl_0c3f.num_26ae > 0 then
          A.a34ca287(e4.a1925f31, {
            ac02a53d = "MidiSequence",
            a04556b5 = qF.song_uuid,
            a6ed8791 = rD.tbl_0c3f.project_uuid,
            a2559603 = e4.midi_uuid,
            a6d2608d = e4.stem_index,
            a01c4c55 = e4.tc_slot,
            aedcc9ac = e4.enabled,
            a190b284 = e4.flag_offset,
            a134d150 = e4.index_b,
            ae0ea4fe = e4.index_a,
            a2309d93 = e4.flag_a
          }, rm.str_0c9c)
        end
      end
    end
    for rG, rT in pairs(rz) do
      if not rT.a2dc0aa1 then
        if not rD.tbl_b3fe[rG] then
          rD.tbl_b3fe[rG] = {}
        end
        if not rD.tbl_b3fe[rG].tbl_b89c then
          rD.tbl_b3fe[rG].tbl_b89c = {}
        end
        rD.tbl_b3fe[rG].flag_33a7 = rT.flag_33a7
        rD.tbl_b3fe[rG].af09dc19 = DataPool().Pages[rT.tc_slot]
        for Q, nB in pairs(rT.tbl_b89c) do
          if not nB.a2dc0aa1 and nB.stem_index then
            rD.tbl_b3fe[rG].tbl_b89c[nB.stem_index] = {
              a1925f31 = nB.a1925f31,
              aedcc9ac = nB.enabled,
              a190b284 = nB.flag_offset,
              a134d150 = nB.index_b,
              ae0ea4fe = nB.index_a,
              a2309d93 = nB.flag_a
            }
          end
        end
      end
    end
  end
  
  function rm.a2d2279b(qF, rA, rD, tf)
    if qF.tc_handle_c and Obj.GetClass(qF.tc_handle_c) ~= "Sequence" then
      qF.tc_handle_c = nil
    end
    if 0 == rD.tbl_0c3f.num_f670 then
      return
    end
    local dl
    local tg = qF.tc_handle_c
    if not tg then
      local th = GetVar(y.g_plugin_var_obj, "tempoSeqStart")
      th = tonumber(th) or 1
      local t3 = tf or th
      local ti = A.ab5f5833(DataPool().Sequences, t3)
      tg, dl = rm.a4b0cf0f(ti, string.format("%s - Tempo", qF.a3bdc261), nil, qF.ab453ab2)
      if dl then
        return dl
      end
      qF.tc_handle_c = tg
      A.a4b25f9e()
    end
    rD.tbl_0c3f.tc_handle_c = tg
    if not tg then
      return
    end
    A.aaa980e8(tg, qF.ab453ab2)
    if rD.tbl_0c3f.num_26ae > 0 then
      A.a34ca287(tg, {
        ac02a53d = "TempoSeq",
        a04556b5 = qF.song_uuid,
        a6ed8791 = rD.tbl_0c3f.project_uuid
      }, rm.str_0c9c)
    end
    local tj = 3
    for ac, e4 in ipairs(rA) do
      e4.a9ab5f40 = tg[tj]
      if not e4.a9ab5f40 then
        e4.a9ab5f40 = Obj.Append(tg)
        Obj.Create(e4.a9ab5f40, 1)
        e4.a9ab5f40.No = ac
        A.a4b25f9e()
      end
      local ib = string.format("%s BPM", A.a9c04c45(A.ab4cf9a2(e4.a43ac778)))
      local tk = string.format("SetUserVariable \"MATools_BPM\" %s", e4.a43ac778)
      if rD.tbl_0c3f.yes_no_flag ~= "No" then
        local tl = Root().ShowData.Masters.Speed[rD.tbl_0c3f.yes_no_flag]
        if tl then
          local tm = Obj.ToAddr(tl)
          local tn = string.format("%s At BPM %s", tm, e4.a43ac778)
          tk = tk .. " ; " .. tn
        end
      end
      if e4.a9ab5f40[1].Name ~= ib then
        e4.a9ab5f40[1].Name = ib
        A.a4b25f9e()
      end
      if e4.a9ab5f40[1].Command ~= tk then
        e4.a9ab5f40[1].Command = tk
        A.a4b25f9e()
      end
      tj = tj + 1
    end
  end
  
  function rm.a43a5008(ry, sW, rD, to)
    local tp = sW.tbl_13c3[1]
    for ac, e4 in ipairs(ry.tbl_9171) do
      if 1 == rD.tbl_0c3f.num_6f9e and not to then
        e4.master_idx = tp.master_idx
      end
      for mg, mh in pairs(sW.tbl_13c3) do
        if e4.master_idx == mh.master_idx then
          e4.aad45010 = mh
        end
      end
    end
    rm.a11d6555(rD, ry)
  end
  
  function rm.ad4a5f1f(ry)
    for ac, e4 in ipairs(ry.tbl_9171) do
      if e4.a1925f31 then
        if Obj.Parent(e4.a1925f31) == e4.aad45010.a1925f31 then
          local mG = A.abb404ee(e4.a1925f31)
          if mG then
            e4.a0ebe210 = mG
          end
        else
          e4.a1925f31 = nil
        end
      end
    end
  end
  
  function rm.ab3e7c53(ry, rD)
    for ac, e4 in ipairs(ry.tbl_9171) do
      local tq = e4.adbfa544
      if 1 == rD.tbl_0c3f.num_3a3e then
        tq = string.gsub(tq, "%([0-9]*%.?[0-9]+%)", "")
        tq = string.gsub(tq, "%([Oo][Ff][Ff][Cc][Uu][Ee]%)", "")
      else
        if string.match(tq, "%([Oo][Ff][Ff][Cc][Uu][Ee]%)") then
          e4.num_eba2 = nil
        end
        if not e4.a1925f31 then
          e4.a0ebe210 = nil
        end
      end
      if 1 == rD.tbl_0c3f.num_d0c7 then
        tq = string.gsub(tq, "%[(.-)%]", "")
      elseif e4.master_idx == rD.tbl_0c3f.a70e02e7 then
        e4.num_eba2 = -1
      else
        e4.num_eba2 = -1
      end
      if 1 == rD.tbl_0c3f.num_94b9 then
        tq = string.gsub(tq, "%<[0-9]*%.?[0-9]+%/?[0-9]*%.?[0-9]*%>", "")
      else
        e4.a2fad5d8 = nil
        e4.ac51ae0b = nil
      end
      if 1 == rD.tbl_0c3f.num_d99b then
        tq = string.gsub(tq, "%{.-%}", "")
      else
        e4.aa207b2a = nil
      end
      if 1 == rD.tbl_0c3f.num_fc65 then
        tq = string.gsub(tq, "%^+.-%^+", "")
      else
        e4.af2759cf = nil
        e4.af99bee2 = nil
      end
      local tr = string.match(tq, "%~(.-)%~")
      tq = string.gsub(tq, "%~(.-)%~", "")
      if tr and tr ~= CurrentUser().Name then
        e4.flag_63f9 = true
      end
      tq = A.a3fcfd41(tq)
      tq = string.gsub(tq, "%\"", "''")
      tq = string.gsub(tq, "%%", "")
      tq = string.gsub(tq, "^%s*", "")
      tq = string.gsub(tq, "%s*$", "")
      e4.a3bdc261 = tq
    end
  end
  
  local function ts(tt)
    local z = GetFocusDisplay().No
    if z >= 4 and z <= 7 then
      z = 1
    end
    local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(z)
    local hv = hu.ModalOverlay
    local hw
    local hx = 900
    hw = Obj.Append(hv, "BaseInput")
    hw["Visible"] = "No"
    hw["Name"] = "MArkersCueDeleteWindow"
    hw["H"] = "0"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "No"
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 2
    hy["Anchors"] = "0,0"
    hy[2][2]["SizePolicy"] = "Fixed"
    hy[2][2]["Size"] = "50"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label .. " - Delete Cue(s)?"
    hz["Texture"] = "corner1"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local hA = Obj.Append(hy, "CloseButton")
    hA["Anchors"] = "1,0"
    hA["Texture"] = "corner2"
    local hB = Obj.Append(hw, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 4
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Fixed"
    hB[1][1]["Size"] = "100"
    hB[1][2]["SizePolicy"] = "Stretch"
    hB[1][3]["SizePolicy"] = "Fixed"
    hB[1][3]["Size"] = "0"
    hB[1][4]["SizePolicy"] = "Fixed"
    hB[1][4]["Size"] = "60"
    local hC = Obj.Append(hB, "UIObject")
    hC["text"] = "The following cue(s) no longer exist in Reaper, do you want to delete them?"
    hC["ContentDriven"] = "Yes"
    hC["ContentWidth"] = "No"
    hC["TextAutoAdjust"] = "Yes"
    hC["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    hC["Padding"] = {
      left = 20,
      right = 20,
      top = 5,
      bottom = 5
    }
    hC["Font"] = "Medium20"
    hC["HasHover"] = "No"
    local tu = Obj.Append(hB, "ScrollContainer")
    tu["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    tu["MaxSize"] = "0,100%"
    tu["ContentDriven"] = "Yes"
    tu["ContentWidth"] = "No"
    tu["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    local tv = Obj.Append(tu, "ScrollBox")
    tv["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tv["ContentDriven"] = "Yes"
    tv["ContentWidth"] = "No"
    local tw = #tt
    local tx = 60
    local ty = Obj.Append(tv, "UILayoutGrid")
    ty["Padding"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    ty["Rows"] = tw + 1
    ty["Columns"] = 4
    ty[2][1]["SizePolicy"] = "Stretch"
    ty[2][2]["SizePolicy"] = "Stretch"
    ty[2][3]["SizePolicy"] = "Fixed"
    ty[2][3]["Size"] = 150
    ty[2][4]["SizePolicy"] = "Fixed"
    ty[2][4]["Size"] = 150
    local tz, tA
    local tB = Obj.Append(ty, "Button")
    tB["Anchors"] = {
      left = 2,
      right = 2,
      top = 0,
      bottom = 0
    }
    tB["AlignmentH"] = "Center"
    tB["AlignmentV"] = "Center"
    tB["Text"] = "Select All"
    tB["Icon"] = "arrow_down"
    tB["IconAlignmentH"] = "Left"
    tB["Texture"] = "corner15"
    tB["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    tB["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    tB["PluginComponent"] = w
    tB["Clicked"] = "OnCheckDeleteAll"
    
    local function tC()
      local dx = true
      for cr, nB in pairs(tt) do
        if not nB.flag_c312 then
          dx = false
          break
        end
      end
      if dx then
        tz = true
        tB["Text"] = "Unselect All"
      else
        tz = false
        tB["Text"] = "Select All"
      end
    end
    
    v["OnCheckDeleteAll"] = function(mX)
      for cr, nB in pairs(tt) do
        if tz then
          nB.flag_c312 = false
        else
          nB.flag_c312 = true
        end
        if nB.a724394a then
          nB.a724394a["State"] = nB.flag_c312
        end
        if nB.a18f3971 then
          nB.a18f3971["Enabled"] = nB.flag_c312
        end
      end
      tC()
    end
    local tD = Obj.Append(ty, "Button")
    tD["Anchors"] = {
      left = 3,
      right = 3,
      top = 0,
      bottom = 0
    }
    tD["AlignmentH"] = "Center"
    tD["AlignmentV"] = "Center"
    tD["Text"] = "Select All"
    tD["Icon"] = "arrow_down"
    tD["IconAlignmentH"] = "Left"
    tD["Texture"] = "corner15"
    tD["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    tD["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    tD["PluginComponent"] = w
    tD["Clicked"] = "OnCheckCueOnlyAll"
    
    local function tE()
      local dx = true
      if s[10][3] >= s[10][11] then
        return 2
      end
      for cr, nB in pairs(tt) do
        if not nB.flag_a2ec then
          dx = false
          break
        end
      end
      if dx then
        tA = true
        tD["Text"] = "Unselect All"
      else
        tA = false
        tD["Text"] = "Select All"
      end
    end
    
    v["OnCheckCueOnlyAll"] = function(mX)
      for cr, nB in pairs(tt) do
        if tA then
          nB.flag_a2ec = false
        else
          nB.flag_a2ec = true
        end
        if nB.a18f3971 then
          nB.a18f3971["State"] = nB.flag_a2ec
        end
      end
      tE()
    end
    for ac, e4 in pairs(tt) do
      local mH = Obj.FindParent(e4.af3214b7, "Sequence")
      e4.aa6dca56 = Obj.Append(ty, "UIObject")
      e4.aa6dca56["Margin"] = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      }
      e4.aa6dca56["AlignmentV"] = "Center"
      e4.aa6dca56["text"] = mH and string.format("Seq %s - %s", mH.No, mH.Name) or "Unknown"
      e4.aa6dca56["TextAlignmentH"] = "Left"
      e4.aa6dca56["ContentDriven"] = "Yes"
      e4.aa6dca56["ContentWidth"] = "No"
      e4.aa6dca56["TextAutoAdjust"] = "Yes"
      e4.aa6dca56["Anchors"] = {
        left = 0,
        right = 0,
        top = ac,
        bottom = ac
      }
      e4.aa6dca56["Padding"] = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
      }
      e4.aa6dca56["HasHover"] = "No"
      e4.a2639561 = Obj.Append(ty, "UIObject")
      e4.a2639561["Margin"] = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      }
      e4.a2639561["AlignmentV"] = "Center"
      e4.a2639561["text"] = e4.af3214b7 and string.format("Cue %s - %s", A.abb404ee(e4.af3214b7), e4.af3214b7.Name) or "Unknown"
      e4.a2639561["TextAlignmentH"] = "Left"
      e4.a2639561["ContentDriven"] = "Yes"
      e4.a2639561["ContentWidth"] = "No"
      e4.a2639561["TextAutoAdjust"] = "Yes"
      e4.a2639561["Anchors"] = {
        left = 1,
        right = 1,
        top = ac,
        bottom = ac
      }
      e4.a2639561["Padding"] = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
      }
      e4.a2639561["HasHover"] = "No"
      e4.a724394a = Obj.Append(ty, "CheckBox")
      e4.a724394a["Anchors"] = {
        left = 2,
        right = 2,
        top = ac,
        bottom = ac
      }
      e4.a724394a["AlignmentH"] = "Center"
      e4.a724394a["AlignmentV"] = "Center"
      e4.a724394a["Text"] = "Delete"
      e4.a724394a["State"] = e4.flag_c312
      e4.a724394a["Margin"] = {
        left = 5,
        right = 0,
        top = 5,
        bottom = 5
      }
      e4.a724394a["PluginComponent"] = w
      e4.a18f3971 = Obj.Append(ty, "CheckBox")
      e4.a18f3971["Anchors"] = {
        left = 3,
        right = 3,
        top = ac,
        bottom = ac
      }
      e4.a18f3971["AlignmentH"] = "Center"
      e4.a18f3971["AlignmentV"] = "Center"
      e4.a18f3971["Text"] = "Cue Only"
      e4.a18f3971["State"] = e4.flag_a2ec
      e4.a18f3971["Margin"] = {
        left = 5,
        right = 0,
        top = 5,
        bottom = 5
      }
      e4.a18f3971["PluginComponent"] = w
      e4.ae7147ea = string.format("onCueDelete%sChecked", HandleToInt(e4.a724394a))
      e4.a724394a["Clicked"] = e4.ae7147ea
      v[e4.ae7147ea] = function(mX)
        if 1 == mX["State"] then
          mX["State"] = 0
          e4.flag_c312 = false
          if e4.a18f3971 then
            e4.a18f3971["Enabled"] = false
          end
        else
          mX["State"] = 1
          e4.flag_c312 = true
          if e4.a18f3971 then
            e4.a18f3971["Enabled"] = true
          end
        end
        tC()
      end
      e4.a22bcabc = string.format("onCueDelete%sChecked", HandleToInt(e4.a18f3971))
      e4.a18f3971["Clicked"] = e4.a22bcabc
      v[e4.a22bcabc] = function(mX)
        if 1 == mX["State"] then
          mX["State"] = 0
          e4.flag_a2ec = false
        else
          mX["State"] = 1
          e4.flag_a2ec = true
        end
        tE()
      end
    end
    tC()
    tE()
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 2
    local tG = Obj.Append(tF, "Button")
    tG["W"] = "100%"
    tG["H"] = "100%"
    tG["X"] = 0
    tG["Y"] = 0
    tG["AlignmentH"] = "Center"
    tG["AlignmentV"] = "Center"
    tG["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tG["Textshadow"] = 1
    tG["HasHover"] = "Yes"
    tG["Text"] = "Cancel"
    tG["Font"] = "Medium20"
    tG["PluginComponent"] = w
    tG["Clicked"] = "OnCancelClicked"
    local tH = Obj.Append(tF, "Button")
    tH["W"] = "100%"
    tH["H"] = "100%"
    tH["AlignmentH"] = "Center"
    tH["AlignmentV"] = "Center"
    tH["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    tH["Textshadow"] = 1
    tH["HasHover"] = "Yes"
    tH["Text"] = "Continue"
    tH["Font"] = "Medium20"
    tH["PluginComponent"] = w
    tH["Clicked"] = "OnOkClicked"
    local ec
    v["OnCancelClicked"] = function(mX)
      ec = false
      Obj.Delete(hv, Obj.Index(hw))
    end
    v["OnOkClicked"] = function(mX)
      ec = true
      Obj.Delete(hv, Obj.Index(hw))
    end
    Obj.WaitInit(tH)
    FindBestFocus(tH)
    hw["Visible"] = "Yes"
    Obj.ShowModal(hw)
    WaitObjectDelete(hw)
    return ec
  end
  
  function rm.aa48c247(ry, sW)
    if not ry then
      return true
    end
    if not ry.tbl_d158 then
      return true
    end
    if not sW then
      return true
    end
    if not sW.tbl_13c3 then
      return true
    end
    local tI = {}
    for cr, nB in pairs(ry.tbl_d158) do
      if nB.a1925f31 then
        local tJ = Obj.Parent(nB.a1925f31)
        for cr, sW in pairs(sW.tbl_13c3) do
          if tJ == sW.a1925f31 and sW.enabled then
            table.insert(tI, {
              af3214b7 = nB.a1925f31,
              ac312d6e = true,
              aa2ecc1d = false
            })
          end
        end
      end
    end
    if #tI > 0 then
      if not ts(tI) then
        return
      end
      for cr, nB in pairs(tI) do
        if nB.flag_c312 then
          local tJ = Obj.Parent(nB.af3214b7)
          local tK = tJ and tJ.No
          local tL = Obj.FindParent(nB.af3214b7, "Pool")
          local tM = tL and tL.No
          local mG = A.abb404ee(nB.af3214b7)
          if tK and tM and mG then
            if nB.flag_a2ec then
              Cmd(string.format("Delete DataPool %s Sequence %s Cue %s /CueOnly /nc", tM, tK, mG))
            else
              Cmd(string.format("Delete DataPool %s Sequence %s Cue %s /nc", tM, tK, mG))
            end
          end
        end
      end
    end
    for ac, e4 in pairs(ry.tbl_d158) do
      if e4.a1534505 then
        Obj.Remove(Obj.Parent(e4.a1534505), Obj.Index(e4.a1534505))
      end
    end
    return true
  end
  
  function rm.acf51bce(ry, sW, rD)
    local function tN(tO, tP)
      for Q = tO + 1, #ry.tbl_9171 do
        if tP == ry.tbl_9171[Q].aad45010 and ry.tbl_9171[Q].a0ebe210 and tonumber(ry.tbl_9171[Q].a0ebe210) then
          return tonumber(ry.tbl_9171[Q].a0ebe210)
        end
      end
      return nil
    end
    
    local function tQ(tR, mH)
      for Q = 1, Obj.Count(mH) do
        local tS = A.abb404ee(mH[Q])
        if tS and tR < tS then
          return tS
        end
      end
      return nil
    end
    
    local function tT(mH, mG)
      for Q = 1, Obj.Count(mH) do
        if A.abb404ee(mH[Q]) then
          local tU = A.abb404ee(mH[Q])
          if tU and tU == mG then
            return true
          end
        end
      end
      if s[10][2] * s[10][4] <= s[10][4] then
        return s[10][4]
      end
      return nil
    end
    
    local function tV(E, tW)
      local tX = 0
      local tY = {}
      if tW == #E then
        return tX, tY
      end
      if o[3][4] * o[3][3] > o[3][3] then
        return o[3][3]
      end
      local tZ = E[tW].aad45010
      for Q = tW + 1, #E do
        if E[Q].aad45010 == tZ then
          if not E[Q].a0ebe210 and not E[Q].flag_63f9 then
            tX = tX + 1
            tY[tX] = E[Q]
          else
            break
          end
        end
      end
      return tX, tY
    end
    
    if 1 == rD.tbl_0c3f.num_5f0f then
      for ac, e4 in pairs(ry.tbl_9171) do
        if not e4.a0ebe210 then
          e4.a0ebe210 = tonumber(e4.a90ff523)
        end
      end
    end
    rm.a7131707(ry)
    local t_ = 1
    local u0, tY
    local u1 = 1.0E-10
    for ac, e4 in ipairs(ry.tbl_9171) do
      if e4.aad45010.enabled and not e4.flag_63f9 then
        local u2 = {
          ["Top"] = true
        }
        local u3 = false
        if u2[e4.num_eba2] or -1 == e4.num_eba2 and u2[e4.aad45010.a3763cb3] then
          u3 = true
        end
        if e4.aad45010.flag_440f and not e4.a0ebe210 and not u3 then
          return string.format("Can't find available Cue No for Reaper Marker %s - %s\n\nThis may be because the order of cues in your sequence doesn't match the marker order in Reaper.", e4.a90ff523, e4.a3bdc261)
        else
          e4.aad45010.flag_440f = false
        end
        if u3 then
          e4.a0ebe210 = 1
          e4.aad45010.num_a8a1 = 1
          e4.flag_a98e = false
          if e4.a1925f31 and 1 ~= A.abb404ee(e4.a1925f31) then
            e4.a1925f31 = nil
          end
        elseif e4.a0ebe210 then
          if e4.aad45010.num_a8a1 < e4.a0ebe210 then
            e4.aad45010.num_a8a1 = e4.a0ebe210
          end
          if not e4.aad45010.a43a820d then
            e4.aad45010.num_a8a1 = e4.a0ebe210
          end
          e4.flag_a98e = false
        else
          e4.a0ebe210 = e4.aad45010.num_a8a1
          e4.flag_a98e = true
        end
        if not e4.aad45010.a43a820d then
          e4.aad45010.a43a820d = true
        end
        if u0 then
          u0 = u0 - 1
          if u0 <= 0 then
            u0 = nil
            tY = nil
            t_ = 1
          end
        else
          u0, tY = tV(ry.tbl_9171, ac)
          if u0 <= 0 then
            u0 = nil
            tY = nil
            t_ = 1
          end
          local u4 = tQ(e4.a0ebe210, e4.aad45010.a1925f31)
          if u4 and u0 then
            local u5 = u4 - e4.a0ebe210
            local u6 = u5 / u0
            if u6 <= 1 then
              if u6 <= 0.1 then
                if u6 <= 0.01 then
                  if u6 <= 0.001 then
                    local u7 = ""
                    for mg, mh in pairs(tY) do
                      u7 = u7 .. string.format("\n%s - %s", mh.a90ff523, mh.a3bdc261)
                    end
                    return string.format("There are not enough avaliable cue numbers in sequence %s for the following Reaper markers...\n%s\n\nPlease re-number your existing cues then re-sync.", e4.aad45010.a1925f31.No, u7)
                  else
                    t_ = 0.001
                  end
                else
                  t_ = 0.01
                end
              else
                t_ = 0.1
              end
            else
              t_ = 1
            end
          else
            t_ = 1
          end
        end
        local u4 = tN(ac, e4.aad45010)
        if u4 then
          if e4.aad45010.num_a8a1 + 1 >= u4 - u1 or tT(e4.aad45010.a1925f31, e4.aad45010.num_a8a1 + 1) or t_ < 1 then
            if e4.aad45010.num_a8a1 + 0.1 >= u4 - u1 or tT(e4.aad45010.a1925f31, e4.aad45010.num_a8a1 + 0.1) or t_ < 0.1 then
              if e4.aad45010.num_a8a1 + 0.01 >= u4 - u1 or tT(e4.aad45010.a1925f31, e4.aad45010.num_a8a1 + 0.01) or t_ < 0.01 then
                if e4.aad45010.num_a8a1 + 0.001 >= u4 - u1 or tT(e4.aad45010.a1925f31, e4.aad45010.num_a8a1 + 0.001) or t_ < 0.001 then
                  e4.aad45010.flag_440f = true
                else
                  e4.aad45010.num_a8a1 = e4.a0ebe210 + 0.001
                end
              else
                e4.aad45010.num_a8a1 = e4.a0ebe210 + 0.01
              end
            else
              e4.aad45010.num_a8a1 = e4.a0ebe210 + 0.1
            end
          else
            e4.aad45010.num_a8a1 = math.floor(e4.a0ebe210 + 1)
          end
        else
          e4.aad45010.num_a8a1 = math.floor(e4.a0ebe210 + 1)
        end
        if not e4.aad45010.tbl_e757 then
          e4.aad45010.tbl_e757 = {}
        end
        local u8
        for mg, mh in pairs(e4.aad45010.tbl_e757) do
          if e4.a0ebe210 == mh.a0ebe210 then
            u8 = true
            e4.flag_56e4 = false
          end
        end
        if not u8 then
          table.insert(e4.aad45010.tbl_e757, {
            a0ebe210 = e4.a0ebe210,
            a48881e8 = e4.a90ff523
          })
          e4.flag_56e4 = true
        end
      end
    end
    for ac, e4 in pairs(sW.tbl_13c3) do
      e4.num_a8a1 = e4.aa0327eb
    end
    for ac, e4 in ipairs(ry.tbl_9171) do
      if e4.aad45010.enabled and not e4.flag_63f9 then
        if e4.aad45010.num_a8a1 ~= e4.aad45010.aa0327eb and e4.a0ebe210 <= e4.aad45010.num_a8a1 and e4.flag_a98e then
          e4.a0ebe210 = e4.aad45010.num_a8a1 + 0.001
        end
        if e4.flag_a98e then
          e4.aad45010.num_a8a1 = e4.a0ebe210
        end
      end
    end
  end
  
  function rm.aea97f7c(ry, rA, rD, qF)
    for ac, e4 in ipairs(ry.tbl_9171) do
      if e4.aad45010.enabled and not e4.flag_63f9 then
        local mH = e4.aad45010.a1925f31
        if not e4.a1925f31 then
          for Q = 1, Obj.Count(mH) do
            local rP = mH[Q]
            local mG = A.abb404ee(rP)
            if mG then
              mG = tonumber(mG)
              if mG and mG == e4.a0ebe210 then
                e4.a1925f31 = mH[Q]
              end
            end
          end
        end
        if not e4.a1925f31 then
          local u9 = 0
          local ua
          for Q = 1, Obj.Count(mH) do
            local rP = mH[Q]
            local mG = A.abb404ee(rP)
            if mG then
              if u9 < e4.a0ebe210 and mG > e4.a0ebe210 then
                ua = Q
                break
              end
              u9 = mG
            end
          end
          local ub, uc
          A.a4b25f9e()
          if e4.aad45010.master_idx == rD.tbl_0c3f.a70e02e7 then
            ub = GetVar(y.g_plugin_var_obj, "defSeqFadeTime") or 1
            uc = GetVar(y.g_plugin_var_obj, "defSeqFadeUnit") or 1
          else
            ub = GetVar(y.g_plugin_var_obj, "otherSeqFadeTime") or 1
            uc = GetVar(y.g_plugin_var_obj, "otherSeqFadeUnit") or 1
          end
          e4.a1925f31 = Obj.Insert(mH, ua)
          Obj.Create(e4.a1925f31, 1)
          if 1 == uc then
            e4.a1925f31[1].CueInFade = rm.a48a4a49(e4.num_156e, tonumber(ub))
            A.a4b25f9e()
          else
            e4.a1925f31[1].CueInFade = ub
          end
        end
        if rD.tbl_0c3f.num_26ae > 0 then
          local ud
          for cr, ue in pairs(Obj.Children(e4.a1925f31[1])) do
            if ue.Name == rm.str_0c9c and not ud then
              ud = ue
              break
            end
          end
          if not ud then
            local uf
            if A.a2c6e9b4(Version(), "2.3.100.0", false) then
              uf = "StandardRecipe"
            end
            ud = Obj.Aquire(e4.a1925f31[1], uf)
          end
          if A.a2c6e9b4(Version(), "2.2.1.1", false) and ud.Lock then
            ud.Lock = false
          end
          if ud.Name ~= rm.str_0c9c then
            ud.Name = rm.str_0c9c
          end
          if ud.Enabled then
            ud.Enabled = false
          end
          A.a34ca287(ud, {
            ac02a53d = "Marker",
            a04556b5 = qF.song_uuid,
            a6ed8791 = rD.tbl_0c3f.project_uuid,
            aad7d4ed = e4.ad40375c
          }, rm.str_0c9c)
          if A.a2c6e9b4(Version(), "2.2.1.1", false) then
            ud.Lock = true
          end
        end
        if e4.flag_56e4 then
          e4.a1925f31.No = e4.a0ebe210
          if e4.a2fad5d8 then
            e4.a1925f31[1].CueInFade = e4.a2fad5d8
          end
          if e4.ac51ae0b then
            e4.a1925f31[1].CueOutFade = e4.ac51ae0b
          end
        end
        if e4.a1925f31[1].Name ~= e4.a3bdc261 then
          A.a4b25f9e()
          e4.a1925f31[1].Name = e4.a3bdc261
        end
        if 1 == rD.tbl_0c3f.num_6f9e and 1 == rD.tbl_0c3f.num_c583 then
          local ug = A.ac6f27fe(e4.adb219bd, rm.num_2fb8)
          if e4.a1925f31[1].Appearance ~= ug then
            e4.a1925f31[1].Appearance = ug
          end
        end
        if 1 == rD.tbl_0c3f.num_90cf and 1 == rD.tbl_0c3f.num_c583 and e4.tbl_3940 and type(e4.tbl_3940) == "table" and #e4.tbl_3940 > 0 then
          for cr, uh in ipairs(e4.tbl_3940) do
            local ug = A.ac6f27fe(uh.adb219bd, rm.num_2fb8)
            if e4.a1925f31[1].Appearance ~= ug then
              e4.a1925f31[1].Appearance = ug
            end
          end
        end
        
        local function ui()
          local sL = qF.a27f7dd7 + e4.a5320370
          local uj = A.aa3c2984(sL * 16777216, qF.a9c920d0)
          local uk = string.format("%02d:%02d:%02d:%02d", uj.a3289b61, uj.a56f129b, uj.ac709510, uj.a98fbcfd)
          local s2 = e4.a1925f31.Note
          local ul = string.format("Timecode: %s", uk)
          if string.match(s2, "Timecode:%s*[+-]?[0-9]?[0-9]:[0-9][0-9]:[0-9][0-9]:[0-9][0-9]") then
            s2 = string.gsub(s2, "Timecode:%s*[+-]?[0-9]?[0-9]:[0-9][0-9]:[0-9][0-9]:[0-9][0-9]", ul)
          else
            s2 = ul .. "\n" .. s2
          end
          e4.a1925f31.Note = s2
        end
        
        if 1 == rD.tbl_0c3f.num_f447 then
          ui()
        end
        
        local function um()
          e4.tempoChange = true
          local s2 = e4.a1925f31.Note
          if 1 == rD.tbl_0c3f.num_772e then
            local un = string.format("Tempo: %s BPM", e4.num_156e)
            if string.match(s2, "Tempo:%s*[0-9]*%.?[0-9]+%s*BPM") then
              s2 = string.gsub(s2, "Tempo:%s*[0-9]*%.?[0-9]+%s*BPM", un)
            else
              s2 = un .. "\n" .. s2
            end
            e4.a1925f31.Note = s2
          end
        end
        
        if 1 == ac then
          um()
        else
          local uo
          for up = ac - 1, 1, -1 do
            local uq = ry.tbl_9171[up]
            if uq.aad45010 == e4.aad45010 and uq.num_156e and uq.num_156e == e4.num_156e then
              uo = true
              break
            end
          end
          if not uo then
            um()
          end
        end
        if 1 == rD.tbl_0c3f.num_0be4 and e4.tempoChange then
          local ur = e4.a1925f31[1].Command or ""
          if "" == string.gsub(ur, " ", "") then
            ur = string.format("SetUserVariable \"MATools_BPM\" %s", e4.num_156e)
          elseif string.match(ur, "SetUserVariable%s*%\"MATools_BPM%\"%s*%\"?[0-9]*%.?[0-9]+%\"?") then
            ur = string.gsub(ur, "SetUserVariable%s*%\"MATools_BPM%\"%s*%\"?[0-9]*%.?[0-9]+%\"?", string.format("SetUserVariable \"MATools_BPM\" %s", e4.num_156e))
            ur = string.gsub(ur, "SetUserVariable%s*%\"MATools_BPM%\"%s*%\"?nil%\"?", string.format("SetUserVariable \"MATools_BPM\" %s", e4.num_156e))
          else
            ur = ur .. " ; " .. string.format("SetUserVariable \"MATools_BPM\" %s", e4.num_156e)
          end
          e4.a1925f31[1].Command = ur
        end
        if rD.tbl_0c3f.yes_no_flag ~= "No" and e4.tempoChange then
          local ur = e4.a1925f31[1].Command or ""
          local tl = Root().ShowData.Masters.Speed[rD.tbl_0c3f.yes_no_flag]
          local tm
          if tl then
            tm = Obj.ToAddr(tl)
            if "" == string.gsub(ur, " ", "") then
              ur = string.format("%s At BPM %s", tm, e4.num_156e)
            elseif string.match(ur, "Master%s+3%.%d+%s+At%s+BPM%s+%\"?[0-9]*%.?[0-9]+%\"?") then
              ur = string.gsub(ur, "Master%s+3%.%d+%s+At%s+BPM%s+%\"?[0-9]*%.?[0-9]+%\"?", string.format("%s At BPM %s", tm, e4.num_156e))
            else
              ur = ur .. " ; " .. string.format("%s At BPM %s", tm, e4.num_156e)
            end
            e4.a1925f31[1].Command = ur
          end
        end
        if e4.aa207b2a then
          local ur = e4.a1925f31[1].Command or ""
          local us = Obj.Append(DataPool().Macros)
          local ut
          if us then
            local uu = Obj.Append(us)
            uu.Command = e4.aa207b2a
            ut = uu.Command
            Obj.Delete(Obj.Parent(us), Obj.Index(us))
          end
          if "" == string.gsub(ur, " ", "") then
            ur = e4.aa207b2a
          elseif ut then
            local function uv(uw)
              local e = string.gsub(uw, "[^%w%s]", "%%%1")
              
              e = string.gsub(e, "%s+", "%%s")
              if k[1][6] < k[1][13] then
                return {}
              end
              return e
            end
            
            ut = uv(ut)
            if not string.match(ur, ut) then
              ur = ur .. " ; " .. e4.aa207b2a
            end
          end
          e4.a1925f31[1].Command = ur
        end
      end
      if e4.a1925f31 then
        rD.tbl_9171[e4.ad40375c] = {
          a1925f31 = e4.a1925f31
        }
      end
    end
  end
  
  function rm.afdb860f(ux)
    if not ux then
      return nil
    end
    return {
      ab9049d9 = ux.BackR,
      af7ad2a7 = ux.BackG,
      aea17af0 = ux.BackB
    }
  end
  
  function rm.ade198ec(ry, rz, qF)
    local uy = GetVar(y.g_plugin_var_obj, "defSeqName") or "ProjectName - SeqName"
    local uz = GetVar(y.g_plugin_var_obj, "otherSeqName") or "ProjectName - SeqName"
    local uA = GetVar(y.g_plugin_var_obj, "midiSeqName") or "SeqName - TrackName - ProjectNameShort"
    local uB = GetVar(y.g_plugin_var_obj, "defSeqCue")
    uB = tonumber(uB) or 1
    local uC = GetVar(y.g_plugin_var_obj, "otherSeqCue")
    uC = tonumber(uC) or 1
    local uD = 1
    local uE = GetVar(y.g_plugin_var_obj, "defSeqToken")
    local uF = GetVar(y.g_plugin_var_obj, "otherSeqToken")
    local uG = {}
    for ac, e4 in ipairs(ry.tbl_9171) do
      local uH
      for mg, mh in pairs(ry.tbl_13c3) do
        if e4.master_idx == mh.master_idx then
          uH = mh
        end
      end
      if uH then
        if not uH.str_8d3d and string.gsub(e4.a3bdc261, " ", "") ~= "" then
          uH.str_8d3d = e4.a3bdc261
        elseif uH.str_8d3d ~= e4.a3bdc261 and string.gsub(e4.a3bdc261, " ", "") ~= "" then
          uH.a7bba5e3 = true
        end
        if e4.af2759cf and not uH.af2759cf then
          uH.af2759cf = e4.af2759cf
        end
        if e4.af99bee2 and not uH.af99bee2 then
          uH.af99bee2 = e4.af99bee2
        end
        if e4.num_eba2 then
          if not uH.num_db2f then
            uH.num_db2f = e4.num_eba2
          elseif uH.num_db2f ~= e4.num_eba2 then
            uH.num_db2f = -1
          end
        end
      end
    end
    for ac, e4 in pairs(ry.tbl_13c3) do
      e4.adb219bd = rm.a5c7e72c(e4.master_idx, 0)
      e4.flag_8d3a = true
      e4.str_c132 = "Marker"
      e4.str_ecae = "Markers"
      local uI
      if not e4.a3bdc261 then
        local uJ, uK
        if not e4.str_8d3d then
          e4.str_8d3d = ""
        end
        if e4.master_idx == qF.a70e02e7 then
          uK = uy
          if e4.a7bba5e3 or string.gsub(e4.str_8d3d, " ", "") == "" then
            uJ = "Master"
          else
            uJ = e4.str_8d3d
          end
          if not e4.aa0327eb then
            e4.aa0327eb = uB
          end
        else
          uK = uz
          if e4.a7bba5e3 or string.gsub(e4.str_8d3d, " ", "") == "" then
            uJ = "Sequence"
          else
            uJ = e4.str_8d3d
          end
          if not e4.aa0327eb then
            e4.aa0327eb = uC
          end
        end
        if e4.af2759cf then
          uJ = e4.af2759cf
        end
        e4.a3bdc261 = string.gsub(uK, "ProjectNameShort", qF.ae6dc493)
        e4.a3bdc261 = string.gsub(e4.a3bdc261, "ProjectName", qF.a3bdc261)
        e4.a3bdc261 = string.gsub(e4.a3bdc261, "SeqName", uJ)
      end
      if e4.a1925f31 then
        e4.a283b5c6 = e4.a1925f31.No
        e4.a3bdc261 = e4.a1925f31.Name
        if e4.a1925f31.Appearance then
          local uL = rm.afdb860f(e4.a1925f31.Appearance)
          if uL and uL.ab9049d9 == e4.adb219bd.ab9049d9 and uL.af7ad2a7 == e4.adb219bd.af7ad2a7 and uL.aea17af0 == e4.adb219bd.aea17af0 then
            e4.flag_8d3a = true
          else
            e4.flag_8d3a = false
          end
          e4.adb219bd = uL
        end
      end
      if e4.af99bee2 then
        e4.a3bdc261 = e4.af99bee2
      end
      e4.num_a8a1 = e4.aa0327eb
      if not e4.af09dc19 then
        if not qF.af09dc19 then
          if qF.a936e685 and qF.a936e685.p then
            local uM = tonumber(qF.a936e685.p)
            if uM and uM > 0 and uM < 10000 then
              e4.tc_slot = uM
            else
              e4.tc_slot = A.a039e70f().No
            end
          else
            e4.tc_slot = A.a039e70f().No
          end
          e4.flag_33a7 = true
        else
          e4.tc_slot = qF.af09dc19.No
          e4.flag_33a7 = true
        end
      else
        e4.tc_slot = e4.af09dc19.No
      end
      if e4.af09dc19 then
        uI = e4.af09dc19.Name
      end
      if not e4.flag_offset then
        e4.flag_offset = 0
      end
      if not e4.a993e03c then
        e4.a993e03c = GetVar(y.g_plugin_var_obj, "tempFlashOffDelay") or y.a52ba751["tempFlashOffDelay"].num_3928
      end
      if e4.num_db2f and -1 ~= e4.num_db2f then
        for mg, mh in pairs(rm.a48ca426) do
          if e4.num_db2f == mh.str_7b0e then
            e4.a3763cb3 = mh.a0fc7c03
            break
          end
        end
      end
      if not e4.a3763cb3 then
        if e4.master_idx == qF.a70e02e7 then
          e4.a3763cb3 = uE
        else
          e4.a3763cb3 = uF
        end
      end
      e4.str_ab65 = "Go+"
      table.insert(uG, {
        a04e85a2 = 0,
        a8e43495 = e4,
        a3bdc261 = e4.a3bdc261,
        a7052c3b = uI
      })
    end
    local uN = {}
    local uO = {
      {
        a2cb2374 = "Markers",
        a7b0eb83 = "Marker Sequences",
        ae6971b2 = -1
      }
    }
    for rG, rT in pairs(rz) do
      if nil ~= rT and not rT.a2dc0aa1 then
        table.insert(uO, {
          a2cb2374 = rG,
          a7b0eb83 = string.format("MIDI - %s", rT.a3bdc261),
          ae6971b2 = rT.a09f63fb
        })
        rT.adb219bd = rm.a5c7e72c(rT.master_idx, 1)
        rT.str_ab65 = "Go+"
        if not rT.af09dc19 then
          if not qF.af09dc19 then
            if qF.a936e685 and qF.a936e685.p then
              local uM = tonumber(qF.a936e685.p)
              if uM and uM > 0 and uM < 10000 then
                rT.tc_slot = uM
              else
                rT.tc_slot = A.a039e70f().No
              end
            else
              rT.tc_slot = A.a039e70f().No
            end
            rT.flag_33a7 = true
          else
            rT.tc_slot = qF.af09dc19.No
            rT.flag_33a7 = true
          end
        else
          rT.tc_slot = rT.af09dc19.No
        end
        if rT.af09dc19 and rT.af09dc19.Appearance then
          rT.adb219bd = rm.afdb860f(rT.af09dc19.Appearance)
        end
        for ac, e4 in pairs(rT.tbl_b89c) do
          if not e4.a2dc0aa1 then
            if not e4.flag_offset then
              e4.flag_offset = 0
            end
            if not e4.a3bdc261 or string.gsub(e4.a3bdc261, " ", "") == "" then
              e4.a3bdc261 = string.format("Midi Note %s", e4.stem_index)
            end
            e4.ac34c340 = e4.a3bdc261
            e4.a3bdc261 = string.gsub(uA, "ProjectNameShort", qF.ae6dc493)
            e4.a3bdc261 = string.gsub(e4.a3bdc261, "ProjectName", qF.a3bdc261)
            e4.a3bdc261 = string.gsub(e4.a3bdc261, "SeqName", e4.ac34c340)
            e4.a3bdc261 = string.gsub(e4.a3bdc261, "TrackName", rT.a3bdc261)
            e4.aa0327eb = uD
            e4.num_a8a1 = uD
            e4.master_idx = rT.master_idx
            e4.adb219bd = rT.adb219bd
            e4.flag_8d3a = true
            e4.str_c132 = "MIDI"
            e4.str_ecae = rG
            if e4.a1925f31 then
              e4.a283b5c6 = e4.a1925f31.No
              if e4.a1925f31.Appearance then
                local uL = rm.afdb860f(e4.a1925f31.Appearance)
                if uL and uL.ab9049d9 == e4.adb219bd.ab9049d9 and uL.af7ad2a7 == e4.adb219bd.af7ad2a7 and uL.aea17af0 == e4.adb219bd.aea17af0 then
                  e4.flag_8d3a = true
                else
                  e4.flag_8d3a = false
                end
                e4.adb219bd = uL
              end
            end
            e4.afa082b2 = rT.a09f63fb
            e4.midi_uuid = rG
            e4.a0cefcbd = rT
            table.insert(uN, rT.tbl_b89c[ac])
          end
        end
        table.insert(uG, {
          a04e85a2 = 1,
          a8e43495 = rT,
          a3bdc261 = rT.a3bdc261
        })
      end
    end
    local sW = {}
    sW.tbl_13c3 = ry.tbl_13c3
    sW.ab3a0ae8 = uN
    sW.add72b84 = uG
    sW.ab73c456 = uO
    
    local function uP(at, au)
      return at.a8e43495.a09f63fb < au.a8e43495.a09f63fb
    end
    
    local function uQ(at, au)
      if not at.afa082b2 then
        return false
      end
      if not au.afa082b2 then
        return true
      end
      if not at.stem_index then
        return false
      end
      if not au.stem_index then
        return true
      end
      if at.afa082b2 == au.afa082b2 then
        return at.stem_index < au.stem_index
      else
        return at.afa082b2 < au.afa082b2
      end
    end
    
    local function uR(at, au)
      if not at.ae6971b2 then
        return false
      end
      if not au.ae6971b2 then
        return true
      end
      return at.ae6971b2 < au.ae6971b2
    end
    
    local function uS(eo)
      local uT
      for Q, uU in ipairs(eo) do
        local uV
        if uU.a8e43495 then
          uV = uU.a8e43495.master_idx
        else
          uV = uU.master_idx
        end
        if uV == qF.a70e02e7 then
          uT = Q
          break
        end
      end
      if uT then
        local uW = table.remove(eo, uT)
        table.insert(eo, 1, uW)
      end
    end
    
    table.sort(sW.ab3a0ae8, uQ)
    table.sort(sW.add72b84, uP)
    table.sort(sW.ab73c456, uR)
    uS(sW.tbl_13c3)
    uS(sW.add72b84)
    return sW
  end
  
  function rm.ab41a825(uX, uY, uZ, u_, v0)
    local v1, v2, v3
    if 1 == v0 then
      v2 = GetVar(y.g_plugin_var_obj, "defSeqExecConfig")
      v3 = GetVar(y.g_plugin_var_obj, "defSeqUseTimecodeKey")
    elseif 2 == v0 then
      v2 = GetVar(y.g_plugin_var_obj, "otherSeqExecConfig")
      v3 = GetVar(y.g_plugin_var_obj, "otherSeqUseTimecodeKey")
    elseif 3 == v0 then
      v2 = GetVar(y.g_plugin_var_obj, "midiSeqExecConfig")
      v3 = GetVar(y.g_plugin_var_obj, "midiSeqUseTimecodeKey")
    else
      return
    end
    for cr, v4 in pairs(uY) do
      if v4 and tonumber(v4) then
        v4 = tonumber(v4)
        if v4 then
          local v5 = v4 - 100
          if uX[v5] then
            if not uX[v5].Object and Obj.GetClass(uX[v5]) == "Exec" then
              v1 = uX[v5]
              break
            end
          else
            v1 = Obj.Create(uX, v5)
            break
          end
        end
      end
    end
    if not v1 then
      return
    end
    v1.Object = uZ
    A.a4b25f9e()
    if v2 then
      local v6 = DataPool().Configurations[tonumber(v2)]
      if v6 then
        v1.Width = v6.Width
        v1.Height = v6.Height
        v1.ExecutorConfiguration = v6
        Cmd(string.format("Assign %s At %s", Obj.ToAddr(v6), Obj.ToAddr(v1)))
      end
    end
    if 1 == v3 then
      v1.Key = u_
    end
  end
  
  function rm.a39f685f(v7, oZ)
    local uX = DataPool().Pages[v7]
    if not uX then
      Cmd(string.format("Store Page %s /o", v7))
      while not Obj.IsValid(DataPool().Pages[v7]) do
        coroutine.yield(0.02)
      end
      uX = DataPool().Pages[v7]
    end
    A.aaa980e8(uX, oZ)
    return uX
  end
  
  function rm.aec9f882(v7, v8, oZ)
    v7 = tonumber(v7)
    local uX = DataPool().Pages[v7]
    if not uX and v8 then
      uX = rm.a39f685f(v7, oZ)
    elseif not uX and not v8 then
      return nil, nil
    end
    local v9 = {}
    for Q = 1, Obj.Count(uX) do
      if uX[Q] and uX[Q].Object then
        table.insert(v9, uX[Q].Object)
      end
    end
    return v9, uX
  end
  
  function rm.ad96f734(sW, rD)
    if 0 == rD.tbl_0c3f.a7fa0b8b then
      return
    end
    for ac, e4 in pairs(sW.add72b84) do
      local v7 = e4.a8e43495.tc_slot
      if v7 then
        local uX = DataPool().Pages[v7]
        if not uX then
          uX = rm.a39f685f(v7, rD.tbl_0c3f.ab453ab2)
          uX.Name = e4.a8e43495.a3bdc261
        end
        if uX and e4.a24e0755 then
          uX.Name = e4.a24e0755
        end
      end
    end
    local v9 = {}
    local va = A.abcd8e75(GetVar(y.g_plugin_var_obj, "execDefSeq"), false)
    local vb = A.abcd8e75(GetVar(y.g_plugin_var_obj, "execOtherSeq"), false)
    local vc = A.abcd8e75(GetVar(y.g_plugin_var_obj, "execMidiSeq"), false)
    for ac, e4 in ipairs(sW.tbl_13c3) do
      if e4.flag_33a7 and e4.enabled then
        local uX
        if not v9[e4.tc_slot] then
          v9[e4.tc_slot], uX = rm.aec9f882(e4.tc_slot, true, rD.tbl_0c3f.ab453ab2)
        end
        uX = uX or DataPool().Pages[e4.tc_slot]
        rD.tbl_13c3[e4.master_idx].af09dc19 = uX
        local mw
        for mg, mh in pairs(v9[e4.tc_slot]) do
          if mh == e4.a1925f31 then
            mw = true
            break
          end
        end
        if not mw then
          if e4.master_idx == rD.tbl_0c3f.a70e02e7 then
            rm.ab41a825(uX, va, e4.a1925f31, e4.str_ab65, 1)
          else
            rm.ab41a825(uX, vb, e4.a1925f31, e4.str_ab65, 2)
          end
        end
      end
    end
    for ac, e4 in ipairs(sW.ab3a0ae8) do
      if e4.a0cefcbd.flag_33a7 then
        local uX
        if not v9[e4.a0cefcbd.tc_slot] then
          v9[e4.a0cefcbd.tc_slot], uX = rm.aec9f882(e4.a0cefcbd.tc_slot, true)
        end
        uX = uX or DataPool().Pages[e4.a0cefcbd.tc_slot]
        rD.tbl_b3fe[e4.a0cefcbd.ad40375c].af09dc19 = uX
        local mw
        for mg, mh in pairs(v9[e4.a0cefcbd.tc_slot]) do
          if mh == e4.a1925f31 then
            mw = true
            break
          end
        end
        if not mw then
          rm.ab41a825(uX, vc, e4.a1925f31, e4.str_ab65, 3)
        end
      end
    end
  end
  
  function rm.ae79970c(qF)
    qF.tc_handle_a = DataPool().Timecodes[qF.af96c73e]
    if not qF.tc_handle_a then
      Cmd(string.format("Store Timecode %s /o", qF.af96c73e))
      qF.tc_handle_a = DataPool().Timecodes[qF.af96c73e]
      if not qF.tc_handle_a then
        return string.format("Error 14 - Can't create Timecode %s", qF.af96c73e)
      end
      qF.tc_handle_a.Name = qF.a3bdc261
      qF.firstTcImport = true
      A.a4b25f9e()
    end
    A.aaa980e8(qF.tc_handle_a, qF.ab453ab2)
  end
  
  function rm.a317b304(qF, ry, rz, rD, vd)
    rD.tbl_0c3f.tc_handle_a = qF.tc_handle_a
    if A.a4077f93() then
      qF.tc_handle_a.PlaybackAndRecord = "Manual Events"
    else
      qF.tc_handle_a.IgnoreFollow = true
    end
    local ve = ry.tbl_9171[#ry.tbl_9171].a5320370 + 2
    if y.g_str_false == "true" then
      ve = 20
    end
    if ry.tbl_3940 and #ry.tbl_3940 > 0 then
      local vf = ry.tbl_3940[#ry.tbl_3940].a72235e2
      if ve then
        if ve < vf then
          ve = vf
        end
      else
        ve = vf
      end
    end
    for rG, rT in pairs(rz) do
      if rT.a01d3537 then
        for ac, e4 in pairs(rT.a01d3537) do
          if ve < e4.a72235e2 then
            ve = e4.a72235e2 + 2
          end
        end
      end
    end
    local vg = ve
    local vh = A.a59b6fcc(ve, 2)
    qF.trackDuration = ve
    qF.trackDurationSecs = vg
    qF.trackDurationSecsRounded = vh
    ve = A.a4c6927e(ve)
    qF.tc_handle_a.Duration = ve
    if 1 == rD.tbl_0c3f.num_88eb then
      local vi = rm.ad522a3d(qF.tc_handle_a)
      local vj = A.a4c6927e(qF.a27f7dd7)
      local vk = vd
      vk = tonumber(vk)
      qF.flag_offset = vk
      if vk then
        vk = A.a4c6927e(vk * 1 / qF.a9c920d0)
        vj = vj + vk
      end
      local vl = A.aa3c2984(vi, qF.a9c920d0)
      local vm = A.aa3c2984(vj, qF.a9c920d0)
      local vn = string.format("%02d:%02d:%02d.%02d", vl.a3289b61, vl.a56f129b, vl.ac709510, vl.a98fbcfd)
      local vo = string.format("%02d:%02d:%02d.%02d", vm.a3289b61, vm.a56f129b, vm.ac709510, vm.a98fbcfd)
      if vn ~= vo and not qF.firstTcImport and qF.str_7a7d == "Network" then
        local hO = {
          title = string.format("%s - Timecode Offset", y.g_full_label),
          icon = y.company_label,
          message = string.format("Current TC Offset: %s\nReaper TC Offset: %s\n\nWould you like to use your current TC offset and re-adjust Reaper automatically?", vn, vo),
          commands = {
            {
              value = 0,
              name = "Use Reaper Offset"
            },
            {
              value = 1,
              name = "Use MA Offset"
            }
          }
        }
        local hP = MessageBox(hO)
        if 1 == hP.result then
          vj = vi
          local e, dl = pX.a51ef463({
            a38325d7 = "saveTimecodeOffset",
            adeda4ce = A.a9af03ee(vj - vk)
          })
          if dl then
            A.a880c84e(y.g_full_label, dl, true)
          end
        end
      end
      if qF.tc_handle_a.RawOffsetTCSlot ~= vj then
        A.a4b25f9e()
        qF.tc_handle_a.RawOffsetTCSlot = vj
      end
    elseif 0 ~= qF.tc_handle_a.RawOffsetTCSlot then
      A.a4b25f9e()
      qF.tc_handle_a.RawOffsetTCSlot = 0
    end
    rD.tbl_0c3f.flag_offset = vd
    SetVar(y.g_plugin_var_obj, HandleToInt(qF.tc_handle_a), qF.a06af6c3)
  end
  
  function rm.a246e0ab(qF, rz, rD)
    local function vp(vq, vr, vs, gL)
      local vt
      
      if not qF.tc_handle_a[vq] then
        vt = Obj.Insert(qF.tc_handle_a, vs)
        vt.Name = vq
      else
        vt = qF.tc_handle_a[vq]
      end
      if vt.Rec ~= vr then
        A.a4b25f9e()
        vt.Rec = vr
      end
      if gL then
        local vu = A.ac6f27fe(gL, rm.num_2fb8)
        if vt[1].Appearance ~= vu then
          A.a4b25f9e()
          vt[1].Appearance = vu
        end
      end
      return vt
    end
    
    local vv = 0
    if not rD.tbl_36ae then
      rD.tbl_36ae = {}
    end
    local vw = rD.tbl_36ae
    for ac, e4 in pairs(vw) do
      if e4 and Obj.IsValid(e4) and Obj.Parent(e4) ~= qF.tc_handle_a then
        vw[ac] = nil
      end
    end
    if not vw.a0478d8f and 1 == rD.tbl_0c3f.num_f670 then
      vv = vv + 1
      vw.a0478d8f = vp("Meter", false, vv, nil)
    elseif vw.a0478d8f and Obj.IsValid(vw.a0478d8f) and vw.a0478d8f.No then
      vv = vw.a0478d8f.No
    end
    if not vw.a81dda6a and qF.a2f33b31 then
      vv = vv + 1
      vw.a81dda6a = vp("Waveform", false, vv, nil)
    elseif vw.a81dda6a and Obj.IsValid(vw.a81dda6a) and vw.a81dda6a.No then
      vv = vw.a81dda6a.No
    end
    if not vw.adeb7f45 then
      vv = vv + 1
      vw.adeb7f45 = vp("MArkers", false, vv, nil)
    elseif vw.adeb7f45 and Obj.IsValid(vw.adeb7f45) and vw.adeb7f45.No then
      vv = vw.adeb7f45.No
    end
    if not vw.tbl_2a36 then
      vw.tbl_2a36 = {}
    end
    vv = vv + 1
    for rG, rT in pairs(rz) do
      if rT.a2dc0aa1 then
        Obj.Remove(qF.tc_handle_a, Obj.Index(rT.a2dc0aa1))
        rz[rG] = nil
      end
    end
    
    local function vx(at, au)
      return at.a09f63fb < au.a09f63fb
    end
    
    local vy = {}
    for rG, rT in pairs(rz) do
      if rT then
        table.insert(vy, rT)
      end
    end
    table.sort(vy, vx)
    for vz, rT in pairs(vy) do
      if not vw.tbl_2a36[rT.ad40375c] then
        vw.tbl_2a36[rT.ad40375c] = vp("MIDI - " .. rT.a3bdc261, false, vv, rT.adb219bd)
      elseif vw.tbl_2a36[rT.ad40375c] and Obj.IsValid(vw.tbl_2a36[rT.ad40375c]) and vw.tbl_2a36[rT.ad40375c].No then
        vv = vw.tbl_2a36[rT.ad40375c].No
      end
      rT.a6aaa85b = vw.tbl_2a36[rT.ad40375c]
      vv = vv + 1
      while not Obj.ToAddr(rT.a6aaa85b.Marker) do
        coroutine.yield(0.02)
      end
      if rD.tbl_0c3f.num_26ae > 0 then
        A.a34ca287(rT.a6aaa85b.Marker, {
          ac02a53d = "MIDITrack",
          a04556b5 = rD.tbl_0c3f.song_uuid,
          a6ed8791 = rD.tbl_0c3f.project_uuid,
          ad1509b7 = rT.ad40375c,
          a01c4c55 = rT.tc_slot,
          a33a7def = rT.flag_33a7
        }, rm.str_0c9c)
      end
    end
    return nil
  end
  
  local function vA(ry, vw, qF, rD)
    if ry.tbl_3940 and #ry.tbl_3940 > 0 then
      do
        local vB
        for ac, e4 in pairs(vw) do
          if type(e4) == "userdata" then
            vB = e4
            break
          elseif type(e4) == "table" then
            for mg, mh in pairs(e4) do
              if type(mh) == "userdata" then
                vB = mh
                break
              end
            end
            if vB then
              break
            end
          end
        end
        if not vB then
          return
        end
        while not Obj.ToAddr(vB.Marker) do
          coroutine.yield(0.02)
        end
        local vC = vB.Marker
        local vD
        for ac, e4 in ipairs(ry.tbl_3940) do
          if y.g_str_false == "false" or y.g_str_false == "true" and e4.a5320370 <= 20 and ac <= 3 then
            local vE = vC[ac]
            if not vE then
              vE = Obj.Append(vC)
              A.a4b25f9e()
              vD = true
            end
            if vE.Name ~= e4.a3bdc261 then
              A.a4b25f9e()
              vE.Name = e4.a3bdc261
              vD = true
            end
            local vF = e4.a5320370
            if 0 == rD.tbl_0c3f.num_88eb then
              vF = vF + qF.a27f7dd7 + qF.flag_offset * 1 / qF.a9c920d0
            end
            if A.a59b6fcc(A.a9af03ee(vE.Start), 4) ~= A.a59b6fcc(vF, 4) then
              A.a4b25f9e()
              vE.Start = vF
              vD = true
            end
            local vG = e4.a72235e2 - e4.a5320370
            if y.g_str_false == "true" and e4.a72235e2 > 20 then
              vG = 20 - e4.a5320370
            end
            local vH = string.match(vE.Duration, "[0-9]*%.?[0-9]+") or 0
            vH = tonumber(vH)
            if A.a59b6fcc(vH, 2) ~= A.a59b6fcc(vG, 2) then
              A.a4b25f9e()
              vE.Duration = tostring(vG)
              vD = true
            end
            local ug
            if 1 == rD.tbl_0c3f.num_c583 then
              if 0 ~= ac % 2 then
                ug = A.ac6f27fe(e4.adb219bd, rm.num_2fb8)
              else
                ug = A.ac6f27fe(e4.adb219bd, rm.num_0d9d)
              end
            elseif 0 ~= ac % 2 then
              ug = A.ac6f27fe({
                ab9049d9 = 255,
                af7ad2a7 = 255,
                aea17af0 = 255
              }, rm.num_2fb8)
            else
              ug = A.ac6f27fe({
                ab9049d9 = 255,
                af7ad2a7 = 255,
                aea17af0 = 255
              }, rm.num_0d9d)
            end
            if vE.Appearance ~= ug then
              A.a4b25f9e()
              vE.Appearance = ug
              vD = true
            end
          end
        end
        if vD then
          local function vI(vJ)
            Cmd(string.format("Copy %s.\"Marker\" At %s.\"Marker\" /o", Obj.ToAddr(vB), Obj.ToAddr(vJ)))
          end
          
          for ac, e4 in pairs(vw) do
            if type(e4) == "userdata" and e4 ~= vB then
              vI(e4)
            elseif type(e4) == "table" then
              for mg, mh in pairs(e4) do
                if type(e4) == "userdata" and e4 ~= vB then
                  vI(mh)
                end
              end
            end
          end
          A.a4b25f9e()
        end
      end
    end
  end
  
  function rm.a24714f4(ry, qF, sW, rD)
    local vw = rD.tbl_36ae
    if 1 == rD.tbl_0c3f.num_d192 then
      vA(ry, vw, qF, rD)
    elseif 1 == rD.tbl_0c3f.num_f7e4 then
      ry.tbl_3940 = nil
      ry.tbl_3940 = {}
      local vK = sW.tbl_13c3[rD.tbl_0c3f.ab9a9eaa]
      local nb = {}
      for ac, e4 in pairs(ry.tbl_9171) do
        if e4.master_idx == vK.master_idx then
          table.insert(nb, e4)
        end
      end
      for ac, e4 in ipairs(nb) do
        local ig
        if ac < #nb then
          ig = nb[ac + 1].a5320370
        else
          ig = qF.trackDurationSecs
        end
        table.insert(ry.tbl_3940, {
          a90ff523 = e4.a90ff523,
          a5320370 = e4.a5320370,
          a72235e2 = ig,
          a3bdc261 = e4.a3bdc261,
          a0d6bdd6 = e4.a0d6bdd6,
          adb219bd = rm.defaultMarkerColor
        })
      end
      vA(ry, vw, qF, rD)
    end
  end
  
  function rm.a134e906(vL)
    local vM = Obj.Count(vL)
    for Q = 2, vM do
      if 2 == Q then
        while not Obj.IsValid(vL[Q]) do
          coroutine.yield(0.02)
        end
      end
      local vN = vL[Q]
      if Obj.IsValid(vN) and not vN.Target then
        Cmd(string.format("Delete %s /nc", Obj.ToAddr(vN)))
        A.a4b25f9e()
      elseif 2 == Q and vN.Name == "Track 1" then
        Cmd(string.format("Delete %s /nc", Obj.ToAddr(vN)))
        A.a4b25f9e()
      end
    end
  end
  
  local function vO(vP, vQ, rA, qF, rD)
    if Obj.Count(vP) > 1 then
      Cmd(string.format("Delete %s.*", Obj.ToAddr(vP)))
      while not Obj.IsValid(vP[1]) do
        coroutine.yield(0.1)
      end
    end
    local vR = vP[1]
    vR.Duration = 0
    vR.Name = ""
    local vS = vR[1]
    if not vS then
      vS = Obj.Append(vR, "CmdSubTrack")
      A.a4b25f9e()
    end
    for ac, e4 in ipairs(rA) do
      if y.g_str_false == "false" or y.g_str_false == "true" and e4.a5320370 <= 20 then
        local vF = e4.a5320370
        if 0 == rD.tbl_0c3f.num_88eb then
          vF = vF + qF.a27f7dd7 + qF.flag_offset * 1 / qF.a9c920d0
        end
        if vQ and vS then
          local vT = vS[ac]
          if not vT then
            vT = Obj.Create(vS, ac)
            if not vT then
              CmdIndirectWait(string.format("Store %s.%s /o", Obj.ToAddr(vS), ac))
              vT = vS[ac]
            end
            if not vT then
              error("Failed to create tempo event")
            end
            A.a4b25f9e()
          end
          rm.tbl_5b39[vT] = true
          if A.a59b6fcc(vT.Time, 2) ~= A.a59b6fcc(vF, 2) then
            A.a4b25f9e()
            vT.Time = vF
          end
          if e4.a9ab5f40 and vT.CueDestination ~= e4.a9ab5f40 then
            A.a4b25f9e()
            vT.CueDestination = e4.a9ab5f40
          end
        end
      end
    end
  end
  
  function rm.createTrack(vU, vL, qF, rD)
    for Q = 1, Obj.Count(vL) do
      if vL[Q].Target == vU.a1925f31 then
        vU.a4570d43 = vL[Q]
        break
      end
    end
    if not vU.a4570d43 then
      vU.a4570d43 = Obj.Append(vL)
      A.a4b25f9e()
    end
    rm.tbl_cd44[vU.a4570d43] = true
    if vU.a4570d43.Name ~= vU.a3bdc261 then
      A.a4b25f9e()
      vU.a4570d43.Name = vU.a3bdc261
    end
    if vU.a4570d43.Target ~= vU.a1925f31 then
      A.a4b25f9e()
      vU.a4570d43.Target = vU.a1925f31
    end
    if 1 == rD.tbl_0c3f.num_c583 and vU.a4570d43.Appearance ~= vU.a4e015bd then
      A.a4b25f9e()
      vU.a4570d43.Appearance = vU.a4e015bd
    end
    while not Obj.ToAddr(vU.a4570d43[1]) do
      coroutine.yield(0.02)
    end
    vU.a4570d43[1].Duration = qF.trackDuration
    vU.a4570d43[1].Start = 0
    if 0 == rD.tbl_0c3f.num_88eb then
      vU.a4570d43[1].Start = qF.a27f7dd7 + qF.flag_offset * 1 / qF.a9c920d0
    end
  end
  
  function rm.a44e263e(qF, rA, rD)
    local vV = rD.tbl_0c3f.tc_handle_b
    if vV and Obj.Parent(vV) ~= rD.tbl_36ae.a0478d8f then
      vV = nil
    end
    if 0 == rD.tbl_0c3f.num_f670 then
      if vV then
        vV.Play = false
      end
      return
    end
    vV = vV or rD.tbl_36ae.a0478d8f["Tempo"]
    if not vV then
      vV = Obj.Append(rD.tbl_36ae.a0478d8f)
      while not Obj.ToAddr(vV[1]) do
        coroutine.yield(0.02)
      end
      vV.Name = "Tempo"
      rD.tbl_0c3f.tc_handle_b = vV
      A.a4b25f9e()
    end
    rm.tbl_cd44[vV] = true
    if vV.Target ~= qF.tc_handle_c then
      A.a4b25f9e()
      vV.Target = qF.tc_handle_c
    end
    rm.a134e906(rD.tbl_36ae.a0478d8f)
    vO(vV, true, rA, qF, rD)
  end
  
  function rm.a3ceb701(qF, rD)
    if not qF.a2f33b31 then
      return
    end
    local vW = rD.tbl_0c3f.a0aa6f36
    if vW and Obj.Parent(vW) ~= rD.tbl_36ae.a81dda6a then
      vW = nil
    end
    vW = vW or rD.tbl_36ae.a81dda6a["Waveform"]
    if not vW then
      vW = Obj.Append(rD.tbl_36ae.a81dda6a)
      vW.Name = "Waveform"
      while not Obj.ToAddr(vW[1]) do
        coroutine.yield(0.02)
      end
      rD.tbl_0c3f.a0aa6f36 = vW
    end
    vW[1].Duration = qF.trackDuration
    local vX = qF.flag_offset * -1 * 1 / qF.a9c920d0
    if 0 == rD.tbl_0c3f.num_88eb then
      vX = vX + qF.a27f7dd7
    end
    A.a4b25f9e()
    vW[1].Start = vX
    vW.Target = qF.a2f33b31
    rm.a134e906(rD.tbl_36ae.a81dda6a)
  end
  
  function rm.a843d74d(qF, sW, rD)
    for ac, e4 in pairs(sW.tbl_13c3) do
      if e4.enabled then
        rm.createTrack(e4, rD.tbl_36ae.adeb7f45, qF, rD)
      end
    end
    rm.a134e906(rD.tbl_36ae.adeb7f45)
  end
  
  function rm.a04edf6c(qF, ry, rD)
    for ac, e4 in ipairs(ry.tbl_9171) do
      if e4.aad45010.enabled and not e4.flag_63f9 then
        local vY = e4.aad45010.a4570d43[1]
        local vZ = vY[1]
        if not vZ then
          vZ = Obj.Append(vY, "CmdSubTrack")
          A.a4b25f9e()
        end
        local v_ = e4.a5320370 + e4.aad45010.flag_offset * 1 / qF.a9c920d0
        e4.aedb44db = v_
        e4.aedb44db = A.a59b6fcc(e4.aedb44db, 6)
        if not (e4.a1534505 and Obj.IsValid(e4.a1534505)) or (e4.a1534505 and Obj.Parent(e4.a1534505)) ~= vZ then
          e4.a1534505 = Obj.Append(vZ)
          A.a4b25f9e()
        end
        rm.tbl_5b39[e4.a1534505] = true
        if e4.a1925f31 and e4.a1534505.CueDestination ~= e4.a1925f31 then
          A.a4b25f9e()
          e4.a1534505.CueDestination = e4.a1925f31
        end
        if A.a59b6fcc(tonumber(e4.a1534505.Time), 6) ~= A.a59b6fcc(e4.aedb44db, 6) then
          A.a4b25f9e()
          e4.a1534505.Time = e4.aedb44db
        end
        local w0, w1
        if -1 == e4.num_eba2 then
          w0 = e4.aad45010.a3763cb3
        else
          w0 = e4.num_eba2
        end
        if w0 == "Go/Off" then
          w1 = true
          w0 = "Go+"
        end
        local w2
        if A.a2c6e9b4(Version(), "2.3.100.0", false) then
          w2 = Enums.AssignmentButtonFunctionsTimecode
        else
          w2 = Enums.AssignmentTimecodeFunctions
        end
        if e4.a1534505.Token ~= w0 and e4.a1534505.Token ~= w2[w0] then
          A.a4b25f9e()
          e4.a1534505.Token = w0
        end
        if e4.a1534505.Token == "Top" then
          e4.a1534505.CueDestination = nil
        end
        if -1 == e4.num_eba2 and rm.af039942[e4.aad45010.a3763cb3] then
          if not (e4.aedbcba5 and Obj.IsValid(e4.aedbcba5)) or (e4.aedbcba5 and Obj.Parent(e4.aedbcba5)) ~= vZ then
            e4.aedbcba5 = Obj.Append(vZ)
            A.a4b25f9e()
          end
          rm.tbl_5b39[e4.aedbcba5] = true
          if w0 == "Temp" or w1 then
            if e4.aedbcba5.Token ~= "Temp" or e4.aedbcba5.Status ~= "Off" then
              A.a4b25f9e()
              e4.aedbcba5.Token = "Temp"
              e4.aedbcba5.Status = "Off"
            end
          elseif e4.aedbcba5.Token ~= "Off" then
            A.a4b25f9e()
            e4.aedbcba5.Token = "Off"
          end
          if nil ~= e4.aedbcba5.CueDestination then
            A.a4b25f9e()
            e4.aedbcba5.CueDestination = nil
          end
          local w3 = e4.aedb44db + e4.aad45010.a993e03c
          if A.a59b6fcc(tonumber(e4.aedbcba5.Time), 6) ~= A.a59b6fcc(w3, 6) then
            A.a4b25f9e()
            e4.aedbcba5.Time = w3
          end
        elseif e4.aedbcba5 and Obj.IsValid(e4.aedbcba5) then
          Obj.Remove(vZ, Obj.Index(e4.aedbcba5))
        end
      end
      if e4.a1534505 then
        rD.tbl_9171[e4.ad40375c].a1534505 = e4.a1534505
        if e4.aedbcba5 then
          rD.tbl_9171[e4.ad40375c].aedbcba5 = e4.aedbcba5
        else
          rD.tbl_9171[e4.ad40375c].aedbcba5 = nil
        end
      end
    end
  end
  
  function rm.aefee716(qF, rD)
    if not rm.tbl_cd44 then
      return
    end
    if not rm.tbl_5b39 then
      return
    end
    for vP, cr in pairs(rm.tbl_cd44) do
      if vP and Obj.IsValid(vP) then
        local w4 = Obj.Children(vP)
        if w4 and #w4 > 0 then
          for cr, vY in pairs(w4) do
            local vZ = vY[1]
            if vZ and Obj.IsValid(vZ) then
              local w5 = Obj.Children(vZ)
              if w5 and #w5 > 0 then
                for cr, vT in pairs(w5) do
                  if not rm.tbl_5b39[vT] then
                    Obj.Remove(vZ, Obj.Index(vT))
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  
  function rm.ae397839(mH, mG, w6, v8)
    for Q = 1, Obj.Count(mH) do
      if A.abb404ee(mH[Q]) and A.abb404ee(mH[Q]) == mG then
        return mH[Q], false
      end
    end
    if not v8 then
      return nil, nil
    end
    local u9 = 0
    local ua
    for Q = 1, Obj.Count(mH) do
      local rP = mH[Q]
      local tS = A.abb404ee(rP)
      if tS then
        if mG > u9 and mG < tS then
          ua = Q
          break
        end
        u9 = tS
      end
    end
    local rP
    if not ua then
      rP = Obj.Append(mH)
    else
      rP = Obj.Insert(mH, ua)
    end
    rP.No = mG
    Obj.Create(rP, 1)
    rP[1].Name = w6
    if 3 == ua then
      rP.Release = 1
      rP.Assert = 1
    end
    return rP, true
  end
  
  function rm.acb97f44(rP, el)
    while rP.TrigType == nil do
      coroutine.yield(0.02)
      rP.TrigType = el
    end
    rP.TrigType = el
  end
  
  function rm.a7131707(ry)
    local w7 = {}
    for ac, e4 in ipairs(ry.tbl_9171) do
      if e4.a1925f31 then
        local iv = Obj.Index(e4.a1925f31)
        if not e4.aad45010.ae141750 then
          e4.aad45010.ae141750 = iv
        elseif iv < e4.aad45010.ae141750 and not e4.aa3bab02 then
          table.insert(w7, e4.a1925f31)
        end
        e4.aad45010.ae141750 = iv
      end
    end
    if #w7 > 0 then
      local jW = "The following cues are not in the same order as their markers in Reaper\n"
      for ac, e4 in pairs(w7) do
        jW = jW .. string.format("\n%s - %s", Obj.ToAddr(e4), e4.Name)
      end
      local hO = {
        title = y.g_full_label .. " - Cues Out of Order",
        icon = y.company_label,
        message = jW,
        commands = {
          {
            value = 0,
            name = "Ok"
          }
        }
      }
      local hP = MessageBox(hO)
    end
  end
  
  function rm.a3d854b5(v, w, w8, gL)
    local w9 = Obj.Create(ShowData().Appearances, A.ab5f5833(ShowData().Appearances, 1))
    if not w9 then
      return w8, gL
    end
    if Obj.GetClass(w9) ~= "Appearance" then
      return w8, gL
    end
    local wa = w8
    local wb = gL or {
      ab9049d9 = 0,
      af7ad2a7 = 0,
      aea17af0 = 0
    }
    w9.BackR = wb.ab9049d9
    w9.BackG = wb.af7ad2a7
    w9.BackB = wb.aea17af0
    w9.BackAlpha = wb.num_9b22
    local wc = GetFocusDisplay().No
    local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(wc)
    local hv = hu.ModalOverlay
    local wd
    wd = Obj.Append(hv, "BaseInput")
    wd["Name"] = y.plugin_label .. "Window"
    wd["H"] = 600
    wd["W"] = 720
    wd["Rows"] = 2
    wd["Columns"] = 1
    wd[1][1]["SizePolicy"] = "Fixed"
    wd[1][1]["Size"] = "60"
    wd[1][2]["SizePolicy"] = "Stretch"
    wd["AutoClose"] = "No"
    wd["CloseOnEscape"] = "No"
    wd["Visible"] = "No"
    local hy = Obj.Append(wd, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 1
    hy["Anchors"] = "0,0"
    hy["Texture"] = "corner3"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label .. " - Color Picker"
    hz["Texture"] = "corner3"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local hB = Obj.Append(wd, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 3
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Fixed"
    hB[1][1]["Size"] = "60"
    hB[1][2]["SizePolicy"] = "Stretch"
    hB[1][3]["SizePolicy"] = "Fixed"
    hB[1][3]["Size"] = "60"
    if not w8 then
      hB[1][1]["Size"] = 0
    end
    local we = Obj.Append(hB, "LineEdit")
    we["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    we["AlignmentV"] = "Center"
    we["Prompt"] = "Label:  "
    we["Content"] = wa
    we["ContentDriven"] = "Yes"
    we["ContentWidth"] = "No"
    we["TextAutoAdjust"] = "Yes"
    we["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    we["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    we["HideFocusFrame"] = "Yes"
    we["PluginComponent"] = w
    we["TextChanged"] = "onLabelChanged" .. "CP"
    v["onLabelChanged" .. "CP"] = function(mX)
      if string.gsub(mX["Content"], " ", "") ~= "" then
        wa = mX["Content"]
      end
    end
    local wf = Obj.Append(hB, "UILayoutGrid")
    wf["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    wf["Rows"] = 1
    wf["Columns"] = 2
    wf[2][1]["SizePolicy"] = "Fixed"
    wf[2][1]["Size"] = 600
    wf[2][2]["SizePolicy"] = "Fixed"
    wf[2][2]["Size"] = 120
    local wg = Obj.Append(wf, "ColorPickHSRect")
    wg["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    wg["PluginComponent"] = w
    wg["Target"] = w9
    local wh = Obj.Append(wf, "UiFader")
    wh["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    wh["Target"] = w9
    wh["Property"] = "Alpha"
    if A.a4077f93() then
      wg["System"] = "RGBBackGround"
      wh["System"] = "HSBBackGround"
    else
      wg["System"] = "BackGround"
      wh["System"] = "BackGround"
    end
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 2
    local tG = Obj.Append(tF, "Button")
    tG["W"] = "100%"
    tG["H"] = "100%"
    tG["X"] = 0
    tG["Y"] = 0
    tG["AlignmentH"] = "Center"
    tG["AlignmentV"] = "Center"
    tG["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tG["Textshadow"] = 1
    tG["HasHover"] = "Yes"
    tG["Text"] = "Cancel"
    tG["Font"] = "Medium20"
    tG["PluginComponent"] = w
    tG["Clicked"] = "OnCancelClicked" .. "CP"
    local tH = Obj.Append(tF, "Button")
    tH["W"] = "100%"
    tH["H"] = "100%"
    tH["AlignmentH"] = "Center"
    tH["AlignmentV"] = "Center"
    tH["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    tH["Textshadow"] = 1
    tH["HasHover"] = "Yes"
    tH["Text"] = "OK"
    tH["Font"] = "Medium20"
    tH["PluginComponent"] = w
    tH["Clicked"] = "OnImportClicked" .. "CP"
    local wi = true
    v["OnCancelClicked" .. "CP"] = function(mX)
      Obj.Delete(hv, Obj.Index(wd))
      wi = false
    end
    v["OnImportClicked" .. "CP"] = function(mX)
      Obj.Delete(hv, Obj.Index(wd))
    end
    wd["Visible"] = "Yes"
    WaitObjectDelete(wd)
    wb = {
      ab9049d9 = w9.BackR,
      af7ad2a7 = w9.BackG,
      aea17af0 = w9.BackB,
      a9b22e25 = w9.BackAlpha
    }
    Obj.Delete(ShowData().Appearances, Obj.Index(w9))
    if wi then
      return wa, wb
    else
      return w8, gL
    end
  end
  
  function rm.a93b1e9f(wj)
    if 0 == wj then
      return 0
    end
    local wk = wj % 256
    local wl = (wj - wk) / 256 % 256
    local wm = (wj - wk) / 65536.0 - wl / 256 - 256
    wj = wm + 256 * wl + 65536 * wk + 16777216
    return wj
  end
  
  rm.defaultMarkerColor = {
    ab9049d9 = 160,
    af7ad2a7 = 0,
    aea17af0 = 0
  }
  rm.defaultGreyColor = {
    ab9049d9 = 80,
    af7ad2a7 = 80,
    aea17af0 = 100
  }
  
  function rm.a5c7e72c(wj, wn)
    wj = tonumber(wj)
    if 0 == wj then
      if 0 == wn then
        return rm.defaultMarkerColor
      else
        return rm.defaultGreyColor
      end
    end
    local wm = wj % 256
    local wl = (wj - wm) / 256 % 256
    local wk = (wj - wm) / 65536.0 - wl / 256 - 256
    if not wm then
      wm = 0
    else
      wm = tonumber(wm)
    end
    if not wl then
      wl = 0
    else
      wl = tonumber(wl)
    end
    if not wk then
      wk = 0
    else
      wk = tonumber(wk)
    end
    return {
      ab9049d9 = wk,
      af7ad2a7 = wl,
      aea17af0 = wm
    }
  end
  
  function rm.ab4bfb7c(wo)
    if wo.ab9049d9 == rm.defaultMarkerColor.ab9049d9 and wo.af7ad2a7 == rm.defaultMarkerColor.af7ad2a7 and wo.aea17af0 == rm.defaultMarkerColor.aea17af0 then
      return 0
    end
    local wj = (256 + wo.ab9049d9) * 65536.0 + wo.af7ad2a7 * 256 + wo.aea17af0
    return wj
  end
  
  function rm.aad72235(mO)
    if not mO.num_9b22 then
      mO.num_9b22 = 150
    end
    local mU = A.a20696f8(mO, "MArkers", nil)
    return mU
  end
  
  function rm.a2064023(wp)
    local mT = wp.RGBA
    local up = tonumber(mT:sub(1, 2), 16)
    local ay = tonumber(mT:sub(3, 4), 16)
    local au = tonumber(mT:sub(5, 6), 16)
    local at = tonumber(mT:sub(7, 8) or "FF", 16)
    return {
      ab9049d9 = up,
      af7ad2a7 = ay,
      aea17af0 = au,
      a9b22e25 = at
    }
  end
  
  function rm.a4b0cf0f(ti, uJ, wq, oZ)
    Obj.Create(DataPool().Sequences, ti)
    local mH = DataPool().Sequences[ti]
    if not mH then
      Obj.Insert(DataPool().Sequences, ti)
      mH = DataPool().Sequences[ti]
      if not mH then
        Cmd(string.format("Store Seq %s /o ; Delete Seq %s Cue 1 /nc", ti, ti))
        mH = DataPool().Sequences[ti]
        if not mH then
          return nil, string.format("Error 15 - Can't create Sequence %s", ti)
        end
      end
    end
    wq = wq and tonumber(wq)
    if wq then
      local wr = DataPool().Sequences[wq]
      if wr then
        Cmd(string.format("Copy Seq %s At %s /o", wq, ti))
      end
    end
    mH.Name = uJ
    A.aaa980e8(mH, oZ)
    A.a4b25f9e()
    return mH
  end
  
  function rm.a48a4a49(ws, wt)
    return wt * 60 / ws
  end
  
  function rm.ad522a3d(wu)
    if wu then
      return wu.RawOffsetTCSlot
    else
      return nil
    end
  end
  
  function rm.aded62b6(wu, rP)
    for Q = 1, Obj.Count(wu) do
      local rL = wu[Q]
      for af = 1, Obj.Count(rL) do
        local vP = rL[af]
        for ac = 1, Obj.Count(vP) do
          local wv = vP[ac]
          local vZ = wv[1]
          if vZ then
            for ww = 1, Obj.Count(vZ) do
              local vT = vZ[ww]
              local wx = vT.CueDestination
              if wx and wx == rP then
                return vT
              end
            end
          end
        end
      end
    end
    return nil, "Can't find cue in timecode"
  end
  
  function rm.aad936b2(wu, rP)
    if not wu.Meter then
      return nil, nil, string.format("Timecode has no meteer track %s", wu["Name"])
    end
    local vT, dl = rm.aded62b6(wu, rP)
    if dl or not vT then
      return nil, nil, dl
    end
    
    local function wy(vT)
      local wz = Obj.Parent(Obj.Parent(vT))
      if m[11][5] * m[11][11] <= m[11][6] then
        return m[11][6]
      end
      return vT.RawTime + wz.RawStart
    end
    
    local wA = wy(vT)
    if not wA then
      return nil, nil, "Can't find event time in timecode"
    end
    if not wu.Meter.Tempo then
      return wA, nil, "No Tempo Track"
    end
    if not wu.Meter.Tempo[1] then
      return wA, nil, "No Tempo Timerange"
    end
    if not wu.Meter.Tempo[1][1] then
      return wA, nil, "No Tempo Timerange SubTrack"
    end
    local wB = {}
    for Q = 1, Obj.Count(wu.Meter.Tempo[1][1]) do
      table.insert(wB, {
        af3214b7 = wu.Meter.Tempo[1][1][Q],
        a67f8032 = wy(wu.Meter.Tempo[1][1][Q])
      })
    end
    table.sort(wB, function(at, au)
      return at.a67f8032 < au.a67f8032
    end)
    local wC
    for Q, wD in ipairs(wB) do
      if Q ~= #wB then
        if wA >= wD.a67f8032 and wA < wB[Q + 1].a67f8032 then
          wC = wD.af3214b7
          break
        end
      else
        wC = wD.af3214b7
        break
      end
    end
    if wC.CueDestination then
      local wE = wC.CueDestination.Name
      if wE then
        wE = string.match(wE, "([0-9]*%-?[0-9]+)%s*BPM")
        if wE then
          wE = string.gsub(wE, "%-", ".")
          wE = tonumber(wE)
          return wA, wE
        end
      end
    end
    return wA, nil, string.format("Can't tempo in timecode %s", wu["Name"])
  end
  
  function rm.a6333c38()
    local wF = A.a24e93a9()
    local wG, ti, mG
    if wF then
      wG = wF.CurrentCue
      ti = tonumber(wF.No)
      if wG then
        mG = A.abb404ee(wG)
      else
        return "No Cue Active"
      end
    else
      return "No Sequence Selected"
    end
    for Q = 1, 9999 do
      local wu = DataPool().Timecodes[Q]
      if wu then
        local wH, wI, dl = rm.aad936b2(wu, wG)
        if wI then
          A.a4b25f9e()
          SetVar(UserVars(), "MATools_BPM", wI)
          return
        end
      end
    end
    return string.format("No tempo found for...\n\nSeq %s - %s\nCue %s - %s\n\nPlease make sure you imported the tempo sequence from MArkers.", wF.No, wF.Name, A.abb404ee(wG), wG.Name)
  end
  
  function rm.ae771990()
    if not pX then
      return "This is not a network version of MArkers"
    end
    local qF, dl = pX.a6ab9715()
    if dl or not qF then
      return dl
    end
    local wu = qF.aa942c2a.tbl_0c3f.tc_handle_a
    local wJ
    if wu then
      wJ = wu.No
    else
      return string.format("Error - No Timecode object found for project '%s'", qF.a3bdc261)
    end
    local vj = rm.ad522a3d(wu)
    local vk = qF.flag_offset
    vk = vk or GetVar(y.g_plugin_var_obj, "latencyOffset") or 0
    vk = tonumber(vk)
    vk = vk * 1 / qF.a9c920d0
    vk = A.a4c6927e(vk)
    local e, dl = pX.a51ef463({
      a38325d7 = "saveTimecodeOffset",
      adeda4ce = A.a9af03ee(vj - vk)
    })
    if dl then
      return dl
    end
  end
  
  function rm.a11b2fc9()
    local e, dl = pX.a51ef463({
      a38325d7 = "play"
    })
    if dl then
      return dl
    end
  end
  
  function rm.a54623ba()
    local e, dl = pX.a51ef463({
      a38325d7 = "pause"
    })
    if dl then
      return dl
    end
  end
  
  function rm.adbfc5c9()
    local e, dl = pX.a51ef463({
      a38325d7 = "stop"
    })
    if dl then
      return dl
    end
  end
  
  function rm.a4f1d7be()
    local e, dl = pX.a51ef463({
      a38325d7 = "record"
    })
    if dl then
      return dl
    end
  end
  
  function rm.ad807958(fD)
    local e, dl = pX.a51ef463({
      a38325d7 = "seek",
      a67a3ae2 = fD
    })
    if dl then
      return dl
    end
  end
  
  function rm.a68ec000(wK, wL)
    local e, dl = pX.a51ef463({
      a38325d7 = "skip",
      a6968c76 = wK,
      a3ebc518 = wL
    })
    if dl then
      return dl
    end
  end
  
  function rm.a10e711c(dx)
    if true == dx then
      dx = 1
    end
    if false == dx then
      dx = 0
    end
    local e, dl = pX.a51ef463({
      a38325d7 = "setRepeat",
      ad2ce7f1 = dx
    })
    if dl then
      return dl
    end
  end
  
  function rm.acb304b9(rP)
    local qF, dl = pX.a6ab9715()
    if dl or not qF then
      return dl
    end
    local wu = qF.aa942c2a.tbl_0c3f.tc_handle_a
    local wJ
    if wu then
      wJ = wu.No
    else
      return "Error - No Timecode object found for project"
    end
    local wM, wN, dl = rm.aad936b2(wu, rP)
    if dl then
      return dl
    end
    wM = A.a9af03ee(wM)
    local wO = GetVar(UserVars(), "MArkers_PreRoll")
    wO = tonumber(wO) or 0
    local wP = wM - wO
    local dl = rm.ad807958(wM)
    if dl then
      return dl
    end
  end
  
  function rm.a0f1fd71(wQ)
    local wF = A.a24e93a9()
    local wG, ti, mG
    if wF then
      wG = wF["CurrentCue"]
      ti = tonumber(wF.No)
      if wG then
        mG = A.abb404ee(wG)
      else
        return "No Cue Active"
      end
    else
      return "No Sequence Selected"
    end
    local dl = rm.acb304b9(wG)
    if dl then
      return dl
    end
    if wQ then
      local dl = rm.a11b2fc9()
      if dl then
        return dl
      end
    end
  end
  
  function rm.a28bd01e(wQ)
    local wF = A.a24e93a9()
    local wG, ti, mG
    if wF then
      wG = wF["CurrentCue"]
      ti = tonumber(wF.No)
      if wG then
        mG = A.abb404ee(wG)
      else
        return "No Cue Active"
      end
    else
      return "No Sequence Selected"
    end
    local wR = Obj.Index(wG)
    local wS = Obj.Parent(wG)[wR + 1]
    if not wS then
      return "Next cue doesn't exist"
    end
    local dl = rm.acb304b9(wS)
    if dl then
      return dl
    end
    if wQ then
      local dl = rm.a11b2fc9()
      if dl then
        return dl
      end
    end
  end
  
  function rm.a547cb02(wQ)
    local qF, dl = pX.a6ab9715()
    if dl or not qF then
      return dl
    end
    local wF = A.a24e93a9()
    local wG, ti, mG
    if wF then
      wG = wF.CurrentCue
      ti = tonumber(wF.No)
      if wG then
        mG = A.abb404ee(wG)
      else
        return "No Cue Active"
      end
    else
      return "No Sequence Selected"
    end
    local wu = qF.aa942c2a.tbl_0c3f.tc_handle_a
    local wJ
    if wu then
      wJ = wu.No
    else
      return "Error - No Timecode object found for project"
    end
    local wO = GetVar(UserVars(), "MArkers_PreRoll")
    wO = tonumber(wO) or 0
    local wT, wU, dl = rm.aad936b2(wu, wG)
    if dl then
      return dl
    end
    local wR = Obj.Index(wG)
    local wS = Obj.Parent(wG)[wR + 1]
    local wV, wW, wX
    if not wS then
      wX = true
    else
      wV, wW, dl = rm.aad936b2(wu, wS)
      if not wV then
        wX = true
      end
    end
    if wX then
      local hO = {
        title = y.g_full_label .. " Loop Time",
        icon = y.company_label,
        message = "The next marker can't be found.\nPlease enter a Loop Time in secs.",
        commands = {
          {
            value = 0,
            name = "Cancel"
          },
          {
            value = 1,
            name = "Loop"
          }
        },
        inputs = {
          {
            name = "Loop Time",
            value = "",
            blackFilter = "",
            whiteFilter = "0123456789",
            vkPlugin = "NumericInput",
            maxTextLength = 4
          }
        }
      }
      local hP = MessageBox(hO)
      if 0 == hP.result then
        return
      end
      local wY = hP.inputs["Loop Time"]
      wY = tonumber(wY)
      if not wY then
        return "Invalid Loop Time"
      end
      wV = wT + A.a4c6927e(wY)
    end
    wT = A.a9af03ee(wT)
    wV = A.a9af03ee(wV)
    local dl = rm.a10e711c(1)
    if dl then
      return dl
    end
    local dl = rm.ad807958(wT)
    if dl then
      return dl
    end
    local e, dl = pX.a51ef463({
      a38325d7 = "setLoop",
      ac40ed7a = wT,
      a7f91941 = wV
    })
    if dl then
      return dl
    end
    if wQ then
      local dl = rm.a11b2fc9()
      if dl then
        return dl
      end
    end
  end
  
  function rm.a3a9538c()
    local e, dl = pX.a51ef463({
      a38325d7 = "setClick",
      ad2ce7f1 = 1
    })
    if dl then
      return dl
    end
  end
  
  function rm.afa22900()
    local e, dl = pX.a51ef463({
      a38325d7 = "setClick",
      ad2ce7f1 = 0
    })
    if dl then
      return dl
    end
  end
  
  function rm.ad73a87a(wZ)
    if true == wZ then
      wZ = 1
    end
    if false == wZ then
      wZ = 0
    end
    local e, dl = pX.a51ef463({
      a38325d7 = "SetAutoSync",
      ad2ce7f1 = wZ
    })
    if dl then
      return dl
    end
  end
  
  function rm.ab491460()
    if not DataPool().Plugins["BPMTimes"] then
      return nil, "This function requires \"MATools - BPMTimes\" plugin to be installed."
    end
    if DataPool().Plugins["BPMTimes"] and not A.a2c6e9b4(DataPool().Plugins["BPMTimes"].Version, "2.0.0.0", true) then
      return nil, "This function requires at least version 2.0.0.0 of \"MATools - BPMTimes\" plugin."
    end
    return true
  end
  
  function rm.a4bc44a6()
    local e, dl = rm.ab491460()
    if dl then
      return dl
    end
    rm.a6333c38()
    Cmd("Plugin \"BPMTimes\" \"Cue\"")
  end
  
  function rm.ad28a468()
    local dl = rm.a6333c38()
    if dl then
      return dl
    end
    local w_ = GetVar(UserVars(), "MAT_Speed_Type") or ""
    DelVar(UserVars(), "MAT_Speed_Type")
    local x0 = GetVar(UserVars(), "MATools_BPM")
    if not x0 or not tonumber(x0) then
      x0 = 120
      SetVar(UserVars(), "MATools_BPM", x0)
    end
    
    local function x1(oz)
      local x2 = oz
      if not A.a4077f93() then
        x2 = x2 / 60
      end
      if string.match(w_, "[Rr][Ee][Cc][Ii][Pp][Ee]") then
        Cmd(string.format("Set Programmer *.* \"SpeedFromX\" %s", x2))
      elseif string.match(w_, "Preset") then
        local x3 = string.match(w_, "%d+%.%d+")
        if x3 then
          Cmd(string.format("Set Preset %s \"SpeedFromX\" %s", x3, x2))
          Cmd(string.format("Set Preset %s.* \"SpeedFromX\" %s", x3, x2))
        else
          return "Error - No Preset Selected"
        end
      else
        Cmd(string.format("Step 1 Thru At Speed %s", oz))
      end
    end
    
    local x4 = Root().ColorTheme.ColorGroups.Global.AlertText
    local z = GetFocusDisplay().No
    if z >= 4 and z <= 7 then
      z = 1
    end
    local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(z)
    local hv = hu.ModalOverlay
    local hw
    local hx = 650
    for Q = 1, Obj.Count(hv) do
      if Q > 2 then
        Obj.Delete(hv, Q)
      end
    end
    hw = Obj.Append(hv, "BaseInput")
    hw["Name"] = y.plugin_label .. "Window"
    hw["H"] = "300"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "No"
    hw["Visible"] = "No"
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 2
    hy["Anchors"] = "0,0"
    hy[2][2]["SizePolicy"] = "Fixed"
    hy[2][2]["Size"] = "50"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label .. " - Set Phaser BPM"
    hz["Texture"] = "corner1"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local hA = Obj.Append(hy, "CloseButton")
    hA["Anchors"] = "1,0"
    hA["Texture"] = "corner2"
    local hB = Obj.Append(hw, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 3
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Stretch"
    hB[1][2]["SizePolicy"] = "Fixed"
    hB[1][2]["Size"] = "40"
    hB[1][3]["SizePolicy"] = "Fixed"
    hB[1][3]["Size"] = "180"
    local hC = Obj.Append(hB, "UIObject")
    hC["text"] = "Select a BPM multiplier"
    hC["ContentDriven"] = "Yes"
    hC["ContentWidth"] = "No"
    hC["TextAutoAdjust"] = "Yes"
    hC["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hC["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    hC["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 1
    }
    hC["Font"] = "Medium20"
    hC["HasHover"] = "No"
    local x5 = Obj.Append(hB, "UILayoutGrid")
    x5["W"] = "100%"
    x5["H"] = "100%"
    x5["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    x5["AlignmentH"] = "Center"
    x5["AlignmentV"] = "Center"
    x5["Padding"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    x5["Rows"] = 1
    x5["Columns"] = 3
    x5[2][1]["SizePolicy"] = "Fixed"
    x5[2][1]["Size"] = 60
    x5[2][2]["SizePolicy"] = "Stretch"
    x5[2][3]["SizePolicy"] = "Fixed"
    x5[2][3]["Size"] = 340
    x5[1][1]["SizePolicy"] = "Fixed"
    x5[1][1]["Size"] = 60
    local x6 = Obj.Append(x5, "TitleButton")
    x6["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    x6["Margin"] = {
      left = 0,
      right = 5,
      top = 5,
      bottom = 5
    }
    x6["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    x6["Icon"] = "time"
    x6["HasHover"] = "No"
    x6["Interactive"] = "No"
    local x7 = Obj.Append(x5, "UIObject")
    x7["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    x7["AlignmentV"] = "Center"
    x7["text"] = "BPM"
    x7["TextAlignmentH"] = "Left"
    x7["ContentDriven"] = "Yes"
    x7["ContentWidth"] = "No"
    x7["TextAutoAdjust"] = "Yes"
    x7["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    x7["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    x7["HasHover"] = "No"
    local x8 = Obj.Append(x5, "LineEdit")
    x8["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    x8["AlignmentV"] = "Center"
    x8["Content"] = x0
    x8["ContentDriven"] = "Yes"
    x8["ContentWidth"] = "No"
    x8["TextAutoAdjust"] = "Yes"
    x8["Anchors"] = {
      left = 2,
      right = 2,
      top = 0,
      bottom = 0
    }
    x8["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    x8["Filter"] = "0123456789."
    x8["VkPluginName"] = "TextInputNumOnly"
    x8["MaxTextLength"] = 7
    x8["HideFocusFrame"] = "Yes"
    x8["PluginComponent"] = w
    x8["TextChanged"] = "OnInputBPMFieldValueTextChanged"
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 2
    tF[2][1]["SizePolicy"] = "Fixed"
    tF[2][1]["Size"] = 140
    local x9 = Obj.Append(tF, "UILayoutGrid")
    x9["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    x9["Rows"] = 2
    x9["Columns"] = 1
    local xa = Obj.Append(tF, "UILayoutGrid")
    xa["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    xa["Rows"] = 2
    xa["Columns"] = 5
    local xb = {
      {
        ["beat"] = 0.03125,
        ["beatLabel"] = "1/32",
        ["anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
      },
      {
        ["beat"] = 0.0625,
        ["beatLabel"] = "1/16",
        ["anchors"] = {
          left = 1,
          right = 1,
          top = 0,
          bottom = 0
        }
      },
      {
        ["beat"] = 0.125,
        ["beatLabel"] = "1/8",
        ["anchors"] = {
          left = 2,
          right = 2,
          top = 0,
          bottom = 0
        }
      },
      {
        ["beat"] = 0.25,
        ["beatLabel"] = "1/4",
        ["anchors"] = {
          left = 3,
          right = 3,
          top = 0,
          bottom = 0
        }
      },
      {
        ["beat"] = 0.5,
        ["beatLabel"] = "1/2",
        ["anchors"] = {
          left = 4,
          right = 4,
          top = 0,
          bottom = 0
        }
      },
      {
        ["beat"] = 1,
        ["beatLabel"] = "1",
        ["anchors"] = {
          left = 0,
          right = 0,
          top = 1,
          bottom = 1
        }
      },
      {
        ["beat"] = 2,
        ["beatLabel"] = "2",
        ["anchors"] = {
          left = 1,
          right = 1,
          top = 1,
          bottom = 1
        }
      },
      {
        ["beat"] = 4,
        ["beatLabel"] = "4",
        ["anchors"] = {
          left = 2,
          right = 2,
          top = 1,
          bottom = 1
        }
      },
      {
        ["beat"] = 8,
        ["beatLabel"] = "8",
        ["anchors"] = {
          left = 3,
          right = 3,
          top = 1,
          bottom = 1
        }
      },
      {
        ["beat"] = 16,
        ["beatLabel"] = "16",
        ["anchors"] = {
          left = 4,
          right = 4,
          top = 1,
          bottom = 1
        }
      }
    }
    for ac, e4 in pairs(xb) do
      e4.a1925f31 = Obj.Append(xa, "Button")
      e4.a1925f31["Anchors"] = e4["anchors"]
      e4.a1925f31["Textshadow"] = 1
      e4.a1925f31["HasHover"] = "Yes"
      e4.a1925f31["Text"] = string.format("%s\n\n(%s BPM)", e4["beatLabel"], A.ab4cf9a2(e4["beat"] * x0, 2))
      e4.a1925f31["Font"] = "Regular14"
      e4.a1925f31["Margin"] = {
        left = 1,
        right = 1,
        top = 1,
        bottom = 1
      }
      if 0 == e4["anchors"]["top"] then
        e4.a1925f31["Margin"]["top"] = 2
      end
      if 1 == e4["anchors"]["top"] then
        e4.a1925f31["Margin"]["bottom"] = 2
      end
      if 4 == e4["anchors"]["left"] then
        e4.a1925f31["Margin"]["right"] = 0
      end
      e4.a1925f31["PluginComponent"] = w
      e4.a1925f31["Clicked"] = string.format("OnBeat%sClicked", e4["beat"])
      v[string.format("OnBeat%sClicked", e4["beat"])] = function(mX)
        local xc = e4["beat"] * x0
        x1(xc)
        Obj.Delete(hv, Obj.Index(hw))
      end
    end
    v["OnInputBPMFieldValueTextChanged"] = function(mX)
      if tonumber(x8["Content"]) then
        x0 = tonumber(x8["Content"])
        SetVar(UserVars(), "MATools_BPM", x0)
        for ac, e4 in pairs(xb) do
          e4.a1925f31["Text"] = string.format("%s\n\n(%s BPM)", e4["beatLabel"], A.ab4cf9a2(e4["beat"] * x0, 2))
        end
      end
    end
    local tG = Obj.Append(x9, "Button")
    tG["W"] = "100%"
    tG["H"] = "100%"
    tG["X"] = 0
    tG["Y"] = 0
    tG["AlignmentH"] = "Center"
    tG["AlignmentV"] = "Center"
    tG["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    tG["Textshadow"] = 1
    tG["HasHover"] = "Yes"
    tG["Text"] = "Cancel"
    tG["Font"] = "Medium20"
    tG["Margin"] = {
      left = 0,
      right = 1,
      top = 1,
      bottom = 0
    }
    tG["PluginComponent"] = w
    tG["Clicked"] = "OnCancelClicked"
    local xd = Obj.Append(x9, "Button")
    xd["W"] = "100%"
    xd["H"] = "100%"
    xd["AlignmentH"] = "Center"
    xd["AlignmentV"] = "Center"
    xd["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    xd["Textshadow"] = 1
    xd["HasHover"] = "Yes"
    xd["Text"] = "Other"
    xd["Font"] = "Medium20"
    xd["Margin"] = {
      left = 0,
      right = 1,
      top = 1,
      bottom = 1
    }
    xd["PluginComponent"] = w
    xd["Clicked"] = "OnOtherClicked"
    v["OnCancelClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
    end
    v["OnOtherClicked"] = function(mX)
      local hO = {
        title = y.g_full_label,
        icon = y.company_label,
        message = string.format("How many beats?", ""),
        commands = {
          {
            value = 0,
            name = "Cancel"
          },
          {
            value = 1,
            name = "Ok"
          }
        },
        inputs = {
          {
            name = "Multiplier",
            value = newNo,
            blackFilter = "",
            whiteFilter = "0123456789./",
            vkPlugin = "NumericInput"
          }
        }
      }
      local hP = MessageBox(hO)
      if 0 == hP.result then
        return
      end
      local wt = tonumber(hP["inputs"]["Multiplier"])
      if not wt then
        local mq, xe
        mq, xe = string.match(hP["inputs"]["Multiplier"], "(%d+)%/(%d+)")
        if not mq or not xe then
          Confirm(y.g_full_label, "Invalid number of beats.", true)
          return
        end
        wt = mq / xe
      end
      local xc = wt * x0
      x1(xc)
      Obj.Delete(hv, Obj.Index(hw))
    end
    hw["Visible"] = "Yes"
    WaitObjectDelete(hw)
  end
  
  A.adbd68f7["offsettimecode"] = function()
    local p2 = string.lower(y.a1620eda or "")
    local xf = string.match(p2, "%s(timecode%s*%d+)") or string.match(p2, "%s(tc%s*%d+)")
    local wu
    if xf then
      wu = GetObject(xf)
      p2 = string.gsub(p2, xf, "")
    end
    local xg, xh, xi, xj, xk
    if string.match(p2, "[%:%;%.]") then
      xh, xi, xj, xk = string.match(p2, "(%d+)%s*[%:%;%.]%s*(%d+)%s*[%:%;%.]%s*(%d+)%s*[%:%;%.]%s*(%d+)%s*")
    else
      xh = string.match(p2, "(%d+)%s*h")
      xi = string.match(p2, "(%d+)%s*m")
      xj = string.match(p2, "(%d+)%s*s")
      xk = string.match(p2, "(%d+)%s*f")
    end
    if not xh and not xi and not xj and not xk then
      A.a880c84e(y.g_full_label, "No offset detected, please check formatting. 01:00:00.00 or 01h 00m 00s 00f", true)
      return
    end
    xg = string.match(p2, "([+-])")
    if xh then
      xh = math.floor(tonumber(xh))
    else
      xh = 0
    end
    if xi then
      xi = math.floor(tonumber(xi))
    else
      xi = 0
    end
    if xj then
      xj = math.floor(tonumber(xj))
    else
      xj = 0
    end
    if xk then
      xk = math.floor(tonumber(xk))
    else
      xk = 0
    end
    rm.timecodeOffset(wu, {
      aee0b217 = xg or 1,
      a3289b61 = xh,
      a56f129b = xi,
      ac709510 = xj,
      a98fbcfd = xk
    })
  end
  
  function rm.timecodeOffset(wu, dP)
    if not wu then
      wu = SelectedTimecode()
      if not wu then
        A.a880c84e(y.g_full_label, "No timecode selected.", true)
        return
      end
    end
    local xl = wu.FrameReadout
    xl = string.gsub(xl, "[%<%>]", "")
    xl = string.match(xl, "(%d+)")
    xl = tonumber(xl or 100)
    local xm = wu.RawOffsetTCSlot
    local xn = A.a19885a6(dP, xl)
    local xo
    if dP.aee0b217 == "+" then
      A.a4b25f9e()
      xo = xm + xn
    elseif dP.aee0b217 == "-" then
      A.a4b25f9e()
      xo = xm - xn
    else
      A.a4b25f9e()
      xo = xn
    end
    wu.RawOffsetTCSlot = xo
  end
  
  function openReaperProject()
    A.a880c84e(y.g_full_label, string.format("The use of LUA \"openReaperProject()\" is no longer supported.\n\nPlease use Plugin %s \"OpenReaperProject\" instead.", y.plugin_label), true)
  end
  
  A.adbd68f7["openreaperproject"] = function()
    local xp = string.gsub(y.a1620eda, "^%s*[Oo][Pp][Ee][Nn][Rr][Ee][Aa][Pp][Ee][Rr][Pp][Rr][Oo][Jj][Ee][Cc][Tt]%s*", "")
    if "" == string.gsub(xp, " ", "") then
      xp = nil
    end
    rm.af7bdc59(xp)
  end
  
  function rm.af7bdc59(xp)
    xp = xp or GetVar(GlobalVars(), string.format("%s_snap_reaper", CurrentUser().Name))
    if not xp then
      ErrPrintf("Open Reaper Project Error - No Reaper project path found")
      return
    end
    if string.gsub(xp, " ", "") == "" then
      ErrPrintf("Open Reaper Project Error - Reaper project path is blank")
      return
    end
    if xp == "nil" then
      ErrPrintf("Open Reaper Project Error - Reaper project path is nil")
      return
    end
    local e, dl = pX.a51ef463({
      a38325d7 = "isProjectDirty"
    }, nil, nil, true)
    if dl then
      return dl
    end
    local xq = true
    if e.acf4591d == "dirty" then
      local hO = {
        title = y.g_full_label,
        icon = y.company_label,
        message = string.format("Your open reaper project is not saved.\n\n%s\n\nPlease choose an option...", e.song_name),
        commands = {
          {
            value = 0,
            name = "Do Nothing"
          },
          {
            value = 1,
            name = "Don't Save"
          },
          {
            value = 2,
            name = "Save"
          }
        }
      }
      local hP = MessageBox(hO)
      if 0 == hP.result then
        return
      elseif 1 == hP.result then
        xq = true
      elseif 2 == hP.result then
        xq = false
      end
    end
    local e, dl = pX.a51ef463({
      a38325d7 = "openProject",
      aefac44a = xp,
      ad0e1f41 = xq,
      abd9ebec = true
    }, reaperIP, reaperPORT, true)
    if dl then
      return dl
    end
  end
  
  return rm
end

rm = rm(y, A, pX, v, w, pb)

local function xr(...)
  local xr = {}
  local y = select(1, ...)
  local A = select(2, ...)
  local rm = select(3, ...)
  local pX = select(4, ...)
  local xs = 32768
  
  function xr.a6346b42(hG)
    hG.a4887d7a = type(hG.a4887d7a) == "number" and hG.a4887d7a >= 0 and hG.a4887d7a <= 127 and 0 == hG.a4887d7a % 1 and hG.a4887d7a or 1
    hG.num_44f1 = type(hG.num_44f1) == "number" and hG.num_44f1 >= 0 and hG.num_44f1 <= 127 and 0 == hG.num_44f1 % 1 and hG.num_44f1 or 1
    hG.num_bf2d = 1 == hG.num_bf2d and 1 or 0
    return xs | hG.a4887d7a << 8 | hG.num_44f1 << 1 | hG.num_bf2d & 1
  end
  
  function xr.a3a91440(hG)
    local xt = {}
    if hG & xs == xs then
      xt.num_bf2d = hG & 1
      xt.num_44f1 = hG >> 1 & 127
      xt.a4887d7a = hG >> 8 & 127
    else
      xt.num_bf2d = 0
      xt.num_44f1 = 1
      xt.a4887d7a = hG
    end
    return xt
  end
  
  function xr.af4f8394(hG)
    local xu = xr.a3a91440(hG)
    if 1 == xu.num_bf2d then
      return string.format("%d%s%d", xu.a4887d7a, 1 == xu.num_bf2d and "R" or "", xu.num_44f1)
    else
      return string.format("%d", xu.a4887d7a)
    end
  end
  
  function xr.afe03d2f(hG)
    return xr.a6346b42({
      a4887d7a = tonumber(string.match(hG, "^%d+") or 1),
      abf2dc54 = string.match(hG, "^%d+%s*[Rr]") and 1 or 0,
      a44f1259 = tonumber(string.match(hG, "^%d+%s*[Rr]%s*(%d+)") or 1)
    })
  end
  
  local function xv(m1)
    local dx = m1 & 4294967295
    if o[1][7] * o[1][7] <= o[1][7] then
      return o[1][7]
    end
    local xw
    
    local function xx()
      dx = 1664525 * dx + 1013904223 & 4294967295
      return dx
    end
    
    local function xy()
      if not i[13][5] or type(i[13][5]) ~= "number" then
        return
      end
      return xx() / 4.294967296E9
    end
    
    local function xz(at, au)
      if nil == au then
        au = at
        at = 1
      end
      local xA = au - at + 1
      if xA <= 1 then
        xw = at
        return at
      end
      local up = xx()
      local xB = up >> 16 & 65535
      local e4 = at + xB % xA
      if e4 == xw then
        e4 = at + (e4 - at + 1) % xA
      end
      xw = e4
      return e4
    end
    
    return {
      a181b512 = xx,
      a3d49efc = xy,
      a2d95ab2 = xz
    }
  end
  
  local function xC(e4)
    local xD = xr.a3a91440(e4.aecfc187.a534eef6)
    if not e4.aecfc187.num_2996 then
      e4.aecfc187.num_2996 = 0
    end
    if not e4.aecfc187.afd0a5fc then
      e4.aecfc187.afd0a5fc = xv(xD.num_44f1)
    end
    if 0 == xD.num_bf2d then
      e4.aecfc187.num_2996 = e4.aecfc187.num_2996 + 1
      if e4.aecfc187.num_2996 > xD.a4887d7a then
        e4.aecfc187.num_2996 = 1
      end
    else
      e4.aecfc187.num_2996 = e4.aecfc187.afd0a5fc.a2d95ab2(1, xD.a4887d7a)
    end
    if s[2][9] * s[2][11] <= s[2][1] then
      return s[2][1]
    end
    return e4.aecfc187.num_2996
  end
  
  function xr.a1f734bc()
    local rz, dl = pX.a51ef463({
      a38325d7 = "midi",
      a20cbdb3 = HandleToInt(DataPool())
    })
    if not rz then
      return nil, dl
    end
    for rG, rT in pairs(rz) do
      for Q, xE in pairs(rT.tbl_b89c) do
        local xF = string.match(xE.a3bdc261, "(%[.-%])")
        if xF then
          xE.a3bdc261 = string.gsub(xE.a3bdc261, "%[.-%]", "")
          xF = string.lower(xF)
          for xG, xH in pairs(rm.a48ca426) do
            if string.match(xF, "%[%s*" .. xH.a137a2ab .. "%s*%]") then
              xE.a04e85a2 = xG
              break
            elseif string.match(xF, "%[%s*" .. xH.str_7b0e .. "%s*%]") then
              xE.a04e85a2 = xG
              break
            end
          end
          xF = string.gsub(xF, "^%[", "")
          xF = string.gsub(xF, "%]$", "")
          xF = string.gsub(xF, "^%s", "")
          xF = string.gsub(xF, "%s$", "")
        end
        xE.num_e467 = 0.1
        if 6 == xE.a04e85a2 or 10 == xE.a04e85a2 or 13 == xE.a04e85a2 or 14 == xE.a04e85a2 then
          xE.num_e467 = tonumber(string.match(xF, "[0-9]*%.?[0-9]+$"))
          if not xE.num_e467 then
            xE.num_e467 = 0.1
          end
        end
        xE.a47f1fc5 = xE.num_e467
        if not xE.index_a then
          xE.index_a = -1
        end
        xE.a534eef6 = xr.a6346b42({
          a4887d7a = 1,
          a44f1259 = 1,
          abf2dc54 = 0
        })
        if 9 == xE.a04e85a2 or 10 == xE.a04e85a2 or 14 == xE.a04e85a2 or 17 == xE.a04e85a2 or 18 == xE.a04e85a2 then
          xE.a534eef6 = xr.a6346b42({
            a4887d7a = tonumber(string.match(xF, "^%d+") or 1),
            abf2dc54 = string.match(xF, "^%d+%s*[Rr]") and 1 or 0,
            a44f1259 = tonumber(string.match(xF, "^%d+%s*[Rr]%s*(%d+)") or 1)
          })
        end
        xE.a202f9c8 = xE.a534eef6
        if not xE.flag_a then
          xE.flag_a = -1
        end
        if not xE.a04e85a2 then
          local xI = GetVar(y.g_plugin_var_obj, "midiSeqType")
          xE.a04e85a2 = tonumber(xI) or 2
        end
        xE.ae33a3fb = xE.a04e85a2
        if not xE.index_b then
          xE.index_b = -1
        end
        xE.a3bdc261 = string.gsub(xE.a3bdc261, "^%s", "")
        xE.a3bdc261 = string.gsub(xE.a3bdc261, "%s$", "")
      end
    end
    return rz
  end
  
  function xr.a95b072e(sW, xJ, xK, ld, xL)
    local xM
    local mH = sW.a1925f31
    for Q = 1, Obj.Count(mH) do
      local rP = mH[Q]
      local tS = A.abb404ee(rP)
      tS = tS and tonumber(tS)
      if tS and xJ <= tS and xK >= tS then
        xM = xM or ""
        xM = string.format("%s, %s", xM, tS)
      end
    end
    if xM then
      local xN = A.a21d4837(mH, rm.str_0c9c .. "DeleteWarning")
      if xN and xN.ad435872 then
        return
      end
      xM = string.gsub(xM, "^%, ", "")
      local hO = {
        title = y.g_full_label .. " Delete Cue?",
        icon = y.company_label,
        message = string.format("Cue(s) %s thru %s in Seq %s '%s' need to be deleted %s\n\nWould you like to keep these cues or remove them?\n\n(%s)", xJ, xK, mH.No, mH.Name, ld, xL),
        commands = {
          {
            value = 0,
            name = "Keep"
          },
          {
            value = 1,
            name = "Delete"
          }
        },
        states = {
          {
            name = "Cue Only   ",
            state = false,
            group = 1
          },
          {
            name = "Don't show again   ",
            state = false,
            group = 1
          }
        }
      }
      local hP = MessageBox(hO)
      if hP.states["Don't show again   "] then
        A.a34ca287(mH, {ad435872 = true}, rm.str_0c9c .. "DeleteWarning")
      end
      if 1 == hP.result then
        if hP.states["Cue Only   "] then
          Cmd(string.format("Delete DataPool %s Sequence %s Cue %s Thru %s /CueOnly /nc", DataPool().No, mH.No, xJ, xK))
        else
          Cmd(string.format("Delete DataPool %s Sequence %s Cue %s Thru %s /nc", DataPool().No, mH.No, xJ, xK))
        end
        A.a34ca287(mH, {ad435872 = false}, rm.str_0c9c .. "DeleteWarning")
      end
    end
  end
  
  function xr.a3c4d4e8(sW, rD)
    local xO = GetVar(y.g_plugin_var_obj, "midiSeqRelTrigBeats")
    local xP = GetVar(y.g_plugin_var_obj, "midiSeqRelFadeBeats")
    local xQ = GetVar(y.g_plugin_var_obj, "midiSeqRelTrigTime")
    local xR = GetVar(y.g_plugin_var_obj, "midiSeqRelFadeTime")
    for ac, e4 in pairs(sW.ab3a0ae8) do
      local mH = e4.a1925f31
      local rK = GetVar(y.g_plugin_var_obj, "midiSeqRelCueNo") or y.a52ba751["midiSeqRelCueNo"].num_3928
      rK = tonumber(rK) or y.a52ba751["midiSeqRelCueNo"].num_3928
      if mH and e4.enabled then
        local xS, xT
        if 1 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Go", true)
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xU
          e4.a2ae383e = nil
          xT = false
        elseif 2 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Go", true)
          xr.a95b072e(e4, 1.001, rK - 0.001, string.format("to allow the Release Cue %s to auto follow from Cue 1", rK), "If you keep the cues the auto-follow may not function as expected")
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Time
          e4.af27b042 = xU
          e4.a2ae383e = nil
          xT = true
        elseif 3 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Top", true)
          e4.str_ab65 = "Top"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xU
          e4.a2ae383e = nil
          xT = false
        elseif 4 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Top", true)
          xr.a95b072e(e4, 1.001, rK - 0.001, string.format("to allow the Release Cue %s to auto follow from Cue 1", rK), "If you keep the cues the auto-follow may not function as expected")
          e4.str_ab65 = "Top"
          xS = Enums.CueTrigger.Time
          e4.af27b042 = xU
          e4.a2ae383e = nil
          xT = true
        elseif 5 == e4.a04e85a2 then
          local xW = {}
          for xX, xY in pairs(e4.abbbba71) do
            if 0 ~= xY then
              local xV
              xW[xY], xV = rm.ae397839(mH, xY, string.format("Cue %s", xY), true)
              if rK <= xY then
                rK = xY + 1
              end
            end
          end
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xW
          e4.a2ae383e = nil
          xT = false
        elseif 6 == e4.a04e85a2 or 15 == e4.a04e85a2 then
          local xW = {}
          for xX, xY in pairs(e4.abbbba71) do
            if 0 ~= xY then
              local xV
              xW[xY], xV = rm.ae397839(mH, xY, string.format("Cue %s", xY), true)
              if xY >= rK then
                rK = xY + 1
              end
            end
          end
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xW
          e4.a2ae383e = "ReleaseCue"
          xT = true
        elseif 7 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Temp", true)
          e4.str_ab65 = "Temp"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xU
          e4.a2ae383e = "ReleaseCue"
          xT = true
        elseif 8 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Flash", true)
          e4.str_ab65 = "Flash"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = nil
          e4.a2ae383e = nil
          xT = false
        elseif 9 == e4.a04e85a2 then
          local xW = {}
          local xD = xr.a3a91440(e4.a534eef6)
          for xZ = 1, xD.a4887d7a do
            local xV
            xW[xZ], xV = rm.ae397839(mH, xZ, string.format("Cue %s", xZ), true)
            if xZ >= rK then
              rK = xZ + 1
            end
          end
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xW
          e4.a2ae383e = nil
          xT = false
        elseif 10 == e4.a04e85a2 or 17 == e4.a04e85a2 then
          local xW = {}
          local xD = xr.a3a91440(e4.a534eef6)
          for xZ = 1, xD.a4887d7a do
            local xV
            xW[xZ], xV = rm.ae397839(mH, xZ, string.format("Cue %s", xZ), true)
            if xZ >= rK then
              rK = xZ + 1
            end
          end
          if xD.a4887d7a > 1 then
            xS = Enums.CueTrigger.Go
          else
            xS = Enums.CueTrigger.Time
          end
          e4.str_ab65 = "Go+"
          e4.af27b042 = xW
          e4.a2ae383e = "ReleaseCue"
          xT = true
        elseif 11 == e4.a04e85a2 then
        elseif 12 == e4.a04e85a2 then
          local xU, xV = rm.ae397839(mH, 1, "Hold", true)
          e4.str_ab65 = "Temp"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = nil
          e4.a2ae383e = nil
        elseif 13 == e4.a04e85a2 then
          local xW, x_ = {}, {}
          for xX, xY in pairs(e4.abbbba71) do
            if 0 ~= xY then
              local y0, y1
              xW[xY], y0 = rm.ae397839(mH, xY, string.format("Cue %s", xY), true)
              x_[xY], y1 = rm.ae397839(mH, xY + 0.1, string.format("Follow %s", xY), true)
              if y1 or x_[xY].TrigType ~= Enums.CueTrigger.Time then
                x_[xY].TrigType = Enums.CueTrigger.Time
                x_[xY].TrigTime = e4.num_e467
              end
              if xY >= rK then
                rK = xY + 1
              end
            end
          end
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xW
          e4.a2ae383e = nil
          xT = false
        elseif 14 == e4.a04e85a2 then
          local xW, x_ = {}, {}
          local xD = xr.a3a91440(e4.a534eef6)
          for xZ = 1, xD.a4887d7a do
            local y0, y1
            xW[xZ], y0 = rm.ae397839(mH, xZ, string.format("Cue %s", xZ), true)
            x_[xZ], y1 = rm.ae397839(mH, xZ + 0.1, string.format("Follow %s", xZ), true)
            if y1 or x_[xZ].TrigType ~= Enums.CueTrigger.Time then
              x_[xZ].TrigType = Enums.CueTrigger.Time
              x_[xZ].TrigTime = e4.num_e467
            end
            if xZ >= rK then
              rK = xZ + 1
            end
          end
          if xD.a4887d7a > 1 then
            xS = Enums.CueTrigger.Go
          else
            xS = Enums.CueTrigger.Time
          end
          e4.str_ab65 = "Go+"
          e4.af27b042 = xW
          e4.a2ae383e = nil
          xT = false
        elseif 16 == e4.a04e85a2 then
          local xW, x_ = {}, {}
          for xX, xY in pairs(e4.abbbba71) do
            if 0 ~= xY then
              local y0, y1
              xW[xY], y0 = rm.ae397839(mH, xY, string.format("Cue %s", xY), true)
              x_[xY], y1 = rm.ae397839(mH, xY + 0.1, string.format("Follow %s", xY), true)
              x_[xY].TrigType = Enums.CueTrigger.Go
              if xY >= rK then
                rK = xY + 1
              end
            end
          end
          e4.str_ab65 = "Go+"
          xS = Enums.CueTrigger.Go
          e4.af27b042 = xW
          e4.a2ae383e = x_
          xT = false
        elseif 18 == e4.a04e85a2 then
          local xW, x_ = {}, {}
          local xD = xr.a3a91440(e4.a534eef6)
          for xZ = 1, xD.a4887d7a do
            local y0, y1
            xW[xZ], y0 = rm.ae397839(mH, xZ, string.format("Cue %s", xZ), true)
            x_[xZ], y1 = rm.ae397839(mH, xZ + 0.1, string.format("Follow %s", xZ), true)
            x_[xZ].TrigType = Enums.CueTrigger.Go
            if xZ >= rK then
              rK = xZ + 1
            end
          end
          if xD.a4887d7a > 1 then
            xS = Enums.CueTrigger.Go
          else
            xS = Enums.CueTrigger.Time
          end
          e4.str_ab65 = "Go+"
          e4.af27b042 = xW
          e4.a2ae383e = x_
          xT = false
        end
        if xT then
          local y2, y3
          if not e4.aa62a591 then
            y2, y3 = rm.ae397839(mH, rK, "Release", true)
          else
            y2 = e4.aa62a591
          end
          rD.tbl_b3fe[e4.a0cefcbd.ad40375c].tbl_b89c[e4.stem_index].aa62a591 = y2
          y2.No = rK
          local y4 = ""
          for ac, Q in pairs(Enums.CueTrigger) do
            if Q == xS then
              y4 = ac
              break
            end
          end
          if y2.TrigType ~= xS and y2.TrigType ~= y4 then
            rm.acb97f44(y2, xS)
            A.a4b25f9e()
          end
          if e4.a2ae383e == "ReleaseCue" then
            e4.a2ae383e = y2
          end
          if y3 then
            A.a4b25f9e()
            if xS == Enums.CueTrigger.Time or xS == Enums.CueTrigger.Time then
              if 1 == xO then
                y2.TrigTime = rm.a48a4a49(e4.num_156e, tonumber(xQ))
              else
                y2.TrigTime = xQ
              end
            end
            if 1 == xP then
              y2[1].CueInFade = rm.a48a4a49(e4.num_156e, tonumber(xR))
            else
              y2[1].CueInFade = xR
            end
            if mH.WrapAround ~= false then
              mH.WrapAround = false
              A.a4b25f9e()
            end
            while nil == mH.OffCue.TrigType do
              coroutine.yield(0.02)
            end
            rm.acb97f44(mH.OffCue, "Follow")
          end
        end
      end
    end
  end
  
  function xr.ad4e11b0(qF, rz, rD)
    for rG, rT in pairs(rz) do
      for rM, y5 in ipairs(rT.tbl_b89c) do
        if y5.a2dc0aa1 then
          for Q = 1, Obj.Count(rT.a6aaa85b) do
            if rT.a6aaa85b[Q].Target == y5.a2dc0aa1 then
              y5.a2dc0aa1 = rT.a6aaa85b[Q]
            end
          end
          A.a4b25f9e()
          Obj.Remove(Obj.Parent(y5.a2dc0aa1), Obj.Index(y5.a2dc0aa1))
          rT.tbl_b89c[rM] = nil
        end
        if y5.enabled then
          rm.createTrack(y5, rT.a6aaa85b, qF, rD)
        end
      end
      rm.a134e906(rT.a6aaa85b)
    end
  end
  
  function xr.a0c7f1a9(qF, rz, rD)
    for rG, rT in pairs(rz) do
      for ac, e4 in ipairs(rT.a01d3537) do
        for mg, mh in pairs(rT.tbl_b89c) do
          if e4.stem_index == mh.stem_index then
            e4.aecfc187 = mh
          end
        end
        if e4.aecfc187 and e4.aecfc187.enabled and not e4.flag_63f9 then
          do
            local vY = e4.aecfc187.a4570d43[1]
            local vZ = vY[1]
            if not vZ then
              vZ = Obj.Append(vY, "CmdSubTrack")
              A.a4b25f9e()
            end
            local v_ = e4.a5320370 + e4.aecfc187.flag_offset * 1 / qF.a9c920d0
            local y6 = e4.a72235e2 + e4.aecfc187.flag_offset * 1 / qF.a9c920d0
            e4.aedb44db = v_
            e4.a0faeb19 = y6
            e4.aedb44db = A.a59b6fcc(e4.aedb44db, 6)
            e4.a0faeb19 = A.a59b6fcc(e4.a0faeb19, 6)
            if 11 ~= e4.aecfc187.a04e85a2 then
              if e4.ae883195 and Obj.IsValid(e4.ae883195) and Obj.Parent(e4.ae883195) ~= vZ then
                A.a4b25f9e()
                Obj.Remove(Obj.Parent(e4.ae883195), Obj.Index(e4.ae883195))
                e4.ae883195 = nil
                e4.a8b29714 = nil
              end
              if not (e4.ae883195 and Obj.IsValid(e4.ae883195)) or Obj.Parent(e4.ae883195) ~= vZ then
                e4.ae883195 = Obj.Append(vZ)
                e4.a8b29714 = Obj.Index(e4.ae883195)
                A.a4b25f9e()
              end
              rm.tbl_5b39[e4.ae883195] = true
              if tonumber(e4.ae883195.Time) ~= e4.aedb44db then
                A.a4b25f9e()
                e4.ae883195.Time = e4.aedb44db
              end
            end
            
            local function y7(vT, y8)
              if vT.CueDestination ~= y8 then
                A.a4b25f9e()
                vT.CueDestination = y8
              end
            end
            
            local w2
            if A.a2c6e9b4(Version(), "2.3.100.0", false) then
              w2 = Enums.AssignmentButtonFunctionsTimecode
            else
              w2 = Enums.AssignmentTimecodeFunctions
            end
            
            local function y9(vT, w0, ya)
              if vT.Token ~= w0 and vT.Token ~= w2[w0] then
                A.a4b25f9e()
                vT.Token = w0
              end
              if r[7][11] < r[7][7] then
                return {}
              end
              if ya and vT.Status ~= ya then
                A.a4b25f9e()
                vT.Status = ya
              end
            end
            
            local function yb()
              if e4.ae883195 then
                Obj.Remove(vZ, Obj.Index(e4.ae883195))
              end
            end
            
            local function yc()
              if e4.a1c5d407 then
                Obj.Remove(vZ, Obj.Index(e4.a1c5d407))
              end
            end
            
            local function yd(sL, y8, ne, ya)
              if e4.a1c5d407 and Obj.IsValid(e4.a1c5d407) and Obj.Parent(e4.a1c5d407) ~= vZ then
                A.a4b25f9e()
                Obj.Remove(Obj.Parent(e4.a1c5d407), Obj.Index(e4.a1c5d407))
                e4.a1c5d407 = nil
                e4.aff8a401 = nil
              end
              if not (e4.a1c5d407 and Obj.IsValid(e4.a1c5d407)) or Obj.Parent(e4.a1c5d407) ~= vZ then
                e4.a1c5d407 = Obj.Append(vZ)
                e4.aff8a401 = Obj.Index(e4.a1c5d407)
                A.a4b25f9e()
              end
              rm.tbl_5b39[e4.a1c5d407] = true
              if tonumber(e4.a1c5d407.Time) ~= A.a59b6fcc(sL, 6) then
                A.a4b25f9e()
                e4.a1c5d407.Time = sL
              end
              y7(e4.a1c5d407, y8)
              y9(e4.a1c5d407, ne, ya)
            end
            
            if 1 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042)
              y9(e4.ae883195, "Go+", nil)
              yc()
            elseif 2 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042)
              y9(e4.ae883195, "Go+", nil)
              yc()
            elseif 3 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042)
              y9(e4.ae883195, "Top", nil)
              yc()
            elseif 4 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042)
              y9(e4.ae883195, "Top", nil)
              yc()
            elseif 5 == e4.aecfc187.a04e85a2 or 13 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042[e4.a77a41bb])
              y9(e4.ae883195, "Go+", nil)
              yc()
            elseif 6 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042[e4.a77a41bb])
              y9(e4.ae883195, "Go+", nil)
              yd(e4.aedb44db + e4.aecfc187.num_e467, e4.aecfc187.a2ae383e, "Go+", nil)
            elseif 7 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042)
              y9(e4.ae883195, "Go+", nil)
              yd(e4.a0faeb19, e4.aecfc187.a2ae383e, "Go+", nil)
            elseif 8 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, nil)
              y9(e4.ae883195, "Flash", "On")
              yd(e4.a0faeb19, nil, "Flash", "Off")
            elseif 9 == e4.aecfc187.a04e85a2 or 14 == e4.aecfc187.a04e85a2 then
              local ye = xC(e4)
              y7(e4.ae883195, e4.aecfc187.af27b042[ye])
              y9(e4.ae883195, "Go+", nil)
              yc()
            elseif 10 == e4.aecfc187.a04e85a2 then
              local ye = xC(e4)
              y7(e4.ae883195, e4.aecfc187.af27b042[ye])
              y9(e4.ae883195, "Go+", nil)
              yd(e4.aedb44db + e4.aecfc187.num_e467, e4.aecfc187.a2ae383e, "Go+")
            elseif 11 == e4.aecfc187.a04e85a2 then
              yb()
              yc()
            elseif 12 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, nil)
              y9(e4.ae883195, "Temp", "On")
              yd(e4.a0faeb19, nil, "Temp", "Off")
            elseif 15 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042[e4.a77a41bb])
              y9(e4.ae883195, "Go+", nil)
              yd(e4.a0faeb19, e4.aecfc187.a2ae383e, "Go+", nil)
            elseif 16 == e4.aecfc187.a04e85a2 then
              y7(e4.ae883195, e4.aecfc187.af27b042[e4.a77a41bb])
              y9(e4.ae883195, "Go+", nil)
              yd(e4.a0faeb19, e4.aecfc187.a2ae383e[e4.a77a41bb], "Go+", nil)
            elseif 17 == e4.aecfc187.a04e85a2 then
              local ye = xC(e4)
              y7(e4.ae883195, e4.aecfc187.af27b042[ye])
              y9(e4.ae883195, "Go+", nil)
              yd(e4.a0faeb19, e4.aecfc187.a2ae383e, "Go+")
            elseif 18 == e4.aecfc187.a04e85a2 then
              local ye = xC(e4)
              y7(e4.ae883195, e4.aecfc187.af27b042[ye])
              y9(e4.ae883195, "Go+", nil)
              yd(e4.a0faeb19, e4.aecfc187.a2ae383e[ye], "Go+")
            end
          end
        end
        if not rD.tbl_b3fe[rG].tbl_b89c[e4.stem_index].tbl_8d59 then
          rD.tbl_b3fe[rG].tbl_b89c[e4.stem_index].tbl_8d59 = {}
        end
        if not rD.tbl_b3fe[rG].tbl_b89c[e4.stem_index].tbl_8d59[e4.ad4987af] then
          rD.tbl_b3fe[rG].tbl_b89c[e4.stem_index].tbl_8d59[e4.ad4987af] = {}
        end
        rD.tbl_b3fe[rG].tbl_b89c[e4.stem_index].tbl_8d59[e4.ad4987af][tostring(e4.a09f63fb)] = {
          a63c22eb = e4.ae883195 or nil,
          a68b09dd = e4.a8b29714 or nil,
          ae22d30f = e4.a1c5d407 or nil,
          acd792cb = e4.aff8a401 or nil
        }
      end
      if rT.tbl_d158 then
        for ac, yf in pairs(rT.tbl_d158) do
          if yf then
            A.a4b25f9e()
            Obj.Remove(Obj.Parent(yf), Obj.Index(yf))
          end
        end
      end
    end
  end
  
  return xr
end

xr = xr(y, A, rm, pX)

local function yg(...)
  local yg = {}
  local y = select(1, ...)
  local A = select(2, ...)
  local pX = select(3, ...)
  local rm = select(4, ...)
  
  function yg.a4d5c370()
    local qz, dl = pX.a51ef463({
      a38325d7 = "markers",
      a20cbdb3 = HandleToInt(DataPool())
    })
    if not qz then
      return nil, dl
    end
    rm.ab34cc2a(qz)
    return qz
  end
  
  function yg.a55a1131()
    local rA, dl = pX.a51ef463({
      a38325d7 = "tempo",
      a20cbdb3 = HandleToInt(DataPool())
    })
    if not rA then
      return nil, dl
    end
    return rA
  end
  
  local function yh(cI)
    if not cI then
      return "nil"
    end
    return A.a59b6fcc(cI / 1048576, 2)
  end
  
  local function yi()
    local yj = Obj.Children(ShowData().MediaPools.Sounds)
    if not yj then
      return 0
    end
    if j[1][14] * j[1][1] <= j[1][10] then
      return j[1][10]
    end
    local yk = 0
    for ac, yl in pairs(yj) do
      if yl and Obj.IsValid(yl) and tonumber(yl.Filesize) then
        yk = yk + yl.Filesize
      end
    end
    return yh(yk)
  end
  
  function yg.a5df0dc7(ve, oZ)
    local ym = A.ab61e23f()
    local q5 = A.a4b7900b(y.plugin_label .. ": ")
    SetProgressRange(y.g_progress[q5], 1, 1)
    SetProgressText(y.g_progress[q5], "Waiting for Reaper to generate audio file")
    IncProgress(y.g_progress[q5], 1)
    local yn = yi()
    local yo, dl = pX.a51ef463({
      a38325d7 = "waveform",
      ac420da5 = ve * 0.25,
      ac524591 = true
    })
    if dl then
      return nil, dl
    end
    A.ad7e2935(q5)
    A.ac167e2b(ym, "Time to get waveform from Reaper")
    if not yo then
      return nil, dl
    end
    if yo.acf4591d == "fail" then
      return nil, "Waveform failed to generate in Reaper"
    end
    if yh(yo.a057ff63) + yn > 100 then
      return nil, string.format("Sound file can't be imported as this will cause all the sound files in your showfile to be greater than MA's 100MB limit.\n\nCurrent total: %sMB\nNew total: %sMB", yn, yn + yh(yo.a057ff63))
    end
    local yp = ShowData().MediaPools.Sounds
    local yq = GetPath(GetPathType(yp)) .. GetPathSeparator()
    local yr = yq .. yo.ad3af9e6
    local ax = io.open(yr, "wb")
    if not ax then
      return nil, "Could not save sound file to local station"
    end
    ax:write(yo.ad3b2478)
    ax:close()
    local yl = yp[yo.a4a6a654]
    local ys
    if not yl or not Obj.IsValid(yl) then
      local dl
      ys, dl = A.ab5f5833(yp, 1)
      if dl then
        return nil, dl
      end
      yl = Obj.Create(yp, ys)
      if not yl then
        Cmd(string.format("Store Sound %s /o", ys))
        yl = yp[ys]
      end
    else
      ys = yl.No
    end
    if not yl then
      return nil, "Can't create Sound pool item, please try again"
    end
    A.aaa980e8(yl, oZ)
    Cmd("Drive 1")
    Cmd(string.format("Import Sound %s /File \"%s\" /Path \"%s\" /o /nc", ys, yo.ad3af9e6, yq))
    yl.Name = yo.a4a6a654
    yo.a87591ee = yl
    return yo
  end
  
  return yg
end

yg = yg(y, A, pX, rm)

local function yt(...)
  local yt = {}
  local y = select(1, ...)
  local A = select(2, ...)
  local rm = select(3, ...)
  local v = select(4, ...)
  local w = select(5, ...)
  local pX = select(6, ...)
  local x = GetPathSeparator()
  local yu = 65
  local yv = 80
  local yw = {}
  local yx, yy, yz, yA, yB, yC, yD, yE
  
  local function yF()
    yB = Root().ColorTheme.ColorGroups.Global.Transparent
    yC = Root().ColorTheme.ColorGroups.Global.Pressed
    yD = Root().ColorTheme.ColorGroups.Button.Background
    if j[7][4] * j[7][3] > j[7][3] then
      return j[7][3]
    end
    yE = Root().ColorTheme.ColorGroups.Global.Text
  end
  
  function yt.a20996e0()
    rm.tbl_34a1 = {}
    for ac, e4 in pairs(rm.a48ca426) do
      rm.tbl_34a1[ac] = {
        a7b0eb83 = e4.a0fc7c03,
        a2cb2374 = ac
      }
    end
    rm.tbl_38d6 = {}
    for ac, e4 in pairs(rm.a604d8b4()) do
      rm.tbl_38d6[ac] = {
        a7b0eb83 = e4.a0fc7c03,
        a2cb2374 = e4.a0fc7c03
      }
    end
    table.sort(rm.tbl_38d6, function(at, au)
      return at.str_7b0e < au.str_7b0e
    end)
    y.a52ba751 = {
      ["ReaperIP"] = {
        ac7d80e0 = "ReaperIP",
        ad7531f0 = "IP Address",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Network Settings",
        a5350180 = "UserVar",
        a658fa74 = false,
        a3928b4a = "127.0.0.1",
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 15,
        a144586b = "ip"
      },
      ["ReaperPORT"] = {
        ac7d80e0 = "ReaperPORT",
        ad7531f0 = "Port",
        a28444ad = 2,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Network Settings",
        a5350180 = "UserVar",
        a658fa74 = false,
        a3928b4a = "29882",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 6,
        a144586b = "input"
      },
      ["latencyOffset"] = {
        ac7d80e0 = "latencyOffset",
        ad7531f0 = "Latency Offset (+/-) frames",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Timings",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "0",
        a5ab9d2a = "0123456789-+",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["ImportUseColors"] = {
        ac7d80e0 = "ImportUseColors",
        ad7531f0 = "Apply Colors",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportCombineColors"] = {
        ac7d80e0 = "ImportCombineColors",
        ad7531f0 = "Combine colored markers into a single sequence",
        a28444ad = 2,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportTCOffset"] = {
        ac7d80e0 = "ImportTCOffset",
        ad7531f0 = "Use TC Slot Offset",
        a28444ad = 3,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportUseBrackets"] = {
        ac7d80e0 = "ImportUseBrackets",
        ad7531f0 = "Use () for cue numbers",
        a28444ad = 4,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportUseSquareBrackets"] = {
        ac7d80e0 = "ImportUseSquareBrackets",
        ad7531f0 = "Use [] for timecode tokens",
        a28444ad = 5,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportUseTriangleBrackets"] = {
        ac7d80e0 = "ImportUseTriangleBrackets",
        ad7531f0 = "Use <> for cue fade times",
        a28444ad = 6,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportUseBraces"] = {
        ac7d80e0 = "ImportUseBraces",
        ad7531f0 = "Use {} for cue CMDs",
        a28444ad = 7,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportUseCaret"] = {
        ac7d80e0 = "ImportUseCaret",
        ad7531f0 = "Use ^^ for sequence labels",
        a28444ad = 8,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportTempoSeq"] = {
        ac7d80e0 = "ImportTempoSeq",
        ad7531f0 = "Import Tempo Sequence",
        a28444ad = 9,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["SetSpeedMasterCmd"] = {
        ac7d80e0 = "SetSpeedMasterCmd",
        ad7531f0 = "Set Speed Master in Cue CMDs",
        a28444ad = 10,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "No",
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 1000,
        a144586b = "swipe",
        afb23588 = rm.a8cd96ec(),
        ae2ecd88 = "str"
      },
      ["ImportUseTempoCmd"] = {
        ac7d80e0 = "ImportUseTempoCmd",
        ad7531f0 = "Set Tempo variable in Cue CMDs",
        a28444ad = 11,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportSetTempoNote"] = {
        ac7d80e0 = "ImportSetTempoNote",
        ad7531f0 = "Add Tempo to Cue Note",
        a28444ad = 12,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["ImportSetTimecodeNote"] = {
        ac7d80e0 = "ImportSetTimecodeNote",
        ad7531f0 = "Add Timecode to Cue Note",
        a28444ad = 13,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["AssignSeqsToPages"] = {
        ac7d80e0 = "AssignSeqsToPages",
        ad7531f0 = "Assign Sequences to Page",
        a28444ad = 14,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["UseReaperMarkerNumbers"] = {
        ac7d80e0 = "UseReaperMarkerNumbers",
        ad7531f0 = "Use Reaper marker numbers as cue numbers",
        a28444ad = 15,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["AppearancesFromRegions"] = {
        ac7d80e0 = "AppearancesFromRegions",
        ad7531f0 = "Cue Appearances From Regions",
        a28444ad = 16,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["LocalLinkingData"] = {
        ac7d80e0 = "LocalLinkingData",
        ad7531f0 = "Local Linking Data",
        a28444ad = 17,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "Import Defaults",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.a17386a9,
        ae2ecd88 = "int"
      },
      ["defSeqName"] = {
        ac7d80e0 = "defSeqName",
        ad7531f0 = "Master Seq Name",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "ProjectName - SeqName",
        a5ab9d2a = "",
        a8a79b92 = "TextInput",
        ad2f6ec1 = 1000,
        a144586b = "input"
      },
      ["defSeqStart"] = {
        ac7d80e0 = "defSeqStart",
        ad7531f0 = "Master Seq No Start from",
        a28444ad = 2,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "1",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["defSeqCue"] = {
        ac7d80e0 = "defSeqCue",
        ad7531f0 = "Master Seq Start Cue",
        a28444ad = 3,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "1",
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 8,
        a144586b = "input"
      },
      ["defSeqToken"] = {
        ac7d80e0 = "defSeqToken",
        ad7531f0 = "Master Seq Token",
        a28444ad = 4,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "Go+",
        a5ab9d2a = "",
        a8a79b92 = "",
        ad2f6ec1 = 10,
        a144586b = "swipe",
        afb23588 = rm.tbl_38d6,
        ae2ecd88 = "str"
      },
      ["defSeqPrio"] = {
        ac7d80e0 = "defSeqPrio",
        ad7531f0 = "Master Seq Priority",
        a28444ad = 5,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "LTP",
        a5ab9d2a = "",
        a8a79b92 = "",
        ad2f6ec1 = 10,
        a144586b = "swipe",
        afb23588 = rm.a44777a5(),
        ae2ecd88 = "str"
      },
      ["defSeqTemplate"] = {
        ac7d80e0 = "defSeqTemplate",
        ad7531f0 = "Master Seq Template",
        a28444ad = 6,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = true,
        a3928b4a = "",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["defSeqFadeUnit"] = {
        ac7d80e0 = "defSeqFadeUnit",
        ad7531f0 = "Master Seq Fade Unit",
        a28444ad = 7,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aa59e6cd,
        ae2ecd88 = "int"
      },
      ["defSeqFadeTime"] = {
        ac7d80e0 = "defSeqFadeTime",
        ad7531f0 = "Master Seq Fade Time",
        a28444ad = 8,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "input"
      },
      ["defSeqColor"] = {
        ac7d80e0 = "defSeqColor",
        ad7531f0 = "Master Seq Color",
        a28444ad = 9,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 32,
        a144586b = "color"
      },
      ["defSeqExecConfig"] = {
        ac7d80e0 = "defSeqExecConfig",
        ad7531f0 = "Master Seq Exec Config",
        a28444ad = 10,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "TextInput",
        ad2f6ec1 = 1000,
        a144586b = "swipe",
        afb23588 = rm.a913c50d(),
        ae2ecd88 = "int"
      },
      ["defSeqUseTimecodeKey"] = {
        ac7d80e0 = "defSeqUseTimecodeKey",
        ad7531f0 = "Master Seq Use Timecode Token as Exec Key",
        a28444ad = 11,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Master Sequence",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["otherSeqName"] = {
        ac7d80e0 = "otherSeqName",
        ad7531f0 = "Other Seq Name",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "ProjectName - SeqName",
        a5ab9d2a = "",
        a8a79b92 = "TextInput",
        ad2f6ec1 = 1000,
        a144586b = "input"
      },
      ["otherSeqStart"] = {
        ac7d80e0 = "otherSeqStart",
        ad7531f0 = "Other Seq No Start from",
        a28444ad = 2,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "1",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["otherSeqCue"] = {
        ac7d80e0 = "otherSeqCue",
        ad7531f0 = "Other Seq No Start Cue",
        a28444ad = 3,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "1",
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 8,
        a144586b = "input"
      },
      ["otherSeqToken"] = {
        ac7d80e0 = "otherSeqToken",
        ad7531f0 = "Other Seq Token",
        a28444ad = 4,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "Go+",
        a5ab9d2a = "",
        a8a79b92 = "",
        ad2f6ec1 = 10,
        a144586b = "swipe",
        afb23588 = rm.tbl_38d6,
        ae2ecd88 = "str"
      },
      ["otherSeqPrio"] = {
        ac7d80e0 = "otherSeqPrio",
        ad7531f0 = "Other Seq Priority",
        a28444ad = 5,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "LTP",
        a5ab9d2a = "",
        a8a79b92 = "",
        ad2f6ec1 = 10,
        a144586b = "swipe",
        afb23588 = rm.a44777a5(),
        ae2ecd88 = "str"
      },
      ["otherSeqTemplate"] = {
        ac7d80e0 = "otherSeqTemplate",
        ad7531f0 = "Other Seq Template",
        a28444ad = 6,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = true,
        a3928b4a = "",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["otherSeqFadeUnit"] = {
        ac7d80e0 = "otherSeqFadeUnit",
        ad7531f0 = "Other Seq Fade Unit",
        a28444ad = 7,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aa59e6cd,
        ae2ecd88 = "int"
      },
      ["otherSeqFadeTime"] = {
        ac7d80e0 = "otherSeqFadeTime",
        ad7531f0 = "Other Seq Fade Time",
        a28444ad = 8,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "input"
      },
      ["tempFlashOffDelay"] = {
        ac7d80e0 = "tempFlashOffDelay",
        ad7531f0 = "Temp / Flash Off Delay",
        a28444ad = 9,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0.1,
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "input"
      },
      ["otherSeqExecConfig"] = {
        ac7d80e0 = "otherSeqExecConfig",
        ad7531f0 = "Other Seq Exec Config",
        a28444ad = 10,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "TextInput",
        ad2f6ec1 = 1000,
        a144586b = "swipe",
        afb23588 = rm.a913c50d(),
        ae2ecd88 = "int"
      },
      ["otherSeqUseTimecodeKey"] = {
        ac7d80e0 = "otherSeqUseTimecodeKey",
        ad7531f0 = "Other Seq Use Timecode Token as Exec Key",
        a28444ad = 11,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Other Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["midiSeqName"] = {
        ac7d80e0 = "midiSeqName",
        ad7531f0 = "MIDI Seq Name",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "SeqName - TrackName - ProjectNameShort",
        a5ab9d2a = "",
        a8a79b92 = "TextInput",
        ad2f6ec1 = 1000,
        a144586b = "input"
      },
      ["midiSeqStart"] = {
        ac7d80e0 = "midiSeqStart",
        ad7531f0 = "MIDI Seq No Start from",
        a28444ad = 2,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "1",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["midiSeqPrio"] = {
        ac7d80e0 = "midiSeqPrio",
        ad7531f0 = "MIDI Seq Priority",
        a28444ad = 3,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "High",
        a5ab9d2a = "",
        a8a79b92 = "",
        ad2f6ec1 = 10,
        a144586b = "swipe",
        afb23588 = rm.a44777a5(),
        ae2ecd88 = "str"
      },
      ["midiSeqType"] = {
        ac7d80e0 = "midiSeqType",
        ad7531f0 = "MIDI Seq Type",
        a28444ad = 4,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 2,
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 2,
        a144586b = "swipe",
        afb23588 = rm.tbl_34a1,
        ae2ecd88 = "int"
      },
      ["midiSeqRelTrigTime"] = {
        ac7d80e0 = "midiSeqRelTrigTime",
        ad7531f0 = "MIDI Seq Release Trig Time",
        a28444ad = 5,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "input"
      },
      ["midiSeqRelTrigBeats"] = {
        ac7d80e0 = "midiSeqRelTrigBeats",
        ad7531f0 = "MIDI Seq Release Trig Unit",
        a28444ad = 6,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aa59e6cd,
        ae2ecd88 = "int"
      },
      ["midiSeqRelFadeTime"] = {
        ac7d80e0 = "midiSeqRelFadeTime",
        ad7531f0 = "MIDI Seq Release Fade Time",
        a28444ad = 7,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "0123456789.",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "input"
      },
      ["midiSeqRelFadeBeats"] = {
        ac7d80e0 = "midiSeqRelFadeBeats",
        ad7531f0 = "MIDI Seq Release Fade Unit",
        a28444ad = 8,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aa59e6cd,
        ae2ecd88 = "int"
      },
      ["midiSeqRelCueNo"] = {
        ac7d80e0 = "midiSeqRelCueNo",
        ad7531f0 = "MIDI Seq Release Cue No",
        a28444ad = 9,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 99,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "input"
      },
      ["midiSeqExecConfig"] = {
        ac7d80e0 = "midiSeqExecConfig",
        ad7531f0 = "MIDI Seq Exec Config",
        a28444ad = 10,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 0,
        a5ab9d2a = "",
        a8a79b92 = "TextInput",
        ad2f6ec1 = 1000,
        a144586b = "swipe",
        afb23588 = rm.a913c50d(),
        ae2ecd88 = "int"
      },
      ["midiSeqUseTimecodeKey"] = {
        ac7d80e0 = "midiSeqUseTimecodeKey",
        ad7531f0 = "MIDI Seq Use Timecode Token as Exec Key",
        a28444ad = 11,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "MIDI Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = 1,
        a5ab9d2a = "",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 16,
        a144586b = "swipe",
        afb23588 = rm.aadab8d7,
        ae2ecd88 = "int"
      },
      ["tempoSeqStart"] = {
        ac7d80e0 = "tempoSeqStart",
        ad7531f0 = "Tempo Seq Start from",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "MArkers Sequences",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "1",
        a5ab9d2a = "0123456789",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = 4,
        a144586b = "input"
      },
      ["execDefSeq"] = {
        ac7d80e0 = "execDefSeq",
        ad7531f0 = "Master Sequence",
        a28444ad = 1,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Executors",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "201 Thru 290",
        a5ab9d2a = "0123456789, TtHhRrUu",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = nil,
        a144586b = "input"
      },
      ["execOtherSeq"] = {
        ac7d80e0 = "execOtherSeq",
        ad7531f0 = "Other Sequences",
        a28444ad = 2,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkers",
          "MArkersPRO",
          "MArkersLIVE"
        },
        aa3e81f0 = "Executors",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "201 Thru 290",
        a5ab9d2a = "0123456789, TtHhRrUu",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = nil,
        a144586b = "input"
      },
      ["execMidiSeq"] = {
        ac7d80e0 = "execMidiSeq",
        ad7531f0 = "MIDI Sequences",
        a28444ad = 3,
        a0da9b00 = {
          [5] = e4.a0fc7c03,
          "MArkersLIVE"
        },
        aa3e81f0 = "Executors",
        a5350180 = "PluginVar",
        a658fa74 = false,
        a3928b4a = "401 Thru 415,301 Thru 315,416 Thru 430,316 Thru 330,431 Thru 445,331 Thru 345,446 Thru 460,346 Thru 360,461 Thru 475,361 Thru 375,476 Thru 490,376 Thru 390",
        a5ab9d2a = "0123456789, TtHhRrUu",
        a8a79b92 = "NumericInput",
        ad2f6ec1 = nil,
        a144586b = "input"
      }
    }
    yt.a3e3e8a3()
  end
  
  local yG = {}
  local yH = {
    [14] = nil,
    "MArkers Settings",
    "Sequence Settings",
    "Assignments"
  }
  local yI = {
    ["MArkers Settings"] = {
      [11] = nil,
      "Network Settings",
      "Timings",
      "Import Defaults"
    },
    ["Sequence Settings"] = {
      [11] = nil,
      "Master Sequence",
      "Other Sequences",
      "MIDI Sequences",
      "MArkers Sequences"
    },
    ["Assignments"] = {
      [11] = nil,
      "Executors"
    }
  }
  
  local function yJ(E)
    local fC = 0
    for ac, e4 in pairs(E) do
      fC = fC + 1
    end
    return fC
  end
  
  local function yK(E)
    local fC = 0
    for ac, e4 in pairs(E) do
      for mg, mh in pairs(e4) do
        fC = fC + 1
      end
    end
    return fC
  end
  
  local function yL()
    local nU = {}
    if not m[11][7] or type(m[11][7]) ~= "number" then
      return
    end
    for ac, e4 in pairs(y.a52ba751) do
      for mg, mh in pairs(e4.a0da9b00) do
        if mh == y.plugin_label then
          nU[ac] = e4
        end
      end
    end
    return nU
  end
  
  local function yM()
    local nU = {}
    local yN = {}
    local yO = 0
    for ac, e4 in pairs(y.a52ba751) do
      for mg, mh in pairs(e4.a0da9b00) do
        if mh == y.plugin_label then
          e4.a5cb1aff = true
          table.insert(yN, e4.aa3e81f0)
        end
      end
    end
    for ac, e4 in ipairs(yH) do
      local yP = 1
      for mg, mh in pairs(yI) do
        for yQ, yR in ipairs(mh) do
          if e4 == mg then
            for yS, yT in pairs(yN) do
              if yT == yR then
                if not nU[e4] then
                  nU[e4] = {}
                end
                if not nU[e4][yR] then
                  nU[e4][yR] = yP
                  yP = yP + 1
                end
              end
            end
          end
        end
      end
    end
    return nU
  end
  
  local function yU()
    local nU = {}
    if p[5][3] * p[5][5] <= p[5][14] then
      return p[5][14]
    end
    for ac, e4 in pairs(yG) do
      for mg, mh in pairs(e4) do
        for Q = 1, yJ(y.a52ba751) do
          for yQ, yR in pairs(y.a52ba751) do
            if mg == yR.aa3e81f0 and yR.a5cb1aff and Q == yR.a28444ad then
              if not nU[mg] then
                nU[mg] = {}
              end
              table.insert(nU[mg], yR)
            end
          end
        end
      end
    end
    return nU
  end
  
  function yt.ac96ddb1()
    local oI = string.format("%s%sMATools%s%s%s", y.g_unset_a["Path"], x, x, y.plugin_label, x)
    local oO = DirList(oI, "*.settings")
    if not oO[1] then
      return A.a880c84e(y.g_full_label .. " - Error", "No Settings Files Found!", true)
    end
    local oP = {}
    for ac, e4 in pairs(oO) do
      if not string.match(e4.name, "^%.") then
        table.insert(oP, {
          "str",
          e4.name
        })
      end
    end
    local mp = PopupInput({
      title = "File",
      caller = y.g_unset_b,
      items = oP
    })
    if mp then
      if not A.a4077f93() then
        mp = mp + 1
      end
      local yV = oP[mp][2]
      yV = yV:gsub(".settings$", "")
      local ox = A.a9a72aef(oI, yV, ".settings", y.plugin_label, true)
      A.a4e33754(ox)
      return true
    end
  end
  
  function yt.aa622ca9()
    local oJ = {
      title = y.g_full_label .. " Export Settings",
      icon = y.company_label,
      message = "Please choose a name for the exported settings file",
      commands = {
        {
          value = 0,
          name = "Cancel"
        },
        {
          value = 1,
          name = "Export"
        }
      },
      inputs = {
        {
          name = "Filename",
          value = string.format("%s_Settings", y.plugin_label),
          blackFilter = ".\\\\/",
          whiteFilter = ""
        }
      }
    }
    local oK = MessageBox(oJ)
    if 0 == oK.result then
      return
    end
    local ox = A.ab503f07(y.a52ba751)
    local oI = string.format("%s%sMATools%s%s%s", y.g_unset_a["Path"], x, x, y.plugin_label, x)
    A.af9f28f1(ox, y.plugin_label, oI, oK.inputs["Filename"], ".settings", true, nil, false)
    return true
  end
  
  function yt.ad71f502(E)
    for ac, e4 in pairs(E.a0da9b00) do
      if e4 == y.plugin_label then
        return true
      end
    end
    return false
  end
  
  function yt.af1c3da0()
    for ac, e4 in pairs(y.a52ba751) do
      if e4.str_5350 == "PluginVar" then
        if yt.ad71f502(e4) and not GetVar(y.g_plugin_var_obj, ac) and not e4.a658fa74 then
          A.a4b25f9e()
          return false
        end
      elseif e4.str_5350 == "UserVar" and yt.ad71f502(e4) and not GetVar(UserVars(), ac) and not e4.a658fa74 then
        A.a4b25f9e()
        return false
      end
    end
    return true
  end
  
  local function yW(E, yX, yY)
    local yZ = Obj.Append(yX, "LineEdit")
    yZ["AlignmentV"] = "Center"
    yZ["Content"] = E.a3c78c74
    yZ["Filter"] = E.a5ab9d2a
    yZ["VkPluginName"] = E.a8a79b92
    yZ["MaxTextLength"] = E.ad2f6ec1
    yZ["ContentDriven"] = "Yes"
    if m[11][10] * m[11][9] <= m[11][8] then
      return m[11][8]
    end
    yZ["ContentWidth"] = "No"
    yZ["TextAutoAdjust"] = "Yes"
    yZ["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    yZ["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    yZ["HideFocusFrame"] = "Yes"
    yZ["PluginComponent"] = w
    yZ["TextChanged"] = string.format("OnInputChanged%s", E.ac7d80e0)
    yZ["Texture"] = "corner15"
    yZ["FocusGet"] = "ItemGetFocus"
    yY[E.ac7d80e0] = yZ
    v[string.format("OnInputChanged%s", E.ac7d80e0)] = function(mX)
      E.a3c78c74 = yZ["Content"]
    end
    v["ItemGetFocus"] = function(mX)
      mX:SetCursorToEnd()
    end
    return yY
  end
  
  local function y_(E, yX, yY)
    local z0 = Obj.Append(yX, "UILayoutGrid")
    z0["W"] = "100%"
    z0["H"] = "100%"
    z0["Name"] = "ItemGrid"
    z0["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    z0["AlignmentH"] = "Center"
    z0["AlignmentV"] = "Top"
    z0["Rows"] = 1
    z0["Columns"] = 2
    z0["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    z0[2][2]["Size"] = "60"
    z0[2][2]["SizePolicy"] = "Fixed"
    local z1 = Obj.Append(z0, "LineEdit")
    z1["AlignmentV"] = "Center"
    z1["Content"] = E.a3c78c74
    z1["Filter"] = E.a5ab9d2a
    z1["VkPluginName"] = E.a8a79b92
    z1["MaxTextLength"] = E.ad2f6ec1
    z1["ContentDriven"] = "Yes"
    z1["ContentWidth"] = "No"
    z1["TextAutoAdjust"] = "Yes"
    z1["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    z1["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    z1["Margin"] = {
      left = 0,
      right = 5,
      top = 0,
      bottom = 0
    }
    z1["HideFocusFrame"] = "Yes"
    z1["PluginComponent"] = w
    z1["TextChanged"] = string.format("OnInputChanged%s", E.ac7d80e0)
    z1["Texture"] = "corner15"
    z1["FocusGet"] = "ItemGetFocus"
    yY[E.ac7d80e0] = z1
    local z2 = Obj.Append(z0, "IndicatorButton")
    z2["AlignmentV"] = "Center"
    z2["Text"] = "Ping"
    if i[8][12] * i[8][2] <= i[8][14] then
      return i[8][14]
    end
    z2["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    z2["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    z2["HideFocusFrame"] = "Yes"
    z2["PluginComponent"] = w
    z2["Texture"] = "corner15"
    z2["Clicked"] = string.format("OnPing%s", E.ac7d80e0)
    v[string.format("OnPing%s", E.ac7d80e0)] = function(mX)
      local ec, dl = pX.adf47c53(z1["Content"])
      if dl then
        A.a880c84e("Ping Error", dl, true)
        return
      end
      A.a880c84e("Ping Result", ec.a1e8881d, true)
    end
    v[string.format("OnInputChanged%s", E.ac7d80e0)] = function(mX)
      E.a3c78c74 = z1["Content"]
    end
    v["ItemGetFocus"] = function(mX)
      mX:SetCursorToEnd()
    end
    return yY
  end
  
  local function z3(E, yX, yY)
    local z4 = Obj.Append(yX, "LineEdit")
    z4["AlignmentV"] = "Center"
    z4["Content"] = E.a3c78c74
    z4["Filter"] = E.a5ab9d2a
    z4["VkPluginName"] = E.a8a79b92
    z4["MaxTextLength"] = E.ad2f6ec1
    z4["ContentDriven"] = "Yes"
    z4["ContentWidth"] = "No"
    z4["TextAutoAdjust"] = "Yes"
    z4["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    z4["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    z4["HideFocusFrame"] = "Yes"
    z4["Texture"] = "corner15"
    z4["ShowKeyBoardButton"] = "No"
    z4["Enabled"] = "No"
    yY[E.ac7d80e0] = z4
    return yY
  end
  
  local function z5(E, yX, yY)
    local function z6(mV, z7, hv, hu)
      local yB = Root().ColorTheme.ColorGroups.Global.Transparent
      
      local z8 = Root().ColorTheme.ColorGroups.IndicatorControl.ColorIndicator
      local hw
      local hx = 600
      local z9
      hw = Obj.Append(hv, "BaseInput")
      hw["Name"] = "MArkersColorSettingsWindow"
      hw["H"] = "0"
      hw["W"] = hx
      hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
      hw["MinSize"] = string.format("%s,0", hx - 100)
      hw["Rows"] = 2
      hw["Columns"] = 1
      hw[1][1]["SizePolicy"] = "Fixed"
      hw[1][1]["Size"] = "60"
      hw[1][2]["SizePolicy"] = "Stretch"
      hw["AutoClose"] = "No"
      hw["CloseOnEscape"] = "Yes"
      hw["AutoCloseOnOverlay"] = "No"
      local hy = Obj.Append(hw, "TitleBar")
      hy["Rows"] = 1
      hy["Columns"] = 1
      hy["Anchors"] = "0,0"
      hy[2][1]["SizePolicy"] = "Stretch"
      hy["Texture"] = "corner2"
      local hz = Obj.Append(hy, "TitleButton")
      hz["text"] = y.g_full_label .. " - Choose"
      hz["Texture"] = "corner3"
      hz["Anchors"] = "0,0"
      hz["Icon"] = y.company_label
      local hB = Obj.Append(hw, "DialogFrame")
      hB["H"] = "100%"
      hB["W"] = "100%"
      hB["Rows"] = 2
      hB["Columns"] = 1
      hB["Anchors"] = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
      }
      hB[1][1]["SizePolicy"] = "Stretch"
      hB[1][2]["SizePolicy"] = "Fixed"
      hB[1][2]["Size"] = 60
      local tu = Obj.Append(hB, "ScrollContainer")
      tu["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      tu["MaxSize"] = "0,100%"
      tu["ContentDriven"] = "Yes"
      tu["ContentWidth"] = "No"
      tu["Padding"] = {
        left = 0,
        right = 5,
        top = 0,
        bottom = 0
      }
      tu["Margin"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      tu["DefaultMargin"] = 0
      tu["Transparent"] = "No"
      local tv = Obj.Append(tu, "ScrollBox")
      tv["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      tv["ContentDriven"] = "Yes"
      tv["ContentWidth"] = "No"
      tv["Padding"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      tv["Margin"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      local za = Obj.Append(tv, "UILayoutGrid")
      za["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      za["Rows"] = #mV + 1
      za["Columns"] = 1
      za["Margin"] = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2
      }
      za[1][1]["SizePolicy"] = "Fixed"
      za[1][1]["Size"] = 60
      local zb = Obj.Append(za, "UIObject")
      zb["text"] = "If you can't see the colour you want, first import a project and choose a colour from the settings cog window on the project import window."
      zb["ContentDriven"] = "Yes"
      zb["ContentWidth"] = "No"
      zb["TextAutoAdjust"] = "Yes"
      zb["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      zb["Padding"] = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      }
      zb["HasHover"] = "No"
      zb["Font"] = "Medium20"
      zb["BackColor"] = yB
      local zc = 1
      for ac, e4 in pairs(mV) do
        za[1][zc + 1]["SizePolicy"] = "Fixed"
        za[1][zc + 1]["Size"] = 60
        local zd = Obj.Append(za, "Button")
        zd["Margin"] = {
          left = 2,
          right = 2,
          top = 2,
          bottom = 2
        }
        zd["Anchors"] = {
          left = 0,
          right = 0,
          top = zc,
          bottom = zc
        }
        zd["Textshadow"] = 1
        zd["HasHover"] = "Yes"
        zd["Texture"] = "corner15"
        zd["PluginComponent"] = w
        zd["Clicked"] = string.format("OnChooseColor%sClicked", e4.abd77275)
        zd["BackColor"] = e4.ab4cd56b
        v[string.format("OnChooseColor%sClicked", e4.abd77275)] = function(mX)
          z9 = e4
          Obj.Delete(Obj.Parent(hw), Obj.Index(hw))
        end
        zc = zc + 1
      end
      local tF = Obj.Append(hB, "UILayoutGrid")
      tF["W"] = "100%"
      tF["H"] = "100%"
      tF["Anchors"] = {
        left = 0,
        right = 0,
        top = hB.Rows - 1,
        bottom = hB.Rows - 1
      }
      tF["AlignmentH"] = "Center"
      tF["AlignmentV"] = "Center"
      tF["Rows"] = 1
      tF["Columns"] = 1
      tF["Margin"] = {
        left = 0,
        right = 0,
        top = 10,
        bottom = 0
      }
      local tH = Obj.Append(tF, "Button")
      tH["Margin"] = {
        left = 1,
        right = 1,
        top = 2,
        bottom = 0
      }
      tH["AlignmentH"] = "Center"
      tH["AlignmentV"] = "Center"
      tH["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      tH["Textshadow"] = 1
      tH["HasHover"] = "Yes"
      tH["Text"] = "Close"
      tH["Font"] = "Medium20"
      tH["PluginComponent"] = w
      tH["Clicked"] = "OnFinishedChooseColoeClicked"
      v["OnFinishedChooseColoeClicked"] = function(mX)
        Obj.Delete(hv, Obj.Index(hw))
      end
      WaitObjectDelete(hw)
      return z9
    end
    
    local yZ = Obj.Append(yX, "Button")
    yZ["AlignmentV"] = "Center"
    yZ["ContentDriven"] = "Yes"
    yZ["ContentWidth"] = "No"
    yZ["Text"] = "Choose"
    yZ["TextAutoAdjust"] = "Yes"
    yZ["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    yZ["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    yZ["HideFocusFrame"] = "Yes"
    yZ["PluginComponent"] = w
    yZ["Texture"] = "corner15"
    yZ["Clicked"] = string.format("OnInputChanged%s", E.ac7d80e0)
    yZ["BackColor"] = rm.aad72235(rm.a5c7e72c(E.a3c78c74, 0))
    yY[E.ac7d80e0] = yZ
    v[string.format("OnInputChanged%s", E.ac7d80e0)] = function(mX)
      local hv = yX
      local hu = yX
      for Q = 1, 30 do
        hv = Obj.Parent(hv)
        if Obj.GetClass(hv) == "BaseInput" then
          hv = hv.ModalOverlay
          break
        end
      end
      for Q = 1, 30 do
        hu = Obj.Parent(hu)
        if Obj.GetClass(hu) == "Display" then
          break
        end
      end
      local ze = {}
      if Root().ColorTheme.ColorGroups["MArkers"] then
        for Q = 1, Obj.Count(Root().ColorTheme.ColorGroups["MArkers"]) do
          local zf = Root().ColorTheme.ColorGroups["MArkers"][Q]
          local zg = rm.ab4bfb7c(rm.a2064023(zf))
          table.insert(ze, {
            a7b0eb83 = "",
            a0fc7c03 = "",
            ab4cd56b = zf,
            abd77275 = zg
          })
        end
      end
      local zh = z6(ze, {}, hv, hu)
      if zh then
        mX["BackColor"] = zh.ab4cd56b
        rm.aff73f79(zh.abd77275)
        E.a3c78c74 = zh.abd77275
      end
    end
    return yY
  end
  
  local function zi(zj, zk)
    if zj then
      Obj.WaitInit(zj)
    end
    local yC = Root().ColorTheme.ColorGroups.Global.Pressed
    local zl = yw[zk]
    local zm = Obj.FindRecursive(zj, "settingsGrid")
    if zm then
      Obj.Delete(zj, Obj.Index(zm))
    end
    local zn = Obj.Append(zj, "UILayoutGrid")
    zn["W"] = "100%"
    zn["H"] = "100%"
    zn["Name"] = "settingsGrid"
    zn["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    zn["AlignmentH"] = "Center"
    zn["AlignmentV"] = "Top"
    zn["Rows"] = 2
    zn["Columns"] = 1
    zn["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zn[1][1]["Size"] = yu
    zn[1][1]["SizePolicy"] = "Fixed"
    zn[1][2]["SizePolicy"] = "Stretch"
    if string.lower(zk:gsub("%s+", "")) == "networksettings" then
      zn["Rows"] = 3
      zn[1][2]["SizePolicy"] = "Content"
      zn[1][3]["SizePolicy"] = "Stretch"
      local zo = Obj.Append(zn, "UIObject")
      zo["Anchors"] = {
        left = 0,
        right = 0,
        top = zn.Rows - 2,
        bottom = zn.Rows - 2
      }
      zo["HasHover"] = "No"
      zo["Margin"] = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 10
      }
      zo["Padding"] = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
      }
      zo["Name"] = "SettingsInfoWrapper"
      zo["Texture"] = "corner15"
      zo["BackColor"] = yz
      local zp = Obj.Append(zo, "UIObject")
      zp["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      zp["HasHover"] = "No"
      zp["Margin"] = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0
      }
      zp["Padding"] = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10
      }
      zp["Name"] = "SettingsInfo"
      zp["Text"] = "You can either enter an IP address manually or use the auto-discovery feature."
      zp["BackColor"] = yB
      zp["Font"] = "Regular16"
      zp["ContentDriven"] = "Yes"
    end
    local zq = Obj.Append(zn, "UIObject")
    zq["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zq["HasHover"] = "No"
    zq["Margin"] = {
      left = 10,
      right = 0,
      top = 0,
      bottom = 0
    }
    zq["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    zq["Name"] = "SettingsTitle"
    zq["Text"] = zk
    zq["BackColor"] = yB
    zq["Font"] = "Medium20"
    local zr = Obj.Append(zn, "UIObject")
    zr["Anchors"] = {
      left = 0,
      right = 0,
      top = zn.Rows - 1,
      bottom = zn.Rows - 1
    }
    zr["HasHover"] = "No"
    zr["BackColor"] = yz
    zr["Texture"] = "corner15"
    zr["Margin"] = {
      left = 10,
      right = 0,
      top = 0,
      bottom = 0
    }
    zr["Padding"] = {
      left = 5,
      right = 5,
      top = 10,
      bottom = 10
    }
    zr["Name"] = "ContentWrapper"
    local tu = Obj.Append(zr, "ScrollContainer")
    tu["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tu["MaxSize"] = "0,100%"
    tu["ContentDriven"] = "Yes"
    tu["ContentWidth"] = "No"
    tu["Padding"] = {
      left = 5,
      right = 5,
      top = 0,
      bottom = 0
    }
    tu["Visible"] = "No"
    local tv = Obj.Append(tu, "ScrollBox")
    tv["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tv["ContentDriven"] = "Yes"
    tv["ContentWidth"] = "No"
    local x5 = Obj.Append(tv, "UILayoutGrid")
    x5["W"] = "100%"
    x5["H"] = "100%"
    x5["Name"] = "InputGrid"
    x5["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    x5["AlignmentH"] = "Center"
    x5["AlignmentV"] = "Top"
    x5["Rows"] = yJ(zl)
    x5["Columns"] = 1
    x5["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    local yO = 0
    local gC = 1
    local yY = {}
    for ac, e4 in ipairs(zl) do
      x5[1][gC]["Size"] = yv
      x5[1][gC]["SizePolicy"] = "Fixed"
      gC = gC + 1
      local zs = Obj.Append(x5, "UIObject")
      zs["Anchors"] = {
        left = 0,
        right = 0,
        top = yO,
        bottom = yO
      }
      zs["HasHover"] = "No"
      zs["Margin"] = {
        left = 0,
        right = 0,
        top = 10,
        bottom = 0
      }
      zs["Padding"] = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      }
      zs["Name"] = "ItemWrapper"
      zs["Texture"] = "corner15"
      zs["BackColor"] = yy
      local zt = Obj.Append(zs, "UILayoutGrid")
      zt["W"] = "100%"
      zt["H"] = "100%"
      zt["Name"] = "ItemGrid"
      zt["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      zt["AlignmentH"] = "Center"
      zt["AlignmentV"] = "Top"
      zt["Rows"] = 1
      zt["Columns"] = 2
      zt["Margin"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      zt[2][1]["Size"] = "300"
      zt[2][1]["SizePolicy"] = "Fixed"
      local zu = Obj.Append(zt, "UIObject")
      zu["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      zu["HasHover"] = "No"
      zu["Margin"] = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0
      }
      zu["Padding"] = {
        left = 10,
        right = 10,
        top = 2,
        bottom = 2
      }
      zu["Name"] = "SettingsTitle"
      zu["Text"] = e4.str_d753 .. ": "
      zu["TextAutoAdjust"] = true
      zu["TextAlignmentH"] = "Right"
      zu["BackColor"] = yB
      if e4.a144586b == "swipe" then
        e4.ad088220 = true
        e4.str_031d = "Select"
        e4.aa749a18 = {
          left = 1,
          right = 1,
          top = 0,
          bottom = 0
        }
        e4.ab21b3aa = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        e4.a7115302 = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        yY[ac] = A.ab06e3d9({
          a2ac9f94 = {
            a01d416c = zt,
            aa749a18 = {
              left = 1,
              right = 1,
              top = 0,
              bottom = 0
            },
            ab21b3aa = {
              left = 10,
              right = 10,
              top = 10,
              bottom = 10
            },
            a7115302 = {
              left = 0,
              right = 0,
              top = 0,
              bottom = 0
            },
            ad088220 = true,
            aa86fe72 = "Select",
            a6e71315 = w,
            add46b74 = v
          },
          aa72fe59 = e4.a3c78c74,
          a4ba497e = true,
          accc0f89 = true,
          aea86235 = e4.afb23588,
          a7f071c5 = function(e)
            local ic
            if e4.str_e2ec == "int" then
              ic = e.aa6d9a63
            elseif e4.str_e2ec == "str" then
              ic = e.ab6e56b2
            elseif e4.str_e2ec == "handle" then
              ic = e.a1614780
            end
            if not ic then
              return
            end
            e4.a3c78c74 = ic
          end
        })
      end
      if e4.a144586b == "input" then
        yY[ac] = yW(e4, zt, yY)
      end
      if e4.a144586b == "ip" then
        yY[ac] = y_(e4, zt, yY)
      end
      if e4.a144586b == "display" then
        yY[ac] = z3(e4, zt, yY)
      end
      if e4.a144586b == "color" then
        yY[ac] = z5(e4, zt, yY)
      end
      yO = yO + 1
    end
    if zk == "Network Settings" then
      do
        local zv = yJ(zl) + 4
        x5["Rows"] = zv
        x5[1][zv - 3]["Size"] = yv
        x5[1][zv - 3]["SizePolicy"] = "Fixed"
        x5[1][zv - 2]["Size"] = yv
        x5[1][zv - 2]["SizePolicy"] = "Fixed"
        x5[1][zv - 1]["Size"] = yv
        x5[1][zv - 1]["SizePolicy"] = "Fixed"
        x5[1][zv]["Size"] = yv
        x5[1][zv]["SizePolicy"] = "Fixed"
        local zw = Root().ColorTheme.ColorGroups.Global.LabelText
        local zx = Obj.Append(x5, "UIObject")
        zx["Anchors"] = {
          left = 0,
          right = 0,
          top = zv - 4,
          bottom = zv - 4
        }
        zx["HasHover"] = "No"
        zx["Margin"] = {
          left = 0,
          right = 0,
          top = 10,
          bottom = 0
        }
        zx["Padding"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        zx["Name"] = "ItemWrapper"
        zx["Texture"] = "corner15"
        zx["BackColor"] = yy
        local zy = Obj.Append(x5, "UIObject")
        zy["Anchors"] = {
          left = 0,
          right = 0,
          top = zv - 3,
          bottom = zv - 3
        }
        zy["HasHover"] = "No"
        zy["Margin"] = {
          left = 0,
          right = 0,
          top = 10,
          bottom = 0
        }
        zy["Padding"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        zy["Name"] = "ItemWrapper"
        zy["Texture"] = "corner15"
        zy["BackColor"] = yy
        zy["Text"] = "Station Info"
        zy["Font"] = "Regular14"
        zy["TextColor"] = zw
        zy["TextAlignmentH"] = "Left"
        zy["TextAlignmentV"] = "Top"
        local zz = Obj.Append(x5, "UIObject")
        zz["Anchors"] = {
          left = 0,
          right = 0,
          top = zv - 2,
          bottom = zv - 2
        }
        zz["HasHover"] = "No"
        zz["Margin"] = {
          left = 0,
          right = 0,
          top = 10,
          bottom = 0
        }
        zz["Padding"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        zz["Name"] = "ItemWrapper"
        zz["Texture"] = "corner15"
        zz["BackColor"] = yy
        local zA = Obj.Append(x5, "UIObject")
        zA["Anchors"] = {
          left = 0,
          right = 0,
          top = zv - 1,
          bottom = zv - 1
        }
        zA["HasHover"] = "No"
        zA["Margin"] = {
          left = 0,
          right = 0,
          top = 10,
          bottom = 0
        }
        zA["Padding"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        zA["Name"] = "ItemWrapper"
        zA["Texture"] = "corner15"
        zA["BackColor"] = yy
        local zB = Obj.Append(zx, "Button")
        zB["Anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zB["Padding"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        zB["Texture"] = "corner15"
        zB["Text"] = "Auto Discover Reaper Station"
        zB["MouseDownHold"] = string.format("Hold%s", "IPSettings")
        zB["ClickedRight"] = string.format("Hold%s", "IPSettings")
        zB["Clicked"] = string.format("Clicked%s", "IPSettings")
        zB["MouseDown"] = string.format("MouseDown%s", "IPSettings")
        zB["MouseUp"] = string.format("MouseUp%s", "IPSettings")
        zB["MouseLeave"] = string.format("MouseLeave%s", "IPSettings")
        zB["MouseEnter"] = string.format("MouseEnter%s", "IPSettings")
        zB["PluginComponent"] = w
        zB["Icon"] = "SwipeButtonIcon"
        zB["IconAlignmentV"] = "Top"
        zB["IconAlignmentH"] = "Right"
        zB["HideFocusFrame"] = "Yes"
        local zC = Obj.Append(zB, "UIObject")
        zC["Name"] = "stationSelectLabel"
        zC["Text"] = "Select"
        zC["Font"] = "Regular14"
        zC["BackColor"] = yB
        zC["TextAlignmentV"] = "Top"
        zC["TextAlignmentH"] = "Left"
        zC["PluginComponent"] = w
        zC["HasPressedAnimation"] = "No"
        zC["HasHover"] = "No"
        zC["Interactive"] = "No"
        zC["TextColor"] = zw
        local zD = Obj.Append(zy, "UIObject")
        zD["Anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zD["HasHover"] = "No"
        zD["Margin"] = {
          left = 0,
          right = 0,
          top = 10,
          bottom = 0
        }
        zD["Padding"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        zD["Name"] = "stationInfo"
        zD["BackColor"] = yB
        zD["Text"] = GetVar(UserVars(), "ReaperNAME") or "No Station"
        zD["TextAlignmentH"] = "Center"
        zD["TextAlignmentV"] = "Center"
        zD["Font"] = "Regular20"
        local zE = 0
        local zF = 0
        
        local function zG()
          if not pX then
            return
          end
          local zH, dl = pX.a8b0dc9b()
          if dl then
            A.a880c84e(y.g_full_label, dl, true)
          end
          if not zH then
            return
          end
          zD["Text"] = zH.abf27542
          yY["ReaperIP"]["Content"] = zH.a74faa94
          yY["ReaperPORT"]["Content"] = zH.aed31a9c
          y.a52ba751["ReaperIP"].a3c78c74 = zH.a74faa94
          y.a52ba751["ReaperPORT"].a3c78c74 = zH.aed31a9c
        end
        
        v[string.format("Clicked%s", "IPSettings")] = function(mX)
          zG()
        end
        local zI = Obj.Append(zz, "UILayoutGrid")
        zI["Anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zI["Rows"] = 1
        zI["Columns"] = 2
        zI["DefaultMargin"] = 5
        local zJ = Obj.Append(zI, "IndicatorButton")
        zJ["AlignmentV"] = "Center"
        zJ["ColorIndicator"] = Root()["ColorTheme"]["ColorGroups"]["Timecode"]["PauseActive"]
        zJ["ContentDriven"] = "Yes"
        zJ["ContentWidth"] = "No"
        zJ["Text"] = "Stop ArtNet Timecode"
        zJ["TextAutoAdjust"] = "Yes"
        zJ["Anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zJ["Margin"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zJ["Padding"] = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        zJ["HideFocusFrame"] = "Yes"
        zJ["PluginComponent"] = w
        zJ["Icon"] = "object_timecodeslots"
        zJ["IconAlignmentH"] = "Left"
        zJ["Texture"] = "corner15"
        zJ["Clicked"] = "onStopArtnetTcClicked"
        local zK = Obj.Append(zI, "IndicatorButton")
        zK["AlignmentV"] = "Center"
        zK["ColorIndicator"] = Root()["ColorTheme"]["ColorGroups"]["Timecode"]["PlayActive"]
        zK["ContentDriven"] = "Yes"
        zK["ContentWidth"] = "No"
        zK["Text"] = "Start ArtNet Timecode"
        zK["TextAutoAdjust"] = "Yes"
        zK["Anchors"] = {
          left = 1,
          right = 1,
          top = 0,
          bottom = 0
        }
        zK["Margin"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zK["Padding"] = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        zK["HideFocusFrame"] = "Yes"
        zK["PluginComponent"] = w
        zK["Icon"] = "object_timecodeslots"
        zK["IconAlignmentH"] = "Left"
        zK["Texture"] = "corner15"
        zK["Clicked"] = "onStartArtnetTcClicked"
        v["onStartArtnetTcClicked"] = function(mX)
          pX.aea06fc2()
        end
        v["onStopArtnetTcClicked"] = function(mX)
          pX.a7201af5()
        end
        local zL = Obj.Append(zA, "UILayoutGrid")
        zL["Anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zL["Rows"] = 1
        zL["Columns"] = 1
        local zM = Obj.Append(zL, "IndicatorButton")
        zM["AlignmentV"] = "Center"
        zM["ContentDriven"] = "Yes"
        zM["ContentWidth"] = "No"
        zM["Text"] = "Reset Object Cache"
        zM["TextAutoAdjust"] = "Yes"
        zM["Anchors"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zM["Margin"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        zM["Padding"] = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        zM["HideFocusFrame"] = "Yes"
        zM["PluginComponent"] = w
        zM["Icon"] = "refresh"
        zM["IconAlignmentH"] = "Left"
        zM["Texture"] = "corner15"
        zM["Clicked"] = "onResetObjectCacheClicked"
        v["onResetObjectCacheClicked"] = function(mX)
          rm.a9b5cc4c()
        end
      end
    end
    tu["Visible"] = "Yes"
  end
  
  local function zN(E, zj)
    local zO = Obj.Append(zj, "UILayoutGrid")
    zO["W"] = "100%"
    zO["H"] = "100%"
    zO["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zO["AlignmentH"] = "Center"
    zO["AlignmentV"] = "Top"
    if m[2][7] * m[2][12] <= m[2][13] then
      return m[2][13]
    end
    zO["Rows"] = yJ(E)
    zO["Columns"] = 1
    zO["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    local zP = {}
    local yO = 0
    local zQ = {}
    for ac, e4 in pairs(E) do
      local zR = yJ(e4) + 1
      for zS, zT in pairs(yH) do
        if zT == ac then
          yO = zS - 1
          local zU = (yJ(e4) + 1) * yu
          zO[1][zS]["SizePolicy"] = "Fixed"
          zO[1][zS]["Size"] = zU
        end
      end
      if not zP[ac] then
        zP[ac] = Obj.Append(zO, "UILayoutGrid")
        zP[ac]["Name"] = ac
        zP[ac]["W"] = "100%"
        zP[ac]["H"] = "100%"
        zP[ac]["Anchors"] = {
          left = 0,
          right = 0,
          top = yO,
          bottom = yO
        }
        zP[ac]["AlignmentH"] = "Left"
        zP[ac]["AlignmentV"] = "Center"
        zP[ac]["Rows"] = zR
        zP[ac]["Columns"] = 1
        for Q = 1, zR do
          zP[ac][1][Q]["SizePolicy"] = "Fixed"
          zP[ac][1][Q]["Size"] = yu
        end
      end
      local zV = Obj.Append(zP[ac], "Button")
      zV["Anchors"] = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
      zV["Margin"] = {
        left = 1,
        right = 1,
        top = 5,
        bottom = 0
      }
      zV["Padding"] = {
        left = 10,
        right = 0,
        top = 0,
        bottom = 0
      }
      zV["TextAlignmentH"] = "Left"
      zV["AlignmentV"] = "Center"
      zV["Textshadow"] = 1
      zV["HasHover"] = "Yes"
      zV["Text"] = ac
      zV["Font"] = "Medium20"
      zV["Texture"] = "corner7"
      zV["HasHover"] = "No"
      zV["HideFocusFrame"] = "Yes"
      zV["BackColor"] = yB
      for mg, mh in pairs(e4) do
        local zW = Obj.Append(zP[ac], "Button")
        zW["Anchors"] = {
          left = 0,
          right = 0,
          top = mh,
          bottom = mh
        }
        zW["Margin"] = {
          left = 20,
          right = 1,
          top = 2,
          bottom = 0
        }
        zW["Padding"] = {
          left = 10,
          right = 0,
          top = 0,
          bottom = 0
        }
        zW["TextAlignmentH"] = "Left"
        zW["AlignmentV"] = "Center"
        zW["Textshadow"] = 1
        zW["HasHover"] = "Yes"
        zW["Text"] = mg
        zW["Font"] = "Medium20"
        zW["PluginComponent"] = w
        zW["Clicked"] = string.format("OnMenu%sClicked", mg)
        zW["Icon"] = "Ball3D"
        zW["IconAlignmentH"] = "Left"
        zW["HideFocusFrame"] = "Yes"
        zQ[mg] = zW
        if mh == yJ(e4) then
          zW["Texture"] = "corner12"
        end
        if 1 == mh then
          zW["Texture"] = "corner3"
        end
        if 1 == yJ(e4) then
          zW["Texture"] = "corner15"
        end
      end
    end
    for ac, e4 in pairs(E) do
      for mg, mh in pairs(e4) do
        v[string.format("OnMenu%sClicked", mg)] = function(mX)
          for ag, ah in pairs(zQ) do
            ah["BackColor"] = yD
          end
          mX["BackColor"] = yC
          for Q = 1, yJ(e4) + 1 do
            zP[ac][1][Q]["SizePolicy"] = "Fixed"
            zP[ac][1][Q]["Size"] = yu
          end
          zi(zj, mg)
        end
      end
    end
  end
  
  local function zX()
    local z9
    y.g_unset_b = A.a712b18d(true, y.g_unset_b)
    local hv = y.g_unset_b.ModalOverlay
    if r[14][4] < r[14][4] then
      return {}
    end
    local hw
    local hx = 500
    hw = Obj.Append(hv, "BaseInput")
    hw["Name"] = "MArkersSettingsWindow"
    hw["H"] = "0"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", y.g_unset_b.W * 0.8, y.g_unset_b.H)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "Yes"
    hw["AutoCloseOnOverlay"] = "No"
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 2
    hy["Anchors"] = "0,0"
    hy[2][1]["SizePolicy"] = "Stretch"
    hy[2][2]["SizePolicy"] = "Fixed"
    hy[2][2]["Size"] = "50"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label .. ""
    hz["Texture"] = "corner1"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local hA = Obj.Append(hy, "CloseButton")
    hA["Anchors"] = "1,0"
    hA["Texture"] = "corner2"
    hA["HideFocusFrame"] = "Yes"
    local hB = Obj.Append(hw, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 2
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Fixed"
    hB[1][1]["Size"] = "160"
    hB[1][2]["SizePolicy"] = "Fixed"
    hB[1][2]["Size"] = "80"
    local zn = Obj.Append(hB, "UILayoutGrid")
    zn["W"] = "100%"
    zn["H"] = "100%"
    zn["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zn["AlignmentH"] = "Center"
    zn["AlignmentV"] = "Center"
    zn["Rows"] = 2
    zn["Columns"] = 1
    zn["Margin"] = {
      left = 20,
      right = 20,
      top = 20,
      bottom = 20
    }
    local zY = Obj.Append(zn, "Button")
    zY["Margin"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    zY["AlignmentH"] = "Center"
    zY["AlignmentV"] = "Center"
    zY["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zY["Textshadow"] = 1
    zY["HasHover"] = "Yes"
    zY["Text"] = "Import Settings"
    zY["Texture"] = "corner15"
    zY["PluginComponent"] = w
    zY["Clicked"] = "OnImportSettingsClicked"
    local zZ = Obj.Append(zn, "Button")
    zZ["Margin"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    zZ["AlignmentH"] = "Center"
    zZ["AlignmentV"] = "Center"
    zZ["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    zZ["Textshadow"] = 1
    zZ["HasHover"] = "Yes"
    zZ["Text"] = "Export Settings"
    zZ["Texture"] = "corner15"
    zZ["PluginComponent"] = w
    zZ["Clicked"] = "OnExportSettingsClicked"
    v["OnImportSettingsClicked"] = function(mX)
      if yt.ac96ddb1() then
        z9 = "Reload"
        Obj.Delete(hv, Obj.Index(hw))
      end
    end
    v["OnExportSettingsClicked"] = function(mX)
      yt.aa622ca9()
      Obj.Delete(hv, Obj.Index(hw))
    end
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 1
    tF["Margin"] = {
      left = 0,
      right = 0,
      top = 10,
      bottom = 0
    }
    local tH = Obj.Append(tF, "Button")
    tH["Margin"] = {
      left = 1,
      right = 1,
      top = 2,
      bottom = 0
    }
    tH["AlignmentH"] = "Center"
    tH["AlignmentV"] = "Center"
    tH["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tH["Textshadow"] = 1
    tH["HasHover"] = "Yes"
    tH["Text"] = "Close"
    tH["Font"] = "Medium20"
    tH["PluginComponent"] = w
    tH["Clicked"] = "OnFinishedSettingsClicked"
    v["OnFinishedSettingsClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
    end
    Obj.ShowModal(hw)
    WaitObjectDelete(hw)
    return z9
  end
  
  function yt.a3e3e8a3()
    for ac, e4 in pairs(y.a52ba751) do
      if e4.str_5350 == "PluginVar" then
        e4.a3c78c74 = GetVar(y.g_plugin_var_obj, ac)
      elseif e4.str_5350 == "UserVar" then
        e4.a3c78c74 = GetVar(UserVars(), ac)
      end
      if not e4.a3c78c74 then
        e4.a3c78c74 = e4.num_3928
      end
    end
  end
  
  function yt.a1338538()
    yF()
    yx = nil
    yG = yM()
    yw = yU()
    yt.a3e3e8a3()
    yy = A.a20696f8({
      ab9049d9 = 0,
      af7ad2a7 = 0,
      aea17af0 = 0,
      a9b22e25 = 255
    }, "MATools", "LightGrey")
    yz = A.a20696f8({
      ab9049d9 = 33,
      af7ad2a7 = 33,
      aea17af0 = 38,
      a9b22e25 = 255
    }, "MATools", "MidGrey")
    yA = A.a20696f8({
      ab9049d9 = 33,
      af7ad2a7 = 33,
      aea17af0 = 38,
      a9b22e25 = 255
    }, "MATools", "DarkGrey")
    y.g_unset_b = A.a712b18d(true, y.g_unset_b)
    local hu = y.g_unset_b
    local hv = hu.ModalOverlay
    local hw
    local hx = 1100
    hw = Obj.Append(hv, "BaseInput")
    hw["Name"] = y.plugin_label .. " Settings Popup"
    hw["H"] = "0"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "Yes"
    hw["AutoCloseOnOverlay"] = "Yes"
    hw["Visible"] = "No"
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 3
    hy["Anchors"] = "0,0"
    hy[2][2]["SizePolicy"] = "Fixed"
    hy[2][2]["Size"] = "150"
    hy[2][3]["SizePolicy"] = "Fixed"
    hy[2][3]["Size"] = "50"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label
    hz["Texture"] = "corner1"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local z_ = Obj.Append(hy, "Button")
    z_["Text"] = "Import / Export"
    z_["Anchors"] = "1,0"
    z_["PluginComponent"] = w
    z_["Clicked"] = "OnImportExportPressed"
    z_["HideFocusFrame"] = "Yes"
    v["OnImportExportPressed"] = function(mX)
      hw["Enabled"] = "No"
      local e = zX()
      hw["Enabled"] = "Yes"
      if e == "Reload" then
        Obj.Delete(hv, Obj.Index(hw))
        coroutine.yield(0.1)
        yt.a1338538()
      end
    end
    local hA = Obj.Append(hy, "CloseButton")
    hA["Anchors"] = "2,0"
    hA["Texture"] = "corner2"
    hA["HideFocusFrame"] = "Yes"
    local hB = Obj.Append(hw, "DialogFrame")
    hB["Name"] = "Frame"
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 2
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Fixed"
    hB[1][1]["Size"] = (yJ(yG) + yK(yG)) * yu + 20
    hB[1][2]["SizePolicy"] = "Fixed"
    hB[1][2]["Size"] = 80
    local zj = Obj.Append(hB, "UILayoutGrid")
    zj["W"] = "100%"
    zj["H"] = "100%"
    zj["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zj["Rows"] = 1
    zj["Columns"] = 2
    zj["Margin"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    zj[2][1]["SizePolicy"] = "Fixed"
    zj[2][1]["Size"] = 350
    zj[2][2]["SizePolicy"] = "Stretch"
    zN(yG, zj)
    local zn = Obj.Append(zj, "UILayoutGrid")
    zn["W"] = "100%"
    zn["H"] = "100%"
    zn["Name"] = "settingsGrid"
    zn["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    zn["AlignmentH"] = "Center"
    zn["AlignmentV"] = "Top"
    zn["Rows"] = 2
    zn["Columns"] = 1
    zn["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zn[1][1]["Size"] = yu
    zn[1][1]["SizePolicy"] = "Fixed"
    zn[1][2]["SizePolicy"] = "Stretch"
    local zq = Obj.Append(zn, "UIObject")
    zq["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zq["HasHover"] = "No"
    zq["Margin"] = {
      left = 10,
      right = 0,
      top = 0,
      bottom = 0
    }
    zq["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    zq["Name"] = "SettingsTitle"
    zq["Text"] = y.plugin_label .. " Settings"
    zq["BackColor"] = yB
    zq["Font"] = "Medium20"
    local zr = Obj.Append(zn, "UIObject")
    zr["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    zr["HasHover"] = "No"
    zr["BackColor"] = yz
    zr["Texture"] = "corner15"
    zr["Margin"] = {
      left = 10,
      right = 0,
      top = 0,
      bottom = 0
    }
    zr["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    zr["Name"] = "ContentWrapper"
    local A0 = Obj.Append(zr, "UILayoutGrid")
    A0["W"] = "100%"
    A0["H"] = "100%"
    A0["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A0["AlignmentH"] = "Center"
    A0["AlignmentV"] = "Center"
    A0["Rows"] = 5
    A0["Columns"] = 1
    A0["Margin"] = {
      left = 20,
      right = 20,
      top = 20,
      bottom = 20
    }
    A0[1][5]["SizePolicy"] = "Fixed"
    A0[1][5]["Size"] = 200
    local hC = Obj.Append(A0, "UIObject")
    hC["Text"] = "Select an option on the left to adjust the settings for " .. y.plugin_label .. "\n\nTo use " .. y.plugin_label .. " create the macros below."
    hC["ContentDriven"] = "Yes"
    hC["ContentWidth"] = "No"
    hC["TextAutoAdjust"] = "Yes"
    hC["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    hC["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    hC["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 1
    }
    hC["HasHover"] = "No"
    hC["BackColor"] = yz
    hC["H"] = 100
    hC["AlignmentV"] = "Bottom"
    hC["AlignmentH"] = "Center"
    local A1 = Obj.Append(A0, "IndicatorButton")
    A1["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A1["AlignmentH"] = "Center"
    A1["AlignmentV"] = "Center"
    A1["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    A1["Textshadow"] = 1
    A1["HasHover"] = "Yes"
    A1["Text"] = "Create " .. y.plugin_label .. " Macros"
    A1["Texture"] = "corner15"
    A1["PluginComponent"] = w
    A1["Clicked"] = "OnCreateMacrosClicked"
    A1["W"] = 300
    A1["H"] = 70
    A1["AlignmentV"] = "Top"
    A1["AlignmentH"] = "Center"
    v["OnCreateMacrosClicked"] = function(mX)
      A.ae8c00a9(y.ac5be6a8, true)
    end
    local A2 = Obj.Append(A0, "IndicatorButton")
    A2["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A2["AlignmentH"] = "Center"
    A2["AlignmentV"] = "Center"
    A2["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    A2["Textshadow"] = 1
    A2["HasHover"] = "Yes"
    A2["Text"] = "Import .RPP File"
    A2["Texture"] = "corner15"
    A2["PluginComponent"] = w
    A2["Clicked"] = "OnButtImportClicked"
    A2["W"] = 300
    A2["H"] = 70
    A2["AlignmentV"] = "Top"
    A2["AlignmentH"] = "Center"
    v["OnButtImportClicked"] = function(mX)
      v["OnSaveSettingsClicked"]()
      Timer(function()
        CmdIndirect(string.format("Call Plugin \"%s\" \"ImportFromReaper\"", y.plugin_label))
      end, 0.1, 1)
    end
    local A3 = Obj.Append(A0, "IndicatorButton")
    A3["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A3["AlignmentH"] = "Center"
    A3["AlignmentV"] = "Center"
    A3["Anchors"] = {
      left = 0,
      right = 0,
      top = 3,
      bottom = 3
    }
    A3["Textshadow"] = 1
    A3["HasHover"] = "Yes"
    A3["Text"] = "Sync from Reaper (Network)"
    A3["Texture"] = "corner15"
    A3["PluginComponent"] = w
    A3["Clicked"] = "OnButtSyncClicked"
    A3["W"] = 300
    A3["H"] = 70
    A3["AlignmentV"] = "Top"
    A3["AlignmentH"] = "Center"
    v["OnButtSyncClicked"] = function(mX)
      v["OnSaveSettingsClicked"]()
      Timer(function()
        CmdIndirect(string.format("Call Plugin \"%s\" \"SyncFromReaper\"", y.plugin_label))
      end, 0.1, 1)
    end
    if y.plugin_label == "MArkers" then
      A3["Enabled"] = false
      A3["Visible"] = false
      A0[1][4]["SizePolicy"] = "Fixed"
      A0[1][4]["Size"] = 0
    end
    local A4 = Obj.Append(A0, "UILayoutGrid")
    A4["Anchors"] = {
      left = 0,
      right = 0,
      top = 4,
      bottom = 4
    }
    A4["Rows"] = 1
    A4["Columns"] = 2
    local A5 = Obj.Append(A4, "UIObject")
    A5["Text"] = "Need help?\n\nClick or scan the QR code >>>"
    A5["ContentDriven"] = "Yes"
    A5["ContentWidth"] = "No"
    A5["TextAutoAdjust"] = "No"
    A5["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A5["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A5["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 1
    }
    A5["HasHover"] = "No"
    A5["BackColor"] = yz
    A5["H"] = 120
    A5["AlignmentV"] = "Center"
    A5["AlignmentH"] = "Center"
    local A6 = "https://ma.tools/help/plugin/markers"
    if y.plugin_label == "MArkersLIVE" then
      A6 = "https://ma.tools/help/plugin/markers?additional=markerslive#markerslive---overview"
    end
    local A7 = A.adf0373b.a89933ba(A6, "MarkersHelp")
    local A8 = Obj.Append(A4, "UIObject")
    A8["ContentDriven"] = "Yes"
    A8["ContentWidth"] = "No"
    A8["TextAutoAdjust"] = "Yes"
    A8["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    A8["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A8["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 1
    }
    A8["HasHover"] = "No"
    A8["BackColor"] = Root().ColorTheme.ColorGroups.Global.Neutral
    A8["H"] = 180
    A8["W"] = 180
    A8["AlignmentV"] = "Bottom"
    A8["AlignmentH"] = "Center"
    A8["PluginComponent"] = w
    A8["Texture"] = A7
    A8["Clicked"] = "OnHelpClicked"
    v["OnHelpClicked"] = function(mX)
      A.adf0373b.ae513433(A6)
    end
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 3
    tF["Margin"] = {
      left = 0,
      right = 0,
      top = 10,
      bottom = 0
    }
    local A9 = Obj.Append(tF, "Button")
    A9["Margin"] = {
      left = 1,
      right = 1,
      top = 2,
      bottom = 0
    }
    A9["AlignmentH"] = "Center"
    A9["AlignmentV"] = "Center"
    A9["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    A9["Textshadow"] = 1
    A9["HasHover"] = "Yes"
    A9["Text"] = "Cancel"
    A9["Font"] = "Medium20"
    A9["PluginComponent"] = w
    A9["Clicked"] = "OnCancelSettingsClicked"
    local Aa = Obj.Append(tF, "Button")
    Aa["Margin"] = {
      left = 1,
      right = 1,
      top = 2,
      bottom = 0
    }
    Aa["AlignmentH"] = "Center"
    Aa["AlignmentV"] = "Center"
    Aa["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Aa["Textshadow"] = 1
    Aa["HasHover"] = "Yes"
    Aa["Text"] = "Restore Defaults"
    Aa["Font"] = "Medium20"
    Aa["PluginComponent"] = w
    Aa["Clicked"] = "OnRestoreSettingsClicked"
    local Ab = Obj.Append(tF, "Button")
    Ab["Margin"] = {
      left = 1,
      right = 1,
      top = 2,
      bottom = 0
    }
    Ab["AlignmentH"] = "Center"
    Ab["AlignmentV"] = "Center"
    Ab["Anchors"] = {
      left = 2,
      right = 2,
      top = 0,
      bottom = 0
    }
    Ab["Textshadow"] = 1
    Ab["HasHover"] = "Yes"
    Ab["Text"] = "Save"
    Ab["Font"] = "Medium20"
    Ab["PluginComponent"] = w
    Ab["Clicked"] = "OnSaveSettingsClicked"
    v["OnSaveSettingsClicked"] = function(mX)
      for ac, e4 in pairs(y.a52ba751) do
        if e4.str_5350 == "PluginVar" then
          SetVar(y.g_plugin_var_obj, ac, e4.a3c78c74)
        elseif e4.str_5350 == "UserVar" then
          SetVar(UserVars(), ac, e4.a3c78c74)
        end
      end
      Obj.Delete(hv, Obj.Index(hw))
    end
    v["OnRestoreSettingsClicked"] = function(mX)
      if 1 == A.a880c84e(y.plugin_label, "Are you sure you want to restore ALL " .. y.plugin_label .. " settings to default values?") then
        Obj.Delete(hv, Obj.Index(hw))
        for ac, e4 in pairs(y.a52ba751) do
          if e4.str_5350 == "PluginVar" then
            SetVar(y.g_plugin_var_obj, ac, e4.defVal)
          elseif e4.str_5350 == "UserVar" then
            SetVar(UserVars(), ac, e4.defVal)
          end
        end
        SetVar(UserVars(), "ReaperNAME", "None")
        yx = true
      end
    end
    v["OnCancelSettingsClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
    end
    hw["Visible"] = "Yes"
    Obj.ShowModal(hw)
    WaitObjectDelete(hw)
    if yx then
      yt.a1338538()
    end
    return true
  end
  
  return yt
end

yt = yt(y, A, rm, v, w, pX)

local function Ac(...)
  local Ac = {}
  local y = select(1, ...)
  local A = select(2, ...)
  local rm = select(3, ...)
  local yt = select(4, ...)
  local v = select(5, ...)
  local w = select(6, ...)
  local z = select(7, ...)
  local yg = select(8, ...)
  local xr = select(9, ...)
  local x = GetPathSeparator()
  local tx = 75
  local Ad = 7
  local Ae = "Markers"
  
  local function Af(Ag, z7, t4, Ah, Ai)
    if Ae ~= "Markers" then
      return
    end
    if not l[4][7] or type(l[4][7]) ~= "number" then
      return
    end
    if 0 == Ag then
      for ac, e4 in pairs(z7.tbl_7846) do
        if t4.aeddce3c[ac].str_c132 == "Marker" then
          if Ah and not Ai then
            t4.aeddce3c[ac].enabled = true
            z7.tbl_e394[ac]["Enabled"] = true
            z7.tbl_7846[ac]["Enabled"] = true
            z7.tbl_9d42[ac]["Enabled"] = true
            z7.tbl_a718[ac].a2cb2374["Enabled"] = true
            z7.tbl_a718[ac].aa86fe72["Enabled"] = true
            if 1 == t4.num_f7e4 then
              z7.tbl_6c06[ac]["Enabled"] = true
            end
            z7.tbl_5dc8[ac]["Enabled"] = true
            z7.tbl_fc35[ac]["Enabled"] = true
            if rm.af039942[t4.aeddce3c.a3763cb3] then
              z7.tbl_463f[ac]["Enabled"] = true
            end
          end
          local vu = rm.aad72235(t4.aeddce3c[ac].adb219bd)
          e4["BackColor"] = vu
          z7.tbl_e394[ac]["BackColor"] = vu
        end
      end
    else
      for ac, e4 in pairs(z7.tbl_7846) do
        if t4.aeddce3c[ac].str_c132 == "Marker" and t4.aeddce3c[ac].master_idx ~= t4.a70e02e7 then
          e4["BackColor"] = z7.a2e90598
          z7.tbl_e394[ac]["BackColor"] = z7.a2e90598
          if Ah then
            t4.aeddce3c[ac].enabled = false
            z7.tbl_e394[ac]["Enabled"] = false
            z7.tbl_7846[ac]["Enabled"] = false
            z7.tbl_9d42[ac]["Enabled"] = false
            z7.tbl_a718[ac].a2cb2374["Enabled"] = false
            z7.tbl_a718[ac].aa86fe72["Enabled"] = false
            z7.tbl_6c06[ac]["Enabled"] = false
            z7.tbl_6c06[ac]["State"] = 0
            z7.tbl_5dc8[ac]["Enabled"] = false
            z7.tbl_fc35[ac]["Enabled"] = false
            z7.tbl_463f[ac]["Enabled"] = false
          end
        end
      end
    end
  end
  
  function Ac.aa88dcb8(mV, z7, hv, hu)
    local yB = Root().ColorTheme.ColorGroups.Global.Transparent
    local z8 = Root().ColorTheme.ColorGroups.IndicatorControl.ColorIndicator
    local hw
    local hx = 600
    local z9
    z7.a51542a0.Enabled = false
    hw = Obj.Append(hv, "BaseInput")
    hw["Name"] = "MArkersSettingsWindow"
    hw["H"] = "0"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "Yes"
    hw["AutoCloseOnOverlay"] = "No"
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 1
    hy["Anchors"] = "0,0"
    hy[2][1]["SizePolicy"] = "Stretch"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label .. " - Choose"
    hz["Texture"] = "corner3"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local hB = Obj.Append(hw, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 2
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Stretch"
    hB[1][2]["SizePolicy"] = "Fixed"
    hB[1][2]["Size"] = 60
    local tu = Obj.Append(hB, "ScrollContainer")
    tu["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tu["MaxSize"] = "0,100%"
    tu["ContentDriven"] = "Yes"
    tu["ContentWidth"] = "No"
    tu["Padding"] = {
      left = 0,
      right = 5,
      top = 0,
      bottom = 0
    }
    tu["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tu["DefaultMargin"] = 0
    tu["Transparent"] = "No"
    local tv = Obj.Append(tu, "ScrollBox")
    tv["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tv["ContentDriven"] = "Yes"
    tv["ContentWidth"] = "No"
    tv["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tv["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    local za = Obj.Append(tv, "UILayoutGrid")
    za["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    za["Rows"] = #mV + 1
    za["Columns"] = 2
    za["Margin"] = {
      left = 2,
      right = 2,
      top = 2,
      bottom = 2
    }
    za[1][1]["SizePolicy"] = "Fixed"
    za[1][1]["Size"] = 60
    local zb = Obj.Append(za, "UIObject")
    zb["text"] = "Set This Project"
    zb["ContentDriven"] = "Yes"
    zb["ContentWidth"] = "No"
    zb["TextAutoAdjust"] = "Yes"
    zb["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zb["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    zb["HasHover"] = "No"
    zb["Font"] = "Medium20"
    zb["BackColor"] = yB
    local Aj = Obj.Append(za, "UIObject")
    Aj["text"] = "Set Default for All New Projects"
    Aj["ContentDriven"] = "Yes"
    Aj["ContentWidth"] = "No"
    Aj["TextAutoAdjust"] = "Yes"
    Aj["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Aj["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Aj["HasHover"] = "No"
    Aj["Font"] = "Medium20"
    Aj["BackColor"] = yB
    local zc = 1
    for ac, e4 in pairs(mV) do
      za[1][zc + 1]["SizePolicy"] = "Fixed"
      za[1][zc + 1]["Size"] = 60
      local zd = Obj.Append(za, "Button")
      zd["Margin"] = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2
      }
      zd["Anchors"] = {
        left = 0,
        right = 0,
        top = zc,
        bottom = zc
      }
      zd["Textshadow"] = 1
      zd["HasHover"] = "Yes"
      zd["Texture"] = "corner15"
      zd["PluginComponent"] = w
      zd["Clicked"] = string.format("OnChooseColor%sClicked", e4.abd77275)
      zd["BackColor"] = e4.ab4cd56b
      v[string.format("OnChooseColor%sClicked", e4.abd77275)] = function(mX)
        z9 = e4
        Obj.Delete(Obj.Parent(hw), Obj.Index(hw))
      end
      local Ak = Obj.Append(za, "Button")
      Ak["Margin"] = {
        left = 2,
        right = 2,
        top = 2,
        bottom = 2
      }
      Ak["Anchors"] = {
        left = 1,
        right = 1,
        top = zc,
        bottom = zc
      }
      Ak["Textshadow"] = 1
      Ak["HasHover"] = "Yes"
      Ak["Texture"] = "corner15"
      Ak["PluginComponent"] = w
      Ak["Clicked"] = string.format("OnChooseColorDef%sClicked", e4.abd77275)
      Ak["BackColor"] = e4.ab4cd56b
      A.a4b25f9e()
      v[string.format("OnChooseColorDef%sClicked", e4.abd77275)] = function(mX)
        z9 = e4
        rm.aff73f79(e4.abd77275)
        Obj.Delete(Obj.Parent(hw), Obj.Index(hw))
      end
      zc = zc + 1
    end
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 1
    tF["Margin"] = {
      left = 0,
      right = 0,
      top = 10,
      bottom = 0
    }
    local tH = Obj.Append(tF, "Button")
    tH["Margin"] = {
      left = 1,
      right = 1,
      top = 2,
      bottom = 0
    }
    tH["AlignmentH"] = "Center"
    tH["AlignmentV"] = "Center"
    tH["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tH["Textshadow"] = 1
    tH["HasHover"] = "Yes"
    tH["Text"] = "Close"
    tH["Font"] = "Medium20"
    tH["PluginComponent"] = w
    tH["Clicked"] = "OnFinishedChooseColoeClicked"
    v["OnFinishedChooseColoeClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
    end
    WaitObjectDelete(hw)
    z7.a51542a0.Enabled = true
    return z9
  end
  
  function Ac.a194ea9f(t4, qF, z7, ry)
    local yB = Root().ColorTheme.ColorGroups.Global.Transparent
    local z8 = Root().ColorTheme.ColorGroups.IndicatorControl.ColorIndicator
    z = Obj.Index(GetFocusDisplay()) or z or 1
    if z >= 4 and z <= 7 then
      z = 1
    end
    local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(z)
    local hv = hu.ModalOverlay
    local hw
    local hx = 1100
    local z9
    local Al = qF.a1f2d3df
    z7.a51542a0.Enabled = false
    hw = Obj.Append(hv, "BaseInput")
    hw["Name"] = "MArkersSettingsWindow"
    hw["H"] = "0"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "Yes"
    hw["AutoCloseOnOverlay"] = "No"
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 1
    hy["Anchors"] = "0,0"
    hy[2][1]["SizePolicy"] = "Stretch"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label .. " - Settings"
    hz["Texture"] = "corner3"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local hB = Obj.Append(hw, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 3
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Fixed"
    hB[1][1]["Size"] = "775"
    hB[1][2]["SizePolicy"] = "Fixed"
    hB[1][2]["Size"] = "40"
    hB[1][3]["SizePolicy"] = "Fixed"
    hB[1][3]["Size"] = "80"
    local zn = Obj.Append(hB, "UILayoutGrid")
    zn["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    zn["Rows"] = 3
    zn["Columns"] = 1
    zn["Margin"] = {
      left = 20,
      right = 20,
      top = 20,
      bottom = 20
    }
    zn[1][1]["SizePolicy"] = "Fixed"
    zn[1][1]["Size"] = "120"
    zn[1][2]["SizePolicy"] = "Fixed"
    zn[1][2]["Size"] = "80"
    zn[1][3]["SizePolicy"] = "Stretch"
    local tF = Obj.Append(zn, "UILayoutGrid")
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tF["Padding"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    tF["Rows"] = 2
    tF["Columns"] = 1
    tF[1][1]["SizePolicy"] = "Fixed"
    tF[1][1]["Size"] = "65"
    local Am = Obj.Append(tF, "Button")
    Am["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Am["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Am["Textshadow"] = 1
    Am["HasHover"] = "Yes"
    Am["Text"] = "Open Full Settings"
    Am["Texture"] = "corner15"
    Am["PluginComponent"] = w
    Am["Clicked"] = "OnOpenFullSettingsClicked"
    Am["Icon"] = "settings"
    Am["IconOffsetH"] = "100"
    v["OnOpenFullSettingsClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
      z9 = {
        a81de8f4 = "OpenFullSettings"
      }
    end
    local An = Obj.Append(tF, "UIObject")
    An["text"] = string.format("%s - Import Settings", t4.a28a3a8e)
    An["ContentDriven"] = "Yes"
    An["ContentWidth"] = "No"
    An["TextAutoAdjust"] = "Yes"
    An["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    An["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    An["HasHover"] = "No"
    An["Font"] = "Medium20"
    An["BackColor"] = yB
    local Ao = Obj.Append(zn, "UILayoutGrid")
    Ao["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Ao["Padding"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    Ao["Rows"] = 1
    Ao["Columns"] = 2
    local Ap = Obj.Append(Ao, "LineEdit")
    Ap["Margin"] = {
      left = 5,
      right = 0,
      top = 5,
      bottom = 5
    }
    Ap["AlignmentV"] = "Center"
    Ap["Prompt"] = "Sequence "
    Ap["Content"] = qF.aa942c2a.tbl_0c3f.ac5fccac
    Ap["ContentDriven"] = "Yes"
    Ap["ContentWidth"] = "No"
    Ap["TextAutoAdjust"] = "Yes"
    Ap["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Ap["Filter"] = "0123456789"
    Ap["VkPluginName"] = "TextInputNumOnly"
    Ap["MaxTextLength"] = 4
    Ap["Texture"] = "corner5"
    Ap["HideFocusFrame"] = "Yes"
    Ap["PluginComponent"] = w
    Ap["TextChanged"] = "OnInputPlaceholderSeqChanged"
    local Aq = Obj.Append(Ao, "Button")
    Aq["Margin"] = {
      left = 0,
      right = 5,
      top = 5,
      bottom = 5
    }
    Aq["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Aq["Textshadow"] = 1
    Aq["HasHover"] = "Yes"
    Aq["Text"] = "Renumber & Create\nPlaceholder Sequence"
    Aq["Texture"] = "corner10"
    Aq["PluginComponent"] = w
    Aq["Clicked"] = "OnCreatePlaceholderClicked"
    v["OnCreatePlaceholderClicked"] = function(mX)
      local Ar = Ap["Content"]
      if not Ar or string.gsub(Ar, " ", "") == "" or not tonumber(Ar) then
        A.a880c84e(y.g_full_label, "Please enter a valid placeholder sequence number.", true)
        return
      end
      Ar = tonumber(Ar)
      if DataPool().Sequences[Ar] then
        local hO = {
          title = y.g_full_label,
          icon = y.company_label,
          message = string.format("Sequence %s - \"%s\" already exists.\nWould you like to overwrite?", Ar, DataPool().Sequences[Ar].Name),
          commands = {
            {
              value = 0,
              name = "Cancel"
            },
            {
              value = 1,
              name = "Overwrite"
            }
          }
        }
        local hP = MessageBox(hO)
        if 0 == hP.result then
          return
        end
      end
      Obj.Delete(hv, Obj.Index(hw))
      qF.aa942c2a.tbl_0c3f.ac5fccac = Ar
      z9 = {
        a81de8f4 = "Placeholder"
      }
    end
    local As = Obj.Append(zn, "UILayoutGrid")
    As["W"] = "100%"
    As["H"] = "100%"
    As["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    As["AlignmentH"] = "Center"
    As["AlignmentV"] = "Center"
    As["Rows"] = 2
    As["Columns"] = 3
    As[1][1]["SizePolicy"] = "Fixed"
    As[1][1]["Size"] = "60"
    local At = Obj.Append(As, "UIObject")
    At["text"] = "Marker Special Characters"
    At["ContentDriven"] = "Yes"
    At["ContentWidth"] = "No"
    At["TextAutoAdjust"] = "Yes"
    At["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    At["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    At["HasHover"] = "No"
    At["Font"] = "Medium20"
    At["BackColor"] = yB
    local Au = Obj.Append(As, "UIObject")
    Au["text"] = "Import Settings"
    Au["ContentDriven"] = "Yes"
    Au["ContentWidth"] = "No"
    Au["TextAutoAdjust"] = "Yes"
    Au["Anchors"] = {
      left = 1,
      right = 2,
      top = 0,
      bottom = 0
    }
    Au["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Au["HasHover"] = "No"
    Au["Font"] = "Medium20"
    Au["BackColor"] = yB
    local Av = 65
    local Aw = Obj.Append(As, "UILayoutGrid")
    Aw["W"] = "100%"
    Aw["H"] = "100%"
    Aw["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Aw["Margin"] = {
      left = 0,
      right = 5,
      top = 0,
      bottom = 0
    }
    Aw["AlignmentH"] = "Center"
    Aw["AlignmentV"] = "Center"
    Aw["Rows"] = 7
    Aw["Columns"] = 1
    Aw[1][1]["SizePolicy"] = "Fixed"
    Aw[1][1]["Size"] = Av
    Aw[1][2]["SizePolicy"] = "Fixed"
    Aw[1][2]["Size"] = Av
    Aw[1][3]["SizePolicy"] = "Fixed"
    Aw[1][3]["Size"] = Av
    Aw[1][4]["SizePolicy"] = "Fixed"
    Aw[1][4]["Size"] = Av
    Aw[1][5]["SizePolicy"] = "Fixed"
    Aw[1][5]["Size"] = Av
    Aw[1][6]["SizePolicy"] = "Fixed"
    Aw[1][6]["Size"] = Av
    Aw[1][7]["SizePolicy"] = "Fixed"
    Aw[1][7]["Size"] = Av
    local Ax = Obj.Append(Aw, "CheckBox")
    Ax["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Ax["Text"] = "Use () for\ncue numbers"
    Ax["AlignmentH"] = "Center"
    Ax["AlignmentV"] = "Center"
    Ax["State"] = t4.num_3a3e
    Ax["PluginComponent"] = w
    Ax["Clicked"] = "OnCheckCueNameBracketsClicked"
    Ax["Texture"] = "corner3"
    v["OnCheckCueNameBracketsClicked"] = function(mX)
      if 1 == Ax["State"] then
        Ax["State"] = 0
        t4.num_3a3e = 0
      else
        Ax["State"] = 1
        t4.num_3a3e = 1
      end
    end
    local Ay = Obj.Append(Aw, "CheckBox")
    Ay["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Ay["Text"] = "Use ^^ for\nsequence labels"
    Ay["AlignmentH"] = "Center"
    Ay["AlignmentV"] = "Center"
    Ay["State"] = t4.num_fc65
    Ay["PluginComponent"] = w
    Ay["Clicked"] = "OncheckCueNameCaretClicked"
    v["OncheckCueNameCaretClicked"] = function(mX)
      if 1 == Ay["State"] then
        Ay["State"] = 0
        t4.num_fc65 = 0
      else
        Ay["State"] = 1
        t4.num_fc65 = 1
      end
    end
    local Az = Obj.Append(Aw, "CheckBox")
    Az["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    Az["Text"] = "Use {} for\ncue CMDs"
    Az["AlignmentH"] = "Center"
    Az["AlignmentV"] = "Center"
    Az["State"] = t4.num_d99b
    Az["PluginComponent"] = w
    Az["Clicked"] = "OncheckCueNameBracesClicked"
    v["OncheckCueNameBracesClicked"] = function(mX)
      if 1 == Az["State"] then
        Az["State"] = 0
        t4.num_d99b = 0
      else
        Az["State"] = 1
        t4.num_d99b = 1
      end
    end
    local AA = Obj.Append(Aw, "CheckBox")
    AA["Anchors"] = {
      left = 0,
      right = 0,
      top = 3,
      bottom = 3
    }
    AA["Text"] = "Use [] for\ntimecode tokens"
    AA["AlignmentH"] = "Center"
    AA["AlignmentV"] = "Center"
    AA["State"] = t4.num_d0c7
    AA["PluginComponent"] = w
    AA["Clicked"] = "OnCheckCueNameSquareBracketsClicked"
    v["OnCheckCueNameSquareBracketsClicked"] = function(mX)
      if 1 == AA["State"] then
        AA["State"] = 0
        t4.num_d0c7 = 0
      else
        AA["State"] = 1
        t4.num_d0c7 = 1
      end
    end
    local AB = Obj.Append(Aw, "CheckBox")
    AB["Anchors"] = {
      left = 0,
      right = 0,
      top = 4,
      bottom = 4
    }
    AB["Text"] = "Use <> for\ncue fade times"
    AB["AlignmentH"] = "Center"
    AB["AlignmentV"] = "Center"
    AB["State"] = t4.num_94b9
    AB["PluginComponent"] = w
    AB["Clicked"] = "OnCheckCueNameTriangleBracketsClicked"
    AB["Texture"] = "corner12"
    v["OnCheckCueNameTriangleBracketsClicked"] = function(mX)
      if 1 == AB["State"] then
        AB["State"] = 0
        t4.num_94b9 = 0
      else
        AB["State"] = 1
        t4.num_94b9 = 1
      end
    end
    local AC = Obj.Append(Aw, "UIObject")
    AC["text"] = "Master Sequence"
    AC["ContentDriven"] = "Yes"
    AC["ContentWidth"] = "No"
    AC["TextAutoAdjust"] = "Yes"
    AC["Anchors"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    AC["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    AC["HasHover"] = "No"
    AC["Font"] = "Medium20"
    AC["BackColor"] = yB
    local AD = Obj.Append(Aw, "Button")
    AD["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AD["Anchors"] = {
      left = 0,
      right = 0,
      top = 6,
      bottom = 6
    }
    AD["Textshadow"] = 1
    AD["HasHover"] = "Yes"
    AD["Text"] = "Choose Master Sequence Color"
    AD["Texture"] = "corner15"
    AD["PluginComponent"] = w
    AD["Clicked"] = "OnChooseMasterSeqColorClicked"
    AD["BackColor"] = rm.aad72235(rm.a5c7e72c(t4.a70e02e7, 0))
    local ze = {}
    for ac, e4 in pairs(ry.tbl_13c3) do
      table.insert(ze, {
        a7b0eb83 = "",
        a0fc7c03 = "",
        ab4cd56b = e4.a4e015bd,
        abd77275 = e4.master_idx
      })
    end
    v["OnChooseMasterSeqColorClicked"] = function(mX)
      local zh = Ac.aa88dcb8(ze, {a51542a0 = hw}, hv, hu)
      if zh then
        mX["BackColor"] = zh.ab4cd56b
        t4.a70e02e7 = zh.abd77275
        z7.a69cb802()
      end
    end
    local AE = Obj.Append(As, "UILayoutGrid")
    AE["W"] = "100%"
    AE["H"] = "100%"
    AE["Anchors"] = {
      left = 1,
      right = 1,
      top = 1,
      bottom = 1
    }
    AE["Margin"] = {
      left = 5,
      right = 0,
      top = 0,
      bottom = 0
    }
    AE["AlignmentH"] = "Center"
    AE["AlignmentV"] = "Center"
    AE["Rows"] = 7
    AE["Columns"] = 1
    AE[1][1]["SizePolicy"] = "Fixed"
    AE[1][1]["Size"] = Av
    AE[1][2]["SizePolicy"] = "Fixed"
    AE[1][2]["Size"] = Av
    AE[1][3]["SizePolicy"] = "Fixed"
    AE[1][3]["Size"] = Av
    AE[1][4]["SizePolicy"] = "Fixed"
    AE[1][4]["Size"] = Av
    AE[1][5]["SizePolicy"] = "Fixed"
    AE[1][5]["Size"] = Av
    AE[1][6]["SizePolicy"] = "Fixed"
    AE[1][6]["Size"] = Av
    AE[1][7]["SizePolicy"] = "Fixed"
    AE[1][7]["Size"] = Av
    local AF = Obj.Append(AE, "CheckBox")
    AF["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AF["Text"] = "Combine colored markers into a single sequence"
    AF["TextAutoAdjust"] = true
    AF["AlignmentH"] = "Center"
    AF["AlignmentV"] = "Center"
    AF["State"] = t4.num_6f9e
    AF["PluginComponent"] = w
    AF["Clicked"] = "OnCheckCombineColorsClicked"
    AF["Texture"] = "corner3"
    v["OnCheckCombineColorsClicked"] = function(mX)
      if 1 == AF["State"] then
        AF["State"] = 0
        t4.num_6f9e = 0
        Af(0, z7, t4, true, false)
      else
        AF.State = 1
        t4.num_6f9e = 1
        Af(1, z7, t4, true, false)
      end
    end
    local AG = Obj.Append(AE, "CheckBox")
    AG["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    AG["Text"] = "Apply Colors"
    AG["AlignmentH"] = "Center"
    AG["AlignmentV"] = "Center"
    AG["State"] = t4.num_c583
    AG["PluginComponent"] = w
    AG["Clicked"] = "OnCheckTrackColoursClicked"
    v["OnCheckTrackColoursClicked"] = function(mX)
      if 1 == AG["State"] then
        AG["State"] = 0
        t4.num_c583 = 0
        for ac, e4 in pairs(z7.tbl_7846) do
          e4["BackColor"] = z7.a2e90598
          z7.tbl_e394[ac]["BackColor"] = z7.a2e90598
        end
      else
        AG.State = 1
        t4.num_c583 = 1
        for ac, e4 in pairs(z7.tbl_7846) do
          local vu = rm.aad72235(t4.aeddce3c[ac].adb219bd)
          e4["BackColor"] = vu
          z7.tbl_e394[ac]["BackColor"] = vu
        end
      end
    end
    local AH = Obj.Append(AE, "CheckBox")
    AH["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    AH["Text"] = "Import Tempo Sequence"
    AH["AlignmentH"] = "Center"
    AH["AlignmentV"] = "Center"
    AH["State"] = t4.num_f670
    AH["PluginComponent"] = w
    AH["Clicked"] = "OnCheckImportTempoClicked"
    v["OnCheckImportTempoClicked"] = function(mX)
      if 1 == AH["State"] then
        AH["State"] = 0
        t4.num_f670 = 0
      else
        AH["State"] = 1
        t4.num_f670 = 1
      end
    end
    local AI = Obj.Append(AE, "CheckBox")
    AI["Anchors"] = {
      left = 0,
      right = 0,
      top = 3,
      bottom = 3
    }
    AI["Text"] = "Use TC Slot Offset\n" .. string.format("%02d:%02d:%02d.%02d", Al.a3289b61, Al.a56f129b, Al.ac709510, math.floor(Al.a98fbcfd))
    AI["AlignmentH"] = "Center"
    AI["AlignmentV"] = "Center"
    AI["State"] = t4.num_88eb
    AI["PluginComponent"] = w
    AI["Clicked"] = "OnCheckTCoffsetClicked"
    v["OnCheckTCoffsetClicked"] = function(mX)
      if 1 == AI["State"] then
        AI["State"] = 0
        t4.num_88eb = 0
      else
        AI["State"] = 1
        t4.num_88eb = 1
      end
    end
    local AJ = Obj.Append(AE, "CheckBox")
    AJ["Anchors"] = {
      left = 0,
      right = 0,
      top = 4,
      bottom = 4
    }
    AJ["Text"] = "Create Regions\nfrom selected"
    AJ["AlignmentH"] = "Center"
    AJ["AlignmentV"] = "Center"
    AJ["State"] = t4.num_f7e4
    AJ["PluginComponent"] = w
    AJ["Clicked"] = "OnCheckCreateRegionsClicked"
    AJ["Enabled"] = "Yes"
    if 0 == #t4.aeddce3c then
      AJ["Enabled"] = "No"
    end
    if qF.flag_61c3 then
      t4.num_d192 = 1
    end
    v["OnCheckCreateRegionsClicked"] = function(mX)
      if 1 == AJ["State"] then
        AJ["State"] = 0
        t4.num_f7e4 = 0
        if qF.flag_61c3 then
          t4.num_d192 = 1
        else
          t4.num_d192 = 0
        end
        for ac, e4 in pairs(z7.tbl_6c06) do
          e4["Enabled"] = "No"
          e4["State"] = 0
        end
        for ac, e4 in pairs(z7.tbl_aaff) do
          e4[2][9]["Size"] = 0
        end
        z7.a9e17a5f[2][6]["Size"] = 10
        if z7.ae170f1e > Ad then
          z7.a9e17a5f[2][6]["Size"] = 30
        end
      else
        AJ["State"] = 1
        t4.num_f7e4 = 1
        t4.num_d192 = 0
        for ac, e4 in pairs(z7.tbl_6c06) do
          if t4.aeddce3c[z7.tbl_0f28[ac]].enabled and not t4.aeddce3c[z7.tbl_0f28[ac]].flag_63f9 then
            e4["Enabled"] = "Yes"
          else
            e4["Enabled"] = "No"
          end
        end
        for ac, e4 in pairs(z7.tbl_aaff) do
          e4[2][9]["Size"] = 60
        end
        z7.a9e17a5f[2][6]["Size"] = 70
        if z7.ae170f1e > Ad then
          z7.a9e17a5f[2][6]["Size"] = 90
        end
      end
    end
    local AK = Obj.Append(AE, "CheckBox")
    AK["Anchors"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    AK["Text"] = "Cue Appearances From Regions"
    AK["AlignmentH"] = "Center"
    AK["AlignmentV"] = "Center"
    AK["State"] = t4.num_90cf
    AK["Texture"] = "corner12"
    AK["PluginComponent"] = w
    AK["Clicked"] = "OnCheckRegionAppearancesClicked"
    v["OnCheckRegionAppearancesClicked"] = function(mX)
      if 1 == AK["State"] then
        AK["State"] = 0
        t4.num_90cf = 0
      else
        AK["State"] = 1
        t4.num_90cf = 1
      end
    end
    local AL = Obj.Append(As, "UILayoutGrid")
    AL["W"] = "100%"
    AL["H"] = "100%"
    AL["Anchors"] = {
      left = 2,
      right = 2,
      top = 1,
      bottom = 1
    }
    AL["Margin"] = {
      left = 5,
      right = 0,
      top = 0,
      bottom = 0
    }
    AL["AlignmentH"] = "Center"
    AL["AlignmentV"] = "Center"
    AL["Rows"] = 7
    AL["Columns"] = 1
    AL[1][1]["SizePolicy"] = "Fixed"
    AL[1][1]["Size"] = Av
    AL[1][2]["SizePolicy"] = "Fixed"
    AL[1][2]["Size"] = Av
    AL[1][3]["SizePolicy"] = "Fixed"
    AL[1][3]["Size"] = Av
    AL[1][4]["SizePolicy"] = "Fixed"
    AL[1][4]["Size"] = Av
    AL[1][5]["SizePolicy"] = "Fixed"
    AL[1][5]["Size"] = Av
    AL[1][6]["SizePolicy"] = "Fixed"
    AL[1][6]["Size"] = Av
    AL[1][7]["SizePolicy"] = "Fixed"
    AL[1][7]["Size"] = Av
    local AM = Obj.Append(AL, "CheckBox")
    AM["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AM["Text"] = "Add Tempo to Cue Note"
    AM["AlignmentH"] = "Center"
    AM["AlignmentV"] = "Center"
    AM["State"] = t4.num_772e
    AM["PluginComponent"] = w
    AM["Clicked"] = "OnCheckSetTempoNoteClicked"
    AM["Texture"] = "corner3"
    v["OnCheckSetTempoNoteClicked"] = function(mX)
      if 1 == AM["State"] then
        AM["State"] = 0
        t4.num_772e = 0
      else
        AM["State"] = 1
        t4.num_772e = 1
      end
    end
    local AN = Obj.Append(AL, "CheckBox")
    AN["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    AN["Text"] = "Add Timecode to Cue Note"
    AN["AlignmentH"] = "Center"
    AN["AlignmentV"] = "Center"
    AN["State"] = t4.num_f447
    AN["PluginComponent"] = w
    AN["Clicked"] = "OnCheckSetTimecodeNoteClicked"
    v["OnCheckSetTimecodeNoteClicked"] = function(mX)
      if 1 == AN["State"] then
        AN["State"] = 0
        t4.num_f447 = 0
      else
        AN["State"] = 1
        t4.num_f447 = 1
      end
    end
    local AO = Obj.Append(AL, "CheckBox")
    AO["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    AO["Text"] = "Set Tempo var\nin Cue CMDs"
    AO["AlignmentH"] = "Center"
    AO["AlignmentV"] = "Center"
    AO["State"] = t4.num_0be4
    AO["PluginComponent"] = w
    AO["Clicked"] = "OnCheckUseTempoCmdClicked"
    v["OnCheckUseTempoCmdClicked"] = function(mX)
      if 1 == AO["State"] then
        AO["State"] = 0
        t4.num_0be4 = 0
      else
        AO["State"] = 1
        t4.num_0be4 = 1
      end
    end
    local AP = Obj.Append(AL, "UILayoutGrid")
    AP["W"] = "100%"
    AP["H"] = "100%"
    AP["Anchors"] = {
      left = 0,
      right = 0,
      top = 3,
      bottom = 3
    }
    AP["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AP["AlignmentH"] = "Center"
    AP["AlignmentV"] = "Center"
    AP["Rows"] = 2
    AP["Columns"] = 1
    AP[1][1]["SizePolicy"] = "Fixed"
    AP[1][1]["Size"] = "5"
    local AQ = Obj.Append(AP, "UIObject")
    AQ["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AQ["HasHover"] = "No"
    AQ["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AQ["Name"] = "SettingsTitle"
    AQ["BackColor"] = z8
    A.ab06e3d9({
      a2ac9f94 = {
        a01d416c = AP,
        aa749a18 = {
          left = 0,
          right = 0,
          top = 1,
          bottom = 1
        },
        ab21b3aa = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        },
        a7115302 = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        },
        aa86fe72 = "Set Speed Master in Cue CMDs",
        a031dcf5 = "Set Speed Master in Cue CMDs",
        a6e71315 = w,
        add46b74 = v
      },
      aa72fe59 = t4.yes_no_flag,
      a4ba497e = true,
      accc0f89 = true,
      aea86235 = rm.a8cd96ec(),
      a7f071c5 = function(e)
        if e.ab6e56b2 then
          t4.yes_no_flag = e.ab6e56b2
        end
      end
    })
    local AR = Obj.Append(AL, "CheckBox")
    AR["Anchors"] = {
      left = 0,
      right = 0,
      top = 4,
      bottom = 4
    }
    AR["Text"] = "Use Reaper marker\nnumbers as Cue numbers"
    AR["AlignmentH"] = "Center"
    AR["AlignmentV"] = "Center"
    AR["State"] = t4.num_5f0f
    AR["PluginComponent"] = w
    AR["Clicked"] = "OnCheckUseReaperMarkersClicked"
    AR["Enabled"] = "Yes"
    AR["Texture"] = "corner12"
    v["OnCheckUseReaperMarkersClicked"] = function(mX)
      if 1 == AR["State"] then
        AR["State"] = 0
        t4.num_5f0f = 0
      else
        AR["State"] = 1
        t4.num_5f0f = 1
      end
    end
    local AS = Obj.Append(AL, "UILayoutGrid")
    AS["W"] = "100%"
    AS["H"] = "100%"
    AS["Anchors"] = {
      left = 0,
      right = 0,
      top = 5,
      bottom = 5
    }
    AS["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AS["AlignmentH"] = "Center"
    AS["AlignmentV"] = "Center"
    AS["Rows"] = 2
    AS["Columns"] = 1
    AS[1][1]["SizePolicy"] = "Fixed"
    AS[1][1]["Size"] = "5"
    AS["Visible"] = false
    local AT = Obj.Append(AS, "UIObject")
    AT["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AT["HasHover"] = "No"
    AT["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    AT["Name"] = "SettingsTitle"
    AT["BackColor"] = z8
    local AU = {
      ac7d80e0 = "SelectLocalLinkingDataOption",
      ad7531f0 = "Set Local Linking Data Option",
      afb23588 = rm.a17386a9,
      ae2ecd88 = "int",
      a3c78c74 = t4.num_26ae,
      a55dfd63 = "corner12",
      a031dcf5 = "Set Local Linking Data Option",
      aa749a18 = {
        left = 0,
        right = 0,
        top = 1,
        bottom = 1
      },
      ab21b3aa = {
        left = 5,
        right = 5,
        top = 5,
        bottom = 5
      },
      a7115302 = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0
      }
    }
    
    local function AV()
      t4.num_26ae = AU.a3c78c74
    end
    
    local AW = A.ab06e3d9({
      a2ac9f94 = {
        a01d416c = AS,
        aa749a18 = {
          left = 0,
          right = 0,
          top = 1,
          bottom = 1
        },
        ab21b3aa = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        },
        a7115302 = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        },
        a55dfd63 = "corner12",
        aa86fe72 = "Set Local Linking Data Option",
        a031dcf5 = "Set Local Linking Data Option",
        a6e71315 = w,
        add46b74 = v
      },
      aa72fe59 = t4.num_26ae,
      a4ba497e = true,
      accc0f89 = true,
      aea86235 = rm.a17386a9,
      a7f071c5 = function(e)
        if e.aa6d9a63 then
          t4.num_26ae = e.aa6d9a63
        else
          t4.num_26ae = 0
        end
      end
    })
    if y.plugin_label == "MArkersLIVE" then
      AS["Visible"] = true
      AR["Texture"] = "corner0"
      AW["Texture"] = "corner12"
    end
    local AX = Obj.Append(hB, "UIObject")
    AX["text"] = "For help with settings, visit ma.tools/MArkers/help"
    AX["ContentDriven"] = "Yes"
    AX["ContentWidth"] = "No"
    AX["TextAutoAdjust"] = "Yes"
    AX["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    AX["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    AX["HasHover"] = "No"
    AX["BackColor"] = yB
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["W"] = "100%"
    tF["H"] = "100%"
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["AlignmentH"] = "Center"
    tF["AlignmentV"] = "Center"
    tF["Rows"] = 1
    tF["Columns"] = 1
    tF["Margin"] = {
      left = 0,
      right = 0,
      top = 10,
      bottom = 0
    }
    local tH = Obj.Append(tF, "Button")
    tH["Margin"] = {
      left = 1,
      right = 1,
      top = 2,
      bottom = 0
    }
    tH["AlignmentH"] = "Center"
    tH["AlignmentV"] = "Center"
    tH["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tH["Textshadow"] = 1
    tH["HasHover"] = "Yes"
    tH["Text"] = "Close"
    tH["Font"] = "Medium20"
    tH["PluginComponent"] = w
    tH["Clicked"] = "OnFinishedSettingsClicked"
    v["OnFinishedSettingsClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
    end
    WaitObjectDelete(hw)
    z7.a51542a0.Enabled = true
    return z9
  end
  
  function Ac.adbd069f(qF, sW, ry)
    local x4 = Root().ColorTheme.ColorGroups["Global"]["AlertText"]
    local AY = Root().ColorTheme.ColorGroups["Global"]["AlertText"]
    local AZ = Root().ColorTheme.ColorGroups["Global"]["SelectedInverted"]
    local A_ = Root().ColorTheme.ColorGroups["MessageCenter"]["FlashErrorBackground"]
    local B0 = Root().ColorTheme.ColorGroups["Global"]["BackgroundSelected"]
    local yB = Root().ColorTheme.ColorGroups.Global.Transparent
    local yC = Root().ColorTheme.ColorGroups.Global.Pressed
    local yD = Root().ColorTheme.ColorGroups.Button.Background
    local yE = Root().ColorTheme.ColorGroups.Global.Text
    local zw = Root().ColorTheme.ColorGroups.Global.LabelText
    local B1 = Root().ColorTheme.ColorGroups.Global.PartlySelectedPreset
    local B2 = Root().ColorTheme.ColorGroups.Global.PartlySelectedPreset
    local B3 = Root().ColorTheme.ColorGroups.Global.Darkened
    local B4 = Root().ColorTheme.ColorGroups.Network.NetworkError
    z = Obj.Index(GetFocusDisplay()) or z or 1
    if z >= 4 and z <= 7 then
      z = 1
    end
    local hu = Root().GraphicsRoot.PultCollect:Ptr(1).DisplayCollect:Ptr(z)
    local hv = hu.ModalOverlay
    local hw
    local t4 = {
      a52fede5 = 0,
      af96c73e = qF.af96c73e,
      a190b284 = qF.flag_offset,
      a28a3a8e = qF.a3bdc261,
      aeddce3c = {},
      ac583297 = qF.num_c583 or GetVar(y.g_plugin_var_obj, "ImportUseColors") or y.a52ba751["ImportUseColors"].num_3928,
      a6f9eaf5 = qF.num_6f9e or GetVar(y.g_plugin_var_obj, "ImportCombineColors") or y.a52ba751["ImportCombineColors"].num_3928,
      a88eb4bf = qF.num_88eb or GetVar(y.g_plugin_var_obj, "ImportTCOffset") or y.a52ba751["ImportTCOffset"].num_3928,
      af7e433a = qF.num_f7e4 or 0,
      a3a3e551 = qF.num_3a3e or GetVar(y.g_plugin_var_obj, "ImportUseBrackets") or y.a52ba751["ImportUseBrackets"].num_3928,
      ad0c7956 = qF.num_d0c7 or GetVar(y.g_plugin_var_obj, "ImportUseSquareBrackets") or y.a52ba751["ImportUseSquareBrackets"].num_3928,
      a94b9607 = qF.num_94b9 or GetVar(y.g_plugin_var_obj, "ImportUseTriangleBrackets") or y.a52ba751["ImportUseTriangleBrackets"].num_3928,
      afc650e4 = qF.num_fc65 or GetVar(y.g_plugin_var_obj, "ImportUseCaret") or y.a52ba751["ImportUseCaret"].num_3928,
      ad99ba0f = qF.num_d99b or GetVar(y.g_plugin_var_obj, "ImportUseBraces") or y.a52ba751["ImportUseBraces"].num_3928,
      a0be4296 = qF.num_0be4 or GetVar(y.g_plugin_var_obj, "ImportUseTempoCmd") or y.a52ba751["ImportUseTempoCmd"].num_3928,
      af6702fb = qF.num_f670 or GetVar(y.g_plugin_var_obj, "ImportTempoSeq") or y.a52ba751["ImportTempoSeq"].num_3928,
      a7fa0b8b = qF.a7fa0b8b or GetVar(y.g_plugin_var_obj, "AssignSeqsToPages") or y.a52ba751["AssignSeqsToPages"].num_3928,
      a5f0f10b = qF.num_5f0f or GetVar(y.g_plugin_var_obj, "UseReaperMarkerNumbers") or y.a52ba751["UseReaperMarkerNumbers"].num_3928,
      a90cfb05 = qF.num_90cf or GetVar(y.g_plugin_var_obj, "AppearancesFromRegions") or y.a52ba751["AppearancesFromRegions"].num_3928,
      a5eab388 = qF.yes_no_flag or GetVar(y.g_plugin_var_obj, "SetSpeedMasterCmd") or y.a52ba751["SetSpeedMasterCmd"].num_3928,
      a70e02e7 = qF.a70e02e7 or GetVar(y.g_plugin_var_obj, "defSeqColor") or y.a52ba751["defSeqColor"].num_3928,
      a772ebfe = qF.num_772e or GetVar(y.g_plugin_var_obj, "ImportSetTempoNote") or y.a52ba751["ImportSetTempoNote"].num_3928,
      af44735c = qF.num_f447 or GetVar(y.g_plugin_var_obj, "ImportSetTimecodeNote") or y.a52ba751["ImportSetTimecodeNote"].num_3928,
      ab9a9eaa = qF.ab9a9eaa or nil,
      a26aeca2 = qF.num_26ae or GetVar(y.g_plugin_var_obj, "LocalLinkingData") or y.a52ba751["LocalLinkingData"].num_3928,
      a2f33b31 = nil
    }
    if qF.ab453ab2 then
      t4.a027c659 = qF.ab453ab2.No
    end
    if 0 == t4.num_f7e4 then
      t4.num_d192 = 1
    else
      t4.num_d192 = 0
    end
    local z7 = {}
    local B5
    for ac, e4 in pairs(sW.tbl_13c3) do
      table.insert(t4.aeddce3c, e4)
    end
    for ac, e4 in pairs(sW.ab3a0ae8) do
      table.insert(t4.aeddce3c, e4)
    end
    local tw = #t4.aeddce3c
    z7.ae170f1e = tw
    for Q = 1, Obj.Count(hv) do
      if Q > 2 then
        Obj.Delete(hv, Q)
      end
    end
    local hx = 1750
    if y.plugin_label ~= "MArkersLIVE" then
      hx = 1400
    end
    hw = Obj.Append(hv, "BaseInput")
    hw["Name"] = "MArkersImportWindow"
    hw["H"] = "0"
    hw["W"] = hx
    hw["MaxSize"] = string.format("%s,%s", hu.W * 0.8, hu.H * 0.8)
    hw["MinSize"] = string.format("%s,0", hx - 100)
    hw["Rows"] = 2
    hw["Columns"] = 1
    hw[1][1]["SizePolicy"] = "Fixed"
    hw[1][1]["Size"] = "60"
    hw[1][2]["SizePolicy"] = "Stretch"
    hw["AutoClose"] = "No"
    hw["CloseOnEscape"] = "Yes"
    hw["Visible"] = false
    z7.a51542a0 = hw
    local hy = Obj.Append(hw, "TitleBar")
    hy["Rows"] = 1
    hy["Columns"] = 3
    hy["Anchors"] = "0,0"
    hy[2][2]["SizePolicy"] = "Fixed"
    hy[2][2]["Size"] = "50"
    hy[2][3]["SizePolicy"] = "Fixed"
    hy[2][3]["Size"] = "50"
    hy["Texture"] = "corner2"
    local hz = Obj.Append(hy, "TitleButton")
    hz["text"] = y.g_full_label
    hz["Texture"] = "corner1"
    hz["Anchors"] = "0,0"
    hz["Icon"] = y.company_label
    local B6 = hw["BackColor"]
    local B7 = Obj.Append(hy, "Button")
    B7["Anchors"] = "1,0"
    B7["Padding"] = {
      left = 3,
      right = 3,
      top = 3,
      bottom = 3
    }
    B7["BackColor"] = Root().ColorTheme.ColorGroups["Overlay"]["FrameColor"]
    B7["Icon"] = "settings"
    B7["PluginComponent"] = w
    B7["Clicked"] = "OnSettingsCogPressed"
    local hA = Obj.Append(hy, "CloseButton")
    hA["Anchors"] = "2,0"
    hA["Texture"] = "corner2"
    local hB = Obj.Append(hw, "DialogFrame")
    hB["H"] = "100%"
    hB["W"] = "100%"
    hB["Rows"] = 5
    hB["Columns"] = 1
    hB["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    hB[1][1]["SizePolicy"] = "Fixed"
    hB[1][1]["Size"] = "160"
    hB[1][2]["SizePolicy"] = "Stretch"
    hB[1][3]["SizePolicy"] = "Fixed"
    hB[1][3]["Size"] = "10"
    hB[1][4]["SizePolicy"] = "Fixed"
    hB[1][4]["Size"] = "60"
    hB[1][5]["SizePolicy"] = "Fixed"
    hB[1][5]["Size"] = "60"
    local B8 = Obj.Append(hB, "UILayoutGrid")
    B8["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    B8["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    B8["Rows"] = 3
    B8["Columns"] = 1
    B8[1][1]["SizePolicy"] = "Fixed"
    B8[1][1]["Size"] = 70
    B8[1][2]["SizePolicy"] = "Fixed"
    B8[1][2]["Size"] = 0
    B8[1][3]["SizePolicy"] = "Fixed"
    B8[1][3]["Size"] = 80
    local B9 = Obj.Append(B8, "UIObject")
    B9["text"] = string.format("Reaper Project: %s", qF.a3bdc261)
    B9["ContentDriven"] = "Yes"
    B9["ContentWidth"] = "No"
    B9["TextAutoAdjust"] = "Yes"
    B9["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    B9["Padding"] = {
      left = 20,
      right = 20,
      top = 5,
      bottom = 5
    }
    B9["Font"] = "Regular28"
    B9["HasHover"] = "No"
    local Ba = Obj.Append(B8, "UIObject")
    Ba["text"] = string.format("")
    Ba["ContentDriven"] = "Yes"
    Ba["ContentWidth"] = "No"
    Ba["TextAutoAdjust"] = "Yes"
    Ba["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Ba["Padding"] = {
      left = 20,
      right = 20,
      top = 5,
      bottom = 5
    }
    Ba["HasHover"] = "No"
    local Bb = Obj.Append(B8, "UILayoutGrid")
    Bb["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    Bb["Rows"] = 1
    Bb["Columns"] = 2
    Bb[2][1]["SizePolicy"] = "Stretch"
    Bb[2][1]["Size"] = 0.75
    Bb[2][2]["SizePolicy"] = "Stretch"
    Bb[2][2]["Size"] = 0.25
    local Bc = Obj.Append(Bb, "UILayoutGrid")
    Bc["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bc["Rows"] = 3
    Bc["Columns"] = 1
    Bc[1][1]["Size"] = 0
    if y.plugin_label == "MArkers" then
      Bc[1][2]["Size"] = 0
      Bc[1][3]["Size"] = 0
      B8[1][3]["Size"] = 0
      hB[1][1]["Size"] = 80
    end
    if y.g_str_false == "true" then
      B8[1][2]["Size"] = 50
      hB[1][1]["Size"] = 210
      if y.plugin_label == "MArkers" then
        hB[1][1]["Size"] = 110
      end
      Ba["BackColor"] = Root().ColorTheme.ColorGroups["MessageCenter"]["NewAlertBackground"]
      Ba["text"] = string.format("The trial version is limited to a maximum of 3 x Sequences and only the first 3 events of each track in the first 20 secs of the Reaper file.")
    end
    local Bd = Obj.Append(Bc, "UIObject")
    Bd["text"] = string.format("Sequences")
    Bd["ContentDriven"] = "Yes"
    Bd["ContentWidth"] = "No"
    Bd["TextAutoAdjust"] = "Yes"
    Bd["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bd["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bd["HasHover"] = "No"
    Bd["Font"] = "Medium20"
    Bd["BackColor"] = B0
    local Be = Obj.Append(Bc, "UIObject")
    Be["text"] = string.format("Color key:")
    Be["ContentDriven"] = "Yes"
    Be["ContentWidth"] = "No"
    Be["TextAutoAdjust"] = "Yes"
    Be["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Be["Padding"] = {
      left = 20,
      right = 20,
      top = 5,
      bottom = 5
    }
    Be["HasHover"] = "No"
    Be["BackColor"] = B0
    local Bf = Obj.Append(Bc, "UILayoutGrid")
    Bf["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    Bf["Rows"] = 1
    Bf["Columns"] = 3
    local Bg = Obj.Append(Bf, "UIObject")
    Bg["text"] = string.format("New item")
    Bg["ContentDriven"] = "Yes"
    Bg["ContentWidth"] = "No"
    Bg["TextAutoAdjust"] = "Yes"
    Bg["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bg["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bg["HasHover"] = "No"
    local Bh = Obj.Append(Bf, "UIObject")
    Bh["text"] = string.format("Saved item")
    Bh["ContentDriven"] = "Yes"
    Bh["ContentWidth"] = "No"
    Bh["TextAutoAdjust"] = "Yes"
    Bh["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Bh["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bh["HasHover"] = "No"
    Bh["TextColor"] = AZ
    local Bi = Obj.Append(Bf, "UIObject")
    Bi["text"] = string.format("Existing item")
    Bi["ContentDriven"] = "Yes"
    Bi["ContentWidth"] = "No"
    Bi["TextAutoAdjust"] = "Yes"
    Bi["Anchors"] = {
      left = 2,
      right = 2,
      top = 0,
      bottom = 0
    }
    Bi["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bi["HasHover"] = "No"
    Bi["TextColor"] = A_
    local Bj = Obj.Append(Bb, "UIObject")
    Bj["text"] = string.format("Pages")
    Bj["ContentDriven"] = "Yes"
    Bj["ContentWidth"] = "No"
    Bj["TextAutoAdjust"] = "Yes"
    Bj["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Bj["Padding"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bj["HasHover"] = "No"
    Bj["Font"] = "Medium20"
    Bj["BackColor"] = B0
    local Bk = Obj.Append(hB, "UILayoutGrid")
    Bk["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Bk["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bk["Rows"] = 1
    Bk["Columns"] = 2
    Bk[2][1]["SizePolicy"] = "Stretch"
    Bk[2][1]["Size"] = 0.75
    Bk[2][2]["SizePolicy"] = "Stretch"
    Bk[2][2]["Size"] = 0.25
    if y.plugin_label ~= "MArkersLIVE" then
      Bk[2][1]["Size"] = 1
      Bk[2][2]["Size"] = 0
      Bb[2][1]["Size"] = 1
      Bb[2][2]["Size"] = 0
    end
    local Bl = Obj.Append(Bk, "UILayoutGrid")
    Bl["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bl["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bl["Rows"] = 3
    Bl["Columns"] = 1
    Bl[1][1]["SizePolicy"] = "Fixed"
    Bl[1][1]["Size"] = tx
    Bl[1][2]["SizePolicy"] = "Fixed"
    Bl[1][2]["Size"] = 70
    Bl[1][3]["SizePolicy"] = "Stretch"
    local Bm = Obj.Append(Bl, "UILayoutGrid")
    Bm["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bm["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bm["Rows"] = 1
    Bm["Columns"] = 6
    Bm[2][1]["SizePolicy"] = "Fixed"
    Bm[2][1]["Size"] = 60
    Bm[2][2]["SizePolicy"] = "Stretch"
    Bm[2][2]["MinSize"] = 100
    Bm[2][3]["SizePolicy"] = "Fixed"
    Bm[2][3]["Size"] = 180
    Bm[2][4]["SizePolicy"] = "Fixed"
    Bm[2][4]["Size"] = 200
    Bm[2][5]["SizePolicy"] = "Fixed"
    Bm[2][5]["Size"] = 475
    Bm[2][6]["SizePolicy"] = "Fixed"
    Bm[2][6]["Size"] = 70
    z7.a9e17a5f = Bm
    if tw > Ad then
      z7.a9e17a5f[2][6]["Size"] = 90
    end
    local Bn = Obj.Append(Bm, "TitleButton")
    Bn["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bn["Margin"] = {
      left = 0,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bn["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    Bn["Icon"] = "time"
    Bn["HasHover"] = "Yes"
    Bn["Interactive"] = "Yes"
    Bn["PluginComponent"] = w
    Bn["Clicked"] = "OnToggleAllEnabledClicked"
    local Bo = Obj.Append(Bm, "UIObject")
    Bo["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bo["AlignmentV"] = "Center"
    Bo["text"] = "Timecode"
    Bo["TextAlignmentH"] = "Left"
    Bo["ContentDriven"] = "Yes"
    Bo["ContentWidth"] = "No"
    Bo["TextAutoAdjust"] = "Yes"
    Bo["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Bo["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    Bo["HasHover"] = "No"
    Bn["BackColor"] = Bo["BackColor"]
    local Bp, Bq, Br
    local Bs = qF.af96c73e
    local Bt = Obj.Append(Bm, "LineEdit")
    Bt["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bt["AlignmentV"] = "Center"
    Bt["Prompt"] = ""
    Bt["Content"] = qF.af96c73e
    Bt["ContentDriven"] = "Yes"
    Bt["ContentWidth"] = "No"
    Bt["TextAutoAdjust"] = "Yes"
    Bt["Anchors"] = {
      left = 2,
      right = 2,
      top = 0,
      bottom = 0
    }
    Bt["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    Bt["Filter"] = "0123456789"
    Bt["VkPluginName"] = "TextInputNumOnly"
    Bt["MaxTextLength"] = 4
    Bt["HideFocusFrame"] = "Yes"
    Bt["PluginComponent"] = w
    Bt["TextChanged"] = "OnInputTCFieldValueTextChanged"
    z7.aa1646f9 = Bo["TextColor"]
    z7.a2e90598 = Bo["BackColor"]
    if DataPool().Timecodes[tonumber(qF.af96c73e)] then
      Bt["TextColor"] = A_
      if tonumber(qF.af96c73e) == Bs then
        Bt["TextColor"] = AZ
      end
    end
    v["OnInputTCFieldValueTextChanged"] = function(mX)
      if tonumber(mX["Content"]) then
        if tonumber(mX["Content"]) < 1 then
          mX["Content"] = 1
        end
        if tonumber(mX["Content"]) > 9999 then
          mX["Content"] = 9999
        end
      end
      t4.af96c73e = string.match(Bt["Content"], "%d+") or ""
      if "" == string.gsub(t4.af96c73e, " ", "") then
        return
      end
      if DataPool().Timecodes[tonumber(t4.af96c73e)] then
        mX["TextColor"] = A_
        if tonumber(t4.af96c73e) == Bs then
          mX["TextColor"] = AZ
        end
      else
        mX["TextColor"] = z7.aa1646f9
      end
    end
    local Bu = Obj.Append(Bm, "LineEdit")
    Bu["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bu["AlignmentV"] = "Center"
    Bu["Prompt"] = "Offset:   "
    Bu["Content"] = t4.flag_offset
    Bu["ContentDriven"] = "Yes"
    Bu["ContentWidth"] = "No"
    Bu["TextAutoAdjust"] = "Yes"
    Bu["Anchors"] = {
      left = 3,
      right = 3,
      top = 0,
      bottom = 0
    }
    Bu["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    Bu["Filter"] = "0123456789+-"
    Bu["VkPluginName"] = "TextInputNumOnly"
    Bu["MaxTextLength"] = 6
    Bu["HideFocusFrame"] = "Yes"
    Bu["PluginComponent"] = w
    Bu["TextChanged"] = "OnInputTCLatencyValueTextChanged"
    local Bv = Obj.Append(Bm, "Button")
    Bv["Margin"] = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5
    }
    Bv["AlignmentH"] = "Center"
    Bv["AlignmentV"] = "Center"
    Bv["Anchors"] = {
      left = 4,
      right = 4,
      top = 0,
      bottom = 0
    }
    Bv["Textshadow"] = 1
    Bv["HasHover"] = "Yes"
    Bv["Text"] = "Generate Waveform"
    Bv["Font"] = "Medium20"
    Bv["PluginComponent"] = w
    Bv["Clicked"] = "OnGetWaveformsClicked"
    Bv["Icon"] = "object_sound3"
    Bv["IconAlignmentH"] = "Left"
    Bv["Padding"] = {
      left = 20,
      right = 20,
      top = 0,
      bottom = 0
    }
    Bv["Texture"] = "corner15"
    v["OnGetWaveformsClicked"] = function(mX)
      if yg and type(yg) == "table" then
        t4.flag_2a1f = true
        local yo, dl = yg.a5df0dc7(qF.a3075197 or 300, qF.ab453ab2)
        t4.flag_2a1f = false
        if dl then
          A.a880c84e(y.g_full_label, dl, true)
          return
        end
        if yo and yo.a87591ee then
          t4.a2f33b31 = yo.a87591ee
          mX["BackColor"] = B1
          mX["Text"] = "Waveform Generated"
        end
      end
    end
    if A.a4077f93() and qF.str_7a7d == "Network" then
      Bv["Visible"] = "Yes"
    else
      Bv["Visible"] = "No"
    end
    local Bw = Obj.Append(Bl, "ScrollContainer")
    Bw["Anchors"] = {
      left = 0,
      right = 0,
      top = 2,
      bottom = 2
    }
    Bw["MaxSize"] = "0,100%"
    Bw["ContentDriven"] = "Yes"
    Bw["ContentWidth"] = "No"
    Bw["Padding"] = {
      left = 0,
      right = 5,
      top = 0,
      bottom = 0
    }
    Bw["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Bw["DefaultMargin"] = 0
    Bw["Transparent"] = "No"
    local tv = Obj.Append(Bw, "ScrollBox")
    tv["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tv["ContentDriven"] = "Yes"
    tv["ContentWidth"] = "No"
    tv["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tv["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    local Bx
    Ae = "Markers"
    
    function z7.af37963c()
      if Bx and Obj.IsValid(Bx) then
        coroutine.yield(0.1)
        Obj.Delete(Obj.Parent(Bx), Obj.Index(Bx))
      end
      z7.tbl_0f28 = {}
      for ac, e4 in ipairs(t4.aeddce3c) do
        if e4.str_ecae == Ae then
          table.insert(z7.tbl_0f28, ac)
        end
      end
      Bx = Obj.Append(tv, "UILayoutGrid")
      Bx["Columns"] = 1
      local By = 100
      local Bz = math.ceil(#z7.tbl_0f28 / By)
      Bx["Rows"] = Bz
      Bx["ContentWidth"] = "No"
      local BA = {}
      z7.tbl_aaff = {}
      for Q = 1, Bz do
        local BB
        if Q ~= Bz then
          BB = By
        else
          BB = #z7.tbl_0f28 % By
        end
        BA[Q] = Obj.Append(Bx, "UILayoutGrid")
        BA[Q]["Anchors"] = {
          left = 0,
          right = 0,
          top = Q - 1,
          bottom = Q - 1
        }
        BA[Q]["Padding"] = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0
        }
        BA[Q]["Rows"] = BB
        BA[Q]["Columns"] = 9
        BA[Q]["ContentWidth"] = "No"
        Bx[1][Q]["SizePolicy"] = "Fixed"
        Bx[1][Q]["Size"] = BB * tx
        BA[Q][2][1]["SizePolicy"] = "Fixed"
        BA[Q][2][1]["Size"] = 60
        BA[Q][2][2]["SizePolicy"] = "Stretch"
        BA[Q][2][2]["MinSize"] = 100
        BA[Q][2][3]["SizePolicy"] = "Fixed"
        BA[Q][2][3]["Size"] = 180
        BA[Q][2][4]["SizePolicy"] = "Fixed"
        BA[Q][2][4]["Size"] = 120
        BA[Q][2][5]["SizePolicy"] = "Fixed"
        BA[Q][2][5]["Size"] = 80
        BA[Q][2][6]["SizePolicy"] = "Fixed"
        BA[Q][2][6]["Size"] = 140
        BA[Q][2][7]["SizePolicy"] = "Fixed"
        BA[Q][2][7]["Size"] = 170
        BA[Q][2][8]["SizePolicy"] = "Fixed"
        BA[Q][2][8]["Size"] = 170
        BA[Q][2][9]["SizePolicy"] = "Fixed"
        BA[Q][2][9]["Size"] = 60
        z7.tbl_aaff[Q] = BA[Q]
      end
      if 0 == t4.num_f7e4 then
        for ac, e4 in pairs(z7.tbl_aaff) do
          e4[2][9]["Size"] = 0
        end
        z7.a9e17a5f[2][6]["Size"] = 10
        if tw > 7 then
          z7.a9e17a5f[2][6]["Size"] = 30
        end
      end
      z7.tbl_e394 = {}
      z7.tbl_7846 = {}
      z7.tbl_9d42 = {}
      z7.tbl_a718 = {}
      z7.tbl_0d10 = {}
      z7.tbl_6c06 = {}
      z7.tbl_5dc8 = {}
      z7.tbl_fc35 = {}
      z7.tbl_463f = {}
      for BC, BD in ipairs(z7.tbl_0f28) do
        do
          local BE = BC / By
          if BE % 1 > 0 then
            BE = math.floor(BE) + 1
          else
            BE = math.floor(BE)
          end
          local ty = BA[BE]
          local BF = BC % By
          if 0 == BF then
            coroutine.yield(0.2)
            BF = By
          end
          local BG = BF - 1
          ty[1][BF]["SizePolicy"] = "Fixed"
          ty[1][BF]["Size"] = tx
          local BH = Obj.Append(ty, "TitleButton")
          BH["Name"] = string.format("SeqIcon_%s", BC)
          BH["Anchors"] = {
            left = 0,
            right = 0,
            top = BG,
            bottom = BG
          }
          BH["Margin"] = {
            left = 0,
            right = 5,
            top = 5,
            bottom = 5
          }
          BH["Padding"] = {
            left = 10,
            right = 10,
            top = 10,
            bottom = 10
          }
          BH["Icon"] = "object_sequence"
          BH["HasHover"] = "Yes"
          BH["Interactive"] = "Yes"
          BH["PluginComponent"] = w
          BH["Clicked"] = string.format("OnInputIcon%sClicked", BD)
          z7.tbl_e394[BC] = BH
          if t4.aeddce3c[BD].master_idx == t4.a70e02e7 then
            BH["Icon"] = "star"
          end
          if t4.aeddce3c[BD].stem_index then
            BH["Icon"] = "object_sound2"
          end
          
          function z7.a69cb802()
            for ac, e4 in pairs(z7.tbl_e394) do
              if t4.aeddce3c[z7.tbl_0f28[ac]].master_idx == t4.a70e02e7 then
                e4["Icon"] = "star"
              elseif t4.aeddce3c[z7.tbl_0f28[ac]].stem_index then
                e4["Icon"] = "object_sound2"
              else
                e4["Icon"] = "object_sequence"
              end
            end
          end
          
          t4.aeddce3c[BD].a4e015bd = rm.aad72235(t4.aeddce3c[BD].adb219bd)
          local we = Obj.Append(ty, "UIObject")
          we["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          we["AlignmentV"] = "Center"
          we["Text"] = t4.aeddce3c[BD].a3bdc261
          we["TextAlignmentH"] = "Left"
          we["ContentDriven"] = "Yes"
          we["ContentWidth"] = "No"
          we["TextAutoAdjust"] = "Yes"
          we["Anchors"] = {
            left = 1,
            right = 1,
            top = BG,
            bottom = BG
          }
          we["Padding"] = {
            left = 10,
            right = 10,
            top = 10,
            bottom = 10
          }
          we["HasHover"] = "Yes"
          we["Interactive"] = "Yes"
          we["PluginComponent"] = w
          we["BackColor"] = t4.aeddce3c[BD].a4e015bd
          we["Clicked"] = string.format("OnInputLabel%sClicked", BD)
          z7.tbl_7846[BC] = we
          z7.tbl_0d10[BC] = t4.aeddce3c[BD].adb219bd
          BH["BackColor"] = we["BackColor"]
          v[string.format("OnInputLabel%sClicked", BD)] = function(mX)
            hw["Enabled"] = "No"
            local BI = rm.a2064023(mX["BackColor"])
            local wa, wb = rm.a3d854b5(v, w, mX["Text"], BI)
            mX["BackColor"] = rm.aad72235(wb)
            z7.tbl_e394[BC]["BackColor"] = mX["BackColor"]
            t4.aeddce3c[BD].adb219bd = wb
            t4.aeddce3c[BD].flag_8d3a = false
            t4.aeddce3c[BD].a3bdc261 = wa
            mX["Text"] = wa
            hw["Enabled"] = "Yes"
          end
          local BJ = Obj.Append(ty, "LineEdit")
          BJ["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          BJ["AlignmentV"] = "Center"
          BJ["Prompt"] = "Seq: "
          BJ["Content"] = t4.aeddce3c[BD].a283b5c6
          BJ["ContentDriven"] = "Yes"
          BJ["ContentWidth"] = "No"
          BJ["TextAutoAdjust"] = "Yes"
          BJ["Anchors"] = {
            left = 2,
            right = 2,
            top = BG,
            bottom = BG
          }
          BJ["Padding"] = {
            left = 10,
            right = 10,
            top = 10,
            bottom = 10
          }
          BJ["Filter"] = "0123456789"
          BJ["VkPluginName"] = "TextInputNumOnly"
          BJ["MaxTextLength"] = 4
          BJ["HideFocusFrame"] = "Yes"
          BJ["PluginComponent"] = w
          BJ["TextChanged"] = string.format("OnInputFieldValue%01dTextChanged", BD)
          BJ["FocusLost"] = string.format("OnInputFieldValue%01dFocusLost", BD)
          z7.tbl_9d42[BC] = BJ
          if DataPool()["Sequences"][tonumber(t4.aeddce3c[BD].a283b5c6)] then
            BJ["TextColor"] = A_
            if tonumber(t4.aeddce3c[BD].a283b5c6) == t4.aeddce3c[BD].a79b2c7f then
              BJ["TextColor"] = AZ
            end
          end
          
          local function BK(BL, BM, BN)
            local function BO()
              BM["BackColor"] = Root().ColorTheme.ColorGroups.Global.Default
            end
            
            local function BP()
              BM["BackColor"] = B4
            end
            
            local BQ = DataPool().Sequences[tonumber(t4.aeddce3c[BD].a283b5c6)]
            if not BQ then
              BO()
              return
            end
            local BR = 0
            local BS = t4.aeddce3c[BD].aa0327eb
            BS = tonumber(BS)
            local BT = false
            if not BS then
              return
            end
            for ac, e4 in ipairs(ry.tbl_9171) do
              if e4.master_idx == BL.master_idx then
                if not e4.a1925f31 or Obj.Parent(e4.a1925f31) ~= BQ then
                  BR = BR + 1
                else
                  BT = true
                  local tU = A.abb404ee(e4.a1925f31)
                  local BU = tU - BS
                  BU = BU * 1000
                  BU = A.a59b6fcc(BU, 3)
                  if BR <= BU then
                    BR = 0
                  end
                  break
                end
              end
            end
            if 0 == BR or not BT then
              BO()
              return
            end
            BP()
            if BN then
              A.a880c84e(y.g_full_label .. " - Warning", string.format("Seq %s - '%s'\n\nYou have %s new markers that need to be inserted before your existing start cue number %s\n\nPlease either renumber your existing cues or change your start cue number.", BQ.No, BQ.Name, BR, BS), true)
            end
          end
          
          v[string.format("OnInputFieldValue%01dFocusLost", BD)] = function(mX)
            BK(t4.aeddce3c[BD], z7.tbl_5dc8[BC], true)
          end
          v[string.format("OnInputFieldValue%01dTextChanged", BD)] = function(mX)
            t4.aeddce3c[BD].a283b5c6 = string.match(BJ["Content"], "%d+") or ""
            if "" == string.gsub(t4.aeddce3c[BD].a283b5c6, " ", "") then
              return
            end
            local BV
            Bp = nil
            for ac, e4 in pairs(z7.tbl_9d42) do
              e4["TextColor"] = z7.aa1646f9
              if DataPool()["Sequences"][tonumber(e4["Content"])] then
                e4["TextColor"] = A_
                if tonumber(e4["Content"]) == t4.aeddce3c[z7.tbl_0f28[ac]].a79b2c7f then
                  e4["TextColor"] = AZ
                end
              end
            end
            BK(t4.aeddce3c[BD], z7.tbl_5dc8[BC], false)
            for ac, e4 in pairs(z7.tbl_9d42) do
              for mg, mh in pairs(z7.tbl_9d42) do
                if ac ~= mg and e4["Content"] == mh["Content"] and e4["Enabled"] and mh["Enabled"] then
                  mh["TextColor"] = AY
                  e4["TextColor"] = AY
                  BV = true
                end
              end
            end
            Bp = BV
          end
          local BW = Obj.Append(ty, "LineEdit")
          BW["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          BW["AlignmentV"] = "Center"
          BW["Prompt"] = ""
          BW["Content"] = t4.aeddce3c[BD].flag_offset
          BW["ContentDriven"] = "Yes"
          BW["ContentWidth"] = "No"
          BW["TextAutoAdjust"] = "Yes"
          BW["Anchors"] = {
            left = 3,
            right = 3,
            top = BG,
            bottom = BG
          }
          BW["Padding"] = {
            left = 5,
            right = 5,
            top = 2,
            bottom = 2
          }
          BW["Filter"] = "0123456789+-"
          BW["VkPluginName"] = "TextInputNumOnly"
          BW["MaxTextLength"] = 6
          BW["HideFocusFrame"] = "Yes"
          BW["PluginComponent"] = w
          BW["TextChanged"] = string.format("OnInputLatencyValue%01dTextChanged", BD)
          if not z7.tbl_a718[BC] then
            z7.tbl_a718[BC] = {}
          end
          z7.tbl_a718[BC].a2cb2374 = BW
          local BX = Obj.Append(BW, "UIObject")
          BX["Text"] = "Offset"
          BX["Font"] = "Regular14"
          BX["BackColor"] = yB
          BX["TextAlignmentV"] = "Top"
          BX["TextAlignmentH"] = "Left"
          BX["PluginComponent"] = w
          BX["HasPressedAnimation"] = "No"
          BX["HasHover"] = "No"
          BX["Interactive"] = "No"
          BX["TextColor"] = zw
          local BY = Obj.Append(ty, "UIObject")
          BY["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          BY["AlignmentV"] = "Center"
          BY["text"] = string.format("%s f", t4.flag_offset + t4.aeddce3c[BD].flag_offset)
          BY["TextAlignmentH"] = "Center"
          BY["ContentDriven"] = "Yes"
          BY["ContentWidth"] = "No"
          BY["TextAutoAdjust"] = "Yes"
          BY["Anchors"] = {
            left = 4,
            right = 4,
            top = BG,
            bottom = BG
          }
          BY["Padding"] = {
            left = 5,
            right = 5,
            top = 2,
            bottom = 2
          }
          BY["HasHover"] = "No"
          z7.tbl_a718[BC].aa86fe72 = BY
          local BZ = Obj.Append(BY, "UIObject")
          BZ["Text"] = "Total"
          BZ["Font"] = "Regular14"
          BZ["BackColor"] = yB
          BZ["TextAlignmentV"] = "Top"
          BZ["TextAlignmentH"] = "Left"
          BZ["PluginComponent"] = w
          BZ["HasPressedAnimation"] = "No"
          BZ["HasHover"] = "No"
          BZ["Interactive"] = "No"
          BZ["TextColor"] = zw
          v[string.format("OnInputLatencyValue%01dTextChanged", BD)] = function(mX)
            t4.aeddce3c[BD].flag_offset = string.match(BW["Content"], "[+-]?[0-9]+") or 0
            if not t4.aeddce3c[BD].flag_offset then
              t4.aeddce3c[BD].flag_offset = 0
            end
            t4.aeddce3c[BD].flag_offset = tonumber(t4.aeddce3c[BD].flag_offset)
            BY["text"] = string.format("%s f", t4.flag_offset + t4.aeddce3c[BD].flag_offset)
          end
          local B_ = Obj.Append(ty, "LineEdit")
          B_["Name"] = string.format("SeqStartCue_%s", BC)
          B_["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          B_["AlignmentV"] = "Center"
          B_["Prompt"] = "    "
          B_["Content"] = t4.aeddce3c[BD].aa0327eb
          B_["ContentDriven"] = "Yes"
          B_["ContentWidth"] = "No"
          B_["TextAutoAdjust"] = "Yes"
          B_["Anchors"] = {
            left = 6,
            right = 6,
            top = BG,
            bottom = BG
          }
          B_["Padding"] = {
            left = 5,
            right = 5,
            top = 2,
            bottom = 2
          }
          B_["Filter"] = "0123456789."
          B_["VkPluginName"] = "TextInputNumOnly"
          B_["KeyboardIconAlignmentH"] = "Left"
          B_["KeyboardIconAlignmentV"] = "Bottom"
          B_["MaxTextLength"] = 8
          B_["HideFocusFrame"] = "Yes"
          B_["PluginComponent"] = w
          B_["TextChanged"] = string.format("OnInputStartCueValue%01dTextChanged", BD)
          B_["FocusLost"] = string.format("OnInputStartCueValue%01dFocusLost", BD)
          z7.tbl_5dc8[BC] = B_
          local C0 = Obj.Append(B_, "UIObject")
          C0["Text"] = "Start Cue"
          C0["Font"] = "Regular14"
          C0["BackColor"] = yB
          C0["TextAlignmentV"] = "Top"
          C0["TextAlignmentH"] = "Left"
          C0["PluginComponent"] = w
          C0["HasPressedAnimation"] = "No"
          C0["HasHover"] = "No"
          C0["Interactive"] = "No"
          C0["TextColor"] = zw
          v[string.format("OnInputStartCueValue%01dTextChanged", BD)] = function(mX)
            local C1 = string.match(mX["Content"], "[0-9]*%.?[0-9]+")
            if C1 and tonumber(C1) then
              t4.aeddce3c[BD].aa0327eb = tonumber(C1)
              t4.aeddce3c[BD].num_a8a1 = tonumber(C1)
            end
            BK(t4.aeddce3c[BD], z7.tbl_5dc8[BC], false)
          end
          v[string.format("OnInputStartCueValue%01dFocusLost", BD)] = function(mX)
            BK(t4.aeddce3c[BD], z7.tbl_5dc8[BC], true)
          end
          BK(t4.aeddce3c[BC], B_, false)
          local C2 = Obj.Append(ty, "LineEdit")
          C2["Name"] = string.format("SeqTokenTime_%s", BC)
          C2["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          C2["AlignmentV"] = "Center"
          C2["Prompt"] = "    "
          C2["Content"] = t4.aeddce3c[BD].a993e03c
          C2["ContentDriven"] = "Yes"
          C2["ContentWidth"] = "No"
          C2["TextAutoAdjust"] = "Yes"
          C2["Anchors"] = {
            left = 7,
            right = 7,
            top = BG,
            bottom = BG
          }
          C2["Padding"] = {
            left = 5,
            right = 5,
            top = 2,
            bottom = 2
          }
          C2["Filter"] = "0123456789."
          C2["MaxTextLength"] = 8
          C2["VkPluginName"] = "TextInputNumOnly"
          C2["KeyboardIconAlignmentH"] = "Left"
          C2["KeyboardIconAlignmentV"] = "Bottom"
          C2["HideFocusFrame"] = "Yes"
          C2["PluginComponent"] = w
          C2["TextChanged"] = string.format("OnInputTokenTimeValue%01dTextChanged", BD)
          if rm.af039942[t4.aeddce3c[BD].a3763cb3] then
            C2["Enabled"] = true
          else
            C2["Enabled"] = false
          end
          z7.tbl_463f[BC] = C2
          local C3 = Obj.Append(C2, "UIObject")
          C3["Text"] = "Off Delay"
          C3["Font"] = "Regular14"
          C3["BackColor"] = yB
          C3["TextAlignmentV"] = "Top"
          C3["TextAlignmentH"] = "Left"
          C3["PluginComponent"] = w
          C3["HasPressedAnimation"] = "No"
          C3["HasHover"] = "No"
          C3["Interactive"] = "No"
          C3["TextColor"] = zw
          v[string.format("OnInputTokenTimeValue%01dTextChanged", BD)] = function(mX)
            local C1 = string.match(mX["Content"], "[0-9]*%.?[0-9]+")
            if C1 and tonumber(C1) then
              t4.aeddce3c[BD].a993e03c = tonumber(C1)
            end
          end
          local C4 = {
            ad7531f0 = "Key",
            afb23588 = rm.tbl_38d6,
            ae2ecd88 = "str",
            a3c78c74 = t4.aeddce3c[BD].a3763cb3
          }
          
          local function C5(e)
            if rm.af039942[e.aa6d9a63] then
              C2["Enabled"] = true
            else
              C2["Enabled"] = false
            end
            t4.aeddce3c[BD].a3763cb3 = e.ab6e56b2
          end
          
          local C6 = false
          
          local function C7(e)
            if 0 == e.aa6d9a63 then
              t4.aeddce3c[BD].a04e85a2 = t4.aeddce3c[BD].ae33a3fb
              t4.aeddce3c[BD].index_b = -1
              e.a59ef9c1["Text"] = rm.a48ca426[t4.aeddce3c[BD].ae33a3fb].a0fc7c03
              e.a59ef9c1["BackColor"] = z7.a2e90598
              C6 = true
              C2["Content"] = t4.aeddce3c[BD].a47f1fc5
              t4.aeddce3c[BD].num_e467 = t4.aeddce3c[BD].a47f1fc5
              t4.aeddce3c[BD].index_a = -1
              C2["BackColor"] = z7.a2e90598
              B_["Content"] = xr.af4f8394(t4.aeddce3c[BD].a202f9c8)
              t4.aeddce3c[BD].a534eef6 = t4.aeddce3c[BD].a202f9c8
              t4.aeddce3c[BD].flag_a = -1
              B_["BackColor"] = z7.a2e90598
              coroutine.yield(0.02)
              C6 = false
            else
              t4.aeddce3c[BD].a04e85a2 = e.aa6d9a63
              t4.aeddce3c[BD].index_b = e.aa6d9a63
              e.a59ef9c1["BackColor"] = B2
              if t4.aeddce3c[BD].index_a >= 0 then
                C2["BackColor"] = B2
              end
              if t4.aeddce3c[BD].flag_a >= 0 then
                B_["BackColor"] = B2
              end
            end
            if 6 == t4.aeddce3c[BD].a04e85a2 or 10 == t4.aeddce3c[BD].a04e85a2 or 13 == t4.aeddce3c[BD].a04e85a2 or 14 == t4.aeddce3c[BD].a04e85a2 then
              C2["Enabled"] = true
            else
              C2["Enabled"] = false
            end
            if 9 == t4.aeddce3c[BD].a04e85a2 or 10 == t4.aeddce3c[BD].a04e85a2 or 14 == t4.aeddce3c[BD].a04e85a2 or 17 == t4.aeddce3c[BD].a04e85a2 or 18 == t4.aeddce3c[BD].a04e85a2 then
              B_["Enabled"] = true
            else
              B_["Enabled"] = false
            end
          end
          
          local C8 = C5
          if t4.aeddce3c[BD].stem_index then
            C4.str_e2ec = "int"
            C4.afb23588 = A.ad96c7cb(rm.tbl_34a1)
            table.insert(C4.afb23588, {
              a7b0eb83 = "From Reaper",
              a2cb2374 = 0
            })
            C4.str_d753 = "Note Type"
            C4.a3c78c74 = t4.aeddce3c[BD].a04e85a2
            C8 = C7
            C2["Content"] = t4.aeddce3c[BD].num_e467
            v[string.format("OnInputTokenTimeValue%01dTextChanged", BD)] = function(mX)
              if not C6 then
                local C1 = string.match(mX["Content"], "[0-9]*%.?[0-9]+")
                if C1 and tonumber(C1) then
                  t4.aeddce3c[BD].num_e467 = tonumber(C1)
                  t4.aeddce3c[BD].index_a = tonumber(C1)
                  mX["BackColor"] = B2
                else
                  t4.aeddce3c[BD].num_e467 = t4.aeddce3c[BD].a47f1fc5
                  t4.aeddce3c[BD].index_a = -1
                  mX["BackColor"] = z7.a2e90598
                end
              end
            end
            if 6 == t4.aeddce3c[BD].a04e85a2 or 10 == t4.aeddce3c[BD].a04e85a2 or 13 == t4.aeddce3c[BD].a04e85a2 or 14 == t4.aeddce3c[BD].a04e85a2 then
              C2["Enabled"] = true
            else
              C2["Enabled"] = false
            end
            if 9 == t4.aeddce3c[BD].a04e85a2 or 10 == t4.aeddce3c[BD].a04e85a2 or 14 == t4.aeddce3c[BD].a04e85a2 or 17 == t4.aeddce3c[BD].a04e85a2 or 18 == t4.aeddce3c[BD].a04e85a2 then
              B_["Enabled"] = true
            else
              B_["Enabled"] = false
            end
            B_["Content"] = xr.af4f8394(t4.aeddce3c[BD].a534eef6)
            C0["Text"] = "Steps"
            B_["Filter"] = "0123456789Rr"
            v[string.format("OnInputStartCueValue%01dTextChanged", BD)] = function(mX)
              if not C6 then
                local dc, C1 = pcall(xr.afe03d2f, mX["Content"])
                if dc then
                  A.a4b25f9e()
                  t4.aeddce3c[BD].a534eef6 = C1
                  t4.aeddce3c[BD].flag_a = C1
                  mX["BackColor"] = B2
                else
                  A.a4b25f9e()
                  t4.aeddce3c[BD].a534eef6 = t4.aeddce3c[BD].a202f9c8
                  t4.aeddce3c[BD].flag_a = -1
                  mX["BackColor"] = z7.a2e90598
                end
              end
            end
          end
          local C9 = A.ab06e3d9({
            a2ac9f94 = {
              a01d416c = ty,
              aa749a18 = {
                left = 5,
                right = 5,
                top = BG,
                bottom = BG
              },
              ab21b3aa = {
                left = 5,
                right = 5,
                top = 5,
                bottom = 5
              },
              a7115302 = {
                left = 5,
                right = 5,
                top = 5,
                bottom = 5
              },
              ad088220 = false,
              aa86fe72 = C4.str_d753,
              a6e71315 = w,
              add46b74 = v
            },
            aa72fe59 = C4.a3c78c74,
            a4ba497e = true,
            accc0f89 = true,
            a2b22ed8 = true,
            aea86235 = C4.afb23588,
            a7f071c5 = C8
          })
          z7.tbl_fc35[BC] = C9
          C9.Name = string.format("SeqToken_%s", BC)
          if t4.aeddce3c[BD].stem_index then
            if -1 == t4.aeddce3c[BD].index_b then
              C9["BackColor"] = z7.a2e90598
            else
              C9["BackColor"] = B2
            end
            if t4.aeddce3c[BD].index_a < 0 then
              C2["BackColor"] = z7.a2e90598
            else
              C2["BackColor"] = B2
            end
            if t4.aeddce3c[BD].flag_a < 0 then
              B_["BackColor"] = z7.a2e90598
            else
              B_["BackColor"] = B2
            end
          end
          local Ca = Obj.Append(ty, "CheckBox")
          Ca["Name"] = string.format("SeqSelected_%s", BC)
          Ca["Anchors"] = {
            left = 8,
            right = 8,
            top = BG,
            bottom = BG
          }
          Ca["Margin"] = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          }
          Ca["Enabled"] = "No"
          Ca["PluginComponent"] = w
          Ca["Clicked"] = string.format("OnSelected%01dClicked", BC)
          z7.tbl_6c06[BC] = Ca
          if t4.ab9a9eaa and t4.ab9a9eaa == BD then
            Ca["State"] = 1
          end
          if t4.aeddce3c[BD].stem_index then
            Ca["Visible"] = "No"
          end
          if 1 == t4.num_f7e4 then
            Ca["Enabled"] = "Yes"
          end
          v[string.format("OnSelected%01dClicked", BD)] = function(mX)
            local Cb = mX["State"]
            for ac, e4 in pairs(z7.tbl_6c06) do
              e4["State"] = 0
            end
            if 0 == Cb then
              mX["State"] = 1
              t4.ab9a9eaa = BD
            else
              mX["State"] = 0
            end
          end
          v[string.format("OnInputIcon%sClicked", BD)] = function(mX)
            if t4.aeddce3c[BD].enabled then
              t4.aeddce3c[BD].enabled = false
              z7.tbl_7846[BC]["Enabled"] = "No"
              z7.tbl_9d42[BC]["Enabled"] = "No"
              z7.tbl_a718[BC].a2cb2374["Enabled"] = "No"
              z7.tbl_a718[BC].aa86fe72["Enabled"] = "No"
              z7.tbl_6c06[BC]["Enabled"] = "No"
              z7.tbl_6c06[BC]["State"] = 0
              z7.tbl_5dc8[BC]["Enabled"] = "No"
              z7.tbl_fc35[BC]["Enabled"] = "No"
              z7.tbl_463f[BC]["Enabled"] = "No"
            else
              t4.aeddce3c[BD].enabled = true
              z7.tbl_7846[BC]["Enabled"] = "Yes"
              z7.tbl_9d42[BC]["Enabled"] = "Yes"
              z7.tbl_a718[BC].a2cb2374["Enabled"] = "Yes"
              z7.tbl_a718[BC].aa86fe72["Enabled"] = "Yes"
              if 1 == t4.num_f7e4 then
                z7.tbl_6c06[BC]["Enabled"] = "Yes"
              end
              z7.tbl_5dc8[BC]["Enabled"] = "Yes"
              z7.tbl_fc35[BC]["Enabled"] = "Yes"
              if rm.af039942[t4.aeddce3c[BD].a3763cb3] then
                z7.tbl_463f[BC]["Enabled"] = "Yes"
              end
            end
          end
          if t4.aeddce3c[BD].enabled == false then
            z7.tbl_7846[BC]["Enabled"] = "No"
            z7.tbl_9d42[BC]["Enabled"] = "No"
            z7.tbl_a718[BC].a2cb2374["Enabled"] = "No"
            z7.tbl_a718[BC].aa86fe72["Enabled"] = "No"
            z7.tbl_6c06[BC]["Enabled"] = "No"
            z7.tbl_6c06[BC]["State"] = 0
            z7.tbl_5dc8[BC]["Enabled"] = "No"
            z7.tbl_fc35[BC]["Enabled"] = "No"
            z7.tbl_463f[BC]["Enabled"] = "No"
          end
          if t4.aeddce3c[BD].flag_63f9 then
            z7.tbl_7846[BC]["Enabled"] = "No"
            z7.tbl_9d42[BC]["Enabled"] = "No"
            z7.tbl_a718[BC].a2cb2374["Enabled"] = "No"
            z7.tbl_a718[BC].aa86fe72["Enabled"] = "No"
            z7.tbl_6c06[BC]["Enabled"] = "No"
            z7.tbl_6c06[BC]["State"] = 0
            z7.tbl_5dc8[BC]["Enabled"] = "No"
            z7.tbl_fc35[BC]["Enabled"] = "No"
            z7.tbl_463f[BC]["Enabled"] = "No"
          end
        end
      end
      Af(t4.num_6f9e, z7, t4, false, false)
    end
    
    z7.af37963c()
    Af(t4.num_6f9e, z7, t4, true, true)
    v["OnInputTCLatencyValueTextChanged"] = function(mX)
      t4.flag_offset = string.match(Bu["Content"], "[+-]?[0-9]+") or latencyOffset
      if not t4.flag_offset then
        t4.flag_offset = 0
      end
      t4.flag_offset = tonumber(t4.flag_offset)
      for ac, e4 in pairs(z7.tbl_a718) do
        e4.aa86fe72["text"] = string.format("%s f", t4.flag_offset + t4.aeddce3c[ac].flag_offset)
      end
    end
    v["OnToggleAllEnabledClicked"] = function(mX)
      local Cc
      for ac, e4 in pairs(t4.aeddce3c) do
        if e4.enabled then
          Cc = true
        end
      end
      local Cd
      if Cc then
        Cd = false
      else
        Cd = true
      end
      for ac, e4 in pairs(t4.aeddce3c) do
        e4.enabled = Cd
      end
      z7.af37963c()
    end
    local Ce = Obj.Append(Bl, "UIObject")
    Ce["Anchors"] = {
      left = 0,
      right = 0,
      top = 1,
      bottom = 1
    }
    Ce["Text"] = "Sequences"
    Ce["BackColor"] = B3
    Ce["HasHover"] = false
    Ce["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Ce["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    if y.plugin_label == "MArkersLIVE" then
      local Cf = {
        af4e1cc6 = "Choose Sequence Type",
        a2ac9f94 = {
          a01d416c = Ce,
          aa749a18 = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0
          },
          ab21b3aa = {
            left = 5,
            right = 5,
            top = 5,
            bottom = 5
          },
          a7115302 = {
            left = 1,
            right = 1,
            top = 1,
            bottom = 1
          },
          afdbf62e = "Marker Sequences",
          aa86fe72 = "Filter Sequences",
          a6e71315 = w,
          add46b74 = v
        },
        a4ba497e = true,
        accc0f89 = true,
        aef8b4da = true,
        aea86235 = sW.ab73c456,
        aa72fe59 = "Markers",
        a7f071c5 = function(e)
          Ae = e.ab6e56b2
          z7.af37963c()
        end
      }
      A.a57cb2bb(Cf)
    end
    local Cg = false
    
    local function Ch()
      if Cg then
        return
      end
      Cg = true
      local Ci, Cj
      for ac, e4 in pairs(z7.tbl_0e1c) do
        if not Ci then
          Ci = e4.Content
        elseif e4.Content ~= Ci then
          Cj = true
        end
      end
      if Cj then
        B5.Content = "Multiple"
      else
        B5.Content = Ci
      end
      coroutine.yield(0.01)
      Cg = false
    end
    
    local Ck = Obj.Append(Bk, "ScrollContainer")
    Ck["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    Ck["MaxSize"] = "0,100%"
    Ck["ContentDriven"] = "Yes"
    Ck["ContentWidth"] = "No"
    Ck["Padding"] = {
      left = 5,
      right = 0,
      top = 0,
      bottom = 0
    }
    local Cl = Obj.Append(Ck, "ScrollBox")
    Cl["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Cl["ContentDriven"] = "Yes"
    Cl["ContentWidth"] = "No"
    local Cm = #sW.add72b84
    local Cn = Obj.Append(Cl, "UILayoutGrid")
    Cn["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Cn["Rows"] = Cm
    Cn["Columns"] = 3
    Cn[2][1]["SizePolicy"] = "Fixed"
    Cn[2][1]["Size"] = 60
    Cn[2][2]["SizePolicy"] = "Stretch"
    Cn[2][2]["MinSize"] = 10
    Cn[2][3]["SizePolicy"] = "Fixed"
    Cn[2][3]["Size"] = 180
    z7.tbl_ed91 = {}
    z7.tbl_a1d1 = {}
    z7.tbl_0e1c = {}
    for Q = 1, Cm do
      Cn[1][Q]["SizePolicy"] = "Fixed"
      Cn[1][Q]["Size"] = tx
      do
        local Co = Obj.Append(Cn, "TitleButton")
        Co["Anchors"] = {
          left = 0,
          right = 0,
          top = Q - 1,
          bottom = Q - 1
        }
        Co["Margin"] = {
          left = 0,
          right = 5,
          top = 5,
          bottom = 5
        }
        Co["Padding"] = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        Co["Icon"] = "object_sequence"
        Co["HasHover"] = "Yes"
        Co["Interactive"] = "Yes"
        Co["PluginComponent"] = w
        Co["Clicked"] = string.format("OnInputIconPage%sClicked", Q)
        z7.tbl_ed91[Q] = Co
        if 1 == sW.add72b84[Q].a04e85a2 then
          Co["Icon"] = "object_sound2"
        end
        local Cp = Obj.Append(Cn, "UIObject")
        Cp["Margin"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        Cp["AlignmentV"] = "Center"
        Cp["text"] = sW.add72b84[Q].a8e43495.a3bdc261
        Cp["TextAlignmentH"] = "Left"
        Cp["ContentDriven"] = "Yes"
        Cp["ContentWidth"] = "No"
        Cp["TextAutoAdjust"] = "Yes"
        Cp["Anchors"] = {
          left = 1,
          right = 1,
          top = Q - 1,
          bottom = Q - 1
        }
        Cp["Padding"] = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        Cp["BackColor"] = rm.aad72235(sW.add72b84[Q].a8e43495.adb219bd)
        Cp["HasHover"] = "Yes"
        Cp["Interactive"] = "Yes"
        Cp["PluginComponent"] = w
        Cp["Clicked"] = string.format("OnInputPageLabel%sClicked", Q)
        z7.tbl_a1d1[Q] = Cp
        Co["BackColor"] = Cp["BackColor"]
        v[string.format("OnInputPageLabel%sClicked", Q)] = function(mX)
          hw["Enabled"] = "No"
          local BI = rm.a2064023(mX["BackColor"])
          local wa, wb = rm.a3d854b5(v, w, mX["Text"], BI)
          if wa ~= sW.add72b84[Q].a3bdc261 then
            sW.add72b84[Q].a24e0755 = wa
            mX["Text"] = wa
          end
          mX["BackColor"] = rm.aad72235(wb)
          z7.tbl_ed91[Q]["BackColor"] = mX["BackColor"]
          sW.add72b84[Q].a8e43495.adb219bd = wb
          sW.add72b84[Q].adb219bd = wb
          local Cq = rm.aad72235(wb)
          for ac, e4 in ipairs(t4.aeddce3c) do
            local Cr
            if z7.tbl_0f28 then
              for BC, BD in pairs(z7.tbl_0f28) do
                if BD == ac then
                  Cr = BC
                  break
                end
              end
            end
            if e4 == sW.add72b84[Q].a8e43495 then
              e4.adb219bd = wb
              if Cr then
                z7.tbl_7846[Cr].BackColor = Cq
                z7.tbl_e394[Cr].BackColor = Cq
              end
            elseif e4.a0cefcbd and e4.a0cefcbd == sW.add72b84[Q].a8e43495 and e4.flag_8d3a then
              e4.adb219bd = wb
              if Cr then
                z7.tbl_7846[Cr].BackColor = Cq
                z7.tbl_e394[Cr].BackColor = Cq
              end
            end
          end
          hw["Enabled"] = "Yes"
        end
        local Cs = Obj.Append(Cn, "LineEdit")
        Cs["Margin"] = {
          left = 5,
          right = 5,
          top = 5,
          bottom = 5
        }
        Cs["AlignmentV"] = "Center"
        Cs["Prompt"] = "Page "
        Cs["Content"] = sW.add72b84[Q].a8e43495.tc_slot
        Cs["ContentDriven"] = "Yes"
        Cs["ContentWidth"] = "No"
        Cs["TextAutoAdjust"] = "Yes"
        Cs["Anchors"] = {
          left = 2,
          right = 2,
          top = Q - 1,
          bottom = Q - 1
        }
        Cs["Padding"] = {
          left = 10,
          right = 10,
          top = 10,
          bottom = 10
        }
        Cs["Filter"] = "0123456789"
        Cs["VkPluginName"] = "TextInputNumOnly"
        Cs["MaxTextLength"] = 4
        Cs["HideFocusFrame"] = "Yes"
        Cs["PluginComponent"] = w
        Cs["TextChanged"] = string.format("OnInputFieldValuePage%01dTextChanged", Q)
        z7.tbl_0e1c[Q] = Cs
        if not sW.add72b84[Q].a8e43495.flag_33a7 then
          Cp["Enabled"] = false
          Cs["Enabled"] = false
        end
        v[string.format("OnInputIconPage%sClicked", Q)] = function(mX)
          if sW.add72b84[Q].a8e43495.flag_33a7 then
            sW.add72b84[Q].a8e43495.flag_33a7 = false
            Cp["Enabled"] = false
            Cs["Enabled"] = false
          else
            sW.add72b84[Q].a8e43495.flag_33a7 = true
            Cp["Enabled"] = true
            Cs["Enabled"] = true
          end
        end
        v[string.format("OnInputFieldValuePage%01dTextChanged", Q)] = function(mX)
          if not tonumber(mX["Content"]) then
            sW.add72b84[Q].a8e43495.tc_slot = nil
          else
            sW.add72b84[Q].a8e43495.tc_slot = tonumber(mX["Content"])
          end
          Ch()
        end
      end
    end
    local Ce = Obj.Append(hB, "UIObject")
    Ce["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 3,
      bottom = hB.Rows - 3
    }
    Ce["BackColor"] = B3
    Ce["HasHover"] = false
    Ce["Padding"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Ce["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    local Ct = Obj.Append(hB, "UILayoutGrid")
    Ct["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 2,
      bottom = hB.Rows - 2
    }
    Ct["Rows"] = 1
    Ct["Columns"] = 3
    Ct[2][1]["SizePolicy"] = "Stretch"
    Ct[2][1]["Size"] = 0.25
    Ct[2][2]["SizePolicy"] = "Stretch"
    Ct[2][2]["Size"] = 0.5
    Ct[2][3]["SizePolicy"] = "Stretch"
    Ct[2][3]["Size"] = 0.25
    Ct["DefaultMargin"] = 0
    Ct["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    B5 = Obj.Append(Ct, "LineEdit")
    B5["Margin"] = {
      left = 0,
      right = 5,
      top = 0,
      bottom = 0
    }
    B5["AlignmentV"] = "Center"
    B5["Prompt"] = "Page:   "
    B5["Content"] = A.a039e70f().No
    B5["ContentDriven"] = "Yes"
    B5["ContentWidth"] = "No"
    B5["TextAutoAdjust"] = "Yes"
    B5["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    B5["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    B5["Filter"] = "0123456789"
    B5["VkPluginName"] = "TextInputNumOnly"
    B5["MaxTextLength"] = 8
    B5["HideFocusFrame"] = "Yes"
    B5["PluginComponent"] = w
    B5["TextChanged"] = "OnInputPageGlobalTextChanged"
    v["OnInputPageGlobalTextChanged"] = function(mX)
      if Cg then
        return
      end
      if tonumber(mX["Content"]) then
        Cg = true
        for ac, e4 in pairs(z7.tbl_0e1c) do
          e4.Content = mX["Content"]
        end
        coroutine.yield(0.01)
        Cg = false
      end
    end
    Ch()
    local Cu = Obj.Append(Ct, "LineEdit")
    Cu["Margin"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Cu["AlignmentV"] = "Center"
    Cu["Prompt"] = "Tag:   "
    Cu["Content"] = t4.a027c659
    Cu["ContentDriven"] = "Yes"
    Cu["ContentWidth"] = "No"
    Cu["TextAutoAdjust"] = "Yes"
    Cu["Anchors"] = {
      left = 2,
      right = 2,
      top = 0,
      bottom = 0
    }
    Cu["Padding"] = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10
    }
    Cu["Filter"] = "0123456789"
    Cu["VkPluginName"] = "TextInputNumOnly"
    Cu["MaxTextLength"] = 4
    Cu["HideFocusFrame"] = "Yes"
    Cu["PluginComponent"] = w
    Cu["TextChanged"] = "OnInputTagTextChanged"
    v["OnInputTagTextChanged"] = function(mX)
      if tonumber(mX["Content"]) then
        t4.a027c659 = tonumber(mX["Content"])
        local Cv = Obj.Find(ShowData(), "Tags")[t4.a027c659]
        if Cv then
          if Cv == qF.ab453ab2 then
            mX["TextColor"] = AZ
          else
            mX["TextColor"] = A_
          end
        else
          mX["TextColor"] = z7.aa1646f9
        end
      else
        t4.a027c659 = nil
        mX["TextColor"] = z7.aa1646f9
      end
    end
    v["OnInputTagTextChanged"](Cu)
    local Cw = Obj.Append(Ct, "CheckBox")
    Cw["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    Cw["Text"] = "Assign Sequences to Page"
    Cw["AlignmentH"] = "Center"
    Cw["AlignmentV"] = "Center"
    Cw["State"] = t4.a7fa0b8b
    Cw["PluginComponent"] = w
    Cw["Clicked"] = "OnAssignSeqToPageCheckClicked"
    Cw["Texture"] = "corner1"
    
    local function Cx(dx)
      Cw["State"] = dx
      t4.a7fa0b8b = dx
      for ac, e4 in pairs(z7.tbl_a1d1) do
        if sW.add72b84[ac].a8e43495.flag_33a7 and 1 == dx then
          e4["Enabled"] = true
        elseif 0 == dx then
          e4["Enabled"] = false
        end
      end
      for ac, e4 in pairs(z7.tbl_0e1c) do
        if sW.add72b84[ac].a8e43495.flag_33a7 and 1 == dx then
          e4["Enabled"] = true
        elseif 0 == dx then
          e4["Enabled"] = false
        end
      end
      if 1 == dx then
        B5["Enabled"] = true
      else
        B5["Enabled"] = false
      end
      FindBestFocus(hw)
    end
    
    Cx(t4.a7fa0b8b)
    v["OnAssignSeqToPageCheckClicked"] = function(mX)
      if 1 == Cw["State"] then
        Cx(0)
      else
        Cx(1)
      end
    end
    local tF = Obj.Append(hB, "UILayoutGrid")
    tF["Anchors"] = {
      left = 0,
      right = 0,
      top = hB.Rows - 1,
      bottom = hB.Rows - 1
    }
    tF["Rows"] = 1
    tF["Columns"] = 2
    local tG = Obj.Append(tF, "Button")
    tG["Margin"] = {
      left = 0,
      right = 1,
      top = 0,
      bottom = 0
    }
    tG["W"] = "100%"
    tG["H"] = "100%"
    tG["X"] = 0
    tG["Y"] = 0
    tG["AlignmentH"] = "Center"
    tG["AlignmentV"] = "Center"
    tG["Anchors"] = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    }
    tG["Textshadow"] = 1
    tG["HasHover"] = "Yes"
    tG["Text"] = "Cancel"
    tG["Font"] = "Medium20"
    tG["PluginComponent"] = w
    tG["Clicked"] = "OnCancelClicked"
    local tH = Obj.Append(tF, "Button")
    tH["Margin"] = {
      left = 1,
      right = 0,
      top = 0,
      bottom = 0
    }
    tH["W"] = "100%"
    tH["H"] = "100%"
    tH["AlignmentH"] = "Center"
    tH["AlignmentV"] = "Center"
    tH["Anchors"] = {
      left = 1,
      right = 1,
      top = 0,
      bottom = 0
    }
    tH["Textshadow"] = 1
    tH["HasHover"] = "Yes"
    tH["Text"] = "Continue"
    tH["Font"] = "Medium20"
    tH["PluginComponent"] = w
    tH["Clicked"] = "OnImportClicked"
    
    local function Cy(Cz, CA)
      local st = Cz
      local CB = {}
      if CA then
        table.insert(CB, Cz)
        st = A.ab5f5833(DataPool().Sequences, st + 1, CB)
      else
        st = A.ab5f5833(DataPool().Sequences, st, CB)
      end
      for ac, e4 in ipairs(t4.aeddce3c) do
        if not e4.a79b2c7f or e4.a79b2c7f ~= e4.a283b5c6 then
          e4.a283b5c6 = st
          table.insert(CB, st)
          st = A.ab5f5833(DataPool().Sequences, st + 1, CB)
        end
      end
      if z7.tbl_0f28 then
        for BC, BD in pairs(z7.tbl_0f28) do
          z7.tbl_9d42[BC]["Content"] = t4.aeddce3c[BD].a283b5c6
        end
      end
      if CA then
        t4.a4474260 = st
      end
    end
    
    v["OnSettingsCogPressed"] = function(mX)
      local e = Ac.a194ea9f(t4, qF, z7, ry)
      if e and type(e) == "table" then
        if e.a81de8f4 == "Placeholder" then
          Cy(qF.aa942c2a.tbl_0c3f.ac5fccac, true)
        end
        if e.a81de8f4 == "OpenFullSettings" then
          Obj.Delete(hv, Obj.Index(hw))
          t4.num_52fe = 2
        end
      end
    end
    v["OnCancelClicked"] = function(mX)
      Obj.Delete(hv, Obj.Index(hw))
      t4.num_52fe = 0
    end
    v["OnImportClicked"] = function(mX)
      local CC
      for ac, e4 in ipairs(z7.tbl_5dc8) do
        if e4["BackColor"] == B4 then
          CC = true
          break
        end
      end
      local CD
      for ac, e4 in pairs(sW.add72b84) do
        if e4.a8e43495.flag_33a7 and (not e4.a8e43495.tc_slot or not tonumber(e4.a8e43495.tc_slot)) then
          CD = true
        end
      end
      local CE
      if 1 == t4.num_f7e4 then
        for ac, e4 in pairs(z7.tbl_6c06) do
          if 1 == e4["State"] then
            t4.ab9a9eaa = ac
          end
        end
        if not t4.ab9a9eaa then
          CE = true
        end
      end
      local CF
      if string.gsub(t4.af96c73e, " ", "") == "" then
        CF = true
      end
      for ac, e4 in pairs(t4.aeddce3c) do
        if "" == string.gsub(e4.a283b5c6, " ", "") then
          CF = true
        end
      end
      if Bp then
        A.a880c84e(y.g_full_label, "You have duplicate sequence numbers.", true)
      elseif CF then
        A.a880c84e(y.g_full_label, "Please don't leave any values blank.", true)
      elseif CE then
        A.a880c84e(y.g_full_label, "Please select a track to create regions from.", true)
      elseif CD then
        A.a880c84e(y.g_full_label, "Please select a page to assign sequences to.", true)
      elseif CC then
        A.a880c84e(y.g_full_label, "You have new markers before some of your existing sequence start cues.", true)
      elseif t4.flag_2a1f then
        A.a880c84e(y.g_full_label, "Please wait until Reaper has finished generating the sound file", true)
      else
        Obj.Delete(hv, Obj.Index(hw))
        for ac, e4 in pairs(t4.aeddce3c) do
          e4.a79b2c7f = e4.a283b5c6
        end
        t4.num_52fe = 1
      end
    end
    hw["Visible"] = true
    Obj.WaitInit(tH)
    FindBestFocus(tH)
    WaitObjectDelete(hw)
    return t4
  end
  
  return Ac
end

Ac = Ac(y, A, rm, yt, v, w, z, yg, xr)

local function CG(dl)
  DelVar(UserVars(), "MArkersLIVE")
  if l[2][3] >= l[2][12] then
    return 3
  end
  A.a77a80af(dl)
end

y.ac5be6a8 = {
  {
    afe6d202 = 1,
    a59a115b = "MArkersLIVE Setup",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 4,
    a59a115b = "Sync from Reaper",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SyncFromReaper\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 23,
    a59a115b = "Import from RPP File",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"ImportFromReaper\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 5,
    a59a115b = "Send TC Offset to Reaper",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SaveTCOffsetToReaper\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 6,
    a59a115b = "Reaper PLAY",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"Play\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 21,
    a59a115b = "Reaper PAUSE",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"Pause\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 7,
    a59a115b = "Reaper STOP",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"Stop\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 8,
    a59a115b = "Reaper Record",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"Record\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 9,
    a59a115b = "Reaper Play This Cue",
    a4c23bc2 = {
      {
        a59a115b = "Set PreRoll",
        a082ca40 = "SetUserVariable \"MArkers_PreRoll\" \"1\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"PlayThisCue\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 10,
    a59a115b = "Reaper Play Next Cue",
    a4c23bc2 = {
      {
        a59a115b = "Set PreRoll",
        a082ca40 = "SetUserVariable \"MArkers_PreRoll\" \"1\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"PlayNextCue\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 11,
    a59a115b = "Reaper Seek This Cue",
    a4c23bc2 = {
      {
        a59a115b = "Set PreRoll",
        a082ca40 = "SetUserVariable \"MArkers_PreRoll\" \"1\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SeekThisCue\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 12,
    a59a115b = "Reaper Seek Next Cue",
    a4c23bc2 = {
      {
        a59a115b = "Set PreRoll",
        a082ca40 = "SetUserVariable \"MArkers_PreRoll\" \"1\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SeekNextCue\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 13,
    a59a115b = "Reaper Loop This Cue",
    a4c23bc2 = {
      {
        a59a115b = "Set PreRoll",
        a082ca40 = "SetUserVariable \"MArkers_PreRoll\" \"0\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"LoopThisCue\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 14,
    a59a115b = "Reaper Click On",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"ClickOn\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 22,
    a59a115b = "Reaper Click Off",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"ClickOff\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 15,
    a59a115b = "Set Cue Time from BPM",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SetCueTime\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 17,
    a59a115b = "Set Reaper Project FileSync ON",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SetAutoSyncOn\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 18,
    a59a115b = "Set Reaper Project FileSync OFF",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SetAutoSyncOff\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 16,
    a59a115b = "Set Prog BPM",
    a4c23bc2 = {
      {
        a59a115b = "Set Plugin Option",
        a082ca40 = "SetUserVariable \"MAT_Speed_Type\" \"\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SetPhaserBPM\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 19,
    a59a115b = "Set Recipe BPM",
    a4c23bc2 = {
      {
        a59a115b = "Set Plugin Option",
        a082ca40 = "SetUserVariable \"MAT_Speed_Type\" \"Recipe\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      },
      {
        af660ca9 = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SetPhaserBPM\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 20,
    a59a115b = "Set Preset BPM",
    a4c23bc2 = {
      {
        a59a115b = "Set Plugin Option",
        a082ca40 = "SetUserVariable \"MAT_Speed_Type\" \"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "No"
      },
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"SetPhaserBPM\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 24,
    a59a115b = "Offset Timecode -1 second",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"OffsetTimecode -00:00:01:00\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 25,
    a59a115b = "Offset Timecode -1 frame",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"OffsetTimecode -00:00:00:01\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 26,
    a59a115b = "Offset Timecode +1 frame",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"OffsetTimecode +00:00:00:01\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 27,
    a59a115b = "Offset Timecode +1 second",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"OffsetTimecode +00:00:01:00\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 28,
    a59a115b = "Set Timecode Offset",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"OffsetTimecode (Enter timecode offset? 01:00:00:00 or 1h 0m 0s 0f)\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 29,
    a59a115b = "Reaper Skip >>>",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"Skip Forward 1\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  },
  {
    afe6d202 = 30,
    a59a115b = "Reaper Skip <<<",
    a4c23bc2 = {
      {
        a59a115b = "Call Plugin",
        a082ca40 = "Plugin \"MArkersLIVE\" \"Skip Backward 1\"",
        ac4fbd9d = "Follow",
        a0be76e8 = "Yes",
        ab68b3b0 = "No",
        a0761a69 = "Yes"
      }
    }
  }
}

local function CH(qF, ry, rz, rA)
  local dl = rm.a47fed4f(ry, rz, qF)
  if dl then
    return dl
  end
  local dl = rm.a1d6dffa(qF, ry, rz, rA)
  if dl then
    return dl
  end
  local sW = rm.ade198ec(ry, rz, qF)
  rm.a228fde5(qF, sW)
  rm.a6c560c5(sW)
  local t4 = Ac.adbd069f(qF, sW, ry)
  if 0 == t4.num_52fe then
    return
  end
  if 2 == t4.num_52fe then
    yt.a1338538()
    return
  end
  local ym = A.ab61e23f()
  local q5 = A.a4b7900b(y.plugin_label .. ": ")
  SetProgressRange(y.g_progress[q5], 1, 13)
  SetProgressText(y.g_progress[q5], "Processing data")
  IncProgress(y.g_progress[q5], 1)
  rm.af68f9e6(qF, t4)
  rm.adab0697(sW, ry, rz)
  local rD = rm.a181c564(t4, qF)
  rm.a43a5008(ry, sW, rD)
  if not rm.aa48c247(ry, sW) then
    A.ad7e2935(q5)
    return nil
  end
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Sequences")
  local dl = rm.a9d7237f(qF, sW, rD, rz)
  if dl then
    return dl
  end
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Tempos")
  local dl = rm.a2d2279b(qF, rA, rD, t4.a4474260)
  if dl then
    return dl
  end
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Cues")
  rm.ad4a5f1f(ry)
  rm.ab3e7c53(ry, rD)
  local dl = rm.acf51bce(ry, sW, rD)
  if dl then
    return dl
  end
  local dl = rm.aea97f7c(ry, rA, rD, qF)
  if dl then
    return dl
  end
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing MIDI")
  xr.a3c4d4e8(sW, rD)
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Assigning Sequences to Pages")
  rm.ad96f734(sW, rD)
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Timecode")
  local dl = rm.ae79970c(qF)
  if dl then
    return dl
  end
  local dl = rm.a317b304(qF, ry, rz, rD, t4.flag_offset)
  if dl then
    return dl
  end
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Timecode Trackgroups")
  local dl = rm.a246e0ab(qF, rz, rD)
  if dl then
    return dl
  end
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Regions")
  rm.a24714f4(ry, qF, sW, rD)
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Timecode Tracks")
  rm.a44e263e(qF, rA, rD)
  rm.a3ceb701(qF, rD)
  rm.a843d74d(qF, sW, rD)
  xr.ad4e11b0(qF, rz, rD)
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing Timecode Events")
  rm.a04edf6c(qF, ry, rD)
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Processing MIDI Events")
  xr.a0c7f1a9(qF, rz, rD)
  rm.aefee716(qF, rD)
  IncProgress(y.g_progress[q5], 1)
  SetProgressText(y.g_progress[q5], "Finishing up")
  rD = A.a71fa32a(rD)
  rm.ac6104f6(rD, qF)
  A.ad7e2935(q5)
  A.ac167e2b(ym, "Import Finished")
  return nil, rD, true
end

local function CI(ro)
  local h_, iU = A.a995c01f(true)
  if 0 == h_ then
    return
  end
  if -5 ~= q[6][1] - q[6][10] then
    return -1
  end
  local CJ
  if HostOS() == "Windows" then
    CJ = string.format("%s%s%s", iU, y.company_name, x, y.plugin_label, x)
  else
    CJ = string.format("%s%s%s%s", iU, x, y.company_name, x, y.plugin_label, x)
  end
  local i4, sh, dl = rm.a5707c15(CJ, "RPP")
  if dl then
    return dl
  end
  if 0 == i4 or nil == i4 then
    return
  end
  local ss, dl = rm.a90c8a99(sh, i4, true)
  if dl then
    return dl
  end
  ss.a1903df5.str_7a7d = "File"
  ro = rm.a39287ea(ro)
  ss.a1903df5.a936e685 = ro
  local dl, rD, iq = CH(ss.a1903df5, ss.acb7e94f, ss.ae3f69a0, ss.tbl_0aeb)
  if dl then
    return dl
  end
  if iq then
    local dl = rm.a4fad83d(rD, sh, ss.a1903df5)
    if dl then
      return dl
    end
    A.a880c84e(string.format("%s - Success", y.g_full_label), string.format("Reaper Project '%s' imported successfully!", ss.a1903df5.a3bdc261), true)
  end
end

local function CK(ro)
  local ym = A.ab61e23f()
  local qF, dl = pX.a6ab9715()
  if dl then
    return dl
  end
  A.ac167e2b(ym, "Get Project Info")
  local ry, dl = yg.a4d5c370()
  if dl then
    return dl
  end
  A.ac167e2b(ym, "Get Marker Info")
  local rz, dl = xr.a1f734bc()
  if dl then
    return dl
  end
  A.ac167e2b(ym, "Get MIDI Info")
  local rA, dl = yg.a55a1131()
  if dl then
    return dl
  end
  A.ac167e2b(ym, "Get Tempo Info")
  qF.str_7a7d = "Network"
  ro = rm.a39287ea(ro)
  qF.a936e685 = ro
  local dl, rD, iq = CH(qF, ry, rz, rA)
  if -4 ~= j[14][5] - j[14][14] then
    return -1
  end
  if dl then
    return dl
  end
  if iq then
    local e, dl = pX.a255c04a(rD)
    if not e then
      A.a880c84e(string.format("%s - Error", y.g_full_label), dl, true)
      return
    end
    A.a880c84e(string.format("%s - Success", y.g_full_label), string.format("Reaper Project '%s' synced successfully!", qF.a3bdc261), true)
  end
end

local function CL()
  local qF, dl = pX.a6ab9715()
  if qF then
    local CM = GetVar(GlobalVars(), string.format("%s_snap_reaper", CurrentUser().Name))
    if CM ~= qF.a06af6c3 then
      local hO = {
        title = y.g_full_label,
        icon = y.company_label,
        message = string.format("Reaper project '%s' does not match current snap '%s'\n\nWhat would you like to do?", qF.a3bdc261, GetVar(GlobalVars(), string.format("%s_snap_name", CurrentUser().Name))),
        commands = {
          {
            value = 0,
            name = "Open Reaper Proj"
          },
          {
            value = 1,
            name = "Record Anyway"
          },
          {
            value = 2,
            name = "Cancel"
          }
        }
      }
      local hP = MessageBox(hO)
      if 2 == hP.result then
        return
      end
      if 0 == hP.result then
        CmdIndirectWait("Plugin \"MArkersLIVE\" \"OpenReaperProject\"")
      end
    end
  end
  local e, dl = pX.a51ef463({
    a38325d7 = "StartOBS"
  })
  if -4 ~= j[14][5] - j[14][14] then
    return -1
  end
  if dl then
    return dl
  end
end

local function CN()
  local e, dl = pX.a51ef463({
    a38325d7 = "StopOBS"
  })
  if not o[4][9] or type(o[4][9]) ~= "number" then
    return
  end
  if dl then
    return dl
  end
end

local function CO(p2)
  local CP = p2 or ""
  yt.a20996e0()
  if not yt.af1c3da0() or CP == "Setup" or "" == CP then
    if not yt.af1c3da0() then
      local CQ = {
        title = y.g_full_label,
        icon = y.company_label,
        message = "Plugin settings are not fully set, would you like to import your previous settings from your USB?",
        commands = {
          {
            value = 0,
            name = "Use Default Settings"
          },
          {
            value = 1,
            name = "Import"
          }
        }
      }
      local hP = MessageBox(CQ)
      if 1 == hP.result then
        yt.ac96ddb1()
      end
    end
    yt.a1338538()
  elseif string.match(CP, "^SyncFromReaper") then
    local ro = string.gsub(CP, "^SyncFromReaper", "")
    local dl = CK(ro)
    if dl then
      return CG(dl)
    end
  elseif string.match(CP, "^ImportFromReaper") then
    local ro = string.gsub(CP, "^ImportFromReaper", "")
    local dl = CI(ro)
    if dl then
      return CG(dl)
    end
  elseif CP == "SaveTCOffsetToReaper" then
    local dl = rm.ae771990()
    if dl then
      return CG(dl)
    end
  elseif CP == "Play" then
    local dl = rm.a11b2fc9()
    if dl then
      return CG(dl)
    end
  elseif CP == "Pause" then
    local dl = rm.a54623ba()
    if dl then
      return CG(dl)
    end
  elseif CP == "Stop" then
    local dl = rm.adbfc5c9()
    if dl then
      return CG(dl)
    end
  elseif CP == "Record" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Record"))
    end
    local dl = rm.a4f1d7be()
    if dl then
      return CG(dl)
    end
  elseif CP == "PlayThisCue" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Play This Cue"))
    end
    local dl = rm.a0f1fd71(true)
    if dl then
      return CG(dl)
    end
  elseif CP == "PlayNextCue" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Play Next Cue"))
    end
    local dl = rm.a28bd01e(true)
    if dl then
      return CG(dl)
    end
  elseif CP == "SeekThisCue" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Seek This Cue"))
    end
    local dl = rm.a0f1fd71(false)
    if dl then
      return CG(dl)
    end
  elseif CP == "SeekNextCue" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Seek Next Cue"))
    end
    local dl = rm.a28bd01e(false)
    if dl then
      return CG(dl)
    end
  elseif CP == "LoopThisCue" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Loop This Cue"))
    end
    local dl = rm.a547cb02(true)
    if dl then
      return CG(dl)
    end
  elseif string.match(CP, "^Skip") then
    local wK, wL = 1, 1
    CP = string.lower(CP)
    if string.match(CP, "backward") then
      wK = -1
    end
    wL = string.match(CP, "([0-9]*%.?[0-9]+)")
    wL = wL or 1
    wL = tonumber(wL)
    local dl = rm.a68ec000(wK, wL)
    if dl then
      return CG(dl)
    end
  elseif CP == "ClickOn" then
    local dl = rm.a3a9538c()
    if dl then
      return CG(dl)
    end
  elseif CP == "ClickOff" then
    local dl = rm.afa22900()
    if dl then
      return CG(dl)
    end
  elseif CP == "SetCueTime" then
    local dl = rm.a4bc44a6()
    if dl then
      return CG(dl)
    end
  elseif CP == "SetPhaserBPM" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("Set Phaser BPM"))
    end
    local dl = rm.ad28a468()
    if dl then
      return CG(dl)
    end
  elseif CP == "StartOBS" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("StartOBS"))
    end
    local dl = CL()
    if dl then
      return CG(dl)
    end
  elseif CP == "StopOBS" then
    if y.g_str_false == "true" then
      return CG(A.a5844c3a("StopOBS"))
    end
    local dl = CN()
    if dl then
      return CG(dl)
    end
  elseif CP == "SetAutoSyncOn" then
    local dl = rm.ad73a87a(true)
    if dl then
      return CG(dl)
    end
  elseif CP == "SetAutoSyncOff" then
    local dl = rm.ad73a87a(false)
    if dl then
      return CG(dl)
    end
  else
    return CG(string.format("'%s' is not a valid MArkersLIVE command.", CP))
  end
  CG()
end

local function CR(p8, p2)
  A.a7997ecc(p8, p2, CO)
end

return CR
