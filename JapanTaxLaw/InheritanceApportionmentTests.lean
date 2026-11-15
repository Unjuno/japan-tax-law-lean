import JapanTaxLaw.InheritanceApportionment

/-!
# InheritanceApportionment tests — 相続税法 art. 17 smoke checks

Decidable smoke tests for the proportional apportionment of the art. 16-computed
相続税の総額 to each heir, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Each example covers a boundary: the zero-totalTaxable case, the full-taxable
case, a mid-range 4-heir split, a 1:2:7 split example.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 相続税の総額: 相続人等の課税価格占有率
example : heirApportionedTax 1_000_000 100_000 4_000_000 = 25_000 := by decide
example : heirApportionedTax 2_000_000 500_000 4_000_000 = 250_000 := by decide
-- 課税価格の合計額 = 0 の場合は算出不能 → 0（モデル化）
example : heirApportionedTax 1_000_000 100_000 0 = 0 := by decide
-- 当該相続人の課税価格 = 合計額 ⇒ 相続税の総額全額
example : heirApportionedTax 1_000_000 4_000_000 4_000_000 = 1_000_000 := by decide

-- 3 : 1 : 6 の分割例（合計 10_000_000、税額 5_000_000）
example : heirApportionedTax 5_000_000 3_000_000 10_000_000 = 1_500_000 := by decide
example : heirApportionedTax 5_000_000 1_000_000 10_000_000 = 500_000 := by decide
example : heirApportionedTax 5_000_000 6_000_000 10_000_000 = 3_000_000 := by decide
-- 合計額の方より小さい配分が総額を超えないこと（decide）
example : heirApportionedTax 5_000_000 3_000_000 10_000_000 +
    heirApportionedTax 5_000_000 1_000_000 10_000_000 +
    heirApportionedTax 5_000_000 6_000_000 10_000_000 = 5_000_000 := by decide

end JapanTaxLaw
