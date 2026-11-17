import JapanTaxLaw.RegistryTrustMarriageFees

/-
# RegistryTrustMarriageFees spec — 別表第一（二）二十六〜三十一 の独立定式

Sources (pinned; identical to RegistryTrustMarriageFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

実装とは独立に、原文の日本語金額を算術式で書き直した定式（spec）を与え、
`agreeRegistryTrustMarriageFees`（有限点点検の `==` 一致）で実装と突き合わせる。
定額のみ（小数点率なし）のため、spec は円単位の整数定式である。
Spec points および agree はすべて `by decide`（kernel-decide）。
Scope boundaries are identical to the implementation module.
-/

namespace JapanTaxLaw.RegistryTrustMarriageFees

open JapanTaxLaw.TaxFinance

-- 二十六 投資法人の登記
/-- Spec 二十六（一）三万円 = 3 × 10,000 円。 -/
def specInvestmentCorporationFormationFee : Money := 3 * 10_000
/-- Spec 二十六（二）一万五千円 = 15 × 1,000 円。 -/
def specInvestmentCorporationOtherRegistrationFee : Money := 15 * 1_000
/-- Spec 二十六（三）一万円 = 1 × 10,000 円。 -/
def specInvestmentCorporationErasureFee : Money := 1 * 10_000

-- 二十七 有限責任事業組合契約の登記
/-- Spec 二十七（一）イ 六万円。 -/
def specLlpContractEffectivenessFee : Money := 6 * 10_000
/-- Spec 二十七（一）ロ 六万円。 -/
def specLlpBranchInstallationFee : Money := 6 * 10_000
/-- Spec 二十七（一）ハ 三万円。 -/
def specLlpRelocationFee : Money := 3 * 10_000
/-- Spec 二十七（一）ニ 一万円。 -/
def specLlpPartnerMattersChangeFee : Money := 1 * 10_000
/-- Spec 二十七（一）ホ 三万円。 -/
def specLlpPartnerSuspensionOrDeputyFee : Money := 3 * 10_000
/-- Spec 二十七（一）ヘ 三万円。 -/
def specLlpOtherRegistrationFee : Money := 3 * 10_000
/-- Spec 二十七（一）ト 二万円。 -/
def specLlpCorrectionFee : Money := 2 * 10_000
/-- Spec 二十七（一）チ 二万円。 -/
def specLlpErasureFee : Money := 2 * 10_000
/-- Spec 二十七（二）イ 六千円。 -/
def specLlpLiquidatorRegistrationFee : Money := 6 * 1_000
/-- Spec 二十七（二）ロ 六千円。 -/
def specLlpLiquidationOtherFee : Money := 6 * 1_000
/-- Spec 二十七（二）ハ 二千円。 -/
def specLlpLiquidationCompletionFee : Money := 2 * 1_000
/-- Spec 二十七（二）ニ 六千円。 -/
def specLlpLiquidationCorrectionOrErasureFee : Money := 6 * 1_000

-- 二十八 投資事業有限責任組合契約の登記
/-- Spec 二十八（一）イ 三万円。 -/
def specViclpContractEffectivenessFee : Money := 3 * 10_000
/-- Spec 二十八（一）ロ 一万五千円。 -/
def specViclpOtherRegistrationFee : Money := 15 * 1_000
/-- Spec 二十八（一）ハ 一万円。 -/
def specViclpCorrectionFee : Money := 1 * 10_000
/-- Spec 二十八（一）ニ 一万円。 -/
def specViclpErasureFee : Money := 1 * 10_000
/-- Spec 二十八（二）イ 六千円。 -/
def specViclpLiquidatorRegistrationFee : Money := 6 * 1_000
/-- Spec 二十八（二）ロ 六千円。 -/
def specViclpLiquidationOtherFee : Money := 6 * 1_000
/-- Spec 二十八（二）ハ 二千円。 -/
def specViclpLiquidationCompletionFee : Money := 2 * 1_000
/-- Spec 二十八（二）ニ 六千円。 -/
def specViclpLiquidationCorrectionOrErasureFee : Money := 6 * 1_000

-- 二十八の二 限定責任信託の登記
/-- Spec 二十八の二（一）三万円。 -/
def specLimitedLiabilityTrustProvisionFee : Money := 3 * 10_000
/-- Spec 二十八の二（二）一万五千円。 -/
def specLimitedLiabilityTrustNewOfficeFee : Money := 15 * 1_000
/-- Spec 二十八の二（三）一万五千円。 -/
def specLimitedLiabilityTrustOtherRegistrationFee : Money := 15 * 1_000
/-- Spec 二十八の二（四）一万円。 -/
def specLimitedLiabilityTrustCorrectionFee : Money := 1 * 10_000
/-- Spec 二十八の二（五）一万円。 -/
def specLimitedLiabilityTrustErasureFee : Money := 1 * 10_000
/-- Spec 二十八の二（六）イ 六千円。 -/
def specLimitedLiabilityTrustLiquidatorRegistrationFee : Money := 6 * 1_000
/-- Spec 二十八の二（六）ロ 六千円。 -/
def specLimitedLiabilityTrustLiquidationOtherFee : Money := 6 * 1_000
/-- Spec 二十八の二（六）ハ 二千円。 -/
def specLimitedLiabilityTrustLiquidationCompletionFee : Money := 2 * 1_000
/-- Spec 二十八の二（六）ニ 六千円。 -/
def specLimitedLiabilityTrustLiquidationCorrectionOrErasureFee : Money := 6 * 1_000

-- 二十九 個人の商業登記
/-- Spec 二十九（一）イ 三万円。 -/
def specIndividualNameEstablishmentOrChangeFee : Money := 3 * 10_000
/-- Spec 二十九（一）ロ 三万円。 -/
def specIndividualManagerFee : Money := 3 * 10_000
/-- Spec 二十九（一）ハ 一万八千円。 -/
def specIndividualMinorOrGuardianFee : Money := 18 * 1_000
/-- Spec 二十九（一）ニ 一万八千円。 -/
def specIndividualBusinessTransferLiabilityFee : Money := 18 * 1_000
/-- Spec 二十九（一）ホ 六千円。 -/
def specIndividualNameAbolitionOrCorrectionFee : Money := 6 * 1_000
/-- Spec 二十九（一）ヘ 六千円。 -/
def specIndividualErasureFee : Money := 6 * 1_000
/-- Spec 二十九（二）イ 九千円。 -/
def specIndividualBranchOfficeFee : Money := 9 * 1_000
/-- Spec 二十九（二）ロ 六千円。 -/
def specIndividualBranchOfficeErasureFee : Money := 6 * 1_000

-- 三十 船舶管理人の登記
/-- Spec 三十（一）三万円。 -/
def specShipManagerFee : Money := 3 * 10_000
/-- Spec 三十（二）六千円。 -/
def specShipManagerCorrectionOrChangeFee : Money := 6 * 1_000

-- 三十一 夫婦財産契約の登記
/-- Spec 三十一（一）一万八千円。 -/
def specMatrimonialPropertyContractFee : Money := 18 * 1_000
/-- Spec 三十一（二）六千円。 -/
def specMatrimonialPropertyContractCorrectionOrChangeFee : Money := 6 * 1_000
/-- Spec 三十一（三）六千円。 -/
def specMatrimonialPropertyContractErasureFee : Money := 6 * 1_000

-- ============================================================
-- Spec points（すべて kernel-decide）
-- ============================================================

example : specInvestmentCorporationFormationFee = 30_000 := by decide
example : specInvestmentCorporationOtherRegistrationFee = 15_000 := by decide
example : specInvestmentCorporationErasureFee = 10_000 := by decide

example : specLlpContractEffectivenessFee = 60_000 := by decide
example : specLlpBranchInstallationFee = 60_000 := by decide
example : specLlpRelocationFee = 30_000 := by decide
example : specLlpPartnerMattersChangeFee = 10_000 := by decide
example : specLlpPartnerSuspensionOrDeputyFee = 30_000 := by decide
example : specLlpOtherRegistrationFee = 30_000 := by decide
example : specLlpCorrectionFee = 20_000 := by decide
example : specLlpErasureFee = 20_000 := by decide
example : specLlpLiquidatorRegistrationFee = 6_000 := by decide
example : specLlpLiquidationOtherFee = 6_000 := by decide
example : specLlpLiquidationCompletionFee = 2_000 := by decide
example : specLlpLiquidationCorrectionOrErasureFee = 6_000 := by decide

example : specViclpContractEffectivenessFee = 30_000 := by decide
example : specViclpOtherRegistrationFee = 15_000 := by decide
example : specViclpCorrectionFee = 10_000 := by decide
example : specViclpErasureFee = 10_000 := by decide
example : specViclpLiquidatorRegistrationFee = 6_000 := by decide
example : specViclpLiquidationOtherFee = 6_000 := by decide
example : specViclpLiquidationCompletionFee = 2_000 := by decide
example : specViclpLiquidationCorrectionOrErasureFee = 6_000 := by decide

example : specLimitedLiabilityTrustProvisionFee = 30_000 := by decide
example : specLimitedLiabilityTrustNewOfficeFee = 15_000 := by decide
example : specLimitedLiabilityTrustOtherRegistrationFee = 15_000 := by decide
example : specLimitedLiabilityTrustCorrectionFee = 10_000 := by decide
example : specLimitedLiabilityTrustErasureFee = 10_000 := by decide
example : specLimitedLiabilityTrustLiquidatorRegistrationFee = 6_000 := by decide
example : specLimitedLiabilityTrustLiquidationOtherFee = 6_000 := by decide
example : specLimitedLiabilityTrustLiquidationCompletionFee = 2_000 := by decide
example : specLimitedLiabilityTrustLiquidationCorrectionOrErasureFee = 6_000 := by decide

example : specIndividualNameEstablishmentOrChangeFee = 30_000 := by decide
example : specIndividualManagerFee = 30_000 := by decide
example : specIndividualMinorOrGuardianFee = 18_000 := by decide
example : specIndividualBusinessTransferLiabilityFee = 18_000 := by decide
example : specIndividualNameAbolitionOrCorrectionFee = 6_000 := by decide
example : specIndividualErasureFee = 6_000 := by decide
example : specIndividualBranchOfficeFee = 9_000 := by decide
example : specIndividualBranchOfficeErasureFee = 6_000 := by decide

example : specShipManagerFee = 30_000 := by decide
example : specShipManagerCorrectionOrChangeFee = 6_000 := by decide

example : specMatrimonialPropertyContractFee = 18_000 := by decide
example : specMatrimonialPropertyContractCorrectionOrChangeFee = 6_000 := by decide
example : specMatrimonialPropertyContractErasureFee = 6_000 := by decide

-- ============================================================
-- agree（実装 ≡ 独立 spec の全件突き合わせ）
-- ============================================================

/-- 45 件の定額について、実装と独立定式が一致するか（`==` による有限点検証）。 -/
def agreeRegistryTrustMarriageFees : Bool :=
  specInvestmentCorporationFormationFee == investmentCorporationFormationFee &&
  specInvestmentCorporationOtherRegistrationFee == investmentCorporationOtherRegistrationFee &&
  specInvestmentCorporationErasureFee == investmentCorporationErasureFee &&
  specLlpContractEffectivenessFee == llpContractEffectivenessFee &&
  specLlpBranchInstallationFee == llpBranchInstallationFee &&
  specLlpRelocationFee == llpRelocationFee &&
  specLlpPartnerMattersChangeFee == llpPartnerMattersChangeFee &&
  specLlpPartnerSuspensionOrDeputyFee == llpPartnerSuspensionOrDeputyFee &&
  specLlpOtherRegistrationFee == llpOtherRegistrationFee &&
  specLlpCorrectionFee == llpCorrectionFee &&
  specLlpErasureFee == llpErasureFee &&
  specLlpLiquidatorRegistrationFee == llpLiquidatorRegistrationFee &&
  specLlpLiquidationOtherFee == llpLiquidationOtherFee &&
  specLlpLiquidationCompletionFee == llpLiquidationCompletionFee &&
  specLlpLiquidationCorrectionOrErasureFee == llpLiquidationCorrectionOrErasureFee &&
  specViclpContractEffectivenessFee == viclpContractEffectivenessFee &&
  specViclpOtherRegistrationFee == viclpOtherRegistrationFee &&
  specViclpCorrectionFee == viclpCorrectionFee &&
  specViclpErasureFee == viclpErasureFee &&
  specViclpLiquidatorRegistrationFee == viclpLiquidatorRegistrationFee &&
  specViclpLiquidationOtherFee == viclpLiquidationOtherFee &&
  specViclpLiquidationCompletionFee == viclpLiquidationCompletionFee &&
  specViclpLiquidationCorrectionOrErasureFee == viclpLiquidationCorrectionOrErasureFee &&
  specLimitedLiabilityTrustProvisionFee == limitedLiabilityTrustProvisionFee &&
  specLimitedLiabilityTrustNewOfficeFee == limitedLiabilityTrustNewOfficeFee &&
  specLimitedLiabilityTrustOtherRegistrationFee == limitedLiabilityTrustOtherRegistrationFee &&
  specLimitedLiabilityTrustCorrectionFee == limitedLiabilityTrustCorrectionFee &&
  specLimitedLiabilityTrustErasureFee == limitedLiabilityTrustErasureFee &&
  specLimitedLiabilityTrustLiquidatorRegistrationFee == limitedLiabilityTrustLiquidatorRegistrationFee &&
  specLimitedLiabilityTrustLiquidationOtherFee == limitedLiabilityTrustLiquidationOtherFee &&
  specLimitedLiabilityTrustLiquidationCompletionFee == limitedLiabilityTrustLiquidationCompletionFee &&
  specLimitedLiabilityTrustLiquidationCorrectionOrErasureFee ==
    limitedLiabilityTrustLiquidationCorrectionOrErasureFee &&
  specIndividualNameEstablishmentOrChangeFee == individualNameEstablishmentOrChangeFee &&
  specIndividualManagerFee == individualManagerFee &&
  specIndividualMinorOrGuardianFee == individualMinorOrGuardianFee &&
  specIndividualBusinessTransferLiabilityFee == individualBusinessTransferLiabilityFee &&
  specIndividualNameAbolitionOrCorrectionFee == individualNameAbolitionOrCorrectionFee &&
  specIndividualErasureFee == individualErasureFee &&
  specIndividualBranchOfficeFee == individualBranchOfficeFee &&
  specIndividualBranchOfficeErasureFee == individualBranchOfficeErasureFee &&
  specShipManagerFee == shipManagerFee &&
  specShipManagerCorrectionOrChangeFee == shipManagerCorrectionOrChangeFee &&
  specMatrimonialPropertyContractFee == matrimonialPropertyContractFee &&
  specMatrimonialPropertyContractCorrectionOrChangeFee ==
    matrimonialPropertyContractCorrectionOrChangeFee &&
  specMatrimonialPropertyContractErasureFee == matrimonialPropertyContractErasureFee

example : agreeRegistryTrustMarriageFees = true := by decide

end JapanTaxLaw.RegistryTrustMarriageFees
