import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP2B — 登録免許税法 別表第一（二）第三十二号 六十九〜七十五 の flat fee モデル (W-B)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  section 開始マーカー: "三十二　人の資格の登録若しくは認定又は技能証明"（\u3000 は全角空白）

Models 別表第一（二）第三十二号 の 六十九〜七十五 の flat fee 項目（pinned raw bytes 逐語）:

  六十九（一）〜（十） 放射性同位元素等に係る各登録 ... 一件につき九万円
  六十九の二 特定先端大型研究施設に係る登録施設利用促進機関の登録 ... 一件につき九万円
  六十九の三 児童生徒等の災害に係る共済事業の認可 ... 一件につき十五万円
  七十（一）〜（四） 水道事業の認可等・水道用水供給事業の認可・登録水質検査機関／
                     登録簡易専用水道検査機関の登録 ... 一件につき九万円
  七十一 食品等の製品検査に係る登録検査機関の登録 ... 一件につき十五万円
  七十二 削除（金額なし。fee def を作らない）
  七十三 販売に供する食品の特別用途表示に係る登録試験機関の登録 ... 一件につき十五万円
  七十四 業として行う採血の許可 ... 一件につき十五万円
  七十五 業として行う臓器のあつせんの許可 ... 一件につき九万円

Scope & honest boundaries:

* 一件につき／一箇所につきの固定額であることを検証するのみ。登録・認可・許可の
  要件・適用・更新の有無・政令で定めるものの該当性は caller-established とし、
  ここではモデル化しない。
* 特に 七十（一）（二）の「政令で定めるものに限る」「変更の認可」、および各項の
  「更新の登録を除く。」は適用判定ゲートであり、金額定数には反映しない。
* 七十二 は原文で「削除」であり金額规定がない。よって fee def も needle も作らない。
* 別表第一（二）第三十二号 の 七十六 以降は未モデル化につき未検査（NOT YET COVERED）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 六十九（一） 第十二条の二第一項（登録認証機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riCertificationBodyRegFee : Money := 90_000

/-- 六十九（二） 第十二条の八第一項（登録検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riInspectionBodyRegFee : Money := 90_000

/-- 六十九（三） 第十二条の十（登録定期確認機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riPeriodicConfirmRegFee : Money := 90_000

/-- 六十九（四） 第十八条第二項（登録運搬方法確認機関の登録）の登録運搬方法確認機関に係る登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riTransportMethodRegFee : Money := 90_000

/-- 六十九（五） 第十八条第二項の登録運搬物確認機関に係る登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riTransportGoodsRegFee : Money := 90_000

/-- 六十九（六） 第十九条の二第二項（登録埋設確認機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riBurialConfirmRegFee : Money := 90_000

/-- 六十九（七） 第三十三条の三第一項（登録濃度確認機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riConcentrationRegFee : Money := 90_000

/-- 六十九（八） 第三十五条第二項（登録試験機関の登録）の登録試験機関に係る登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riTestBodyRegFee : Money := 90_000

/-- 六十九（九） 第三十五条第二項の登録資格講習機関に係る登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riQualCourseRegFee : Money := 90_000

/-- 六十九（十） 第三十六条の二第一項（登録放射線取扱主任者定期講習機関の登録）（同法第三十八条の三において準用する場合を含む。）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def riRadWorkerCourseRegFee : Money := 90_000

/-- 六十九の二 特定先端大型研究施設の共用の促進に関する法律第八条第一項（登録施設利用促進機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def researchFacilityPromoterRegFee : Money := 90_000

/-- 六十九の三 ＰＴＡ・青少年教育団体共済法第三条（認可）の文部科学大臣がする共済事業の認可の件数につきの額（固定 ¥150,000）。 -/
def schoolDisasterMutualAidApprovalFee : Money := 150_000

/-- 七十（一） 水道法第六条第一項の水道事業の認可（政令で定めるものに限る。）又は同法第十条第一項の給水区域の拡張に係る変更の認可（政令で定めるものに限る。）の件数につきの額（固定 ¥90,000）。該当性は caller-established。 -/
def waterworksApprovalFee : Money := 90_000

