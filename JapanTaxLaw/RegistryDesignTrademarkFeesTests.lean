import JapanTaxLaw.RegistryDesignTrademarkFees

/-!
# RegistryDesignTrademarkFeesTests — 別表第一（二）意匠権・商標権・回路配置利用権の退行テスト

Decidable kernel smoke tests, pinned to

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

Each `example` is closed by kernel `decide`; no theorem names are added.
The 課税標準額 (`base`) and the 件数 are caller-established; no Bool enters any
formula. Rounding is floor (切り捨て) via TaxRate.applyFloor. This module
re-checks every flat amount, every rate literal, every positivity fact and
several base amounts (incl. floor boundaries) independently of the main module.

育成者権 is absent from the pinned source slice and is NOT modeled.
-/

namespace JapanTaxLaw.RegistryDesignTrademarkFees

open JapanTaxLaw.TaxFinance

-- 定額: 原文どおりの額と正性
example : designTransferInheritanceOrMergerFee = 3_000 := by decide
example : designTransferInheritanceOrMergerFee > 0 := by decide
example : designTransferOtherFee = 9_000 := by decide
example : designTransferOtherFee > 0 := by decide
example : designExclusiveRightEstablishmentOrPreservationFee = 9_000 := by decide
example : designExclusiveRightEstablishmentOrPreservationFee > 0 := by decide
example : designExclusiveRightTransferInheritanceOrMergerFee = 1_500 := by decide
example : designExclusiveRightTransferInheritanceOrMergerFee > 0 := by decide
example : designExclusiveRightTransferOtherFee = 3_000 := by decide
example : designExclusiveRightTransferOtherFee > 0 := by decide
example : designTrustNonPledgeFee = 3_000 := by decide
example : designTrustNonPledgeFee > 0 := by decide
example : designUpdateRegistrationFee = 1_000 := by decide
example : designUpdateRegistrationFee > 0 := by decide
example : designCancellationFee = 1_000 := by decide
example : designCancellationFee > 0 := by decide

example : trademarkTransferInheritanceOrMergerFee = 3_000 := by decide
example : trademarkTransferInheritanceOrMergerFee > 0 := by decide
example : trademarkTransferOtherFee = 30_000 := by decide
example : trademarkTransferOtherFee > 0 := by decide
example : trademarkUseRightEstablishmentOrPreservationFee = 30_000 := by decide
example : trademarkUseRightEstablishmentOrPreservationFee > 0 := by decide
example : trademarkUseRightTransferInheritanceOrMergerFee = 3_000 := by decide
example : trademarkUseRightTransferInheritanceOrMergerFee > 0 := by decide
example : trademarkUseRightTransferOtherFee = 9_000 := by decide
example : trademarkUseRightTransferOtherFee > 0 := by decide
example : trademarkTrustNonPledgeFee = 9_000 := by decide
example : trademarkTrustNonPledgeFee > 0 := by decide
example : trademarkUpdateRegistrationFee = 1_000 := by decide
example : trademarkUpdateRegistrationFee > 0 := by decide
example : trademarkCancellationFee = 1_000 := by decide
example : trademarkCancellationFee > 0 := by decide

example : circuitEstablishmentFee = 18_000 := by decide
example : circuitEstablishmentFee > 0 := by decide
example : circuitTransferInheritanceOrMergerFee = 3_000 := by decide
example : circuitTransferInheritanceOrMergerFee > 0 := by decide
example : circuitTransferOtherFee = 9_000 := by decide
example : circuitTransferOtherFee > 0 := by decide
example : circuitUseRightEstablishmentFee = 9_000 := by decide
example : circuitUseRightEstablishmentFee > 0 := by decide
example : circuitUseRightTransferInheritanceOrMergerFee = 1_500 := by decide
example : circuitUseRightTransferInheritanceOrMergerFee > 0 := by decide
example : circuitUseRightTransferOtherFee = 3_000 := by decide
example : circuitUseRightTransferOtherFee > 0 := by decide
example : circuitTrustNonPledgeFee = 3_000 := by decide
example : circuitTrustNonPledgeFee > 0 := by decide
example : circuitUpdateRegistrationFee = 1_000 := by decide
example : circuitUpdateRegistrationFee > 0 := by decide
example : circuitCancellationFee = 1_000 := by decide
example : circuitCancellationFee > 0 := by decide

