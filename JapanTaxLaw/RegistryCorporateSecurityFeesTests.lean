import JapanTaxLaw.RegistryCorporateSecurityFees

/-!
# RegistryCorporateSecurityFeesTests — 別表第一（二）六〜六の二・七〜九の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準 (債権金額等) and 件数/個数/両数 are caller-established; no Bool enters
any formula. Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every rate literal, every flat amount and several base
amounts (incl. floor boundaries) independently of the main module's own smoke.
-/

namespace JapanTaxLaw.RegistryCorporateSecurityFees

open JapanTaxLaw.TaxFinance

-- 税率定数: 分子・分母・well-definedness（19 件）
example : corporateSecurityEstablishmentRate.num = 25 := by decide
example : corporateSecurityEstablishmentRate.den = 10000 := by decide
example : 0 < corporateSecurityEstablishmentRate.den := by decide
example : corporateSecurityTransferRate.num = 15 := by decide
example : corporateSecurityTransferRate.den = 10000 := by decide
example : 0 < corporateSecurityTransferRate.den := by decide
example : corporateSecurityTrustRate.num = 15 := by decide
example : corporateSecurityTrustRate.den = 10000 := by decide
example : 0 < corporateSecurityTrustRate.den := by decide
example : railwayFoundationMortgageEstablishmentRate.num = 25 := by decide
example : railwayFoundationMortgageEstablishmentRate.den = 10000 := by decide
example : 0 < railwayFoundationMortgageEstablishmentRate.den := by decide
example : railwayFoundationMortgageTransferRate.num = 15 := by decide
example : railwayFoundationMortgageTransferRate.den = 10000 := by decide
example : 0 < railwayFoundationMortgageTransferRate.den := by decide
example : railwayFoundationRootMortgagePartialTransferRate.num = 15 := by decide
example : railwayFoundationRootMortgagePartialTransferRate.den = 10000 := by decide
example : 0 < railwayFoundationRootMortgagePartialTransferRate.den := by decide
example : railwayFoundationTrustRate.num = 15 := by decide
example : railwayFoundationTrustRate.den = 10000 := by decide
example : 0 < railwayFoundationTrustRate.den := by decide
example : agriculturalMovableMortgageEstablishmentRate.num = 3 := by decide
example : agriculturalMovableMortgageEstablishmentRate.den = 1000 := by decide
example : 0 < agriculturalMovableMortgageEstablishmentRate.den := by decide
example : agriculturalMovableMortgageTransferRate.num = 15 := by decide
example : agriculturalMovableMortgageTransferRate.den = 10000 := by decide
example : 0 < agriculturalMovableMortgageTransferRate.den := by decide
example : agriculturalMovableRootMortgagePartialTransferRate.num = 15 := by decide
example : agriculturalMovableRootMortgagePartialTransferRate.den = 10000 := by decide
example : 0 < agriculturalMovableRootMortgagePartialTransferRate.den := by decide
example : agriculturalMovableMortgageTrustRate.num = 15 := by decide
example : agriculturalMovableMortgageTrustRate.den = 10000 := by decide
example : 0 < agriculturalMovableMortgageTrustRate.den := by decide
example : constructionMachineryMortgageEstablishmentRate.num = 3 := by decide
example : constructionMachineryMortgageEstablishmentRate.den = 1000 := by decide
example : 0 < constructionMachineryMortgageEstablishmentRate.den := by decide
example : constructionMachineryMortgageTransferRate.num = 15 := by decide
example : constructionMachineryMortgageTransferRate.den = 10000 := by decide
example : 0 < constructionMachineryMortgageTransferRate.den := by decide
example : constructionMachineryRootMortgagePartialTransferRate.num = 15 := by decide
example : constructionMachineryRootMortgagePartialTransferRate.den = 10000 := by decide
example : 0 < constructionMachineryRootMortgagePartialTransferRate.den := by decide
example : constructionMachineryMortgageTrustRate.num = 15 := by decide
example : constructionMachineryMortgageTrustRate.den = 10000 := by decide
example : 0 < constructionMachineryMortgageTrustRate.den := by decide
example : automobileMortgageEstablishmentRate.num = 3 := by decide
example : automobileMortgageEstablishmentRate.den = 1000 := by decide
example : 0 < automobileMortgageEstablishmentRate.den := by decide
example : automobileMortgageTransferRate.num = 15 := by decide
example : automobileMortgageTransferRate.den = 10000 := by decide
example : 0 < automobileMortgageTransferRate.den := by decide
example : automobileRootMortgagePartialTransferRate.num = 15 := by decide
example : automobileRootMortgagePartialTransferRate.den = 10000 := by decide
example : 0 < automobileRootMortgagePartialTransferRate.den := by decide
example : automobileMortgageTrustRate.num = 15 := by decide
example : automobileMortgageTrustRate.den = 10000 := by decide
example : 0 < automobileMortgageTrustRate.den := by decide

