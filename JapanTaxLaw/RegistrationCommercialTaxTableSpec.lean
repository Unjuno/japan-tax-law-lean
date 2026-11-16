import JapanTaxLaw.RegistrationCommercialTaxTable

/-!
# RegistrationCommercialTaxTable spec — independent restatement of
  登録免許税法 別表第一（二）第二十四号（一）ロ〜チ

Sources (pinned; identical to RegistrationCommercialTaxTable.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * ロ　合名会社若しくは合資会社又は一般社団法人等の設立の登記の税額（申請件数一件につき六万円）;
  * ハ　合同会社の設立の登記（ホ及びトに掲げる登記を除く。）の税額
    （資本金の額千分の七、計算税額が六万円に満たないときは申請件数一件につき六万円）;
  * ニ　株式会社又は合同会社の資本金の増加の登記（ヘ及びチに掲げる登記を除く。）の税額
    （増加した資本金の額千分の七、計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * ホ　新設合併又は組織変更若しくは種類の変更による株式会社又は合同会社の設立の登記の税額
    （資本金の額千分の一・五、直前における資本金の額を超える部分は千分の七、
     計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * ヘ　吸収合併による株式会社又は合同会社の資本金の増加の登記の税額
    （増加した資本金の額千分の一・五、直前における資本金の額を超える部分は千分の七、
     計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * ト　新設分割による株式会社又は合同会社の設立の登記の税額
    （資本金の額千分の七、計算税額が三万円に満たないときは申請件数一件につき三万円）;
  * チ　吸収分割による株式会社又は合同会社の資本金の増加の登記の税額
    （増加した資本金の額千分の七、計算税額が三万円に満たないときは申請件数一件につき三万円）
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: ロ — 申請件数一件につき六万円、固定額。 -/
def specGmporGeneralFormationTax : Money := 60_000

/-- Spec: ハ — 資本金の額 × 千分の七、floor が六万円未満なら六万円。 -/
def specGoudoushaFormationTax (capital : Money) : Money :=
  max (capital * 7 / 1000) 60_000

/-- Spec: ニ — 増加した資本金の額 × 千分の七、floor が三万円未満なら三万円。 -/
def specCapitalIncreaseTax (increase : Money) : Money :=
  max (increase * 7 / 1000) 30_000

/-- Spec: ト — 資本金の額 × 千分の七、floor が三万円未満なら三万円。 -/
def specNewDivisionalFormationTax (capital : Money) : Money :=
  max (capital * 7 / 1000) 30_000

/-- Spec: チ — 増加した資本金の額 × 千分の七、floor が三万円未満なら三万円。 -/
def specAbsorptionDivisionIncreaseTax (increase : Money) : Money :=
  max (increase * 7 / 1000) 30_000

/-- Spec: ホ/ヘ共通 — 千分の一・五の部分と、直前資本金を超える部分の千分の七の部分の合計。 -/
def specMergedPortionTax (amount preMergerCapitalBasis : Money) : Money :=
  let portion1 := min amount preMergerCapitalBasis
  let portion2 := amount - portion1
  portion1 * 15 / 10000 + portion2 * 7 / 1000

/-- Spec: ホ — 新設合併 etc. -/
def specNewMergerFormationTax (capital preMergerCapitalBasis : Money) : Money :=
  max (specMergedPortionTax capital preMergerCapitalBasis) 30_000

/-- Spec: ヘ — 吸収合併による資本金の増加の登記。 -/
def specAbsorptionMergerIncreaseTax (increase preMergerCapitalBasis : Money) : Money :=
  max (specMergedPortionTax increase preMergerCapitalBasis) 30_000

/-- Spec: リ — 相互会社の設立（新設合併又は組織変更による設立を含む。）の登記、固定額。 -/
def specMutualCompanyFormationFee : Money := 300_000

/-- Spec: ヌ — 新株予約権の発行による変更の登記、固定額。 -/
def specShareSubscriptionModificationFee : Money := 90_000

/-- Spec: ル — 支店又は従たる事務所の設置の登記、「一箇所につき」六万円。 -/
def specBranchInstallationFee (branchCount : Nat) : Nat := branchCount * 60_000

/-- Spec: ヲ — 本店若しくは主たる事務所又は支店若しくは従たる事務所の移転の登記、「一箇所につき」三万円。 -/
def specRelocationFee (branchCount : Nat) : Nat := branchCount * 30_000

/-- Spec: ワ — 取締役会、監査役会、監査等委員会若しくは指名委員会等又は理事会に関する事項の
    変更の登記、固定額。 -/
def specBoardMattersModificationFee : Money := 30_000

/-- Spec: カ — 役員等に関する事項の変更の登記、「資本金の額が一億円以下の場合一万円、そうでなければ三万円」。 -/
def specDirectorMattersModificationFee (capital : Money) : Money :=
  if capital ≤ 100_000_000 then 10_000 else 30_000

/-- Spec: ヨ — 支配人の選任の登記又はその代理権の消滅の登記、固定額。 -/
def specRepresentativeAttachmentFee : Money := 30_000

-- Spec points (kernel-decided)
example : specMutualCompanyFormationFee = 300_000 := by decide
example : specShareSubscriptionModificationFee = 90_000 := by decide
example : specBranchInstallationFee 0 = 0 := by decide
example : specBranchInstallationFee 1 = 60_000 := by decide
example : specBranchInstallationFee 3 = 180_000 := by decide
example : specRelocationFee 0 = 0 := by decide
example : specRelocationFee 1 = 30_000 := by decide
example : specRelocationFee 5 = 150_000 := by decide
example : specBoardMattersModificationFee = 30_000 := by decide
example : specDirectorMattersModificationFee 100_000_000 = 10_000 := by decide
example : specDirectorMattersModificationFee 100_000_001 = 30_000 := by decide
example : specRepresentativeAttachmentFee = 30_000 := by decide

def agreeRegistrationFees : Bool :=
  specMutualCompanyFormationFee == mutualCompanyFormationFee &&
    specShareSubscriptionModificationFee == shareSubscriptionModificationFee &&
    [0, 1, 2, 3].all (fun n => specBranchInstallationFee n == branchInstallationFee n) &&
    [0, 1, 2, 5].all (fun n => specRelocationFee n == relocationFee n) &&
    specBoardMattersModificationFee == boardMattersModificationFee &&
    [0, 100_000_000, 100_000_001, 2_000_000_000].all (fun cap =>
      specDirectorMattersModificationFee cap == directorMattersModificationFee cap) &&
    specRepresentativeAttachmentFee == representativeAttachmentFee

example : agreeRegistrationFees = true := by decide

/-- Spec: タ〜ナ 国内フラット -/
def specOfficerSuspensionFee : Money := 30_000
def specDissolutionFee : Money := 30_000
def specCompanyContinuationFee : Money := 30_000
def specResidualRegistrationModificationFee : Money := 30_000
def specRegistrationCorrectionFee : Money := 20_000
def specRegistrationErasureFee : Money := 20_000

/-- Spec: （二） 外国会社の登記 -/
def specForeignCompanyOfficeInstallationFee (officeCount : Nat) : Money := officeCount * 90_000
def specForeignCompanyFirstOfficeFee : Money := 60_000
def specForeignCompanyOtherRegistrationFee : Money := 9_000
def specForeignCompanyCorrectionErasureFee : Money := 6_000

/-- Spec: （三） 清算に係る登記 -/
def specLiquidatorRegistrationFee : Money := 9_000
def specLiquidatorModificationFee : Money := 6_000
def specLiquidationCompletionFee : Money := 2_000
def specLiquidationOtherModificationFee : Money := 6_000

example : specOfficerSuspensionFee = 30_000 := by decide
example : specDissolutionFee = 30_000 := by decide
example : specCompanyContinuationFee = 30_000 := by decide
example : specResidualRegistrationModificationFee = 30_000 := by decide
example : specRegistrationCorrectionFee = 20_000 := by decide
example : specRegistrationErasureFee = 20_000 := by decide
example : specForeignCompanyOfficeInstallationFee 0 = 0 := by decide
example : specForeignCompanyOfficeInstallationFee 2 = 180_000 := by decide
example : specForeignCompanyFirstOfficeFee = 60_000 := by decide
example : specForeignCompanyOtherRegistrationFee = 9_000 := by decide
example : specForeignCompanyCorrectionErasureFee = 6_000 := by decide
example : specLiquidatorRegistrationFee = 9_000 := by decide
example : specLiquidatorModificationFee = 6_000 := by decide
example : specLiquidationCompletionFee = 2_000 := by decide
example : specLiquidationOtherModificationFee = 6_000 := by decide

def agreeRegistrationFeesExtended : Bool :=
  specOfficerSuspensionFee == officerSuspensionFee &&
    specDissolutionFee == dissolutionFee &&
    specCompanyContinuationFee == companyContinuationFee &&
    specResidualRegistrationModificationFee == residualRegistrationModificationFee &&
    specRegistrationCorrectionFee == registrationCorrectionFee &&
    specRegistrationErasureFee == registrationErasureFee &&
    [0, 1, 2, 3].all fun n =>
      specForeignCompanyOfficeInstallationFee n == foreignCompanyOfficeInstallationFee n &&
    specForeignCompanyFirstOfficeFee == foreignCompanyFirstOfficeFee &&
    specForeignCompanyOtherRegistrationFee == foreignCompanyOtherRegistrationFee &&
    specForeignCompanyCorrectionErasureFee == foreignCompanyCorrectionErasureFee &&
    specLiquidatorRegistrationFee == liquidatorRegistrationFee &&
    specLiquidatorModificationFee == liquidatorModificationFee &&
    specLiquidationCompletionFee == liquidationCompletionFee &&
    specLiquidationOtherModificationFee == liquidationOtherModificationFee

example : agreeRegistrationFeesExtended = true := by decide

/-- Spec: 二十五（一）/（二）/（三） 特定目的会社の登記 -/
def specSpcFormationFee : Money := 30_000
def specSpcOtherRegistrationFee : Money := 15_000
def specSpcErasureFee : Money := 10_000

/-- Spec: 二十六（一）/（二）/（三） 投資法人の登記 -/
def specInvestmentCorporationFormationFee : Money := 30_000
def specInvestmentCorporationOtherRegistrationFee : Money := 15_000
def specInvestmentCorporationErasureFee : Money := 10_000

/-- Spec: 二十七（一） 有限責任事業組合契約の組合契約の登記 -/
def specLlpContractEffectivenessFee : Money := 60_000
def specLlpBranchInstallationFee : Money := 60_000
def specLlpMoveFee : Money := 30_000
def specLlpPartnerModificationFee : Money := 10_000
def specLlpPartnerSuspensionFee : Money := 30_000
def specLlpOtherRegistrationFee : Money := 30_000
def specLlpCorrectionFee : Money := 20_000
def specLlpErasureFee : Money := 20_000

/-- Spec: 二十七（二） 有限責任事業組合契約の組合契約の清算に係る登記 -/
def specLlpLiquidatorRegistrationFee : Money := 6_000
def specLlpLiquidatorOtherFee : Money := 6_000
def specLlpLiquidationCompletionFee : Money := 2_000
def specLlpLiquidatorCorrectionErasureFee : Money := 6_000

example : specSpcFormationFee = 30_000 := by decide
example : specSpcOtherRegistrationFee = 15_000 := by decide
example : specSpcErasureFee = 10_000 := by decide
example : specInvestmentCorporationFormationFee = 30_000 := by decide
example : specInvestmentCorporationOtherRegistrationFee = 15_000 := by decide
example : specInvestmentCorporationErasureFee = 10_000 := by decide
example : specLlpContractEffectivenessFee = 60_000 := by decide
example : specLlpBranchInstallationFee = 60_000 := by decide
example : specLlpMoveFee = 30_000 := by decide
example : specLlpPartnerModificationFee = 10_000 := by decide
example : specLlpPartnerSuspensionFee = 30_000 := by decide
example : specLlpOtherRegistrationFee = 30_000 := by decide
example : specLlpCorrectionFee = 20_000 := by decide
example : specLlpErasureFee = 20_000 := by decide
example : specLlpLiquidatorRegistrationFee = 6_000 := by decide
example : specLlpLiquidatorOtherFee = 6_000 := by decide
example : specLlpLiquidationCompletionFee = 2_000 := by decide
example : specLlpLiquidatorCorrectionErasureFee = 6_000 := by decide

def agreeArt25_27Fees : Bool :=
  specSpcFormationFee == spcFormationFee &&
    specSpcOtherRegistrationFee == spcOtherRegistrationFee &&
    specSpcErasureFee == spcErasureFee &&
    specInvestmentCorporationFormationFee == investmentCorporationFormationFee &&
    specInvestmentCorporationOtherRegistrationFee == investmentCorporationOtherRegistrationFee &&
    specInvestmentCorporationErasureFee == investmentCorporationErasureFee &&
    specLlpContractEffectivenessFee == llpContractEffectivenessFee &&
    specLlpBranchInstallationFee == llpBranchInstallationFee &&
    specLlpMoveFee == llpMoveFee &&
    specLlpPartnerModificationFee == llpPartnerModificationFee &&
    specLlpPartnerSuspensionFee == llpPartnerSuspensionFee &&
    specLlpOtherRegistrationFee == llpOtherRegistrationFee &&
    specLlpCorrectionFee == llpCorrectionFee &&
    specLlpErasureFee == llpErasureFee &&
    specLlpLiquidatorRegistrationFee == llpLiquidatorRegistrationFee &&
    specLlpLiquidatorOtherFee == llpLiquidatorOtherFee &&
    specLlpLiquidationCompletionFee == llpLiquidationCompletionFee &&
    specLlpLiquidatorCorrectionErasureFee == llpLiquidatorCorrectionErasureFee

example : agreeArt25_27Fees = true := by decide

/-- Spec: 二十八 投資事業有限責任組合契約の登記 -/
def specViclpContractEffectivenessFee : Money := 30_000
def specViclpOtherRegistrationFee : Money := 15_000
def specViclpCorrectionFee : Money := 10_000
def specViclpErasureFee : Money := 10_000
def specViclpLiquidatorRegistrationFee : Money := 6_000
def specViclpLiquidatorOtherFee : Money := 6_000
def specViclpLiquidationCompletionFee : Money := 2_000
def specViclpLiquidatorCorrectionErasureFee : Money := 6_000

/-- Spec: 二十八の二 限定責任信託の登記 -/
def specLimitLiabilityTrustProvisionFee : Money := 30_000
def specLimitLiabilityTrustNewDomicileFee : Money := 15_000
def specLimitLiabilityTrustOtherRegistrationFee : Money := 15_000
def specLimitLiabilityTrustCorrectionFee : Money := 10_000
def specLimitLiabilityTrustErasureFee : Money := 10_000
def specLimitLiabilityTrustLiquidatorRegistrationFee : Money := 6_000
def specLimitLiabilityTrustLiquidatorOtherFee : Money := 6_000
def specLimitLiabilityTrustLiquidationCompletionFee : Money := 2_000
def specLimitLiabilityTrustLiquidatorCorrectionErasureFee : Money := 6_000

example : specViclpContractEffectivenessFee = 30_000 := by decide
example : specViclpOtherRegistrationFee = 15_000 := by decide
example : specViclpCorrectionFee = 10_000 := by decide
example : specViclpErasureFee = 10_000 := by decide
example : specViclpLiquidatorRegistrationFee = 6_000 := by decide
example : specViclpLiquidatorOtherFee = 6_000 := by decide
example : specViclpLiquidationCompletionFee = 2_000 := by decide
example : specViclpLiquidatorCorrectionErasureFee = 6_000 := by decide
example : specLimitLiabilityTrustProvisionFee = 30_000 := by decide
example : specLimitLiabilityTrustNewDomicileFee = 15_000 := by decide
example : specLimitLiabilityTrustOtherRegistrationFee = 15_000 := by decide
example : specLimitLiabilityTrustCorrectionFee = 10_000 := by decide
example : specLimitLiabilityTrustErasureFee = 10_000 := by decide
example : specLimitLiabilityTrustLiquidatorRegistrationFee = 6_000 := by decide
example : specLimitLiabilityTrustLiquidatorOtherFee = 6_000 := by decide
example : specLimitLiabilityTrustLiquidationCompletionFee = 2_000 := by decide
example : specLimitLiabilityTrustLiquidatorCorrectionErasureFee = 6_000 := by decide

def agreeArt28Fees : Bool :=
  specViclpContractEffectivenessFee == viclpContractEffectivenessFee &&
    specViclpOtherRegistrationFee == viclpOtherRegistrationFee &&
    specViclpCorrectionFee == viclpCorrectionFee &&
    specViclpErasureFee == viclpErasureFee &&
    specViclpLiquidatorRegistrationFee == viclpLiquidatorRegistrationFee &&
    specViclpLiquidatorOtherFee == viclpLiquidatorOtherFee &&
    specViclpLiquidationCompletionFee == viclpLiquidationCompletionFee &&
    specViclpLiquidatorCorrectionErasureFee == viclpLiquidatorCorrectionErasureFee &&
    specLimitLiabilityTrustProvisionFee == limitLiabilityTrustProvisionFee &&
    specLimitLiabilityTrustNewDomicileFee == limitLiabilityTrustNewDomicileFee &&
    specLimitLiabilityTrustOtherRegistrationFee == limitLiabilityTrustOtherRegistrationFee &&
    specLimitLiabilityTrustCorrectionFee == limitLiabilityTrustCorrectionFee &&
    specLimitLiabilityTrustErasureFee == limitLiabilityTrustErasureFee &&
    specLimitLiabilityTrustLiquidatorRegistrationFee == limitLiabilityTrustLiquidatorRegistrationFee &&
    specLimitLiabilityTrustLiquidatorOtherFee == limitLiabilityTrustLiquidatorOtherFee &&
    specLimitLiabilityTrustLiquidationCompletionFee == limitLiabilityTrustLiquidationCompletionFee &&
    specLimitLiabilityTrustLiquidatorCorrectionErasureFee == limitLiabilityTrustLiquidatorCorrectionErasureFee

example : agreeArt28Fees = true := by decide

-- ==== points, all kernel-decided ====

example : specGmporGeneralFormationTax = 60_000 := by decide
example : specGoudoushaFormationTax 0 = 60_000 := by decide
example : specGoudoushaFormationTax 10_000_000_000 = 70_000_000 := by decide
example : specCapitalIncreaseTax 0 = 30_000 := by decide
example : specCapitalIncreaseTax 4_000_000_000 = 28_000_000 := by decide
example : specNewDivisionalFormationTax 0 = 30_000 := by decide
example : specNewDivisionalFormationTax 10_000_000_000 = 70_000_000 := by decide
example : specAbsorptionDivisionIncreaseTax 0 = 30_000 := by decide
example : specAbsorptionDivisionIncreaseTax 10_000_000_000 = 70_000_000 := by decide
example : specNewMergerFormationTax 0 0 = 30_000 := by decide
example : specNewMergerFormationTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide
example : specNewMergerFormationTax 5_000_000_000 5_000_000_000 = 7_500_000 := by decide
example : specNewMergerFormationTax 7_000_000_000 5_000_000_000 = 7_500_000 + 14_000_000 := by decide
example : specAbsorptionMergerIncreaseTax 0 0 = 30_000 := by decide
example : specAbsorptionMergerIncreaseTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points. -/
def agreeCommercialItemPoints : Bool :=
  [0, 1_000_000_000, 2_000_000_000, 4_999_999, 5_000_000_000, 10_000_000_000].all fun x =>
    goudoushaFormationTax x == specGoudoushaFormationTax x &&
      capitalIncreaseTax x == specCapitalIncreaseTax x &&
      newDivisionalFormationTax x == specNewDivisionalFormationTax x &&
      absorptionDivisionIncreaseTax x == specAbsorptionDivisionIncreaseTax x

def agreeMergedPoints : Bool :=
  [(0, 0), (2_000_000_000, 5_000_000_000), (5_000_000_000, 5_000_000_000),
   (7_000_000_000, 5_000_000_000), (10_000_000_000, 10_000_000_000),
   (3_000_000_000, 1_000_000_000)].all fun (a, b) =>
    newMergerFormationTax a b == specNewMergerFormationTax a b &&
      absorptionMergerIncreaseTax a b == specAbsorptionMergerIncreaseTax a b

example : agreeCommercialItemPoints = true := by decide
example : agreeMergedPoints = true := by decide

end JapanTaxLaw
