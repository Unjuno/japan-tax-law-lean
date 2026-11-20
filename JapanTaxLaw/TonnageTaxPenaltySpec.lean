import JapanTaxLaw.TonnageTaxPenalty

/-!
# TonnageTaxPenalty spec — 特別とん税法 art.10 の独立整数定式
Sources (pinned): law 332AC0000000038, revision 332AC0000000038_20250601_504AC0000000068.
Independent restatement: 拘禁刑上限=3年、罰金上限=500,000円、両者とも以下なら上限内。
-/

namespace JapanTaxLaw.TonnageTaxPenalty

def specWithin (years fine : Nat) : Bool :=
  years ≤ 3 && fine ≤ 500_000

example : specWithin 3 500_000 = true := by decide
example : specWithin 4 500_000 = false := by decide

def agreeTonnageTaxPenalty : Bool :=
  [ (0,0), (1,1000), (3,500_000), (4,500_000), (3,500_001), (2,250_000) ].all fun (y, f) =>
    withinLimits y f == specWithin y f
example : agreeTonnageTaxPenalty = true := by decide

end JapanTaxLaw.TonnageTaxPenalty