-- 定額: 金額・正性（24 件）
example : corporateSecurityRankChangeFeePerCase = 6000 := by decide
example : corporateSecurityRankChangeFeePerCase > 0 := by decide
example : corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication = 6000 := by decide
example : corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication > 0 := by decide
example : corporateSecurityCancellationFeePerApplication = 6000 := by decide
example : corporateSecurityCancellationFeePerApplication > 0 := by decide
example : enterpriseValueSecurityEstablishmentFeePerCase = 30000 := by decide
example : enterpriseValueSecurityEstablishmentFeePerCase > 0 := by decide
example : enterpriseValueSecurityTransferFeePerCase = 6000 := by decide
example : enterpriseValueSecurityTransferFeePerCase > 0 := by decide
example : enterpriseValueSecurityRankChangeFeePerCase = 6000 := by decide
example : enterpriseValueSecurityRankChangeFeePerCase > 0 := by decide
example : enterpriseValueSecurityTrustFeePerCase = 6000 := by decide
example : enterpriseValueSecurityTrustFeePerCase > 0 := by decide
example : enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication = 6000 := by decide
example : enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication > 0 := by decide
example : enterpriseValueSecurityCancellationFeePerApplication = 6000 := by decide
example : enterpriseValueSecurityCancellationFeePerApplication > 0 := by decide
example : railwayFoundationMortgageRankChangeFeePerCase = 6000 := by decide
example : railwayFoundationMortgageRankChangeFeePerCase > 0 := by decide
example : railwayFoundationIncidentalOrCorrectionFeePerFoundation = 6000 := by decide
example : railwayFoundationIncidentalOrCorrectionFeePerFoundation > 0 := by decide
example : railwayFoundationCancellationFeePerFoundation = 6000 := by decide
example : railwayFoundationCancellationFeePerFoundation > 0 := by decide
example : agriculturalMovableMortgageRankChangeFeePerCase = 1000 := by decide
example : agriculturalMovableMortgageRankChangeFeePerCase > 0 := by decide
example : agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication = 1000 := by decide
example : agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication > 0 := by decide
example : agriculturalMovableCancellationFeePerApplication = 1000 := by decide
example : agriculturalMovableCancellationFeePerApplication > 0 := by decide
example : constructionMachineryMortgageRankChangeFeePerCase = 1000 := by decide
example : constructionMachineryMortgageRankChangeFeePerCase > 0 := by decide
example : constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit = 1000 := by decide
example : constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit > 0 := by decide
example : constructionMachineryCancellationFeePerUnit = 1000 := by decide
example : constructionMachineryCancellationFeePerUnit > 0 := by decide
example : automobileRestorationOrCorrectionFeePerVehicle = 1000 := by decide
example : automobileRestorationOrCorrectionFeePerVehicle > 0 := by decide
example : automobileCancellationFeePerVehicle = 1000 := by decide
example : automobileCancellationFeePerVehicle > 0 := by decide
example : movableTransferFeePerApplication = 15000 := by decide
example : movableTransferFeePerApplication > 0 := by decide
example : claimTransferOrPledgeEstablishmentFeePerApplication = 15000 := by decide
example : claimTransferOrPledgeEstablishmentFeePerApplication > 0 := by decide
example : termExtensionFeePerApplication = 7500 := by decide
example : termExtensionFeePerApplication > 0 := by decide
example : movableOrClaimRegistrationCancellationFeePerApplication = 1000 := by decide
example : movableOrClaimRegistrationCancellationFeePerApplication > 0 := by decide