/-- 七十（二） 水道法第二十六条の水道用水供給事業の認可又は同法第三十条第一項の給水対象の増加に係る変更の認可（政令で定めるものに限る。）の件数につきの額（固定 ¥90,000）。該当性は caller-established。 -/
def waterSupplyApprovalFee : Money := 90_000

/-- 七十（三） 水道法第二十条第三項（登録水質検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def waterQualityLabRegFee : Money := 90_000

/-- 七十（四） 水道法第三十四条の二第二項（登録簡易専用水道検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def simpleWaterLabRegFee : Money := 90_000

/-- 七十一 食品衛生法第四条第九項（登録検査機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥150,000）。 -/
def foodProductLabRegFee : Money := 150_000

/-- 七十三 健康増進法第四十三条第三項（登録試験機関の登録）の登録（更新の登録を除く。）の件数につきの額（固定 ¥150,000）。七十二 は「削除」のため金額なし。 -/
def specialUseLabelLabRegFee : Money := 150_000

/-- 七十四 安全な血液製剤の安定供給の確保等に関する法律第十三条第一項（業として行う採血の許可）の規定による業として行う採血の許可の件数につきの額（固定 ¥150,000）。 -/
def bloodCollectionPermitFee : Money := 150_000

/-- 七十五 臓器の移植に関する法律第十二条第一項（業として行う臓器のあつせんの許可）の規定による業として行う臓器のあつせんの許可の件数につきの額（固定 ¥90,000）。 -/
def organBrokeragePermitFee : Money := 90_000

theorem riCertificationBodyRegFee_pos : riCertificationBodyRegFee > 0 := by decide
theorem riInspectionBodyRegFee_pos : riInspectionBodyRegFee > 0 := by decide
theorem riPeriodicConfirmRegFee_pos : riPeriodicConfirmRegFee > 0 := by decide
theorem riTransportMethodRegFee_pos : riTransportMethodRegFee > 0 := by decide
theorem riTransportGoodsRegFee_pos : riTransportGoodsRegFee > 0 := by decide
theorem riBurialConfirmRegFee_pos : riBurialConfirmRegFee > 0 := by decide
theorem riConcentrationRegFee_pos : riConcentrationRegFee > 0 := by decide
theorem riTestBodyRegFee_pos : riTestBodyRegFee > 0 := by decide
theorem riQualCourseRegFee_pos : riQualCourseRegFee > 0 := by decide
theorem riRadWorkerCourseRegFee_pos : riRadWorkerCourseRegFee > 0 := by decide
theorem researchFacilityPromoterRegFee_pos : researchFacilityPromoterRegFee > 0 := by decide
theorem schoolDisasterMutualAidApprovalFee_pos : schoolDisasterMutualAidApprovalFee > 0 := by decide
theorem waterworksApprovalFee_pos : waterworksApprovalFee > 0 := by decide
theorem waterSupplyApprovalFee_pos : waterSupplyApprovalFee > 0 := by decide
theorem waterQualityLabRegFee_pos : waterQualityLabRegFee > 0 := by decide
theorem simpleWaterLabRegFee_pos : simpleWaterLabRegFee > 0 := by decide
theorem foodProductLabRegFee_pos : foodProductLabRegFee > 0 := by decide
theorem specialUseLabelLabRegFee_pos : specialUseLabelLabRegFee > 0 := by decide
theorem bloodCollectionPermitFee_pos : bloodCollectionPermitFee > 0 := by decide
theorem organBrokeragePermitFee_pos : organBrokeragePermitFee > 0 := by decide

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
example : researchFacilityPromoterRegFee = 90_000 := by decide
example : schoolDisasterMutualAidApprovalFee = 150_000 := by decide
example : waterworksApprovalFee = 90_000 := by decide
example : waterSupplyApprovalFee = 90_000 := by decide
example : waterQualityLabRegFee = 90_000 := by decide
example : simpleWaterLabRegFee = 90_000 := by decide
example : foodProductLabRegFee = 150_000 := by decide
example : specialUseLabelLabRegFee = 150_000 := by decide
example : bloodCollectionPermitFee = 150_000 := by decide
example : organBrokeragePermitFee = 90_000 := by decide

end JapanTaxLaw
