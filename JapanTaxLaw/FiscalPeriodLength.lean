import JapanTaxLaw.TaxFinance

/-!
# FiscalPeriodLength — 総務省令で定める期間に係る年度（省令 art.4）bounded L4 モデル

Sources (pinned):
  Law id: 405M50000008001
  Revision: 405M50000008001_20250401_507M60000008028
  Raw snapshot: data/raw/405M50000008001_20250401_507M60000008028.law.json
  Article Num 4, flat/normalized leaf text 90 chars, U+3000 count 0.

原文逐語:
  「法第二十条に規定する総務省令で定める期間に係る年度は、事業税の課税免除又は
   不均一課税をした最初の年度から五箇年度とする。」

Computation（原文逐語から導出、期間の年数のみ）:
  periodYears = 5（五箇年度）
  対象年度 = 最初の年度から 5 年度（最初=1 とすると 1..5）
  isInPeriod(offset) = (1 <= offset && offset <= 5)  （offset=1 が最初の年度）

Scope / NOT MODELLED:
  - 法20条の課税免除・不均一課税の具体的内容は NOT MODELLED。
  - 「最初の年度」の認定・年度の暦年換算は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.FiscalPeriodLength

open JapanTaxLaw.TaxFinance

/-- 期間 = 5 箇年度。 -/
def periodYears : Nat := 5

/-- 最初の年度から数えた offset（1origin）が期間内か。 -/
def isInPeriod (offset : Nat) : Bool :=
  1 <= offset && offset <= periodYears

example : periodYears = 5 := by decide
example : isInPeriod 0 = false := by decide
example : isInPeriod 1 = true := by decide
example : isInPeriod 5 = true := by decide
example : isInPeriod 6 = false := by decide

end JapanTaxLaw.FiscalPeriodLength