-- 割合型: 0 → 0, 1000 → 分子の値（19 件）
example : corporateSecurityEstablishmentFee 0 = 0 := by decide
example : corporateSecurityEstablishmentFee 1000 = 2 := by decide
example : corporateSecurityTransferFee 0 = 0 := by decide
example : corporateSecurityTransferFee 1000 = 1 := by decide
example : corporateSecurityTrustFee 0 = 0 := by decide
example : corporateSecurityTrustFee 1000 = 1 := by decide
example : railwayFoundationMortgageEstablishmentFee 0 = 0 := by decide
example : railwayFoundationMortgageEstablishmentFee 1000 = 2 := by decide
example : railwayFoundationMortgageTransferFee 0 = 0 := by decide
example : railwayFoundationMortgageTransferFee 1000 = 1 := by decide
example : railwayFoundationRootMortgagePartialTransferFee 0 = 0 := by decide
example : railwayFoundationRootMortgagePartialTransferFee 1000 = 1 := by decide
example : railwayFoundationTrustFee 0 = 0 := by decide
example : railwayFoundationTrustFee 1000 = 1 := by decide
example : agriculturalMovableMortgageEstablishmentFee 0 = 0 := by decide
example : agriculturalMovableMortgageEstablishmentFee 1000 = 3 := by decide
example : agriculturalMovableMortgageTransferFee 0 = 0 := by decide
example : agriculturalMovableMortgageTransferFee 1000 = 1 := by decide
example : agriculturalMovableRootMortgagePartialTransferFee 0 = 0 := by decide
example : agriculturalMovableRootMortgagePartialTransferFee 1000 = 1 := by decide
example : agriculturalMovableMortgageTrustFee 0 = 0 := by decide
example : agriculturalMovableMortgageTrustFee 1000 = 1 := by decide
example : constructionMachineryMortgageEstablishmentFee 0 = 0 := by decide
example : constructionMachineryMortgageEstablishmentFee 1000 = 3 := by decide
example : constructionMachineryMortgageTransferFee 0 = 0 := by decide
example : constructionMachineryMortgageTransferFee 1000 = 1 := by decide
example : constructionMachineryRootMortgagePartialTransferFee 0 = 0 := by decide
example : constructionMachineryRootMortgagePartialTransferFee 1000 = 1 := by decide
example : constructionMachineryMortgageTrustFee 0 = 0 := by decide
example : constructionMachineryMortgageTrustFee 1000 = 1 := by decide
example : automobileMortgageEstablishmentFee 0 = 0 := by decide
example : automobileMortgageEstablishmentFee 1000 = 3 := by decide
example : automobileMortgageTransferFee 0 = 0 := by decide
example : automobileMortgageTransferFee 1000 = 1 := by decide
example : automobileRootMortgagePartialTransferFee 0 = 0 := by decide
example : automobileRootMortgagePartialTransferFee 1000 = 1 := by decide
example : automobileMortgageTrustFee 0 = 0 := by decide
example : automobileMortgageTrustFee 1000 = 1 := by decide

-- 端数境界（代表例）:
--   25/1000: 40→1, 999→24, 1001→25, 12345→308, 1000000→25000
--   15/1000: 67→1, 999→14, 1001→15, 12345→185, 1000000→15000
--    3/1000: 334→1, 999→2, 1001→3, 12345→37, 1000000→3000
example : corporateSecurityEstablishmentFee 40 = 0 := by decide
example : corporateSecurityEstablishmentFee 999 = 2 := by decide
example : corporateSecurityEstablishmentFee 1001 = 2 := by decide
example : corporateSecurityEstablishmentFee 12345 = 30 := by decide
example : corporateSecurityEstablishmentFee 1000000 = 2500 := by decide
example : corporateSecurityTransferFee 67 = 0 := by decide
example : corporateSecurityTransferFee 999 = 1 := by decide
example : corporateSecurityTransferFee 1001 = 1 := by decide
example : corporateSecurityTransferFee 12345 = 18 := by decide
example : corporateSecurityTransferFee 1000000 = 1500 := by decide
example : agriculturalMovableMortgageEstablishmentFee 334 = 1 := by decide
example : agriculturalMovableMortgageEstablishmentFee 999 = 2 := by decide
example : agriculturalMovableMortgageEstablishmentFee 1001 = 3 := by decide
example : agriculturalMovableMortgageEstablishmentFee 12345 = 37 := by decide
example : agriculturalMovableMortgageEstablishmentFee 1000000 = 3000 := by decide

end JapanTaxLaw.RegistryCorporateSecurityFees
