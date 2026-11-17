import JapanTaxLaw.RegistryShipFees

/-!
# RegistryShipFeesTests — 別表第一（二）二（船舶の登記）の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準額 (`base`), 隻数 and 件数 are caller-established; no Bool enters
any formula. Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every rate literal, the flat amounts and several base
amounts (incl. floor boundaries) independently of the main module's own smoke.
-/

namespace JapanTaxLaw.RegistryShipFees

open JapanTaxLaw.TaxFinance

-- 税率定数: 分子・分母・well-definedness
example : shipOwnershipPreservationRate.num = 4 := by decide
example : shipOwnershipPreservationRate.den = 1000 := by decide
example : 0 < shipOwnershipPreservationRate.den := by decide
example : shipOwnershipTransferInheritanceOrMergerRate.num = 4 := by decide
example : shipOwnershipTransferInheritanceOrMergerRate.den = 1000 := by decide
example : 0 < shipOwnershipTransferInheritanceOrMergerRate.den := by decide
example : shipOwnershipTransferGratuitousRate.num = 20 := by decide
example : shipOwnershipTransferGratuitousRate.den = 1000 := by decide
example : 0 < shipOwnershipTransferGratuitousRate.den := by decide
example : shipOwnershipTransferOtherRate.num = 28 := by decide
example : shipOwnershipTransferOtherRate.den = 1000 := by decide
example : 0 < shipOwnershipTransferOtherRate.den := by decide
example : shipAbandonmentRate.num = 4 := by decide
example : shipAbandonmentRate.den = 1000 := by decide
example : 0 < shipAbandonmentRate.den := by decide
example : shipLeaseholdRate.num = 15 := by decide
example : shipLeaseholdRate.den = 10000 := by decide
example : 0 < shipLeaseholdRate.den := by decide
example : shipMortgageSecurityRate.num = 4 := by decide
example : shipMortgageSecurityRate.den = 1000 := by decide
example : 0 < shipMortgageSecurityRate.den := by decide
example : shipMortgageTransferInheritanceOrMergerRate.num = 1 := by decide
example : shipMortgageTransferInheritanceOrMergerRate.den = 1000 := by decide
example : 0 < shipMortgageTransferInheritanceOrMergerRate.den := by decide
example : shipMortgageTransferOtherRate.num = 2 := by decide
example : shipMortgageTransferOtherRate.den = 1000 := by decide
example : 0 < shipMortgageTransferOtherRate.den := by decide
example : shipSweepMortgagePartialTransferOrDivisionRate.num = 2 := by decide
example : shipSweepMortgagePartialTransferOrDivisionRate.den = 1000 := by decide
example : 0 < shipSweepMortgagePartialTransferOrDivisionRate.den := by decide
example : shipOwnershipTrustRate.num = 4 := by decide
example : shipOwnershipTrustRate.den = 1000 := by decide
example : 0 < shipOwnershipTrustRate.den := by decide
example : shipMortgageTrustRate.num = 2 := by decide
example : shipMortgageTrustRate.den = 1000 := by decide
example : 0 < shipMortgageTrustRate.den := by decide
example : shipOtherRightTrustRate.num = 15 := by decide
example : shipOtherRightTrustRate.den = 10000 := by decide
example : 0 < shipOtherRightTrustRate.den := by decide
example : shipOwnershipTransferProvisionalRate.num = 4 := by decide
example : shipOwnershipTransferProvisionalRate.den = 1000 := by decide
example : 0 < shipOwnershipTransferProvisionalRate.den := by decide

-- 定額
example : shipMortgageRankChangeFeePerCase = 1_000 := by decide
example : shipMortgageRankChangeFeePerCase > 0 := by decide
example : shipLeaseholdPriorityConsentFeePerCase = 1_000 := by decide
example : shipLeaseholdPriorityConsentFeePerCase > 0 := by decide
example : shipOtherProvisionalFeePerVessel = 2_000 := by decide
example : shipOtherProvisionalFeePerVessel > 0 := by decide
example : shipSupplementaryRegistrationFeePerVessel = 1_000 := by decide
example : shipSupplementaryRegistrationFeePerVessel > 0 := by decide
example : shipCancellationFeePerVessel = 1_000 := by decide
example : shipCancellationFeePerVessel > 0 := by decide

-- （一）4/1000
example : shipOwnershipPreservationFee 0 = 0 := by decide
example : shipOwnershipPreservationFee 249 = 0 := by decide
example : shipOwnershipPreservationFee 250 = 1 := by decide
example : shipOwnershipPreservationFee 999 = 3 := by decide
example : shipOwnershipPreservationFee 1000 = 4 := by decide
example : shipOwnershipPreservationFee 12_345 = 49 := by decide
example : shipOwnershipPreservationFee 1_000_000 = 4_000 := by decide

