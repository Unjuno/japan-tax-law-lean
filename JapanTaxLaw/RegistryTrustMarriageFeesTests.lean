import JapanTaxLaw.RegistryTrustMarriageFees
import JapanTaxLaw.RegistryTrustMarriageFeesSpec

/-
# RegistryTrustMarriageFees tests — 別表第一（二）二十六〜三十一 smoke checks

Decidable smoke tests for the flat per-application fee models, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01

All assertions are `by decide` (kernel-decide). No new named declarations.
-/

namespace JapanTaxLaw.RegistryTrustMarriageFees

open JapanTaxLaw.TaxFinance

-- 二十六 投資法人の登記
example : investmentCorporationFormationFee = 30_000 := by decide
example : investmentCorporationOtherRegistrationFee = 15_000 := by decide
example : investmentCorporationErasureFee = 10_000 := by decide
example : investmentCorporationFormationFee > 0 := by decide
example : investmentCorporationOtherRegistrationFee > 0 := by decide
example : investmentCorporationErasureFee > 0 := by decide

-- 二十七 有限責任事業組合契約の登記（（一）イ〜チ）
example : llpContractEffectivenessFee = 60_000 := by decide
example : llpBranchInstallationFee = 60_000 := by decide
example : llpRelocationFee = 30_000 := by decide
example : llpPartnerMattersChangeFee = 10_000 := by decide
example : llpPartnerSuspensionOrDeputyFee = 30_000 := by decide
example : llpOtherRegistrationFee = 30_000 := by decide
example : llpCorrectionFee = 20_000 := by decide
example : llpErasureFee = 20_000 := by decide
-- 二十七（二）イ〜ニ 清算
example : llpLiquidatorRegistrationFee = 6_000 := by decide
example : llpLiquidationOtherFee = 6_000 := by decide
example : llpLiquidationCompletionFee = 2_000 := by decide
example : llpLiquidationCorrectionOrErasureFee = 6_000 := by decide
-- positivity
example : llpContractEffectivenessFee > 0 := by decide
example : llpBranchInstallationFee > 0 := by decide
example : llpRelocationFee > 0 := by decide
example : llpPartnerMattersChangeFee > 0 := by decide
example : llpPartnerSuspensionOrDeputyFee > 0 := by decide
example : llpOtherRegistrationFee > 0 := by decide
example : llpCorrectionFee > 0 := by decide
example : llpErasureFee > 0 := by decide
example : llpLiquidatorRegistrationFee > 0 := by decide
example : llpLiquidationOtherFee > 0 := by decide
example : llpLiquidationCompletionFee > 0 := by decide
example : llpLiquidationCorrectionOrErasureFee > 0 := by decide

-- 二十八 投資事業有限責任組合契約の登記（（一）イ〜ニ /（二）イ〜ニ）
example : viclpContractEffectivenessFee = 30_000 := by decide
example : viclpOtherRegistrationFee = 15_000 := by decide
example : viclpCorrectionFee = 10_000 := by decide
example : viclpErasureFee = 10_000 := by decide
example : viclpLiquidatorRegistrationFee = 6_000 := by decide
example : viclpLiquidationOtherFee = 6_000 := by decide
example : viclpLiquidationCompletionFee = 2_000 := by decide
example : viclpLiquidationCorrectionOrErasureFee = 6_000 := by decide
example : viclpContractEffectivenessFee > 0 := by decide
example : viclpOtherRegistrationFee > 0 := by decide
example : viclpCorrectionFee > 0 := by decide
example : viclpErasureFee > 0 := by decide
example : viclpLiquidatorRegistrationFee > 0 := by decide
example : viclpLiquidationOtherFee > 0 := by decide
example : viclpLiquidationCompletionFee > 0 := by decide
example : viclpLiquidationCorrectionOrErasureFee > 0 := by decide

-- 二十八の二 限定責任信託の登記（（一）〜（六））
example : limitedLiabilityTrustProvisionFee = 30_000 := by decide
example : limitedLiabilityTrustNewOfficeFee = 15_000 := by decide
example : limitedLiabilityTrustOtherRegistrationFee = 15_000 := by decide
example : limitedLiabilityTrustCorrectionFee = 10_000 := by decide
example : limitedLiabilityTrustErasureFee = 10_000 := by decide
example : limitedLiabilityTrustLiquidatorRegistrationFee = 6_000 := by decide
example : limitedLiabilityTrustLiquidationOtherFee = 6_000 := by decide
example : limitedLiabilityTrustLiquidationCompletionFee = 2_000 := by decide
example : limitedLiabilityTrustLiquidationCorrectionOrErasureFee = 6_000 := by decide
example : limitedLiabilityTrustProvisionFee > 0 := by decide
example : limitedLiabilityTrustNewOfficeFee > 0 := by decide
example : limitedLiabilityTrustOtherRegistrationFee > 0 := by decide
example : limitedLiabilityTrustCorrectionFee > 0 := by decide
example : limitedLiabilityTrustErasureFee > 0 := by decide
example : limitedLiabilityTrustLiquidatorRegistrationFee > 0 := by decide
example : limitedLiabilityTrustLiquidationOtherFee > 0 := by decide
example : limitedLiabilityTrustLiquidationCompletionFee > 0 := by decide
example : limitedLiabilityTrustLiquidationCorrectionOrErasureFee > 0 := by decide

-- 二十九 個人の商業登記（（一）イ〜ヘ /（二）イ〜ロ）
example : individualNameEstablishmentOrChangeFee = 30_000 := by decide
example : individualManagerFee = 30_000 := by decide
example : individualMinorOrGuardianFee = 18_000 := by decide
example : individualBusinessTransferLiabilityFee = 18_000 := by decide
example : individualNameAbolitionOrCorrectionFee = 6_000 := by decide
example : individualErasureFee = 6_000 := by decide
example : individualBranchOfficeFee = 9_000 := by decide
example : individualBranchOfficeErasureFee = 6_000 := by decide
example : individualNameEstablishmentOrChangeFee > 0 := by decide
example : individualManagerFee > 0 := by decide
example : individualMinorOrGuardianFee > 0 := by decide
example : individualBusinessTransferLiabilityFee > 0 := by decide
example : individualNameAbolitionOrCorrectionFee > 0 := by decide
example : individualErasureFee > 0 := by decide
example : individualBranchOfficeFee > 0 := by decide
example : individualBranchOfficeErasureFee > 0 := by decide

-- 三十 船舶管理人の登記（（一）（二））
example : shipManagerFee = 30_000 := by decide
example : shipManagerCorrectionOrChangeFee = 6_000 := by decide
example : shipManagerFee > 0 := by decide
example : shipManagerCorrectionOrChangeFee > 0 := by decide

-- 三十一 夫婦財産契約の登記（（一）〜（三））
example : matrimonialPropertyContractFee = 18_000 := by decide
example : matrimonialPropertyContractCorrectionOrChangeFee = 6_000 := by decide
example : matrimonialPropertyContractErasureFee = 6_000 := by decide
example : matrimonialPropertyContractFee > 0 := by decide
example : matrimonialPropertyContractCorrectionOrChangeFee > 0 := by decide
example : matrimonialPropertyContractErasureFee > 0 := by decide

-- 実装 ≡ 独立 spec の突き合わせ（再確認、kernel-decide）
example : agreeRegistryTrustMarriageFees = true := by decide

end JapanTaxLaw.RegistryTrustMarriageFees
