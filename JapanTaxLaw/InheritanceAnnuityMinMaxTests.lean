import JapanTaxLaw.InheritanceAnnuityMinMax

/-!
# InheritanceAnnuityMinMax tests — 相続税法 art. 24(1) 四号 / art. 24(3)(4) smoke checks

Decidable smoke tests, pinned to Law id 325AC0000000073 /
  revision 325AC0000000073_20260401_506AC0000000008 / enforcement 2026-04-01.

All checks are kernel-decided (`by decide`). term = 有期定期金算出額,
lifetime = 終身定期金算出額 (both caller-established Money).
-/

namespace JapanTaxLaw.InheritanceAnnuityMinMax

-- 四号: 一時金の価額 = 給付金額そのもの
example : lumpSumPaymentAmount 0 = 0 := by decide
example : lumpSumPaymentAmount 12_345 = 12_345 := by decide

-- 3項: 少ない金額 = min
example : conditionalAnnuityValue 3 7 = 3 := by decide  -- term < lifetime
example : conditionalAnnuityValue 7 3 = 3 := by decide  -- term > lifetime
example : conditionalAnnuityValue 5 5 = 5 := by decide  -- 等しい
example : conditionalAnnuityValue 0 5 = 0 := by decide  -- 境界 0（term 側）
example : conditionalAnnuityValue 5 0 = 0 := by decide  -- 境界 0（lifetime 側）
example : conditionalAnnuityValue 0 0 = 0 := by decide

-- 4項: 多い金額 = max
example : continuingAnnuityValue 3 7 = 7 := by decide  -- term < lifetime
example : continuingAnnuityValue 7 3 = 7 := by decide  -- term > lifetime
example : continuingAnnuityValue 5 5 = 5 := by decide  -- 等しい
example : continuingAnnuityValue 0 5 = 5 := by decide  -- 境界 0（term 側）
example : continuingAnnuityValue 5 0 = 5 := by decide  -- 境界 0（lifetime 側）
example : continuingAnnuityValue 0 0 = 0 := by decide

-- 契約種別 Bool は選択のみ（false = 3項 / true = 4項）
example : annuityMinMaxValue false 3 7 = 3 := by decide
example : annuityMinMaxValue true 3 7 = 7 := by decide
example : annuityMinMaxValue false 7 3 = 3 := by decide
example : annuityMinMaxValue true 7 3 = 7 := by decide

end JapanTaxLaw.InheritanceAnnuityMinMax
