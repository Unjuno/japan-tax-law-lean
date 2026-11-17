import JapanTaxLaw.RegistryCopyrightFees

/-!
# RegistryCopyrightFeesTests — 別表第一（二）著作権・出版権・著作隣接権の smoke checks

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準 (債権金額) and 件数/個数 are caller-established; no Bool enters
any formula. Rounding is floor (切り捨て) via TaxRate.applyFloor.
This module re-checks every rate literal, every flat amount and several base
amounts (incl. floor boundaries) independently of the main module's own smoke.
-/


namespace JapanTaxLaw.RegistryCopyrightFees

open JapanTaxLaw.TaxFinance

-- 税率定数: 分子・分母・well-definedness
example : copyrightPledgeEstablishmentRate.num = 4 := by decide
example : copyrightPledgeEstablishmentRate.den = 1000 := by decide
example : 0 < copyrightPledgeEstablishmentRate.den := by decide
example : copyrightPledgeTrustRate.num = 2 := by decide
example : copyrightPledgeTrustRate.den = 1000 := by decide
example : 0 < copyrightPledgeTrustRate.den := by decide
example : publishingRightPledgeEstablishmentRate.num = 4 := by decide
example : publishingRightPledgeEstablishmentRate.den = 1000 := by decide
example : 0 < publishingRightPledgeEstablishmentRate.den := by decide
example : publishingRightPledgeTrustRate.num = 2 := by decide
example : publishingRightPledgeTrustRate.den = 1000 := by decide
example : 0 < publishingRightPledgeTrustRate.den := by decide
example : relatedRightPledgeEstablishmentRate.num = 4 := by decide
example : relatedRightPledgeEstablishmentRate.den = 1000 := by decide
example : 0 < relatedRightPledgeEstablishmentRate.den := by decide
example : relatedRightPledgeTrustRate.num = 2 := by decide
example : relatedRightPledgeTrustRate.den = 1000 := by decide
example : 0 < relatedRightPledgeTrustRate.den := by decide

-- 定額: 金額・正性（24 件）
example : copyrightTransferInheritanceOrMergerFee = 3_000 := by decide
example : copyrightTransferInheritanceOrMergerFee > 0 := by decide
example : copyrightTransferOtherFee = 18_000 := by decide
example : copyrightTransferOtherFee > 0 := by decide
example : copyrightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : copyrightPledgeTransferInheritanceOrMergerFee > 0 := by decide
example : copyrightPledgeTransferOtherFee = 3_000 := by decide
example : copyrightPledgeTransferOtherFee > 0 := by decide
example : copyrightRealNameRegistrationFee = 9_000 := by decide
example : copyrightRealNameRegistrationFee > 0 := by decide
example : copyrightTrustOtherRightFee = 3_000 := by decide
example : copyrightTrustOtherRightFee > 0 := by decide
example : copyrightFirstPublicationDateRegistrationFee = 3_000 := by decide
example : copyrightFirstPublicationDateRegistrationFee > 0 := by decide
example : copyrightRestorationOrCorrectionFee = 1_000 := by decide
example : copyrightRestorationOrCorrectionFee > 0 := by decide
example : copyrightCancellationFee = 1_000 := by decide
example : copyrightCancellationFee > 0 := by decide
example : publishingRightEstablishmentFee = 30_000 := by decide
example : publishingRightEstablishmentFee > 0 := by decide
example : publishingRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : publishingRightTransferInheritanceOrMergerFee > 0 := by decide
example : publishingRightTransferOtherFee = 18_000 := by decide
example : publishingRightTransferOtherFee > 0 := by decide
example : publishingRightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : publishingRightPledgeTransferInheritanceOrMergerFee > 0 := by decide
example : publishingRightPledgeTransferOtherFee = 3_000 := by decide
example : publishingRightPledgeTransferOtherFee > 0 := by decide
example : publishingRightTrustOtherRightFee = 3_000 := by decide
example : publishingRightTrustOtherRightFee > 0 := by decide
example : publishingRightRestorationOrCorrectionFee = 1_000 := by decide
example : publishingRightRestorationOrCorrectionFee > 0 := by decide
example : publishingRightCancellationFee = 1_000 := by decide
example : publishingRightCancellationFee > 0 := by decide
example : relatedRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : relatedRightTransferInheritanceOrMergerFee > 0 := by decide
example : relatedRightTransferOtherFee = 9_000 := by decide
example : relatedRightTransferOtherFee > 0 := by decide
example : relatedRightPledgeTransferInheritanceOrMergerFee = 1_500 := by decide
example : relatedRightPledgeTransferInheritanceOrMergerFee > 0 := by decide
example : relatedRightPledgeTransferOtherFee = 3_000 := by decide
example : relatedRightPledgeTransferOtherFee > 0 := by decide
example : relatedRightTrustOtherRightFee = 3_000 := by decide
example : relatedRightTrustOtherRightFee > 0 := by decide
example : relatedRightRestorationOrCorrectionFee = 1_000 := by decide
example : relatedRightRestorationOrCorrectionFee > 0 := by decide
example : relatedRightCancellationFee = 1_000 := by decide
example : relatedRightCancellationFee > 0 := by decide

