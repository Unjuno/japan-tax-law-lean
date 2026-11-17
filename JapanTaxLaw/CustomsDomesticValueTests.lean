import JapanTaxLaw.CustomsDomesticValue

/-!
# CustomsDomesticValue tests — 関税定率法 art. 4の3 smoke checks

Decidable smoke tests, pinned to
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

def d3 : DomesticDeductions := ⟨20_000, 30_000, 10_000, 40_000⟩

-- art. 4の3(1): 国内販売価格 − 控除合計
example : domesticDeductionsTotal d3 = 100_000 := by decide
example : domesticSalesValue 1_000_000 d3 = 900_000 := by decide
-- art. 4の3(2): 製造原価 + 利潤一般経費 + 運賃
example : computedValue 500_000 100_000 20_000 = 620_000 := by decide
-- art. 4の3(3): 申出で製造原価法を優先
example : customsValueArt4_3 1_000_000 d3 500_000 100_000 20_000 true = 620_000 := by decide
example : customsValueArt4_3 1_000_000 d3 500_000 100_000 20_000 false = 900_000 := by decide
-- 境界: underflow / 控除0 / 原価0
example : domesticSalesValue 50_000 d3 = 0 := by decide
example : domesticSalesValue 1_000_000 ⟨0, 0, 0, 0⟩ = 1_000_000 := by decide
example : computedValue 0 0 0 = 0 := by decide

end JapanTaxLaw