-- 税率定数: 分子・分母・well-definedness（千分の四 / 千分の二）
example : designPledgeSecurityRate.num = 4 := by decide
example : designPledgeSecurityRate.den = 1000 := by decide
example : 0 < designPledgeSecurityRate.den := by decide
example : designTrustPledgeRate.num = 2 := by decide
example : designTrustPledgeRate.den = 1000 := by decide
example : 0 < designTrustPledgeRate.den := by decide
example : trademarkPledgeSecurityRate.num = 4 := by decide
example : trademarkPledgeSecurityRate.den = 1000 := by decide
example : 0 < trademarkPledgeSecurityRate.den := by decide
example : trademarkTrustPledgeRate.num = 2 := by decide
example : trademarkTrustPledgeRate.den = 1000 := by decide
example : 0 < trademarkTrustPledgeRate.den := by decide
example : circuitPledgeSecurityRate.num = 4 := by decide
example : circuitPledgeSecurityRate.den = 1000 := by decide
example : 0 < circuitPledgeSecurityRate.den := by decide
example : circuitTrustPledgeRate.num = 2 := by decide
example : circuitTrustPledgeRate.den = 1000 := by decide
example : 0 < circuitTrustPledgeRate.den := by decide

-- 4/1000: 境界 249→0, 250→1, 999→3, 1000→4, 1001→4, 12345→49
example : designPledgeSecurityFee 0 = 0 := by decide
example : designPledgeSecurityFee 249 = 0 := by decide
example : designPledgeSecurityFee 250 = 1 := by decide
example : designPledgeSecurityFee 999 = 3 := by decide
example : designPledgeSecurityFee 1000 = 4 := by decide
example : designPledgeSecurityFee 1001 = 4 := by decide
example : designPledgeSecurityFee 12_345 = 49 := by decide
example : designPledgeSecurityFee 1_000_000 = 4_000 := by decide
example : trademarkPledgeSecurityFee 0 = 0 := by decide
example : trademarkPledgeSecurityFee 249 = 0 := by decide
example : trademarkPledgeSecurityFee 250 = 1 := by decide
example : trademarkPledgeSecurityFee 999 = 3 := by decide
example : trademarkPledgeSecurityFee 1000 = 4 := by decide
example : trademarkPledgeSecurityFee 12_345 = 49 := by decide
example : trademarkPledgeSecurityFee 1_000_000 = 4_000 := by decide
example : circuitPledgeSecurityFee 0 = 0 := by decide
example : circuitPledgeSecurityFee 249 = 0 := by decide
example : circuitPledgeSecurityFee 250 = 1 := by decide
example : circuitPledgeSecurityFee 999 = 3 := by decide
example : circuitPledgeSecurityFee 1000 = 4 := by decide
example : circuitPledgeSecurityFee 12_345 = 49 := by decide
example : circuitPledgeSecurityFee 1_000_000 = 4_000 := by decide

-- 2/1000: 境界 499→0, 500→1, 999→1, 1000→2, 1001→2, 12345→24
example : designTrustPledgeFee 0 = 0 := by decide
example : designTrustPledgeFee 499 = 0 := by decide
example : designTrustPledgeFee 500 = 1 := by decide
example : designTrustPledgeFee 999 = 1 := by decide
example : designTrustPledgeFee 1000 = 2 := by decide
example : designTrustPledgeFee 1001 = 2 := by decide
example : designTrustPledgeFee 12_345 = 24 := by decide
example : designTrustPledgeFee 1_000_000 = 2_000 := by decide
example : trademarkTrustPledgeFee 0 = 0 := by decide
example : trademarkTrustPledgeFee 499 = 0 := by decide
example : trademarkTrustPledgeFee 500 = 1 := by decide
example : trademarkTrustPledgeFee 999 = 1 := by decide
example : trademarkTrustPledgeFee 1000 = 2 := by decide
example : trademarkTrustPledgeFee 12_345 = 24 := by decide
example : trademarkTrustPledgeFee 1_000_000 = 2_000 := by decide
example : circuitTrustPledgeFee 0 = 0 := by decide
example : circuitTrustPledgeFee 499 = 0 := by decide
example : circuitTrustPledgeFee 500 = 1 := by decide
example : circuitTrustPledgeFee 999 = 1 := by decide
example : circuitTrustPledgeFee 1000 = 2 := by decide
example : circuitTrustPledgeFee 12_345 = 24 := by decide
example : circuitTrustPledgeFee 1_000_000 = 2_000 := by decide

end JapanTaxLaw.RegistryDesignTrademarkFees
