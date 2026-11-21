import JapanTaxLaw.TaxFinance

/-!
# TaxExaminerCount — 国税審査官の定数（政令 art.3）bounded L4 モデル

Sources (pinned):
  Law id: 345M50000040017
  Revision: 345M50000040017_20260710_508M60000040048
  Raw snapshot: data/raw/345M50000040017_20260710_508M60000040048.law.json
  Article Num 3, flat/normalized leaf text 65 chars, U+3000 count 0.

原文逐語:
  「国税不服審判所に、国税審査官百七十四人以内を置く。」

Computation（原文逐語から導出、定員上限のみ）:
  maxExaminers = 174（百七十四人以内 = 上限）
  isWithinCap(n) = n <= 174

Scope / NOT MODELLED:
  - 実際の任命数、欠員、定数改正手続は NOT MODELLED。
  - 国税審査官の職務内容は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxExaminerCount

open JapanTaxLaw.TaxFinance

/-- 国税審査官の定数上限 = 174 人。 -/
def maxExaminers : Nat := 174

/-- 定員内か（境界: 174 は含む）。 -/
def isWithinCap (n : Nat) : Bool := n <= maxExaminers

example : maxExaminers = 174 := by decide
example : isWithinCap 0 = true := by decide
example : isWithinCap 174 = true := by decide
example : isWithinCap 175 = false := by decide

end JapanTaxLaw.TaxExaminerCount