-- （二）イ 4/1000
example : shipOwnershipTransferInheritanceOrMergerFee 0 = 0 := by decide
example : shipOwnershipTransferInheritanceOrMergerFee 999 = 3 := by decide
example : shipOwnershipTransferInheritanceOrMergerFee 1000 = 4 := by decide
example : shipOwnershipTransferInheritanceOrMergerFee 12_345 = 49 := by decide

-- （二）ロ 20/1000
example : shipOwnershipTransferGratuitousFee 0 = 0 := by decide
example : shipOwnershipTransferGratuitousFee 999 = 19 := by decide
example : shipOwnershipTransferGratuitousFee 1000 = 20 := by decide
example : shipOwnershipTransferGratuitousFee 12_345 = 246 := by decide
example : shipOwnershipTransferGratuitousFee 1_000_000 = 20_000 := by decide

-- （二）ハ 28/1000
example : shipOwnershipTransferOtherFee 0 = 0 := by decide
example : shipOwnershipTransferOtherFee 999 = 27 := by decide
example : shipOwnershipTransferOtherFee 1000 = 28 := by decide
example : shipOwnershipTransferOtherFee 12_345 = 345 := by decide
example : shipOwnershipTransferOtherFee 1_000_000 = 28_000 := by decide

-- （三）4/1000
example : shipAbandonmentFee 0 = 0 := by decide
example : shipAbandonmentFee 999 = 3 := by decide
example : shipAbandonmentFee 1000 = 4 := by decide
example : shipAbandonmentFee 12_345 = 49 := by decide

-- （四）15/10000（千分の一・五）: 666→0, 667→1, 1000→1, 1_000_000→1500
example : shipLeaseholdFee 0 = 0 := by decide
example : shipLeaseholdFee 666 = 0 := by decide
example : shipLeaseholdFee 667 = 1 := by decide
example : shipLeaseholdFee 1000 = 1 := by decide
example : shipLeaseholdFee 12_345 = 18 := by decide
example : shipLeaseholdFee 1_000_000 = 1_500 := by decide

-- （五）4/1000
example : shipMortgageSecurityFee 0 = 0 := by decide
example : shipMortgageSecurityFee 999 = 3 := by decide
example : shipMortgageSecurityFee 1000 = 4 := by decide
example : shipMortgageSecurityFee 12_345 = 49 := by decide

-- （六）イ 1/1000
example : shipMortgageTransferInheritanceOrMergerFee 0 = 0 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 999 = 0 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 1000 = 1 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 12_345 = 12 := by decide
example : shipMortgageTransferInheritanceOrMergerFee 1_000_000 = 1_000 := by decide

-- （六）ロ 2/1000
example : shipMortgageTransferOtherFee 0 = 0 := by decide
example : shipMortgageTransferOtherFee 999 = 1 := by decide
example : shipMortgageTransferOtherFee 1000 = 2 := by decide
example : shipMortgageTransferOtherFee 12_345 = 24 := by decide
example : shipMortgageTransferOtherFee 1_000_000 = 2_000 := by decide

-- （七）2/1000
example : shipSweepMortgagePartialTransferOrDivisionFee 0 = 0 := by decide
example : shipSweepMortgagePartialTransferOrDivisionFee 999 = 1 := by decide
example : shipSweepMortgagePartialTransferOrDivisionFee 1000 = 2 := by decide
example : shipSweepMortgagePartialTransferOrDivisionFee 12_345 = 24 := by decide
example : shipSweepMortgagePartialTransferOrDivisionFee 1_000_000 = 2_000 := by decide

-- （十）イ 4/1000
example : shipOwnershipTrustFee 0 = 0 := by decide
example : shipOwnershipTrustFee 999 = 3 := by decide
example : shipOwnershipTrustFee 1000 = 4 := by decide
example : shipOwnershipTrustFee 12_345 = 49 := by decide

-- （十）ロ 2/1000
example : shipMortgageTrustFee 0 = 0 := by decide
example : shipMortgageTrustFee 999 = 1 := by decide
example : shipMortgageTrustFee 1000 = 2 := by decide
example : shipMortgageTrustFee 12_345 = 24 := by decide

-- （十）ハ 15/10000
example : shipOtherRightTrustFee 0 = 0 := by decide
example : shipOtherRightTrustFee 666 = 0 := by decide
example : shipOtherRightTrustFee 667 = 1 := by decide
example : shipOtherRightTrustFee 1000 = 1 := by decide
example : shipOtherRightTrustFee 12_345 = 18 := by decide
example : shipOtherRightTrustFee 1_000_000 = 1_500 := by decide

-- （十一）イ 4/1000
example : shipOwnershipTransferProvisionalFee 0 = 0 := by decide
example : shipOwnershipTransferProvisionalFee 999 = 3 := by decide
example : shipOwnershipTransferProvisionalFee 1000 = 4 := by decide
example : shipOwnershipTransferProvisionalFee 12_345 = 49 := by decide

end JapanTaxLaw.RegistryShipFees
