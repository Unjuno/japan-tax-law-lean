import JapanTaxLaw.RegistryForeignCompanyFees

/-!
# RegistryForeignCompanyFeesSpec — 別表第一（二）二十二〜二十五の独立整数定式

Source (pinned; identical to RegistryForeignCompanyFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee amounts as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  割合型 2 件（課税標準基準、切り捨て、整数千分率は分母 1000）:
    千分の四 ..... (base * 4) / 1000
    千分の二 ..... (base * 2) / 1000
  定額型 42 件: 1,000 〜 300,000 円（一件・一箇所・一個あたり）。

The 課税標準 (`base`), 件数, 箇所数, 区域数 are caller-established in both the
implementation and this spec; no eligibility Bool enters any formula. Rounding is
floor (切り捨て). Scope boundaries identical to the implementation
(二十四（一）イ〜チ, 二十五（三）, 他の号・条文 are NOT YET COVERED).
-/

namespace JapanTaxLaw.RegistryForeignCompanyFees

open JapanTaxLaw.TaxFinance

/-! === 独立整数定式: 割合型 (base * X) / 1000 === -/
/-- Spec: 二十三（七） 権利の処分の制限の登録 — 千分の四。 -/
def specFishingRightLienPreservationFee (base : Nat) : Nat := (base * 4) / 1000
/-- Spec: 二十三（十）イ 先取特権又は抵当権の信託の登録 — 千分の二。 -/
def specFishingRightLienTrustFee (base : Nat) : Nat := (base * 2) / 1000

/-! === 独立整数定式: 定額 42 件 === -/
def specMiningAreaChangeRegistrationFeePerArea : Nat := 1000
def specMiningAreaCancellationFeePerArea : Nat := 1000
def specFishingRightTransferByInheritanceOrMergerFeePerCase : Nat := 1800
def specFishingRightTransferOtherFeePerCase : Nat := 9000
def specFishingRightShareTransferByInheritanceOrMergerFeePerCase : Nat := 1500
def specFishingRightShareTransferOtherFeePerCase : Nat := 3000
def specAnglingRightEstablishmentFeePerCase : Nat := 6000
def specAnglingRightPreservationFeePerCase : Nat := 1500
def specAnglingRightTransferByInheritanceOrMergerFeePerCase : Nat := 1500
def specAnglingRightTransferOtherFeePerCase : Nat := 4500
def specAnglingRightShareTransferByInheritanceOrMergerFeePerCase : Nat := 1500
def specAnglingRightShareTransferOtherFeePerCase : Nat := 3000
def specLienOrMortgageTransferByInheritanceOrMergerFeePerCase : Nat := 1500
def specLienOrMortgageTransferOtherFeePerCase : Nat := 3000
def specMortgageRankChangeFeePerCase : Nat := 1000
def specNonLienOrMortgageRightTrustFeePerCase : Nat := 4500
def specFishingIncidentalOrRestorationOrCorrectionFeePerCase : Nat := 1000
def specFishingRightCancellationFeePerCase : Nat := 1000
def specMutualCompanyEstablishmentFeePerApplication : Nat := 300000
def specNewShareOptionIssuanceChangeFeePerApplication : Nat := 90000
def specBranchOrSubsidiaryOfficeEstablishmentFeePerOffice : Nat := 60000
def specHeadOrBranchOfficeRelocationFeePerOffice : Nat := 30000
def specBoardAndCommitteeMatterChangeFeePerApplication : Nat := 30000
def specDirectorAndOfficerMatterChangeFeePerApplication : Nat := 30000
def specDirectorAndOfficerMatterChangeSmallCapitalFeePerApplication : Nat := 10000
def specManagerAppointmentOrAgencyRevocationFeePerApplication : Nat := 30000
def specDirectorDutySuspensionOrSubstituteAppointmentFeePerApplication : Nat := 30000
def specCompanyDissolutionFeePerApplication : Nat := 30000
def specCompanyContinuationOrRestorationFeePerApplication : Nat := 30000
def specCompanyMiscRegistrationChangeFeePerApplication : Nat := 30000
def specCompanyCorrectionFeePerApplication : Nat := 20000
def specCompanyCancellationFeePerApplication : Nat := 20000
def specForeignCompanyBusinessOfficeEstablishmentFeePerOffice : Nat := 90000
def specForeignCompanyWithoutBusinessOfficeRegistrationFeePerApplication : Nat := 60000
def specForeignCompanyOtherRegistrationFeePerApplication : Nat := 9000
def specForeignCompanyCorrectionOrCancellationFeePerApplication : Nat := 6000
def specForeignCompanyLiquidatorAppointmentFeePerApplication : Nat := 9000
def specForeignCompanyLiquidatorDutySuspensionFeePerApplication : Nat := 6000
def specForeignCompanyLiquidationCompletionFeePerApplication : Nat := 2000
def specForeignCompanyLiquidationMiscFeePerApplication : Nat := 6000
def specSpecialPurposeCompanyEstablishmentFeePerApplication : Nat := 30000
def specSpecialPurposeCompanyOtherRegistrationFeePerApplication : Nat := 15000

-- ==== 独立定式の smoke（kernel-decide） ====
example : specFishingRightLienPreservationFee 0 = 0 := by decide
example : specFishingRightLienPreservationFee 1000 = 4 := by decide
example : specFishingRightLienTrustFee 0 = 0 := by decide
example : specFishingRightLienTrustFee 1000 = 2 := by decide
example : specMiningAreaChangeRegistrationFeePerArea = 1000 := by decide
example : specMiningAreaCancellationFeePerArea = 1000 := by decide
example : specFishingRightTransferByInheritanceOrMergerFeePerCase = 1800 := by decide
example : specFishingRightTransferOtherFeePerCase = 9000 := by decide
example : specFishingRightShareTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : specFishingRightShareTransferOtherFeePerCase = 3000 := by decide
example : specAnglingRightEstablishmentFeePerCase = 6000 := by decide
example : specAnglingRightPreservationFeePerCase = 1500 := by decide
example : specAnglingRightTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : specAnglingRightTransferOtherFeePerCase = 4500 := by decide
example : specAnglingRightShareTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : specAnglingRightShareTransferOtherFeePerCase = 3000 := by decide
example : specLienOrMortgageTransferByInheritanceOrMergerFeePerCase = 1500 := by decide
example : specLienOrMortgageTransferOtherFeePerCase = 3000 := by decide
example : specMortgageRankChangeFeePerCase = 1000 := by decide
example : specNonLienOrMortgageRightTrustFeePerCase = 4500 := by decide
example : specFishingIncidentalOrRestorationOrCorrectionFeePerCase = 1000 := by decide
example : specFishingRightCancellationFeePerCase = 1000 := by decide
example : specMutualCompanyEstablishmentFeePerApplication = 300000 := by decide
example : specNewShareOptionIssuanceChangeFeePerApplication = 90000 := by decide
example : specBranchOrSubsidiaryOfficeEstablishmentFeePerOffice = 60000 := by decide
example : specHeadOrBranchOfficeRelocationFeePerOffice = 30000 := by decide
example : specBoardAndCommitteeMatterChangeFeePerApplication = 30000 := by decide
example : specDirectorAndOfficerMatterChangeFeePerApplication = 30000 := by decide
example : specDirectorAndOfficerMatterChangeSmallCapitalFeePerApplication = 10000 := by decide
example : specManagerAppointmentOrAgencyRevocationFeePerApplication = 30000 := by decide
example : specDirectorDutySuspensionOrSubstituteAppointmentFeePerApplication = 30000 := by decide
example : specCompanyDissolutionFeePerApplication = 30000 := by decide
example : specCompanyContinuationOrRestorationFeePerApplication = 30000 := by decide
example : specCompanyMiscRegistrationChangeFeePerApplication = 30000 := by decide
example : specCompanyCorrectionFeePerApplication = 20000 := by decide
example : specCompanyCancellationFeePerApplication = 20000 := by decide
example : specForeignCompanyBusinessOfficeEstablishmentFeePerOffice = 90000 := by decide
example : specForeignCompanyWithoutBusinessOfficeRegistrationFeePerApplication = 60000 := by decide
example : specForeignCompanyOtherRegistrationFeePerApplication = 9000 := by decide
example : specForeignCompanyCorrectionOrCancellationFeePerApplication = 6000 := by decide
example : specForeignCompanyLiquidatorAppointmentFeePerApplication = 9000 := by decide
example : specForeignCompanyLiquidatorDutySuspensionFeePerApplication = 6000 := by decide
example : specForeignCompanyLiquidationCompletionFeePerApplication = 2000 := by decide
example : specForeignCompanyLiquidationMiscFeePerApplication = 6000 := by decide
example : specSpecialPurposeCompanyEstablishmentFeePerApplication = 30000 := by decide
example : specSpecialPurposeCompanyOtherRegistrationFeePerApplication = 15000 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryForeignCompanyFees : Bool :=
  let g : List Nat := [0, 1, 39, 40, 66, 67, 99, 100, 249, 250, 333, 334, 499, 500,
                       999, 1000, 1001, 12345, 100000, 1000000]
  g.all (fun n => fishingRightLienPreservationFee n == specFishingRightLienPreservationFee n) &&
  g.all (fun n => fishingRightLienTrustFee n == specFishingRightLienTrustFee n) &&
  miningAreaChangeRegistrationFeePerArea == specMiningAreaChangeRegistrationFeePerArea &&
  miningAreaCancellationFeePerArea == specMiningAreaCancellationFeePerArea &&
  fishingRightTransferByInheritanceOrMergerFeePerCase == specFishingRightTransferByInheritanceOrMergerFeePerCase &&
  fishingRightTransferOtherFeePerCase == specFishingRightTransferOtherFeePerCase &&
  fishingRightShareTransferByInheritanceOrMergerFeePerCase == specFishingRightShareTransferByInheritanceOrMergerFeePerCase &&
  fishingRightShareTransferOtherFeePerCase == specFishingRightShareTransferOtherFeePerCase &&
  anglingRightEstablishmentFeePerCase == specAnglingRightEstablishmentFeePerCase &&
  anglingRightPreservationFeePerCase == specAnglingRightPreservationFeePerCase &&
  anglingRightTransferByInheritanceOrMergerFeePerCase == specAnglingRightTransferByInheritanceOrMergerFeePerCase &&
  anglingRightTransferOtherFeePerCase == specAnglingRightTransferOtherFeePerCase &&
  anglingRightShareTransferByInheritanceOrMergerFeePerCase == specAnglingRightShareTransferByInheritanceOrMergerFeePerCase &&
  anglingRightShareTransferOtherFeePerCase == specAnglingRightShareTransferOtherFeePerCase &&
  lienOrMortgageTransferByInheritanceOrMergerFeePerCase == specLienOrMortgageTransferByInheritanceOrMergerFeePerCase &&
  lienOrMortgageTransferOtherFeePerCase == specLienOrMortgageTransferOtherFeePerCase &&
  mortgageRankChangeFeePerCase == specMortgageRankChangeFeePerCase &&
  nonLienOrMortgageRightTrustFeePerCase == specNonLienOrMortgageRightTrustFeePerCase &&
  fishingIncidentalOrRestorationOrCorrectionFeePerCase == specFishingIncidentalOrRestorationOrCorrectionFeePerCase &&
  fishingRightCancellationFeePerCase == specFishingRightCancellationFeePerCase &&
  mutualCompanyEstablishmentFeePerApplication == specMutualCompanyEstablishmentFeePerApplication &&
  newShareOptionIssuanceChangeFeePerApplication == specNewShareOptionIssuanceChangeFeePerApplication &&
  branchOrSubsidiaryOfficeEstablishmentFeePerOffice == specBranchOrSubsidiaryOfficeEstablishmentFeePerOffice &&
  headOrBranchOfficeRelocationFeePerOffice == specHeadOrBranchOfficeRelocationFeePerOffice &&
  boardAndCommitteeMatterChangeFeePerApplication == specBoardAndCommitteeMatterChangeFeePerApplication &&
  directorAndOfficerMatterChangeFeePerApplication == specDirectorAndOfficerMatterChangeFeePerApplication &&
  directorAndOfficerMatterChangeSmallCapitalFeePerApplication == specDirectorAndOfficerMatterChangeSmallCapitalFeePerApplication &&
  managerAppointmentOrAgencyRevocationFeePerApplication == specManagerAppointmentOrAgencyRevocationFeePerApplication &&
  directorDutySuspensionOrSubstituteAppointmentFeePerApplication == specDirectorDutySuspensionOrSubstituteAppointmentFeePerApplication &&
  companyDissolutionFeePerApplication == specCompanyDissolutionFeePerApplication &&
  companyContinuationOrRestorationFeePerApplication == specCompanyContinuationOrRestorationFeePerApplication &&
  companyMiscRegistrationChangeFeePerApplication == specCompanyMiscRegistrationChangeFeePerApplication &&
  companyCorrectionFeePerApplication == specCompanyCorrectionFeePerApplication &&
  companyCancellationFeePerApplication == specCompanyCancellationFeePerApplication &&
  foreignCompanyBusinessOfficeEstablishmentFeePerOffice == specForeignCompanyBusinessOfficeEstablishmentFeePerOffice &&
  foreignCompanyWithoutBusinessOfficeRegistrationFeePerApplication == specForeignCompanyWithoutBusinessOfficeRegistrationFeePerApplication &&
  foreignCompanyOtherRegistrationFeePerApplication == specForeignCompanyOtherRegistrationFeePerApplication &&
  foreignCompanyCorrectionOrCancellationFeePerApplication == specForeignCompanyCorrectionOrCancellationFeePerApplication &&
  foreignCompanyLiquidatorAppointmentFeePerApplication == specForeignCompanyLiquidatorAppointmentFeePerApplication &&
  foreignCompanyLiquidatorDutySuspensionFeePerApplication == specForeignCompanyLiquidatorDutySuspensionFeePerApplication &&
  foreignCompanyLiquidationCompletionFeePerApplication == specForeignCompanyLiquidationCompletionFeePerApplication &&
  foreignCompanyLiquidationMiscFeePerApplication == specForeignCompanyLiquidationMiscFeePerApplication &&
  specialPurposeCompanyEstablishmentFeePerApplication == specSpecialPurposeCompanyEstablishmentFeePerApplication &&
  specialPurposeCompanyOtherRegistrationFeePerApplication == specSpecialPurposeCompanyOtherRegistrationFeePerApplication

example : agreeRegistryForeignCompanyFees = true := by decide

end JapanTaxLaw.RegistryForeignCompanyFees
