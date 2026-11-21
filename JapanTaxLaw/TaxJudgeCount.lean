import JapanTaxLaw.TaxFinance

/-!
# TaxJudgeCount — 国税審判官等の定数（政令 art.2）bounded L4 モデル

Sources (pinned):
  Law id: 345M50000040017
  Revision: 345M50000040017_20260710_508M60000040048
  Raw snapshot: data/raw/345M50000040017_20260710_508M60000040048.law.json
  Article Num 2, flat/normalized leaf text 62 chars, U+3000 count 0.

原文逐語:
  「国税審判官及び国税副審判官の定数は、次のとおりとする。
   一国税審判官百八十人 二国税副審判官八十九人」

Computation（原文逐語から導出、定員定数のみ）:
  judgeCount = 180（国税審判官 百八十人）
  deputyJudgeCount = 89（国税副審判官 八十九人）

Scope / NOT MODELLED:
  - 実際の任命数、欠員、定数の改正手続は NOT MODELLED。
  - 本スライスは法定定員の数値定数のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxJudgeCount

open JapanTaxLaw.TaxFinance

/-- 国税審判官の定数 = 180 人。 -/
def judgeCount : Nat := 180
/-- 国税副審判官の定数 = 89 人。 -/
def deputyJudgeCount : Nat := 89

example : judgeCount = 180 := by decide
example : deputyJudgeCount = 89 := by decide

end JapanTaxLaw.TaxJudgeCount
