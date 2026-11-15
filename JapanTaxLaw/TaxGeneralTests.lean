import JapanTaxLaw.TaxGeneral

/-!
# TaxGeneral tests — 国税通則法 Act art. 2 items 1–4 smoke checks

Decidable smoke checks for the definition layer. Scope limited to
Act art. 2 items 1–4 definitions; items 5+ are not claimed.
-/

namespace JapanTaxLaw

-- 関税 is NOT a national tax (item 1)
example : isNationalTax .customsDuty = false := by decide
example : isNationalTax .tonZei = false := by decide
example : isNationalTax .specialTonZei = false := by decide
example : isNationalTax .forestEnvironmentZei = false := by decide
example : isNationalTax .specialCorporateBizZei = false := by decide

-- 源泉徴収に係る所得税 IS a national tax and IS source-collected (item 2)
example : isNationalTax .withholdingIncomeTax = true := by decide
example : isSourceCollectedNationalTax .withholdingIncomeTax = true := by decide
example : isNationalTax .internationalTourismSpecialCollZei = true := by decide
example : isSourceCollectedNationalTax .internationalTourismSpecialCollZei = true := by decide

-- 附帯税 are national taxes, NOT source-collected (item 4 + item 2 caveat)
example : isNationalTax .latePaymentTax = true := by decide
example : isAncillaryTax .heavyAdditionalTax = true := by decide
example : isSourceCollectedNationalTax .interestTax = false := by decide

-- 消費税等 kinds are national taxes and NOT ancillary (item 3 vs item 4)
example : isNationalTax .consumptionTax = true := by decide
example : isConsumptionTaxEtc .petroleumAndCoalTax = true := by decide
example : isAncillaryTax .petroleumAndCoalTax = false := by decide

-- 補足: 源泉徴収等による国税の附帯税は item 2 から除かれている (smoke inclusion)
example : isSourceCollectedNationalTax .underDeclarationTax = false := by decide

-- 排他性は decide ですべての閉じたケースで検査可能（h が過去条件のため cases で ∀ を分解）
example : ∀ k : TaxKind, isConsumptionTaxEtc k = true → isNationalTax k = true := by
  intro k h
  cases k <;> first | contradiction | decide

end JapanTaxLaw
