import JapanTaxLaw.RegistryForeignCompanyFees

/-!
# RegistryForeignCompanyFeesTests — 別表第一（二）二十二〜二十五の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準 (債権金額等), 件数, 箇所数, 区域数 are caller-established; no Bool enters
any formula. Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every rate literal, every flat amount and several base
amounts (incl. floor boundaries) independently of the main module's own smoke.
-/

namespace JapanTaxLaw.RegistryForeignCompanyFees

open JapanTaxLaw.TaxFinance

-- 税率定数: 分子・分母・well-definedness（2 件）
example : fishingRightLienPreservationRate.num = 4 := by decide
example : fishingRightLienPreservationRate.den = 1000 := by decide
example : 0 < fishingRightLienPreservationRate.den := by decide
example : fishingRightLienTrustRate.num = 2 := by decide
example : fishingRightLienTrustRate.den = 1000 := by decide
example : 0 < fishingRightLienTrustRate.den := by decide

-- 定額: 金額・正性（42 件）
example : miningAreaChangeRegistrationFeePerArea = 1000 := by decide
example : miningAreaChangeRegistrationFeePerArea > 0 := by decide
example : miningAreaCancellationFeePerArea = 1000 := by decide
example : miningAreaCancellationFeePerArea > 0 := by decide
example : fishingRightTransferByInheritanceOrMergerFeePerCase = 1800 := by decide
example : fishingRightTransferByInheritanceOrMergerFeePerCase > 0 := by decide
example : fishingRightTransferOtherFeePerCase = 9000 := by decide
example : fishingRightTransferOtherFeePerCase > 0 := by decide
example : fishingRightShareTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : fishingRightShareTransferByInheritanceOrMergerFeePerCase > 0 := by decide
example : fishingRightShareTransferOtherFeePerCase = 3000 := by decide
example : fishingRightShareTransferOtherFeePerCase > 0 := by decide
example : anglingRightEstablishmentFeePerCase = 6000 := by decide
example : anglingRightEstablishmentFeePerCase > 0 := by decide
example : anglingRightPreservationFeePerCase = 1500 := by decide
example : anglingRightPreservationFeePerCase > 0 := by decide
example : anglingRightTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : anglingRightTransferByInheritanceOrMergerFeePerCase > 0 := by decide
example : anglingRightTransferOtherFeePerCase = 4500 := by decide
example : anglingRightTransferOtherFeePerCase > 0 := by decide
example : anglingRightShareTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : anglingRightShareTransferByInheritanceOrMergerFeePerCase > 0 := by decide
example : anglingRightShareTransferOtherFeePerCase = 3000 := by decide
example : anglingRightShareTransferOtherFeePerCase > 0 := by decide
example : lienOrMortgageTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : lienOrMortgageTransferByInheritanceOrMergerFeePerCase > 0 := by decide
example : lienOrMortgageTransferOtherFeePerCase = 3000 := by decide
example : lienOrMortgageTransferOtherFeePerCase > 0 := by decide
example : mortgageRankChangeFeePerCase = 1000 := by decide
example : mortgageRankChangeFeePerCase > 0 := by decide
example : nonLienOrMortgageRightTrustFeePerCase = 4500 := by decide
example : nonLienOrMortgageRightTrustFeePerCase > 0 := by decide
example : fishingIncidentalOrRestorationOrCorrectionFeePerCase = 1000 := by decide
example : fishingIncidentalOrRestorationOrCorrectionFeePerCase > 0 := by decide
example : fishingRightCancellationFeePerCase = 1000 := by decide
example : fishingRightCancellationFeePerCase > 0 := by decide
example : mutualCompanyEstablishmentFeePerApplication = 300000 := by decide
example : mutualCompanyEstablishmentFeePerApplication > 0 := by decide
example : newShareOptionIssuanceChangeFeePerApplication = 90000 := by decide
example : newShareOptionIssuanceChangeFeePerApplication > 0 := by decide
example : branchOrSubsidiaryOfficeEstablishmentFeePerOffice = 60000 := by decide
example : branchOrSubsidiaryOfficeEstablishmentFeePerOffice > 0 := by decide
example : headOrBranchOfficeRelocationFeePerOffice = 30000 := by decide
example : headOrBranchOfficeRelocationFeePerOffice > 0 := by decide
example : boardAndCommitteeMatterChangeFeePerApplication = 30000 := by decide
example : boardAndCommitteeMatterChangeFeePerApplication > 0 := by decide
example : directorAndOfficerMatterChangeFeePerApplication = 30000 := by decide
example : directorAndOfficerMatterChangeFeePerApplication > 0 := by decide
example : directorAndOfficerMatterChangeSmallCapitalFeePerApplication = 10000 := by decide
example : directorAndOfficerMatterChangeSmallCapitalFeePerApplication > 0 := by decide
example : managerAppointmentOrAgencyRevocationFeePerApplication = 30000 := by decide
example : managerAppointmentOrAgencyRevocationFeePerApplication > 0 := by decide
example : directorDutySuspensionOrSubstituteAppointmentFeePerApplication = 30000 := by decide
example : directorDutySuspensionOrSubstituteAppointmentFeePerApplication > 0 := by decide
example : companyDissolutionFeePerApplication = 30000 := by decide
example : companyDissolutionFeePerApplication > 0 := by decide
example : companyContinuationOrRestorationFeePerApplication = 30000 := by decide
example : companyContinuationOrRestorationFeePerApplication > 0 := by decide
example : companyMiscRegistrationChangeFeePerApplication = 30000 := by decide
example : companyMiscRegistrationChangeFeePerApplication > 0 := by decide
example : companyCorrectionFeePerApplication = 20000 := by decide
example : companyCorrectionFeePerApplication > 0 := by decide
example : companyCancellationFeePerApplication = 20000 := by decide
example : companyCancellationFeePerApplication > 0 := by decide
example : foreignCompanyBusinessOfficeEstablishmentFeePerOffice = 90000 := by decide
example : foreignCompanyBusinessOfficeEstablishmentFeePerOffice > 0 := by decide
example : foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication = 60000 := by decide
example : foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication > 0 := by decide
example : foreignCompanyOtherRegistrationFeePerApplication = 9000 := by decide
example : foreignCompanyOtherRegistrationFeePerApplication > 0 := by decide
example : foreignCompanyCorrectionOrCancellationFeePerApplication = 6000 := by decide
example : foreignCompanyCorrectionOrCancellationFeePerApplication > 0 := by decide
example : foreignCompanyLiquidatorAppointmentFeePerApplication = 9000 := by decide
example : foreignCompanyLiquidatorAppointmentFeePerApplication > 0 := by decide
example : foreignCompanyLiquidatorDutySuspensionFeePerApplication = 6000 := by decide
example : foreignCompanyLiquidatorDutySuspensionFeePerApplication > 0 := by decide
example : foreignCompanyLiquidationCompletionFeePerApplication = 2000 := by decide
example : foreignCompanyLiquidationCompletionFeePerApplication > 0 := by decide
example : foreignCompanyLiquidationMiscFeePerApplication = 6000 := by decide
example : foreignCompanyLiquidationMiscFeePerApplication > 0 := by decide
example : specialPurposeCompanyEstablishmentFeePerApplication = 30000 := by decide
example : specialPurposeCompanyEstablishmentFeePerApplication > 0 := by decide
example : specialPurposeCompanyOtherRegistrationFeePerApplication = 15000 := by decide
example : specialPurposeCompanyOtherRegistrationFeePerApplication > 0 := by decide

