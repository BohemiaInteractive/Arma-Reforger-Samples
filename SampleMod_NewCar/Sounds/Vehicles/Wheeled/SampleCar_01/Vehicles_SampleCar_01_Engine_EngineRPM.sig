AudioSignalResClass {
 Inputs {
  IOPItemInputClass {
   id 1
   name "EngineRPM_"
   tl -63.889 -33.444
   children {
    3 4 5 6 11 12 16 34
   }
   value 3000
   valueMax 10000
  }
  IOPItemInputClass {
   id 14
   name "EngineThrust_"
   tl -63.679 -643.679
   children {
    15 33
   }
   value 1
  }
  IOPItemInputClass {
   id 22
   name "EngineDamageRPMRevs_"
   tl -417.032 625.508
   children {
    35
   }
   value 0.3
  }
  IOPItemInputClass {
   id 23
   name "EngineDamage_"
   tl 210.536 700
   children {
    24 33
   }
  }
  IOPItemInputClass {
   id 25
   name "EngineDamageRPMDips_"
   tl -183.889 523.444
   children {
    29 33
   }
  }
 }
 Ops {
  IOPItemOpConvertorClass {
   id 3
   name "Point 1"
   tl 208.905 -230.286
   children {
    6
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   Intervals {
    IOPItemOpConvertorRange {
     min 0
     max 1000
     out 1
    }
   }
  }
  IOPItemOpConvertorClass {
   id 4
   name "Point 2"
   tl 200.667 61.667
   children {
    7
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   Intervals {
    IOPItemOpConvertorRange {
     min 1000
     max 2000
     out 1
    }
   }
  }
  IOPItemOpConvertorClass {
   id 5
   name "Point 3"
   tl 202.333 380.333
   children {
    8
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   Intervals {
    IOPItemOpConvertorRange {
     min 2000
     max 10000
     out 1
    }
   }
  }
  IOPItemOpMulClass {
   id 6
   name "Mul 6"
   tl 468.381 -233.904
   children {
    9
   }
   inputs {
    ConnectionClass connection {
     id 3
     port 0
    }
    ConnectionClass connection {
     id 1
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 7
   name "Mul 7"
   tl 477 -44
   children {
    9
   }
   inputs {
    ConnectionClass connection {
     id 4
     port 0
    }
    ConnectionClass connection {
     id 11
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 8
   name "Mul 8"
   tl 468 258
   children {
    9
   }
   inputs {
    ConnectionClass connection {
     id 5
     port 0
    }
    ConnectionClass connection {
     id 12
     port 0
    }
   }
  }
  IOPItemOpSumClass {
   id 9
   name "Sum 9"
   tl 674 -45
   children {
    2
   }
   inputs {
    ConnectionClass connection {
     id 17
     port 0
    }
    ConnectionClass connection {
     id 8
     port 0
    }
    ConnectionClass connection {
     id 7
     port 0
    }
    ConnectionClass connection {
     id 24
     port 0
    }
    ConnectionClass connection {
     id 6
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 11
   name "Point 2"
   tl 202.222 -106.667
   children {
    7
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   a 1000
   b 2000
   c 1000
   d 1500
  }
  IOPItemOpInterpolateClass {
   id 12
   name "Point 3"
   tl 204.028 210.417
   children {
    8
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   a 2000
   b 5000
   c 1500
   d 5000
   Type 3
   Type2 3
  }
  IOPItemOpInterpolateClass {
   id 15
   name "Add RPM when Thrust"
   tl 217.321 -644.107
   children {
    17
   }
   inputs {
    ConnectionClass connection {
     id 14
     port 0
    }
   }
   a 1
   b 0.1
   d 300
  }
  IOPItemOpInterpolateClass {
   id 16
   name "Interpolate 16"
   tl 212.5 -464.286
   children {
    17
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   a 1200
   b 1500
  }
  IOPItemOpMulClass {
   id 17
   name "Mul 17"
   tl 471.25 -546.607
   children {
    9
   }
   inputs {
    ConnectionClass connection {
     id 15
     port 0
    }
    ConnectionClass connection {
     id 16
     port 0
    }
   }
  }
  IOPItemOpMulClass {
   id 24
   name "Mul 24"
   tl 438.75 651.25
   children {
    9
   }
   inputs {
    ConnectionClass connection {
     id 28
     port 0
    }
    ConnectionClass connection {
     id 23
     port 0
    }
   }
  }
  IOPItemOpAverageClass {
   id 28
   name "Average 28"
   tl 216 572
   children {
    24
   }
   inputs {
    ConnectionClass connection {
     id 29
     port 0
    }
   }
  }
  IOPItemOpSumClass {
   id 29
   name "Sum 29"
   tl 21.111 573.333
   children {
    28
   }
   inputs {
    ConnectionClass connection {
     id 35
     port 0
    }
    ConnectionClass connection {
     id 25
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 30
   name "Interpolate 30"
   tl 399.682 824.921
   children {
    31
   }
   inputs {
    ConnectionClass connection {
     id 32
     port 0
    }
   }
   b -1000
   c 1
   d 0.35
  }
  IOPItemOpAverageClass {
   id 32
   name "Average 32"
   tl 208.571 823.393
   children {
    30
   }
   inputs {
    ConnectionClass connection {
     id 33
     port 0
    }
   }
   Capacity 16
  }
  IOPItemOpMulClass {
   id 33
   name "Mul 33"
   tl 28.571 822.857
   children {
    32
   }
   inputs {
    ConnectionClass connection {
     id 25
     port 0
    }
    ConnectionClass connection {
     id 23
     port 0
    }
    ConnectionClass connection {
     id 14
     port 0
    }
   }
  }
  IOPItemOpInterpolateClass {
   id 34
   name "Interpolate 34"
   tl -418.75 766.25
   children {
    35
   }
   inputs {
    ConnectionClass connection {
     id 1
     port 0
    }
   }
   a 1000
   b 2000
   c 1
   d 0
  }
  IOPItemOpMulClass {
   id 35
   name "Mul 35"
   tl -199.643 673.214
   children {
    29
   }
   inputs {
    ConnectionClass connection {
     id 34
     port 0
    }
    ConnectionClass connection {
     id 22
     port 0
    }
   }
  }
 }
 Outputs {
  IOPItemOutputClass {
   id 2
   name "EngineRPMCustom"
   tl 1074.857 -46.477
   input 9
  }
  IOPItemOutputClass {
   id 31
   name "Engine_V"
   tl 596.905 823.809
   input 30
  }
 }
 compiled IOPCompiledClass {
  visited {
   517 389 261 133 2191 2055 1927 134 1159 5 2311 2443 1803 1671 1547 1287 1419 1031 903 263 651 135 523 7 395 791 6
  }
  ins {
   IOPCompiledIn {
    data {
     8 3 65539 131075 196611 458755 524291 655363 1179651
    }
   }
   IOPCompiledIn {
    data {
     2 589827 1114115
    }
   }
   IOPCompiledIn {
    data {
     1 1245187
    }
   }
   IOPCompiledIn {
    data {
     2 786435 1114115
    }
   }
   IOPCompiledIn {
    data {
     2 917507 1114115
    }
   }
  }
  ops {
   IOPCompiledOp {
    data {
     1 196611 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 262147 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 327683 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 393219 4 1 0 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 393219 4 65537 0 458753 0
    }
   }
   IOPCompiledOp {
    data {
     1 393219 4 131073 0 524289 0
    }
   }
   IOPCompiledOp {
    data {
     1 2 10 720897 0 327681 0 262145 0 786433 0 196609 0
    }
   }
   IOPCompiledOp {
    data {
     1 262147 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 327683 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 720899 2 65536 0
    }
   }
   IOPCompiledOp {
    data {
     1 720899 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 393219 4 589825 0 655361 0
    }
   }
   IOPCompiledOp {
    data {
     1 393219 4 851969 0 196608 0
    }
   }
   IOPCompiledOp {
    data {
     1 786435 2 917505 0
    }
   }
   IOPCompiledOp {
    data {
     1 851971 4 1245185 0 262144 0
    }
   }
   IOPCompiledOp {
    data {
     1 65538 2 1048577 0
    }
   }
   IOPCompiledOp {
    data {
     1 983043 2 1114113 0
    }
   }
   IOPCompiledOp {
    data {
     1 1048579 6 262144 0 196608 0 65536 0
    }
   }
   IOPCompiledOp {
    data {
     1 1245187 2 0 0
    }
   }
   IOPCompiledOp {
    data {
     1 917507 4 1179649 0 131072 0
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
  }
  processed 27
  version 2
  ops_reeval_list {
   13 16
  }
 }
}