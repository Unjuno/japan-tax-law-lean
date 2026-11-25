import JapanTaxLaw.TaxFinance

/-!
# ProgressiveSurchargeBrackets — 地方税法 不申告加算金額の3段階累進

Statutory bracket table (repeated across 17 pinned provisions of 地方税法):
  50万円以下の部分     : 15%
  50万円超300万円以下の部分 : 20%
  300万円を超える部分   : 30%
plus the additional 10% of the tax in the cases described in 第2項/第3項.

`base` is the amount to which the brackets apply (Nat 円); `tax` is the
納入/納付すべき税額. The statutory conditions selecting 第2項/第3項 are
caller-established and NOT modelled. Not legal advice.
-/

namespace JapanTaxLaw.ProgressiveSurchargeBrackets

def progressiveSurcharge (base : Nat) : Nat :=
  min base 500_000 * 15 / 100
  + min (base - 500_000) 2_500_000 * 20 / 100
  + (base - 3_000_000) * 30 / 100

def withAdditional (base tax : Nat) : Nat :=
  progressiveSurcharge base + tax * 10 / 100

example : progressiveSurcharge 0 = 0 := by decide
example : progressiveSurcharge 500_000 = 75_000 := by decide
example : progressiveSurcharge 3_000_000 = 75_000 + 500_000 := by decide
example : progressiveSurcharge 4_000_000 = 75_000 + 500_000 + 300_000 := by decide
example : withAdditional 3_000_000 1_000_000 = 675_000 := by decide

end JapanTaxLaw.ProgressiveSurchargeBrackets