-- 割合型: 0 → 0, 1000 → 分子の値（2 件）
example : fishingRightLienPreservationFee 0 = 0 := by decide
example : fishingRightLienPreservationFee 1000 = 4 := by decide
example : fishingRightLienTrustFee 0 = 0 := by decide
example : fishingRightLienTrustFee 1000 = 2 := by decide

-- 端数境界（代表例）:
--   4/1000: 249→0, 250→1, 999→3, 1001→4, 12345→49, 1000000→4000
--   2/1000: 499→0, 500→1, 999→1, 1001→2, 12345→24, 1000000→2000
example : fishingRightLienPreservationFee 249 = 0 := by decide
example : fishingRightLienPreservationFee 250 = 1 := by decide
example : fishingRightLienPreservationFee 999 = 3 := by decide
example : fishingRightLienPreservationFee 1001 = 4 := by decide
example : fishingRightLienPreservationFee 12345 = 49 := by decide
example : fishingRightLienPreservationFee 1000000 = 4000 := by decide
example : fishingRightLienTrustFee 499 = 0 := by decide
example : fishingRightLienTrustFee 500 = 1 := by decide
example : fishingRightLienTrustFee 999 = 1 := by decide
example : fishingRightLienTrustFee 1001 = 2 := by decide
example : fishingRightLienTrustFee 12345 = 24 := by decide
example : fishingRightLienTrustFee 1000000 = 2000 := by decide

-- 二十五（三） 特定目的会社の登記の抹消 ¥10,000
example : specialPurposeCompanyCancellationFeePerApplication = 10000 := by decide

end JapanTaxLaw.RegistryForeignCompanyFees