-- 割合型 4/1000: 境界 249→0, 250→1, 999→3, 1000→4, 1001→4, 12345→49
example : copyrightPledgeEstablishmentFee 0 = 0 := by decide
example : copyrightPledgeEstablishmentFee 249 = 0 := by decide
example : copyrightPledgeEstablishmentFee 250 = 1 := by decide
example : copyrightPledgeEstablishmentFee 999 = 3 := by decide
example : copyrightPledgeEstablishmentFee 1000 = 4 := by decide
example : copyrightPledgeEstablishmentFee 1001 = 4 := by decide
example : copyrightPledgeEstablishmentFee 12_345 = 49 := by decide
example : copyrightPledgeEstablishmentFee 1_000_000 = 4_000 := by decide
example : publishingRightPledgeEstablishmentFee 0 = 0 := by decide
example : publishingRightPledgeEstablishmentFee 249 = 0 := by decide
example : publishingRightPledgeEstablishmentFee 999 = 3 := by decide
example : publishingRightPledgeEstablishmentFee 1000 = 4 := by decide
example : publishingRightPledgeEstablishmentFee 12_345 = 49 := by decide
example : publishingRightPledgeEstablishmentFee 1_000_000 = 4_000 := by decide
example : relatedRightPledgeEstablishmentFee 0 = 0 := by decide
example : relatedRightPledgeEstablishmentFee 249 = 0 := by decide
example : relatedRightPledgeEstablishmentFee 999 = 3 := by decide
example : relatedRightPledgeEstablishmentFee 1000 = 4 := by decide
example : relatedRightPledgeEstablishmentFee 12_345 = 49 := by decide
example : relatedRightPledgeEstablishmentFee 1_000_000 = 4_000 := by decide

-- 割合型 2/1000: 境界 499→0, 500→1, 999→1, 1000→2, 1001→2, 12345→24
example : copyrightPledgeTrustFee 0 = 0 := by decide
example : copyrightPledgeTrustFee 499 = 0 := by decide
example : copyrightPledgeTrustFee 500 = 1 := by decide
example : copyrightPledgeTrustFee 999 = 1 := by decide
example : copyrightPledgeTrustFee 1000 = 2 := by decide
example : copyrightPledgeTrustFee 1001 = 2 := by decide
example : copyrightPledgeTrustFee 12_345 = 24 := by decide
example : copyrightPledgeTrustFee 1_000_000 = 2_000 := by decide
example : publishingRightPledgeTrustFee 0 = 0 := by decide
example : publishingRightPledgeTrustFee 499 = 0 := by decide
example : publishingRightPledgeTrustFee 999 = 1 := by decide
example : publishingRightPledgeTrustFee 1000 = 2 := by decide
example : publishingRightPledgeTrustFee 12_345 = 24 := by decide
example : publishingRightPledgeTrustFee 1_000_000 = 2_000 := by decide
example : relatedRightPledgeTrustFee 0 = 0 := by decide
example : relatedRightPledgeTrustFee 499 = 0 := by decide
example : relatedRightPledgeTrustFee 999 = 1 := by decide
example : relatedRightPledgeTrustFee 1000 = 2 := by decide
example : relatedRightPledgeTrustFee 12_345 = 24 := by decide
example : relatedRightPledgeTrustFee 1_000_000 = 2_000 := by decide

end JapanTaxLaw.RegistryCopyrightFees
