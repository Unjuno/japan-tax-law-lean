import JapanTaxLaw.ObligationArt15

/-!
# ObligationArt15 tests — 国税通則法 Act art. 15 smoke checks

Decidable smoke checks for the establishment event mapping.
Scope limited to the tax kinds enumerated in the closed TaxKind universe;
item 1 onwards for 所得税・法人税等 (not in universe) is not claimed.
-/

namespace JapanTaxLaw

-- 源泉徴収による所得税 ⇒ 所得の支払の時に成立
example : establishmentEvent .withholdingIncomeTax = .timeOfIncomePayment := by decide

-- 消費税等 ⇒ 課税資産の譲渡等等の時に成立
example : establishmentEvent .consumptionTax = .timeOfSupplyOrRemoval := by decide
example : establishmentEvent .liquorTax = .timeOfSupplyOrRemoval := by decide
example : establishmentEvent .tobaccoTax = .timeOfSupplyOrRemoval := by decide
example : establishmentEvent .gasolineTax = .timeOfSupplyOrRemoval := by decide
example : establishmentEvent .localGasolineTax = .timeOfSupplyOrRemoval := by decide
example : establishmentEvent .petroleumGasTax = .timeOfSupplyOrRemoval := by decide
example : establishmentEvent .petroleumAndCoalTax = .timeOfSupplyOrRemoval := by decide

-- 過少申告加算税・無申告加算税 ⇒ 法定申告期限の経過の時
example : establishmentEvent .underDeclarationTax = .timeOfExpiryOfFilingDeadline := by decide
example : establishmentEvent .nonDeclarationTax = .timeOfExpiryOfFilingDeadline := by decide

-- 不納付加算税 ⇒ 法定納期限の経過の時
example : establishmentEvent .nonPaymentTax = .timeOfExpiryOfPaymentDeadline := by decide

-- 延滞税・利子税 ⇒ 特別の手続を要しない（第15条第3項第七号）
example : establishmentEvent .latePaymentTax = .noSpecialProcedureNeeded := by decide
example : establishmentEvent .interestTax = .noSpecialProcedureNeeded := by decide

-- その他 ⇒ 未サポート（未対応として記録）
example : establishmentEvent .customsDuty = .unsupported := by decide
example : establishmentEvent .tonZei = .unsupported := by decide
example : establishmentEvent .specialTonZei = .unsupported := by decide
example : establishmentEvent .forestEnvironmentZei = .unsupported := by decide
example : establishmentEvent .specialCorporateBizZei = .unsupported := by decide
example : establishmentEvent .internationalTourismSpecialCollZei = .unsupported := by decide
example : establishmentEvent .heavyAdditionalTax = .unsupported := by decide
example : establishmentEvent .otherNationalTax = .unsupported := by decide

end JapanTaxLaw
