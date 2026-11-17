import JapanTaxLaw.CustomsTransactionPrice

/-!
# CustomsTransactionPrice tests — 関税定率法 art. 4 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def testAdditions : CustomsAdditions :=
  ⟨100_000, 5_000, 2_000, 3_000, 10_000, 4_000, 1_000, 6_000, 8_000, 7_000⟩

-- art. 4(1): 加算合計
example : additionsTotal testAdditions = 146_000 := by decide
-- 取引価格 = 現実支払価格 + 加算合計
example : transactionPrice 1_000_000 testAdditions = 1_146_000 := by decide
-- 加算0
example : transactionPrice 500_000 ⟨0, 0, 0, 0, 0, 0, 0, 0, 0, 0⟩ = 500_000 := by decide
-- 境界: 現実支払0
example : transactionPrice 0 testAdditions = 146_000 := by decide

end JapanTaxLaw
