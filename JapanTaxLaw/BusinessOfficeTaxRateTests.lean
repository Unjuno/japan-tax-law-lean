import JapanTaxLaw.BusinessOfficeTaxRate

/-!
# BusinessOfficeTaxRateTests — 地方税法 第七百一条の四十二 の回帰テスト

Kernel-decided smoke tests pinned to
  law 325AC0000000226 / revision 325AC0000000226_20261101_508AC0000000002 /
  enforcement 2026-11-01.

境界（0）、六百円/㎡、0.25% = 25/10000 の切り捨て、合算を確認する。
認定・課税標準・手続・附則は NOT MODELLED（impl の doc-comment 参照）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- ==== rates (pinned literals) ====
example : businessOfficeAssetRatePerSqMeter = 600 := by decide
example : businessOfficeEmploymentRate.num = 25 := by decide
example : businessOfficeEmploymentRate.den = 10000 := by decide

-- ==== asset part: 600 yen per square meter ====
example : businessOfficeAssetTax 0 = 0 := by decide
example : businessOfficeAssetTax 1 = 600 := by decide
example : businessOfficeAssetTax 100 = 60_000 := by decide
example : businessOfficeAssetTax 10_000 = 6_000_000 := by decide

-- ==== employment part: 0.25% with floor ====
example : businessOfficeEmploymentTax 0 = 0 := by decide
example : businessOfficeEmploymentTax 1 = 0 := by decide
example : businessOfficeEmploymentTax 400 = 1 := by decide
example : businessOfficeEmploymentTax 4_000_000 = 10_000 := by decide
example : businessOfficeEmploymentTax 10_000_000 = 25_000 := by decide

-- ==== total ====
example : businessOfficeTax 0 0 = 0 := by decide
example : businessOfficeTax 100 4_000_000 = 70_000 := by decide
example : businessOfficeTax 100 0 = 60_000 := by decide
example : businessOfficeTax 0 4_000_000 = 10_000 := by decide

-- ==== regression against 10x denominator error (25/1000) ====
example : businessOfficeEmploymentTax 4_000_000 ≠ 100_000 := by decide

end JapanTaxLaw
