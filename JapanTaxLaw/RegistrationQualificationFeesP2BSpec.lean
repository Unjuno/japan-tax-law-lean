import JapanTaxLaw.RegistrationQualificationFeesP2B

/-!
# RegistrationQualificationFeesP2B spec — independent restatement of
   登録免許税法 別表第一（二）第三十二号 六十九〜七十五

Sources (pinned; identical to RegistrationQualificationFeesP2B.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 六十九〜七十五 の flat 額 from the statutory text itself.
七十二 は「削除」につき金額なし（spec def を作らない）。

Scope boundaries identical to the implementation (七十六 以降は NOT YET COVERED;
政令で定めるものの該当性等は caller-established).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 六十九（一） 登録認証機関の登録。 -/
def specRiCertificationBodyRegFee : Money := 90_000
/-- Spec: 六十九（二） 登録検査機関の登録。 -/
def specRiInspectionBodyRegFee : Money := 90_000
/-- Spec: 六十九（三） 登録定期確認機関の登録。 -/
def specRiPeriodicConfirmRegFee : Money := 90_000
/-- Spec: 六十九（四） 登録運搬方法確認機関の登録。 -/
def specRiTransportMethodRegFee : Money := 90_000
/-- Spec: 六十九（五） 登録運搬物確認機関の登録。 -/
def specRiTransportGoodsRegFee : Money := 90_000
/-- Spec: 六十九（六） 登録埋設確認機関の登録。 -/
def specRiBurialConfirmRegFee : Money := 90_000
/-- Spec: 六十九（七） 登録濃度確認機関の登録。 -/
def specRiConcentrationRegFee : Money := 90_000
/-- Spec: 六十九（八） 登録試験機関の登録。 -/
def specRiTestBodyRegFee : Money := 90_000
/-- Spec: 六十九（九） 登録資格講習機関の登録。 -/
def specRiQualCourseRegFee : Money := 90_000
/-- Spec: 六十九（十） 登録放射線取扱主任者定期講習機関の登録。 -/
def specRiRadWorkerCourseRegFee : Money := 90_000
/-- Spec: 六十九の二 登録施設利用促進機関の登録。 -/
def specResearchFacilityPromoterRegFee : Money := 90_000
/-- Spec: 六十九の三 児童生徒等の災害に係る共済事業の認可。 -/
def specSchoolDisasterMutualAidApprovalFee : Money := 150_000
/-- Spec: 七十（一） 水道事業の認可・給水区域の変更の認可。 -/
def specWaterworksApprovalFee : Money := 90_000
/-- Spec: 七十（二） 水道用水供給事業の認可・給水対象の変更の認可。 -/
def specWaterSupplyApprovalFee : Money := 90_000
/-- Spec: 七十（三） 登録水質検査機関の登録。 -/
def specWaterQualityLabRegFee : Money := 90_000
/-- Spec: 七十（四） 登録簡易専用水道検査機関の登録。 -/
def specSimpleWaterLabRegFee : Money := 90_000
/-- Spec: 七十一 食品等の製品検査に係る登録検査機関の登録。 -/
def specFoodProductLabRegFee : Money := 150_000
/-- Spec: 七十三 特別用途表示に係る登録試験機関の登録（七十二 は削除）。 -/
def specSpecialUseLabelLabRegFee : Money := 150_000
/-- Spec: 七十四 業として行う採血の許可。 -/
def specBloodCollectionPermitFee : Money := 150_000
/-- Spec: 七十五 業として行う臓器のあつせんの許可。 -/
def specOrganBrokeragePermitFee : Money := 90_000

example : specRiCertificationBodyRegFee = 90_000 := by decide
example : specRiInspectionBodyRegFee = 90_000 := by decide
example : specRiPeriodicConfirmRegFee = 90_000 := by decide
example : specRiTransportMethodRegFee = 90_000 := by decide
example : specRiTransportGoodsRegFee = 90_000 := by decide
example : specRiBurialConfirmRegFee = 90_000 := by decide
example : specRiConcentrationRegFee = 90_000 := by decide
example : specRiTestBodyRegFee = 90_000 := by decide
example : specRiQualCourseRegFee = 90_000 := by decide
example : specRiRadWorkerCourseRegFee = 90_000 := by decide
example : specResearchFacilityPromoterRegFee = 90_000 := by decide
example : specSchoolDisasterMutualAidApprovalFee = 150_000 := by decide
example : specWaterworksApprovalFee = 90_000 := by decide
example : specWaterSupplyApprovalFee = 90_000 := by decide
example : specWaterQualityLabRegFee = 90_000 := by decide
example : specSimpleWaterLabRegFee = 90_000 := by decide
example : specFoodProductLabRegFee = 150_000 := by decide
example : specSpecialUseLabelLabRegFee = 150_000 := by decide
example : specBloodCollectionPermitFee = 150_000 := by decide
example : specOrganBrokeragePermitFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP2B : Bool :=
  specRiCertificationBodyRegFee == riCertificationBodyRegFee &&
  specRiInspectionBodyRegFee == riInspectionBodyRegFee &&
  specRiPeriodicConfirmRegFee == riPeriodicConfirmRegFee &&
  specRiTransportMethodRegFee == riTransportMethodRegFee &&
  specRiTransportGoodsRegFee == riTransportGoodsRegFee &&
  specRiBurialConfirmRegFee == riBurialConfirmRegFee &&
  specRiConcentrationRegFee == riConcentrationRegFee &&
  specRiTestBodyRegFee == riTestBodyRegFee &&
  specRiQualCourseRegFee == riQualCourseRegFee &&
  specRiRadWorkerCourseRegFee == riRadWorkerCourseRegFee &&
  specResearchFacilityPromoterRegFee == researchFacilityPromoterRegFee &&
  specSchoolDisasterMutualAidApprovalFee == schoolDisasterMutualAidApprovalFee &&
  specWaterworksApprovalFee == waterworksApprovalFee &&
  specWaterSupplyApprovalFee == waterSupplyApprovalFee &&
  specWaterQualityLabRegFee == waterQualityLabRegFee &&
  specSimpleWaterLabRegFee == simpleWaterLabRegFee &&
  specFoodProductLabRegFee == foodProductLabRegFee &&
  specSpecialUseLabelLabRegFee == specialUseLabelLabRegFee &&
  specBloodCollectionPermitFee == bloodCollectionPermitFee &&
  specOrganBrokeragePermitFee == organBrokeragePermitFee

example : agreeRegistrationQualificationFeesP2B = true := by decide

end JapanTaxLaw
