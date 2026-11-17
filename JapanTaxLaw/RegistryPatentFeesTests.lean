import JapanTaxLaw.RegistryPatentFees

/-!
# RegistryPatentFeesTests — 別表第一（二）第十三号・第十四号（特許権・実用新案権）の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 登録件数 and 課税標準 (`base`) are caller-established; no Bool enters any
formula. Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every flat amount, every rate literal, and several base
amounts (incl. floor boundaries) independently of the main module's own smoke.
-/

namespace JapanTaxLaw.RegistryPatentFees

open JapanTaxLaw.TaxFinance

-- 十三 定額: 金額・well-definedness
example : patentTransferInheritanceOrMergerFee = 3_000 := by decide
example : patentTransferInheritanceOrMergerFee > 0 := by decide
example : patentTransferOtherFee = 15_000 := by decide
example : patentTransferOtherFee > 0 := by decide
example : patentExclusiveRightEstablishmentOrPreservationFee = 15_000 := by decide
example : patentExclusiveRightEstablishmentOrPreservationFee > 0 := by decide
example : patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : patentExclusiveRightOrPledgeTransferInheritanceOrMergerFee > 0 := by decide
example : patentExclusiveRightOrPledgeTransferOtherFee = 3_000 := by decide
example : patentExclusiveRightOrPledgeTransferOtherFee > 0 := by decide
example : patentNonPledgeTrustFee = 3_000 := by decide
example : patentNonPledgeTrustFee > 0 := by decide
example : patentMiscRegistrationFee = 1_000 := by decide
example : patentMiscRegistrationFee > 0 := by decide
example : patentCancellationFee = 1_000 := by decide
example : patentCancellationFee > 0 := by decide

-- 十三 割合型: 分子・分母・well-definedness
example : patentPledgeEstablishmentOrDispositionRestrictionRate.num = 4 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionRate.den = 1000 := by decide
example : 0 < patentPledgeEstablishmentOrDispositionRestrictionRate.den := by decide
example : patentPledgeTrustRate.num = 2 := by decide
example : patentPledgeTrustRate.den = 1000 := by decide
example : 0 < patentPledgeTrustRate.den := by decide

-- 十三（三）4/1000: 249→0, 250→1, 999→3, 1000→4, 1001→4, 12345→49
example : patentPledgeEstablishmentOrDispositionRestrictionFee 0 = 0 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 1 = 0 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 249 = 0 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 250 = 1 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 999 = 3 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 1000 = 4 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 1001 = 4 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 12_345 = 49 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 100_000 = 400 := by decide
example : patentPledgeEstablishmentOrDispositionRestrictionFee 1_000_000 = 4_000 := by decide

-- 十三（五）イ 2/1000: 499→0, 500→1, 999→1, 1000→2, 12345→24
example : patentPledgeTrustFee 0 = 0 := by decide
example : patentPledgeTrustFee 499 = 0 := by decide
example : patentPledgeTrustFee 500 = 1 := by decide
example : patentPledgeTrustFee 999 = 1 := by decide
example : patentPledgeTrustFee 1000 = 2 := by decide
example : patentPledgeTrustFee 1001 = 2 := by decide
example : patentPledgeTrustFee 12_345 = 24 := by decide
example : patentPledgeTrustFee 1_000_000 = 2_000 := by decide

-- 十四 定額: 金額・well-definedness
example : utilityModelTransferInheritanceOrMergerFee = 3_000 := by decide
example : utilityModelTransferInheritanceOrMergerFee > 0 := by decide
example : utilityModelTransferOtherFee = 9_000 := by decide
example : utilityModelTransferOtherFee > 0 := by decide
example : utilityModelExclusiveRightEstablishmentOrPreservationFee = 9_000 := by decide
example : utilityModelExclusiveRightEstablishmentOrPreservationFee > 0 := by decide
example : utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : utilityModelExclusiveRightOrPledgeTransferInheritanceOrMergerFee > 0 := by decide
example : utilityModelExclusiveRightOrPledgeTransferOtherFee = 3_000 := by decide
example : utilityModelExclusiveRightOrPledgeTransferOtherFee > 0 := by decide
example : utilityModelNonPledgeTrustFee = 3_000 := by decide
example : utilityModelNonPledgeTrustFee > 0 := by decide
example : utilityModelMiscRegistrationFee = 1_000 := by decide
example : utilityModelMiscRegistrationFee > 0 := by decide
example : utilityModelCancellationFee = 1_000 := by decide
example : utilityModelCancellationFee > 0 := by decide

-- 十四 割合型: 分子・分母・well-definedness
example : utilityModelPledgeEstablishmentOrDispositionRestrictionRate.num = 4 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionRate.den = 1000 := by decide
example : 0 < utilityModelPledgeEstablishmentOrDispositionRestrictionRate.den := by decide
example : utilityModelPledgeTrustRate.num = 2 := by decide
example : utilityModelPledgeTrustRate.den = 1000 := by decide
example : 0 < utilityModelPledgeTrustRate.den := by decide

-- 十四（三）4/1000
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 0 = 0 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 249 = 0 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 250 = 1 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 999 = 3 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 1000 = 4 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 12_345 = 49 := by decide
example : utilityModelPledgeEstablishmentOrDispositionRestrictionFee 1_000_000 = 4_000 := by decide

-- 十四（五）イ 2/1000
example : utilityModelPledgeTrustFee 0 = 0 := by decide
example : utilityModelPledgeTrustFee 499 = 0 := by decide
example : utilityModelPledgeTrustFee 500 = 1 := by decide
example : utilityModelPledgeTrustFee 999 = 1 := by decide
example : utilityModelPledgeTrustFee 1000 = 2 := by decide
example : utilityModelPledgeTrustFee 12_345 = 24 := by decide
example : utilityModelPledgeTrustFee 1_000_000 = 2_000 := by decide

end JapanTaxLaw.RegistryPatentFees
