import JapanTaxLaw.RegistryCorporateSecurityFees

/-!
# RegistryCorporateSecurityFeesSpec — 別表第一（二）六〜六の二・七〜九の独立整数定式

Source (pinned; identical to RegistryCorporateSecurityFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of the statutory fee amounts as plain Nat arithmetic,
**not** reusing the implementation's `TaxRate.applyFloor` helper:

  割合型 19 件（課税標準基準、切り捨て）:
    千分の二・五 ..... (base * 25) / 10000  （pinned モデル num=25, den=10000）
    千分の一・五 ..... (base * 15) / 10000  （pinned モデル num=15, den=10000）
    千分の三 ......... (base * 3) / 1000   （num=3, den=1000）
  定額型 24 件: 6,000 / 30,000 / 1,000 / 15,000 / 7,500 円（一件・一個・一両あたり）。

The 課税標準 (`base`) is caller-established in both the implementation and this
spec; no eligibility Bool enters any formula. Rounding is floor (切り捨て).
Scope boundaries identical to the implementation (other 号・条文 are NOT YET COVERED).
-/

namespace JapanTaxLaw.RegistryCorporateSecurityFees

open JapanTaxLaw.TaxFinance

/-! === 独立整数定式: 割合型 (base * X) / 1000 === -/
/-- Spec: 六（一） 企業担保権の設定の登記 — 債権金額千分の二・五（pinned モデル num=25, den=10000）。 -/
def specCorporateSecurityEstablishmentFee (base : Nat) : Nat := (base * 25) / 10000
/-- Spec: 六（二） 企業担保権の移転の登記 — 債権金額千分の一・五（pinned モデル num=15, den=10000）。 -/
def specCorporateSecurityTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 六（四） 信託の登記 — 債権金額千分の一・五（pinned モデル num=15, den=10000）。 -/
def specCorporateSecurityTrustFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 七（一） 抵当権の設定又は強制競売若しくは強制管理の申立ての登録 — 債権金額又は極度金額千分の二・五（num=25, den=10000）。 -/
def specRailwayFoundationMortgageEstablishmentFee (base : Nat) : Nat := (base * 25) / 10000
/-- Spec: 七（二） 抵当権の移転の登録 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specRailwayFoundationMortgageTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 七（三） 根抵当権の一部譲渡又は法人の分割による移転の登録 — 一部譲渡又は分割後の共有者の数で極度金額を除して計算した金額千分の一・五（num=15, den=10000）。 -/
def specRailwayFoundationRootMortgagePartialTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 七（五） 信託の登録 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specRailwayFoundationTrustFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（一）イ 農業用動産の抵当権の設定の登記 — 債権金額又は極度金額千分の三（num=3, den=1000）。 -/
def specAgriculturalMovableMortgageEstablishmentFee (base : Nat) : Nat := (base * 3) / 1000
/-- Spec: 八（一）ロ 農業用動産の抵当権の移転の登記 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specAgriculturalMovableMortgageTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（一）ハ 農業用動産の根抵当権の一部譲渡又は法人の分割による移転の登記 — 計算した金額千分の一・五（num=15, den=10000）。 -/
def specAgriculturalMovableRootMortgagePartialTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（一）ホ 農業用動産の抵当権の信託の登記 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specAgriculturalMovableMortgageTrustFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（二）イ 建設機械の抵当権の設定の登記 — 債権金額又は極度金額千分の三（num=3, den=1000）。 -/
def specConstructionMachineryMortgageEstablishmentFee (base : Nat) : Nat := (base * 3) / 1000
/-- Spec: 八（二）ロ 建設機械の抵当権の移転の登記 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specConstructionMachineryMortgageTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（二）ハ 建設機械の根抵当権の一部譲渡又は法人の分割による移転の登記 — 計算した金額千分の一・五（num=15, den=10000）。 -/
def specConstructionMachineryRootMortgagePartialTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（二）ホ 建設機械の抵当権の信託の登記 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specConstructionMachineryMortgageTrustFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（三）イ 自動車の抵当権の設定の登録 — 債権金額又は極度金額千分の三（num=3, den=1000）。 -/
def specAutomobileMortgageEstablishmentFee (base : Nat) : Nat := (base * 3) / 1000
/-- Spec: 八（三）ロ 自動車の抵当権の移転の登録 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specAutomobileMortgageTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（三）ハ 自動車の根抵当権の一部譲渡又は法人の分割による移転の登録 — 計算した金額千分の一・五（num=15, den=10000）。 -/
def specAutomobileRootMortgagePartialTransferFee (base : Nat) : Nat := (base * 15) / 10000
/-- Spec: 八（三）ニ 自動車の抵当権の信託の登録 — 債権金額又は極度金額千分の一・五（num=15, den=10000）。 -/
def specAutomobileMortgageTrustFee (base : Nat) : Nat := (base * 15) / 10000

/-! === 独立整数定式: 定額 24 件 === -/
/-- Spec: 六（三） 企業担保権の順位の変更の登記 — 企業担保権の件数一件につき六千円（¥6,000）。 -/
def specCorporateSecurityRankChangeFeePerCase : Nat := 6000
/-- Spec: 六（五） 付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 申請件数一件につき六千円（¥6,000）。 -/
def specCorporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication : Nat := 6000
/-- Spec: 六（六） 登記の抹消 — 申請件数一件につき六千円（¥6,000）。 -/
def specCorporateSecurityCancellationFeePerApplication : Nat := 6000
/-- Spec: 六の二（一） 企業価値担保権の設定の登記 — 企業価値担保権の件数一件につき三万円（¥30,000）。 -/
def specEnterpriseValueSecurityEstablishmentFeePerCase : Nat := 30000
/-- Spec: 六の二（二） 企業価値担保権の移転の登記 — 企業価値担保権の件数一件につき六千円（¥6,000）。 -/
def specEnterpriseValueSecurityTransferFeePerCase : Nat := 6000
/-- Spec: 六の二（三） 企業価値担保権の順位の変更の登記 — 企業価値担保権の件数一件につき六千円（¥6,000）。 -/
def specEnterpriseValueSecurityRankChangeFeePerCase : Nat := 6000
/-- Spec: 六の二（四） 信託の登記 — 企業価値担保権の件数一件につき六千円（¥6,000）。 -/
def specEnterpriseValueSecurityTrustFeePerCase : Nat := 6000
/-- Spec: 六の二（五） 付記登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 申請件数一件につき六千円（¥6,000）。 -/
def specEnterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication : Nat := 6000
/-- Spec: 六の二（六） 登記の抹消 — 申請件数一件につき六千円（¥6,000）。 -/
def specEnterpriseValueSecurityCancellationFeePerApplication : Nat := 6000
/-- Spec: 七（四） 抵当権の順位の変更の登録 — 抵当権の件数一件につき六千円（¥6,000）。 -/
def specRailwayFoundationMortgageRankChangeFeePerCase : Nat := 6000
/-- Spec: 七（六） 付記登録又は登録の更正若しくは変更の登録 — 財団の数一個につき六千円（¥6,000）。 -/
def specRailwayFoundationIncidentalOrCorrectionFeePerFoundation : Nat := 6000
/-- Spec: 七（七） 登録の抹消 — 財団の数一個につき六千円（¥6,000）。 -/
def specRailwayFoundationCancellationFeePerFoundation : Nat := 6000
/-- Spec: 八（一）ニ 農業用動産の抵当権の順位の変更の登記 — 抵当権の件数一件につき千円（¥1,000）。 -/
def specAgriculturalMovableMortgageRankChangeFeePerCase : Nat := 1000
/-- Spec: 八（一）ヘ 付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 申請件数一件につき千円（¥1,000）。 -/
def specAgriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication : Nat := 1000
/-- Spec: 八（一）ト 登記の抹消 — 申請件数一件につき千円（¥1,000）。 -/
def specAgriculturalMovableCancellationFeePerApplication : Nat := 1000
/-- Spec: 八（二）ニ 建設機械の抵当権の順位の変更の登記 — 抵当権の件数一件につき千円（¥1,000）。 -/
def specConstructionMachineryMortgageRankChangeFeePerCase : Nat := 1000
/-- Spec: 八（二）ヘ 付記登記、仮登記、抹消された登記の回復の登記又は登記事項の更正若しくは変更の登記 — 建設機械の数一個につき千円（¥1,000）。 -/
def specConstructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit : Nat := 1000
/-- Spec: 八（二）ト 登記の抹消 — 建設機械の数一個につき千円（¥1,000）。 -/
def specConstructionMachineryCancellationFeePerUnit : Nat := 1000
/-- Spec: 八（三）ホ 抹消した登録の回復の登録又は登録の更正若しくは変更の登録 — 自動車の数一両につき千円（¥1,000）。 -/
def specAutomobileRestorationOrCorrectionFeePerVehicle : Nat := 1000
/-- Spec: 八（三）ヘ 登録の抹消 — 自動車の数一両につき千円（¥1,000）。 -/
def specAutomobileCancellationFeePerVehicle : Nat := 1000
/-- Spec: 九（一） 動産の譲渡の登記 — 申請件数一件につき一万五千円（¥15,000）。 -/
def specMovableTransferFeePerApplication : Nat := 15000
/-- Spec: 九（二） 債権の譲渡又は質権の設定の登記 — 申請件数一件につき一万五千円（¥15,000）。 -/
def specClaimTransferOrPledgeEstablishmentFeePerApplication : Nat := 15000
/-- Spec: 九（三） （一）又は（二）に掲げる登記の存続期間を延長する登記 — 申請件数一件につき七千五百円（¥7,500）。 -/
def specTermExtensionFeePerApplication : Nat := 7500
/-- Spec: 九（四） 登記の抹消 — 申請件数一件につき千円（¥1,000）。 -/
def specMovableOrClaimRegistrationCancellationFeePerApplication : Nat := 1000

-- ==== 独立定式の smoke（kernel-decide） ====
example : specCorporateSecurityEstablishmentFee 1000 = 2 := by decide
example : specCorporateSecurityTransferFee 1000 = 1 := by decide
example : specCorporateSecurityTrustFee 1000 = 1 := by decide
example : specRailwayFoundationMortgageEstablishmentFee 1000 = 2 := by decide
example : specRailwayFoundationMortgageTransferFee 1000 = 1 := by decide
example : specRailwayFoundationRootMortgagePartialTransferFee 1000 = 1 := by decide
example : specRailwayFoundationTrustFee 1000 = 1 := by decide
example : specAgriculturalMovableMortgageEstablishmentFee 1000 = 3 := by decide
example : specAgriculturalMovableMortgageTransferFee 1000 = 1 := by decide
example : specAgriculturalMovableRootMortgagePartialTransferFee 1000 = 1 := by decide
example : specAgriculturalMovableMortgageTrustFee 1000 = 1 := by decide
example : specConstructionMachineryMortgageEstablishmentFee 1000 = 3 := by decide
example : specConstructionMachineryMortgageTransferFee 1000 = 1 := by decide
example : specConstructionMachineryRootMortgagePartialTransferFee 1000 = 1 := by decide
example : specConstructionMachineryMortgageTrustFee 1000 = 1 := by decide
example : specAutomobileMortgageEstablishmentFee 1000 = 3 := by decide
example : specAutomobileMortgageTransferFee 1000 = 1 := by decide
example : specAutomobileRootMortgagePartialTransferFee 1000 = 1 := by decide
example : specAutomobileMortgageTrustFee 1000 = 1 := by decide
example : specCorporateSecurityRankChangeFeePerCase = 6000 := by decide
example : specCorporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication = 6000 := by decide
example : specCorporateSecurityCancellationFeePerApplication = 6000 := by decide
example : specEnterpriseValueSecurityEstablishmentFeePerCase = 30000 := by decide
example : specEnterpriseValueSecurityTransferFeePerCase = 6000 := by decide
example : specEnterpriseValueSecurityRankChangeFeePerCase = 6000 := by decide
example : specEnterpriseValueSecurityTrustFeePerCase = 6000 := by decide
example : specEnterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication = 6000 := by decide
example : specEnterpriseValueSecurityCancellationFeePerApplication = 6000 := by decide
example : specRailwayFoundationMortgageRankChangeFeePerCase = 6000 := by decide
example : specRailwayFoundationIncidentalOrCorrectionFeePerFoundation = 6000 := by decide
example : specRailwayFoundationCancellationFeePerFoundation = 6000 := by decide
example : specAgriculturalMovableMortgageRankChangeFeePerCase = 1000 := by decide
example : specAgriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication = 1000 := by decide
example : specAgriculturalMovableCancellationFeePerApplication = 1000 := by decide
example : specConstructionMachineryMortgageRankChangeFeePerCase = 1000 := by decide
example : specConstructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit = 1000 := by decide
example : specConstructionMachineryCancellationFeePerUnit = 1000 := by decide
example : specAutomobileRestorationOrCorrectionFeePerVehicle = 1000 := by decide
example : specAutomobileCancellationFeePerVehicle = 1000 := by decide
example : specMovableTransferFeePerApplication = 15000 := by decide
example : specClaimTransferOrPledgeEstablishmentFeePerApplication = 15000 := by decide
example : specTermExtensionFeePerApplication = 7500 := by decide
example : specMovableOrClaimRegistrationCancellationFeePerApplication = 1000 := by decide

/-- 実装と独立整数定式の有限グリッド一致（`==` 比較、法的等価証明ではない）。 -/
def agreeRegistryCorporateSecurityFees : Bool :=
  let g : List Nat := [0, 1, 39, 40, 66, 67, 99, 100, 249, 250, 333, 334, 499, 500,
                       999, 1000, 1001, 12345, 100000, 1000000]
  g.all (fun n => corporateSecurityEstablishmentFee n == specCorporateSecurityEstablishmentFee n) &&
  g.all (fun n => corporateSecurityTransferFee n == specCorporateSecurityTransferFee n) &&
  g.all (fun n => corporateSecurityTrustFee n == specCorporateSecurityTrustFee n) &&
  g.all (fun n => railwayFoundationMortgageEstablishmentFee n == specRailwayFoundationMortgageEstablishmentFee n) &&
  g.all (fun n => railwayFoundationMortgageTransferFee n == specRailwayFoundationMortgageTransferFee n) &&
  g.all (fun n => railwayFoundationRootMortgagePartialTransferFee n == specRailwayFoundationRootMortgagePartialTransferFee n) &&
  g.all (fun n => railwayFoundationTrustFee n == specRailwayFoundationTrustFee n) &&
  g.all (fun n => agriculturalMovableMortgageEstablishmentFee n == specAgriculturalMovableMortgageEstablishmentFee n) &&
  g.all (fun n => agriculturalMovableMortgageTransferFee n == specAgriculturalMovableMortgageTransferFee n) &&
  g.all (fun n => agriculturalMovableRootMortgagePartialTransferFee n == specAgriculturalMovableRootMortgagePartialTransferFee n) &&
  g.all (fun n => agriculturalMovableMortgageTrustFee n == specAgriculturalMovableMortgageTrustFee n) &&
  g.all (fun n => constructionMachineryMortgageEstablishmentFee n == specConstructionMachineryMortgageEstablishmentFee n) &&
  g.all (fun n => constructionMachineryMortgageTransferFee n == specConstructionMachineryMortgageTransferFee n) &&
  g.all (fun n => constructionMachineryRootMortgagePartialTransferFee n == specConstructionMachineryRootMortgagePartialTransferFee n) &&
  g.all (fun n => constructionMachineryMortgageTrustFee n == specConstructionMachineryMortgageTrustFee n) &&
  g.all (fun n => automobileMortgageEstablishmentFee n == specAutomobileMortgageEstablishmentFee n) &&
  g.all (fun n => automobileMortgageTransferFee n == specAutomobileMortgageTransferFee n) &&
  g.all (fun n => automobileRootMortgagePartialTransferFee n == specAutomobileRootMortgagePartialTransferFee n) &&
  g.all (fun n => automobileMortgageTrustFee n == specAutomobileMortgageTrustFee n) &&
  corporateSecurityRankChangeFeePerCase == specCorporateSecurityRankChangeFeePerCase &&
  corporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication == specCorporateSecurityIncidentalOrRestorationOrCorrectionFeePerApplication &&
  corporateSecurityCancellationFeePerApplication == specCorporateSecurityCancellationFeePerApplication &&
  enterpriseValueSecurityEstablishmentFeePerCase == specEnterpriseValueSecurityEstablishmentFeePerCase &&
  enterpriseValueSecurityTransferFeePerCase == specEnterpriseValueSecurityTransferFeePerCase &&
  enterpriseValueSecurityRankChangeFeePerCase == specEnterpriseValueSecurityRankChangeFeePerCase &&
  enterpriseValueSecurityTrustFeePerCase == specEnterpriseValueSecurityTrustFeePerCase &&
  enterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication == specEnterpriseValueSecurityIncidentalOrRestorationOrCorrectionFeePerApplication &&
  enterpriseValueSecurityCancellationFeePerApplication == specEnterpriseValueSecurityCancellationFeePerApplication &&
  railwayFoundationMortgageRankChangeFeePerCase == specRailwayFoundationMortgageRankChangeFeePerCase &&
  railwayFoundationIncidentalOrCorrectionFeePerFoundation == specRailwayFoundationIncidentalOrCorrectionFeePerFoundation &&
  railwayFoundationCancellationFeePerFoundation == specRailwayFoundationCancellationFeePerFoundation &&
  agriculturalMovableMortgageRankChangeFeePerCase == specAgriculturalMovableMortgageRankChangeFeePerCase &&
  agriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication == specAgriculturalMovableIncidentalOrRestorationOrCorrectionFeePerApplication &&
  agriculturalMovableCancellationFeePerApplication == specAgriculturalMovableCancellationFeePerApplication &&
  constructionMachineryMortgageRankChangeFeePerCase == specConstructionMachineryMortgageRankChangeFeePerCase &&
  constructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit == specConstructionMachineryIncidentalOrRestorationOrCorrectionFeePerUnit &&
  constructionMachineryCancellationFeePerUnit == specConstructionMachineryCancellationFeePerUnit &&
  automobileRestorationOrCorrectionFeePerVehicle == specAutomobileRestorationOrCorrectionFeePerVehicle &&
  automobileCancellationFeePerVehicle == specAutomobileCancellationFeePerVehicle &&
  movableTransferFeePerApplication == specMovableTransferFeePerApplication &&
  claimTransferOrPledgeEstablishmentFeePerApplication == specClaimTransferOrPledgeEstablishmentFeePerApplication &&
  termExtensionFeePerApplication == specTermExtensionFeePerApplication &&
  movableOrClaimRegistrationCancellationFeePerApplication == specMovableOrClaimRegistrationCancellationFeePerApplication

example : agreeRegistryCorporateSecurityFees = true := by decide

end JapanTaxLaw.RegistryCorporateSecurityFees
