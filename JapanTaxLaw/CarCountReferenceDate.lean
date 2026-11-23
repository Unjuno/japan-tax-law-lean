import JapanTaxLaw.TaxFinance

/-!
# CarCountReferenceDate — 自家用乗用車台数の算定基準日（自動車重量譲与税法施行規則 art.3の2）bounded L4 モデル

Sources (pinned):
  Law id: 346M50000008013
  Revision: 346M50000008013_20230401_505M60000008036
  Raw snapshot: data/raw/346M50000008013_20230401_505M60000008036.law.json
  Article Num 3_2, flat/normalized leaf text 70 chars, U+3000 count 0.

原文逐語:
  「法第二条の二第一項の自家用の乗用車の台数の算定は、毎年度、前年の四月一日現在において行うものとする。」

Computation（原文逐語から導出、基準日の算定のみ）:
  referenceYear(fiscalYear) = fiscalYear - 1（前年）
  referenceDate(fiscalYear) = (referenceYear(fiscalYear), 4, 1)（四月一日現在）

Scope / NOT MODELLED:
  - 「自家用の乗用車」の定義・台数の実際の算定方法は NOT MODELLED。
  - 年度の暦年/会計年度の別・適用開始時点は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.CarCountReferenceDate

open JapanTaxLaw.TaxFinance

/-- 基準年 = 前年（年度から 1 を引く）。年度は 1 以上とする。 -/
def referenceYear (fiscalYear : Nat) : Nat := fiscalYear - 1

/-- 基準日 = (前年, 4月, 1日)。 -/
def referenceDate (fiscalYear : Nat) : Nat × Nat × Nat :=
  (referenceYear fiscalYear, 4, 1)

example : referenceYear 2025 = 2024 := by decide
example : referenceYear 1 = 0 := by decide
example : referenceDate 2025 = (2024, 4, 1) := by decide
example : referenceDate 2026 = (2025, 4, 1) := by decide

end JapanTaxLaw.CarCountReferenceDate
