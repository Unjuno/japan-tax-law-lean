import JapanTaxLaw.InheritanceAnnuityMaxima

/-!
# InheritanceAnnuityMaxima tests — 相続税法 art. 24(1) 一号・二号・三号 smoke checks

Decidable smoke tests, pinned to Law id 325AC0000000073 /
  revision 325AC0000000073_20260401_506AC0000000008 / enforcement 2026-04-01.

各入力の大小パターン（イ / ロ / ハ が最大になるケース）、同値、境界 0、
一時金選択（Bool / Option）をカーネルが `decide` する。
法解釈の正しさではなく、モデルの計算結果の退行確認のみ。
-/

namespace JapanTaxLaw.InheritanceAnnuityMaxima

open JapanTaxLaw.TaxFinance

-- ==== 一時金選択（Bool / Option、金額式には入れず選択のみ） ====

example : selectLumpSum false 100 = 0 := by decide
example : selectLumpSum true 100 = 100 := by decide
example : lumpSumAmount (none : Option Money) = 0 := by decide
example : lumpSumAmount (some 100) = 100 := by decide

-- ==== 一号 有期定期金 ====

-- イ（解約返戻金）が最大
example : termAnnuityValue 30 20 10 = 30 := by decide
example : termAnnuityValue 100 99 98 = 100 := by decide
-- ロ（一時金）が最大
example : termAnnuityValue 10 30 20 = 30 := by decide
example : termAnnuityValue 99 100 98 = 100 := by decide
-- ハ（平均額×複利年金現価率）が最大
example : termAnnuityValue 10 20 30 = 30 := by decide
example : termAnnuityValue 98 99 100 = 100 := by decide
-- 同値・境界
example : termAnnuityValue 20 20 20 = 20 := by decide
example : termAnnuityValue 30 30 10 = 30 := by decide
example : termAnnuityValue 10 30 30 = 30 := by decide
example : termAnnuityValue 0 0 0 = 0 := by decide
example : termAnnuityValue 0 5 5 = 5 := by decide
example : termAnnuityValue 5 0 5 = 5 := by decide
example : termAnnuityValue 5 5 0 = 5 := by decide
-- Option 版（一時金なし / あり）
example : termAnnuityValueOpt 10 (none : Option Money) 30 = 30 := by decide
example : termAnnuityValueOpt 10 (some 50) 30 = 50 := by decide
example : termAnnuityValueOpt 100 (some 50) 30 = 100 := by decide

-- ==== 二号 無期定期金 ====

example : perpetualAnnuityValue 30 20 10 = 30 := by decide
example : perpetualAnnuityValue 10 30 20 = 30 := by decide
example : perpetualAnnuityValue 10 20 30 = 30 := by decide
example : perpetualAnnuityValue 20 20 20 = 20 := by decide
example : perpetualAnnuityValue 0 0 0 = 0 := by decide
example : perpetualAnnuityValue 0 7 7 = 7 := by decide
example : perpetualAnnuityValueOpt 10 (none : Option Money) 30 = 30 := by decide
example : perpetualAnnuityValueOpt 10 (some 50) 30 = 50 := by decide

-- ==== 三号 終身定期金 ====

example : lifetimeAnnuityValue 30 20 10 = 30 := by decide
example : lifetimeAnnuityValue 10 30 20 = 30 := by decide
example : lifetimeAnnuityValue 10 20 30 = 30 := by decide
example : lifetimeAnnuityValue 20 20 20 = 20 := by decide
example : lifetimeAnnuityValue 0 0 0 = 0 := by decide
example : lifetimeAnnuityValue 0 9 9 = 9 := by decide
example : lifetimeAnnuityValueOpt 10 (none : Option Money) 30 = 30 := by decide
example : lifetimeAnnuityValueOpt 10 (some 50) 30 = 50 := by decide

end JapanTaxLaw.InheritanceAnnuityMaxima
