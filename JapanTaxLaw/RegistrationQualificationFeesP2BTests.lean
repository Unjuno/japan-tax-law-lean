import JapanTaxLaw.RegistrationQualificationFeesP2B

/-!
# RegistrationQualificationFeesP2B tests — 別表第一（二）第三十二号 六十九〜七十五 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 六十九（一）〜（十） 放射性同位元素等に係る各登録（¥90,000）
example : riCertificationBodyRegFee = 90_000 := by decide
example : riInspectionBodyRegFee = 90_000 := by decide
example : riPeriodicConfirmRegFee = 90_000 := by decide
example : riTransportMethodRegFee = 90_000 := by decide
example : riTransportGoodsRegFee = 90_000 := by decide
example : riBurialConfirmRegFee = 90_000 := by decide
example : riConcentrationRegFee = 90_000 := by decide
example : riTestBodyRegFee = 90_000 := by decide
example : riQualCourseRegFee = 90_000 := by decide
example : riRadWorkerCourseRegFee = 90_000 := by decide
-- 六十九の二 登録施設利用促進機関 ¥90,000 ／ 六十九の三 共済事業の認可 ¥150,000
example : researchFacilityPromoterRegFee = 90_000 := by decide
example : schoolDisasterMutualAidApprovalFee = 150_000 := by decide
-- 七十（一）〜（四） 水道事業認可等・水道用水供給事業認可・水質／簡易専用水道検査機関（¥90,000）
example : waterworksApprovalFee = 90_000 := by decide
example : waterSupplyApprovalFee = 90_000 := by decide
example : waterQualityLabRegFee = 90_000 := by decide
example : simpleWaterLabRegFee = 90_000 := by decide
-- 七十一 食品等製品検査登録検査機関 ¥150,000 ／ 七十二 削除（fee なし）／ 七十三 特別用途表示登録試験機関 ¥150,000
example : foodProductLabRegFee = 150_000 := by decide
example : specialUseLabelLabRegFee = 150_000 := by decide
-- 七十四 業として行う採血の許可 ¥150,000 ／ 七十五 臓器のあつせんの許可 ¥90,000
example : bloodCollectionPermitFee = 150_000 := by decide
example : organBrokeragePermitFee = 90_000 := by decide

end JapanTaxLaw
