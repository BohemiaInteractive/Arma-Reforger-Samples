AudioSignalResClass {
 Inputs {
  IOPItemInputClass {
   id 1
   name "EngineDamage"
   tl -592 4072.547
   children {
    58 90 123
   }
   value 1
  }
  IOPItemInputClass {
   id 2
   name "EngineOn"
   tl -460.904 458.429
   children {
    12 106
   }
   value 1
  }
  IOPItemInputClass {
   id 3
   name "EngineRPM"
   tl -362.334 2776.5
   children {
    10 11 21 88 112 118
   }
   value 3000
   valueMax 100000
  }
  IOPItemInputClass {
   id 5
   name "EngineDamageRPMRevs"
   tl -590.334 4167.702
   children {
    70 106 108
   }
   value -800
   valueMin -1000
   valueMax 1000
  }
  IOPItemInputClass {
   id 7
   name "RPM_IDLE"
   tl -456 976.167
   children {
    10 11 99 113
   }
   value 800
   valueMax 10000
  }
  IOPItemInputClass {
   id 8
   name "RPM_MAX"
   tl -456 1053.667
   children {
    10 113
   }
   value 6000
   valueMax 10000
  }
  IOPInputValueClass {
   id 14
   name "1"
   tl 202.25 825.917
   children {
    15
   }
   value 1
  }
  IOPInputValueClass {
   id 20
   name "60000"
   tl 202.778 1028.75
   children {
    21
   }
   value 60000
  }
  IOPInputValueClass {
   id 23
   name "4"
   tl 447.5 1156.667
   children {
    22
   }
   value 4
  }
  IOPInputValueClass {
   id 56
   name "1"
   tl -444.643 1670.238
   children {
    35
   }
   value 1
  }
  IOPInputValueClass {
   id 59
   name "Attenuation - Inversed!!!"
   tl -450.496 2290.099
   children {
    65
   }
   value -8
  }
  IOPInputValueClass {
   id 60
   name "1"
   tl -3.571 2072.599
   children {
    62
   }
   value 1
  }
  IOPInputValueClass {
   id 66
   name "RPM Dynamic Range [dB]"
   tl -251.25 628.612
   children {
    67
   }
   value -12
  }
  IOPItemInputClass {
   id 95
   name "Offload_W"
   tl -448.75 1767.917
   children {
    35 39 61
   }
   value 1
  }
  IOPInputValueClass {
   id 98
   name "150"
   tl -1661.556 3321.223
   children {
    99
   }
   value 150
  }
  IOPInputValueClass {
   id 100
   name "Factor"
   tl -1454.333 3424.556
   children {
    101
   }
   value 2
  }
  IOPInputValueClass {
   id 107
   name "-1"
   tl 455.698 2223.059
   children {
    106
   }
   value -1
  }
  IOPInputValueClass {
   id 110
   name "Engine SC [dB]"
   tl 358 4213.667
   children {
    109
   }
   value -9
  }
  IOPItemInputClass {
   id 115
   name "DYNAMIC_RANGE"
   tl 353.434 4389.677
   children {
    113
   }
   value -12
   valueMin -18
   valueMax 0
  }
  IOPItemInputClass {
   id 117
   name "RPM_RED_LINE"
   tl -1220.667 3688.286
   children {
    127 128
   }
   value 3400
   valueMax 4000
  }
  IOPInputValueClass {
   id 125
   name "FADE_START_FACTOR"
   tl -1220 3770
   children {
    127
   }
   value 0.95
  }
  IOPInputValueClass {
   id 126
   name "FADE_END_FACTOR"
   tl -1217.5 3853.75
   children {
    128
   }
   value 1.05
  }
 }
 Ops {
  IOPItemOpInterpolateClass {
   id 10
   name "RPM to Vol"
   tl 137.436 557.227
   children {
    12 31 58
   }
   inputs {
    ConnectionClass connection {
     id 3
     port 0
    }
    ConnectionClass connection {
     id 67
     port 3
    }
    ConnectionClass connection {
     id 8
     port 2
    }
    ConnectionClass connection {
     id 7
     port 1
    }
   }
   "Y min" 0.65
  }
  IOPItemOpInterpolateClass {
   id 11
   name "Belt Crossfade"
   tl 443.75 627.917
   children {
    13 15
   }
   inputs {
    ConnectionClass connection {
     id 7
     port 1
    }
    ConnectionClass connection {
     id 3
     port 0
    }
   }
   "X max" 2500
  }
  IOPItemOpMulClass {
   id 12
   name "Mul 12"
   tl 442.5 462.917
   children {
    13 16 19 31
   }
   inputs {
    ConnectionClass connection {
     id 123
     port 0
    }
    ConnectionClass connection {
     id 10
     port 0
    }
    ConnectionClass connection {
     id 2
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 13
   name "Mul 13"
   tl 685 549.167
   children {
    17
   }
   inputs {
    ConnectionClass connection {
     id 11
     port 0
    }
    ConnectionClass connection {
     id 12
     port 0
    }
   }
  }
  IOPItemOpSubClass {
   id 15
   name "Sub 15"
   tl 445 842.917
   children {
    16
   }
   inputs {
    ConnectionClass connection {
     id 11
     port 1
    }
    ConnectionClass connection {
     id 14
     port 0
    }
   }
   Subtracter 0
  }
  IOPItemOpMulClass {
   id 16
   name "Mul 16"
   tl 692.5 772.917
   children {
    18
   }
   inputs {
    ConnectionClass connection {
     id 12
     port 0
    }
    ConnectionClass connection {
     id 15
     port 0
    }
   }
  }
  IOPItemOpDivClass {
   id 21
   name "Div 21"
   tl 443.75 1030.417
   children {
    22
   }
   inputs {
    ConnectionClass connection {
     id 3
     port 1
    }
    ConnectionClass connection {
     id 20
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 22
   name "Mul 22"
   tl 691.25 1067.917
   children {
    24
   }
   inputs {
    ConnectionClass connection {
     id 23
     port 0
    }
    ConnectionClass connection {
     id 21
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 31
   name "Mul 31"
   tl 703.73 1505.396
   children {
    30 38 39
   }
   inputs {
    ConnectionClass connection {
     id 10
     port 0
    }
    ConnectionClass connection {
     id 12
     port 0
    }
   }
  }
  IOPItemOpSubClass {
   id 35
   name "OnLoad"
   tl -216.453 1705.191
   children {
    38
   }
   inputs {
    ConnectionClass connection {
     id 95
     port 1
    }
    ConnectionClass connection {
     id 56
     port 0
    }
   }
   Subtracter 0
  }
  IOPItemOpMulClass {
   id 38
   name "Mul 38"
   tl 703.73 1688.667
   children {
    36
   }
   inputs {
    ConnectionClass connection {
     id 35
     port 0
    }
    ConnectionClass connection {
     id 31
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 39
   name "Mul 39"
   tl 703.73 1785.81
   children {
    37
   }
   inputs {
    ConnectionClass connection {
     id 95
     port 0
    }
    ConnectionClass connection {
     id 31
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 58
   name "Mul 58"
   tl 703.73 2114.083
   children {
    41
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
    ConnectionClass connection {
     id 10
     port 0
    }
    ConnectionClass connection {
     id 62
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 61
   name "Mul 52"
   tl 0.179 2249.563
   children {
    62
   }
   inputs {
    ConnectionClass connection {
     id 95
     port 0
    }
    ConnectionClass connection {
     id 65
     port 0
    }
   }
  }
  IOPItemOpSubClass {
   id 62
   name "Sub 51"
   tl 203.393 2123.313
   children {
    58
   }
   inputs {
    ConnectionClass connection {
     id 61
     port 1
    }
    ConnectionClass connection {
     id 60
     port 0
    }
   }
   Subtracter 0
  }
  SignalOpDb2GainClass {
   id 65
   name "Db2Gain 65"
   tl -220 2291.25
   children {
    61
   }
   inputs {
    ConnectionClass connection {
     id 59
     port 0
    }
   }
  }
  SignalOpDb2GainClass {
   id 67
   name "Db2Gain 67"
   tl -65 629.862
   children {
    10
   }
   inputs {
    ConnectionClass connection {
     id 66
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 70
   name "Mul 35"
   tl -810.817 3259.328
   children {
    71
   }
   inputs {
    ConnectionClass connection {
     id 5
     port 0
    }
    ConnectionClass connection {
     id 88
     port 0
    }
   }
  }
  IOPItemOpAverageClass {
   id 71
   name "Average 28"
   tl -597.174 3258.114
   children {
    92
   }
   inputs {
    ConnectionClass connection {
     id 70
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 76
   name "Interpolate 30"
   tl 731.508 4116.035
   children {
    116
   }
   inputs {
    ConnectionClass connection {
     id 109
     port 4
    }
    ConnectionClass connection {
     id 85
     port 0
    }
   }
   "X max" -1000
   "Y min" 1
   "Y max" 0.35
  }
  IOPItemOpAverageClass {
   id 85
   name "Average 32"
   tl 540.397 4114.506
   children {
    76
   }
   inputs {
    ConnectionClass connection {
     id 90
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 88
   name "Interpolate 34"
   tl -1058.813 3331.475
   children {
    70
   }
   inputs {
    ConnectionClass connection {
     id 3
     port 0
    }
    ConnectionClass connection {
     id 101
     port 2
    }
    ConnectionClass connection {
     id 99
     port 1
    }
   }
   "X min" 1000
   "X max" 2000
   "Y min" 1
   "Y max" 0
  }
  IOPItemOpMulClass {
   id 90
   name "Mul 33"
   tl 360.397 4113.971
   children {
    85
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
    ConnectionClass connection {
     id 108
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 92
   name "Mul 24"
   tl -360.424 3261.364
   children {
    112
   }
   inputs {
    ConnectionClass connection {
     id 123
     port 0
    }
    ConnectionClass connection {
     id 71
     port 0
    }
   }
  }
  IOPItemOpSumClass {
   id 99
   name "Sum 99"
   tl -1456 3322.334
   children {
    88 101
   }
   inputs {
    ConnectionClass connection {
     id 7
     port 0
    }
    ConnectionClass connection {
     id 98
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 101
   name "Mul 101"
   tl -1262.111 3422.333
   children {
    88
   }
   inputs {
    ConnectionClass connection {
     id 99
     port 0
    }
    ConnectionClass connection {
     id 100
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 106
   name "Mul 106"
   tl 703.73 2275.809
   children {
    57
   }
   inputs {
    ConnectionClass connection {
     id 107
     port 0
    }
    ConnectionClass connection {
     id 2
     port 0
    }
    ConnectionClass connection {
     id 5
     port 0
    }
   }
  }
  IOPItemOpClampMaxClass {
   id 108
   name "ClampMax 108"
   tl -361.5 4168.083
   children {
    90
   }
   inputs {
    ConnectionClass connection {
     id 5
     port 0
    }
   }
   Max 0
  }
  SignalOpDb2GainClass {
   id 109
   name "Db2Gain 109"
   tl 541.75 4211.667
   children {
    76
   }
   inputs {
    ConnectionClass connection {
     id 110
     port 0
    }
   }
  }
  IOPItemOpSumClass {
   id 112
   name "EngineRPMCustom"
   tl -43.762 3090.524
   children {
    74 113
   }
   inputs {
    ConnectionClass connection {
     id 3
     port 0
    }
    ConnectionClass connection {
     id 92
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 113
   name "Interpolate 113"
   tl 544.545 4317.122
   children {
    114
   }
   inputs {
    ConnectionClass connection {
     id 8
     port 2
    }
    ConnectionClass connection {
     id 112
     port 0
    }
    ConnectionClass connection {
     id 115
     port 3
    }
    ConnectionClass connection {
     id 7
     port 1
    }
   }
   "Y max" 0
   "Fade In Type" "Power of 1/2"
   "Fade Out Type" "Power of 1/2"
  }
  SignalOpDb2GainClass {
   id 114
   name "Db2Gain 114"
   tl 730.545 4316.788
   children {
    116
   }
   inputs {
    ConnectionClass connection {
     id 113
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 116
   name "Mul 116"
   tl 950 4206.667
   children {
    86
   }
   inputs {
    ConnectionClass connection {
     id 114
     port 0
    }
    ConnectionClass connection {
     id 76
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 118
   name "Interpolate 118"
   tl -767.857 3735.214
   children {
    123
   }
   inputs {
    ConnectionClass connection {
     id 3
     port 0
    }
    ConnectionClass connection {
     id 128
     port 2
    }
    ConnectionClass connection {
     id 127
     port 1
    }
   }
  }
  IOPItemOpMaxClass {
   id 123
   name "Max 123"
   tl -480 3822.857
   children {
    12 92
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
    ConnectionClass connection {
     id 118
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 127
   name "Mul 127"
   tl -1030 3768.75
   children {
    118
   }
   inputs {
    ConnectionClass connection {
     id 125
     port 0
    }
    ConnectionClass connection {
     id 117
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 128
   name "Mul 128"
   tl -1027.5 3853.75
   children {
    118
   }
   inputs {
    ConnectionClass connection {
     id 126
     port 0
    }
    ConnectionClass connection {
     id 117
     port 0
    }
   }
  }
 }
 Outputs {
  IOPItemOutputClass {
   id 17
   name "Belt_Fast_V"
   tl 890 547.917
   input 13
  }
  IOPItemOutputClass {
   id 18
   name "Belt_Slow_V"
   tl 891.25 771.667
   input 16
  }
  IOPItemOutputClass {
   id 19
   name "Belt_T"
   tl 891.25 461.667
   input 12
  }
  IOPItemOutputClass {
   id 24
   name "Belt_Time"
   tl 892.5 1067.917
   input 22
  }
  IOPItemOutputClass {
   id 30
   name "EngineRattle_T"
   tl 895.139 1504.464
   input 31
  }
  IOPItemOutputClass {
   id 36
   name "EngineRattle_OnLoad_V"
   tl 895.139 1688.949
   input 38
  }
  IOPItemOutputClass {
   id 37
   name "EngineRattle_OffLoad_V"
   tl 895.139 1785.838
   input 39
  }
  IOPItemOutputClass {
   id 41
   name "BackFire_V"
   tl 895.139 2113.39
   input 58
  }
  IOPItemOutputClass {
   id 57
   name "BackFire_T"
   tl 895.139 2277.361
   input 106
  }
  IOPItemOutputClass {
   id 74
   name "EngineRPMCustom"
   tl 234.683 3092.803
   input 112
  }
  IOPItemOutputClass {
   id 86
   name "Engine_V"
   tl 1151.62 4207.144
   input 116
  }
 }
 groups {
  GroupClass {
   id 66
   name "BackFIre Offload Attenuation"
   children {
    62 64 59 60 61 65
   }
   parent -1
   Color 0.6 0.6 0.6 0.251
  }
  GroupClass {
   id 112
   name "OnLoad / Offload"
   children {
    35 56 95
   }
   parent -1
   Color 0.6 0.6 0.6 0.251
  }
  GroupClass {
   id 97
   name "RPM oscillation for damaged engine"
   children {
    92 91 70 88 71 99 98 100 101
   }
   parent -1
   Color 0.6 0.6 0.6 0.251
  }
 }
 compiled IOPCompiledClass {
  visited {
   2693 2565 2437 4619 4491 2309 2181 3591 2053 1925 1797 1669 1541 2055 1413 1285 1927 1675 1799 1157 1159 1029 901 773 645 517 3083 3211 389 3463 261 4231 2695 2187 2311 775 907 390 135 519 7 133 3343 1030 5 4363 2955 3723 3847 3975 1158 271 1035 1419 774 1291 646 518 262 651 134 395 6 2827 2567 2439 4107 1286 1551 902
  }
  ins {
   IOPCompiledIn {
    data {
     3 786435 1441795 2228227
    }
   }
   IOPCompiledIn {
    data {
     2 131075 1703939
    }
   }
   IOPCompiledIn {
    data {
     6 3 65539 393219 1376259 1900547 2162691
    }
   }
   IOPCompiledIn {
    data {
     3 1114115 1703939 1769475
    }
   }
   IOPCompiledIn {
    data {
     4 3 65539 1572867 1966083
    }
   }
   IOPCompiledIn {
    data {
     2 3 1966083
    }
   }
   IOPCompiledIn {
    data {
     1 262147
    }
   }
   IOPCompiledIn {
    data {
     1 393219
    }
   }
   IOPCompiledIn {
    data {
     1 458755
    }
   }
   IOPCompiledIn {
    data {
     1 589827
    }
   }
   IOPCompiledIn {
    data {
     1 983043
    }
   }
   IOPCompiledIn {
    data {
     1 917507
    }
   }
   IOPCompiledIn {
    data {
     1 1048579
    }
   }
   IOPCompiledIn {
    data {
     3 589827 720899 851971
    }
   }
   IOPCompiledIn {
    data {
     1 1572867
    }
   }
   IOPCompiledIn {
    data {
     1 1638403
    }
   }
   IOPCompiledIn {
    data {
     1 1703939
    }
   }
   IOPCompiledIn {
    data {
     1 1835011
    }
   }
   IOPCompiledIn {
    data {
     1 1966083
    }
   }
   IOPCompiledIn {
    data {
     2 2293763 2359299
    }
   }
   IOPCompiledIn {
    data {
     1 2293763
    }
   }
   IOPCompiledIn {
    data {
     1 2359299
    }
   }
  }
  ops {
   IOPCompiledOp {
    data {
     3 131075 524291 786435 8 131072 0 1048577 3 327680 2 262144 1
    }
   }
   IOPCompiledOp {
    data {
     2 196611 262147 4 262144 1 131072 0
    }
   }
   IOPCompiledOp {
    data {
     4 196611 327683 131074 524291 6 2228225 0 1 0 65536 0
    }
   }
   IOPCompiledOp {
    data {
     1 2 4 65537 0 131073 0
    }
   }
   IOPCompiledOp {
    data {
     1 327683 4 65537 1 393216 0
    }
   }
   IOPCompiledOp {
    data {
     1 65538 4 131073 0 262145 0
    }
   }
   IOPCompiledOp {
    data {
     1 458755 4 131072 1 458752 0
    }
   }
   IOPCompiledOp {
    data {
     1 196610 4 524288 0 393217 0
    }
   }
   IOPCompiledOp {
    data {
     3 262146 655363 720899 4 1 0 131073 0
    }
   }
   IOPCompiledOp {
    data {
     1 655363 4 851968 1 589824 0
    }
   }
   IOPCompiledOp {
    data {
     1 327682 4 589825 0 524289 0
    }
   }
   IOPCompiledOp {
    data {
     1 393218 4 851968 0 524289 0
    }
   }
   IOPCompiledOp {
    data {
     1 458754 6 0 0 1 0 917505 0
    }
   }
   IOPCompiledOp {
    data {
     1 917507 4 851968 0 983041 0
    }
   }
   IOPCompiledOp {
    data {
     1 786435 4 851969 1 720896 0
    }
   }
   IOPCompiledOp {
    data {
     1 851971 2 655360 0
    }
   }
   IOPCompiledOp {
    data {
     1 3 2 786432 0
    }
   }
   IOPCompiledOp {
    data {
     1 1179651 4 196608 0 1376257 0
    }
   }
   IOPCompiledOp {
    data {
     1 1507331 2 1114113 0
    }
   }
   IOPCompiledOp {
    data {
     1 2097155 4 1835009 4 1310721 0
    }
   }
   IOPCompiledOp {
    data {
     1 1245187 2 1441793 0
    }
   }
   IOPCompiledOp {
    data {
     1 1114115 6 131072 0 1638401 2 1572865 1
    }
   }
   IOPCompiledOp {
    data {
     1 1310723 4 0 0 1769473 0
    }
   }
   IOPCompiledOp {
    data {
     1 1900547 4 2228225 0 1179649 0
    }
   }
   IOPCompiledOp {
    data {
     2 1376259 1638403 4 262144 0 917504 0
    }
   }
   IOPCompiledOp {
    data {
     1 1376259 4 1572865 0 983040 0
    }
   }
   IOPCompiledOp {
    data {
     1 524290 6 1048576 0 65536 0 196608 0
    }
   }
   IOPCompiledOp {
    data {
     1 1441795 2 196608 0
    }
   }
   IOPCompiledOp {
    data {
     1 1245187 2 1114112 0
    }
   }
   IOPCompiledOp {
    data {
     2 589826 1966083 4 131072 0 1507329 0
    }
   }
   IOPCompiledOp {
    data {
     1 2031619 8 327680 2 1900545 0 1179648 3 262144 1
    }
   }
   IOPCompiledOp {
    data {
     1 2097155 2 1966081 0
    }
   }
   IOPCompiledOp {
    data {
     1 655362 4 2031617 0 1245185 0
    }
   }
   IOPCompiledOp {
    data {
     1 2228227 6 131072 0 2359297 2 2293761 1
    }
   }
   IOPCompiledOp {
    data {
     2 131075 1507331 4 0 0 2162689 0
    }
   }
   IOPCompiledOp {
    data {
     1 2162691 4 1310720 0 1245184 0
    }
   }
   IOPCompiledOp {
    data {
     1 2162691 4 1376256 0 1245184 0
    }
   }
  }
  outs {
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
   IOPCompiledOut {
    data {
     0
    }
   }
  }
  processed 70
  version 2
  ops_reeval_list {
   18 20
  }
 }
}