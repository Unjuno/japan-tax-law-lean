import JapanTaxLaw.RegistryRealEstateFeesP1A

/-!
# RegistryRealEstateFeesP1ATests — 別表第一（一）区分（一）〜（五）の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準額 (`base`) is caller-established; no Bool enters any formula.
Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every rate literal, the flat amount and several base
amounts (incl. floor boundaries) independently of the main module's own smoke.
-/

namespace JapanTaxLaw.RegistryRealEstateFeesP1A

open JapanTaxLaw.TaxFinance

-- 税率定数: 分子・分母・well-definedness
example : ownershipPreservationRate.num = 4 := by decide
example : ownershipPreservationRate.den = 1000 := by decide
example : 0 < ownershipPreservationRate.den := by decide
example : ownershipTransferInheritanceOrMergerRate.num = 4 := by decide
example : ownershipTransferInheritanceOrMergerRate.den = 1000 := by decide
example : 0 < ownershipTransferInheritanceOrMergerRate.den := by decide
example : ownershipTransferCoOwnershipDivisionRate.num = 4 := by decide
example : ownershipTransferCoOwnershipDivisionRate.den = 1000 := by decide
example : 0 < ownershipTransferCoOwnershipDivisionRate.den := by decide
example : ownershipTransferOtherRate.num = 20 := by decide
example : ownershipTransferOtherRate.den = 1000 := by decide
example : 0 < ownershipTransferOtherRate.den := by decide
example : restrictedRealRightEstablishmentOrSubleaseRate.num = 10 := by decide
example : restrictedRealRightEstablishmentOrSubleaseRate.den = 1000 := by decide
example : 0 < restrictedRealRightEstablishmentOrSubleaseRate.den := by decide
example : restrictedRealRightInheritanceOrMergerRate.num = 2 := by decide
example : restrictedRealRightInheritanceOrMergerRate.den = 1000 := by decide
example : 0 < restrictedRealRightInheritanceOrMergerRate.den := by decide
example : restrictedRealRightCoOwnershipDivisionRate.num = 2 := by decide
example : restrictedRealRightCoOwnershipDivisionRate.den = 1000 := by decide
example : 0 < restrictedRealRightCoOwnershipDivisionRate.den := by decide
example : restrictedRealRightOtherRate.num = 10 := by decide
example : restrictedRealRightOtherRate.den = 1000 := by decide
example : 0 < restrictedRealRightOtherRate.den := by decide
example : spousalResidenceRightRate.num = 2 := by decide
example : spousalResidenceRightRate.den = 1000 := by decide
example : 0 < spousalResidenceRightRate.den := by decide
example : securityRegistrationRate.num = 4 := by decide
example : securityRegistrationRate.den = 1000 := by decide
example : 0 < securityRegistrationRate.den := by decide

-- 定額
example : easementEstablishmentFeePerParcel = 1_500 := by decide
example : easementEstablishmentFeePerParcel > 0 := by decide

-- （一）4/1000: 境界 249→0, 250→1, 999→3, 1000→4, 1001→4, 12345→49
example : ownershipPreservationFee 0 = 0 := by decide
example : ownershipPreservationFee 1 = 0 := by decide
example : ownershipPreservationFee 249 = 0 := by decide
example : ownershipPreservationFee 250 = 1 := by decide
example : ownershipPreservationFee 999 = 3 := by decide
example : ownershipPreservationFee 1000 = 4 := by decide
example : ownershipPreservationFee 1001 = 4 := by decide
example : ownershipPreservationFee 12_345 = 49 := by decide
example : ownershipPreservationFee 100_000 = 400 := by decide
example : ownershipPreservationFee 1_000_000 = 4_000 := by decide

-- （二）イ 4/1000
example : ownershipTransferInheritanceOrMergerFee 0 = 0 := by decide
example : ownershipTransferInheritanceOrMergerFee 999 = 3 := by decide
example : ownershipTransferInheritanceOrMergerFee 1000 = 4 := by decide
example : ownershipTransferInheritanceOrMergerFee 12_345 = 49 := by decide

-- （二）ロ 4/1000
example : ownershipTransferCoOwnershipDivisionFee 0 = 0 := by decide
example : ownershipTransferCoOwnershipDivisionFee 999 = 3 := by decide
example : ownershipTransferCoOwnershipDivisionFee 1000 = 4 := by decide
example : ownershipTransferCoOwnershipDivisionFee 12_345 = 49 := by decide

-- （二）ハ 20/1000: 999→19, 1000→20, 1001→20, 12345→246
example : ownershipTransferOtherFee 0 = 0 := by decide
example : ownershipTransferOtherFee 1 = 0 := by decide
example : ownershipTransferOtherFee 999 = 19 := by decide
example : ownershipTransferOtherFee 1000 = 20 := by decide
example : ownershipTransferOtherFee 1001 = 20 := by decide
example : ownershipTransferOtherFee 12_345 = 246 := by decide
example : ownershipTransferOtherFee 1_000_000 = 20_000 := by decide

-- （三）イ 10/1000: 999→9, 1000→10, 12345→123
example : restrictedRealRightEstablishmentOrSubleaseFee 0 = 0 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 999 = 9 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 1000 = 10 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 12_345 = 123 := by decide
example : restrictedRealRightEstablishmentOrSubleaseFee 1_000_000 = 10_000 := by decide

-- （三）ロ 2/1000: 999→1, 1000→2, 12345→24
example : restrictedRealRightInheritanceOrMergerFee 0 = 0 := by decide
example : restrictedRealRightInheritanceOrMergerFee 999 = 1 := by decide
example : restrictedRealRightInheritanceOrMergerFee 1000 = 2 := by decide
example : restrictedRealRightInheritanceOrMergerFee 12_345 = 24 := by decide
example : restrictedRealRightInheritanceOrMergerFee 1_000_000 = 2_000 := by decide

-- （三）ハ 2/1000
example : restrictedRealRightCoOwnershipDivisionFee 0 = 0 := by decide
example : restrictedRealRightCoOwnershipDivisionFee 999 = 1 := by decide
example : restrictedRealRightCoOwnershipDivisionFee 1000 = 2 := by decide
example : restrictedRealRightCoOwnershipDivisionFee 12_345 = 24 := by decide

-- （三）ニ 10/1000
example : restrictedRealRightOtherFee 0 = 0 := by decide
example : restrictedRealRightOtherFee 999 = 9 := by decide
example : restrictedRealRightOtherFee 1000 = 10 := by decide
example : restrictedRealRightOtherFee 12_345 = 123 := by decide

-- （三の二）2/1000
example : spousalResidenceRightFee 0 = 0 := by decide
example : spousalResidenceRightFee 999 = 1 := by decide
example : spousalResidenceRightFee 1000 = 2 := by decide
example : spousalResidenceRightFee 12_345 = 24 := by decide

-- （五）4/1000
example : securityRegistrationFee 0 = 0 := by decide
example : securityRegistrationFee 999 = 3 := by decide
example : securityRegistrationFee 1000 = 4 := by decide
example : securityRegistrationFee 12_345 = 49 := by decide
example : securityRegistrationFee 1_000_000 = 4_000 := by decide

end JapanTaxLaw.RegistryRealEstateFeesP1A
