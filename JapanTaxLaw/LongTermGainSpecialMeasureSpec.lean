import JapanTaxLaw.LongTermGainSpecialMeasure

/-!
# LongTermGainSpecialMeasure spec — 2%/1% 特例の独立定式
Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 指定都市は base/100、それ以外は base/50。
-/

namespace JapanTaxLaw.LongTermGainSpecialMeasure

-- Independent restatement: the statute writes the rate as 百分の二 (2/100),
-- with 百分の一 (1/100) for a designated city.  The rate is carried as an
-- explicit (numerator, denominator) pair transcribed from 原文, so the source
-- correspondence audit can check the exact statutory ratio, not merely the
-- presence of a digit somewhere in the article.
def specRate (designatedCity : Bool) : Nat × Nat :=
  if designatedCity then (1, 100) else (2, 100)

def specMeasure (g : Nat) (city : Bool) : Nat :=
  let b := if g > 20000000 then g - 20000000 else 0
  let r := specRate city
  b * r.1 / r.2

example : specRate false = (2, 100) := by decide
example : specRate true = (1, 100) := by decide
example : specMeasure 30000000 false = 200000 := by decide
example : specMeasure 30000000 true = 100000 := by decide

def agreeLongTermGainSpecialMeasure : Bool :=
  [(0,false),(10000000,false),(20000000,false),(30000000,false),(30000000,true),(50000000,false)].all fun gc =>
    measure gc.1 gc.2 == specMeasure gc.1 gc.2

example : agreeLongTermGainSpecialMeasure = true := by decide

end JapanTaxLaw.LongTermGainSpecialMeasure
