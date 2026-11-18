import JapanTaxLaw.LocalCorporationTaxRate

/-!
# LocalCorporationTaxRate tests — 地方法人税法 art. 10 smoke checks

Decidable kernel smoke tests, pinned to
  Law id: 426AC0000000011
  Revision: 426AC0000000011_20260401_507AC0000000013

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準法人税額 / 基準法人税額 / 加算額 are caller-established;
no Bool enters any formula.
-/

namespace JapanTaxLaw.LocalCorporationTaxRate

open JapanTaxLaw.TaxFinance

-- 第1項: 課税標準法人税額 × 103/1000 (百分の十・三, floor)
example : localCorpTax 0 = 0 := by decide
example : localCorpTax 1 = 0 := by decide
example : localCorpTax 999 = 102 := by decide
example : localCorpTax 1000 = 103 := by decide  -- 1030 ではない
example : localCorpTax 1001 = 103 := by decide
example : localCorpTax 12345 = 1271 := by decide  -- 端数切り捨て
example : localCorpTax 100_000 = 10_300 := by decide
example : localCorpTax 1_000_000 = 103_000 := by decide

-- 第2項: 基準法人税額 − 加算額（飽和減算）
example : localCorpTaxBase 0 0 = 0 := by decide
example : localCorpTaxBase 1000 0 = 1000 := by decide
example : localCorpTaxBase 1000 200 = 800 := by decide
example : localCorpTaxBase 500 500 = 0 := by decide
example : localCorpTaxBase 200 1000 = 0 := by decide  -- 加算 > 基準 で飽和
example : localCorpTaxBase 0 500 = 0 := by decide

-- 第1項と第2項の合成（加算額がある場合の税額）
example : localCorpTax (localCorpTaxBase 1000 200) = 82 := by decide  -- 800 * 103 / 1000
example : localCorpTax (localCorpTaxBase 200 1000) = 0 := by decide

end JapanTaxLaw.LocalCorporationTaxRate
