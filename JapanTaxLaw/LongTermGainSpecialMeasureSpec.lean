import JapanTaxLaw.LongTermGainSpecialMeasure

/-!
# LongTermGainSpecialMeasure spec — 2%/1% 特例の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 指定都市は base/100、それ以外は base/50。
-/

namespace JapanTaxLaw.LongTermGainSpecialMeasure

def specMeasure (g : Nat) (city : Bool) : Nat :=
  let b := if g > 20000000 then g - 20000000 else 0
  if city then b / 100 else b / 50

example : specMeasure 30000000 false = 200000 := by decide
example : specMeasure 30000000 true = 100000 := by decide

def agreeLongTermGainSpecialMeasure : Bool :=
  [(0,false),(10000000,false),(20000000,false),(30000000,false),(30000000,true),(50000000,false)].all fun gc =>
    measure gc.1 gc.2 == specMeasure gc.1 gc.2

example : agreeLongTermGainSpecialMeasure = true := by decide

end JapanTaxLaw.LongTermGainSpecialMeasure
