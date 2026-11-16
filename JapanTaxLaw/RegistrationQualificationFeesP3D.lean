import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP3D — 登録免許税法 別表第一（二）第三十二号 八十三〜八十九 の flat fee モデル (W-D)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  section 開始マーカー: "三十二　人の資格の登録若しくは認定又は技能証明"（\u3000 は全角空白）

Models 別表第一（二）第三十二号 の 八十三〜八十九 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）:

  八十三（一） 労働安全衛生法 検査業者の登録 ... 一件につき九万円       → ¥90,000
  八十三（二） 労働安全衛生法 登録教習機関の登録 ... 一件につき九万円   → ¥90,000
  八十三（三） 労働安全衛生法 登録設計審査等機関の登録 ... 一件につき九万円 → ¥90,000
  八十三（四） 労働安全衛生法 登録性能検査機関の登録 ... 一件につき九万円 → ¥90,000
  八十三（五） 労働安全衛生法 登録個別検定機関の登録 ... 一件につき九万円 → ¥90,000
  八十三（六） 労働安全衛生法 登録型式検定機関の登録 ... 一件につき九万円 → ¥90,000
  八十四（一） 作業環境測定機関の登録 ... 一件につき九万円              → ¥90,000
  八十四（二） 登録講習機関の登録 ... 一件につき九万円                  → ¥90,000
  八十四の二   中小事業主共済事業の認可 ... 一件につき十五万円          → ¥150,000
  八十五       中央卸売市場の認定 ... 一件につき一万五千円              → ¥15,000
  八十五の二   輸出植物等の登録検査機関の登録 ... 一件につき九万円      → ¥90,000
  八十六（一） 農産物検査 登録検査機関の登録 ... 一件につき十五万円      → ¥150,000
  八十六（二） 農産物検査 変更登録（区分の増加） ... 一件につき十五万円  → ¥150,000
  八十六（三） 農産物検査 変更登録（種類・区域の増加） ... 一件につき三万円 → ¥30,000
  八十七（一） 日本農林規格 登録認証機関／登録外国認証機関 ... 一件につき九万円 → ¥90,000
  八十七（二） 日本農林規格 登録試験業者 ... 一件につき九万円            → ¥90,000
  八十七（三） 日本農林規格 登録外国試験業者 ... 一件につき九万円        → ¥90,000
  八十七の二   登録生産者団体の登録／変更の登録 ... 一件につき九万円      → ¥90,000
  八十七の三（一） 登録発行機関の登録 ... 一件につき九万円               → ¥90,000
  八十七の三（二） 登録認定機関の登録 ... 一件につき九万円               → ¥90,000
  八十八（一） 普通肥料の生産の登録 ... 一件につき一万五千円             → ¥15,000
  八十八（二） 普通肥料の輸入の登録 ... 一件につき一万五千円             → ¥15,000
  八十八（三） 普通肥料の仮登録 ... 一件につき一万五千円                 → ¥15,000
  八十八（四） 外国生産肥料の登録／仮登録 ... 一件につき一万五千円       → ¥15,000
  八十九（一） 特定飼料等製造業者の登録 ... 一件につき九万円             → ¥90,000
  八十九（二） 外国特定飼料等製造業者の登録 ... 一件につき九万円         → ¥90,000
  八十九（三） 登録検定機関の登録 ... 一件につき九万円                   → ¥90,000

本範囲には割合（千分の△）やデーミング規定はなく、全 27 件が一件につきの固定額である。
金額なしの行はない。

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定・認可の要件・適用は
   caller-established とし、ここではモデル化しない。
* 「更新の登録を除く。」「政令で定めるものに限り、更新の登録を除く。」
   「政令で定めるものに限る。」「同法第二条第六号（定義）に規定する第一種作業環境測定士が受ける登録を除く。」
   「検査の区分の増加に係る変更登録に限る。」「登録の区分の増加に係る変更登録で政令で定めるものに限る。」
   「農産物の種類又は区域の増加に係る変更登録で政令で定めるものに限る。」等の適用判定は
   caller-established とし、金額定数には反映しない。
* 八十二 以前・九十 以降は NOT YET COVERED。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 八十三（一） 労働安全衛生法 検査業者の登録（第五十四条の三第一項）の件数につきの額（固定 ¥90,000）。 -/
def laborSafetyInspecBusinessRegFee : Money := 90_000

/-- 八十三（二） 労働安全衛生法 登録教習機関の登録（第十四条／第六十一条第一項／第七十五条第三項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def laborSafetyTrainingInstRegFee : Money := 90_000

/-- 八十三（三） 労働安全衛生法 登録設計審査等機関の登録（第三十七条第三項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def laborSafetyDesignReviewRegFee : Money := 90_000

/-- 八十三（四） 労働安全衛生法 登録性能検査機関の登録（第四十一条第二項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def laborSafetyPerformanceInspecRegFee : Money := 90_000

/-- 八十三（五） 労働安全衛生法 登録個別検定機関の登録（第四十四条第一項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def laborSafetyIndividualVerifyRegFee : Money := 90_000

/-- 八十三（六） 労働安全衛生法 登録型式検定機関の登録（第四十四条の二第一項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def laborSafetyTypeVerifyRegFee : Money := 90_000

/-- 八十四（一） 作業環境測定機関の登録（作業環境測定法第三十三条第一項、第一種作業環境測定士が受ける登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def workEnvMeasureOrgRegFee : Money := 90_000

/-- 八十四（二） 登録講習機関の登録（作業環境測定法第五条／第四十四条第一項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def workEnvMeasureCourseInstRegFee : Money := 90_000

/-- 八十四の二 中小事業主が行う事業に従事する者等の労働災害等に係る共済事業の認可（第三条、厚生労働大臣がする認可）の件数につきの額（固定 ¥150,000）。 -/
def smallBizMutualAidApprovalFee : Money := 150_000

/-- 八十五 中央卸売市場の認定（卸売市場法第四条第一項）の件数につきの額（固定 ¥15,000）。 -/
def centralWholesaleMarketCertFee : Money := 15_000

/-- 八十五の二 輸出植物等の検査に係る登録検査機関の登録（植物防疫法第二条第四項／第十条の六第一項の変更登録、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def exportPlantInspectOrgRegFee : Money := 90_000

/-- 八十六（一） 農産物検査 登録検査機関の登録（第二条第五項、政令で定めるものに限り、更新の登録を除く。）の件数につきの額（固定 ¥150,000）。 -/
def agriProduceInspectOrgRegFee : Money := 150_000

/-- 八十六（二） 農産物検査 変更登録（第十九条第一項、登録の区分の増加に係る変更登録で政令で定めるものに限る。）の件数につきの額（固定 ¥150,000）。 -/
def agriProduceChangeRegFee : Money := 150_000

/-- 八十六（三） 農産物検査 変更登録（第十九条第一項、農産物の種類又は区域の増加に係る変更登録で政令で定めるものに限る。）の件数につきの額（固定 ¥30,000）。 -/
def agriProduceTypeAreaChangeRegFee : Money := 30_000

/-- 八十七（一） 日本農林規格 登録認証機関又は登録外国認証機関の登録（第二条第三項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def japaneseAgriStdCertOrgRegFee : Money := 90_000

/-- 八十七（二） 日本農林規格 登録試験業者の登録（第四十二条、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def japaneseAgriStdTestBizRegFee : Money := 90_000

/-- 八十七（三） 日本農林規格 登録外国試験業者の登録（第五十三条、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def japaneseAgriStdForeignTestBizRegFee : Money := 90_000

/-- 八十七の二 登録生産者団体の登録又は変更の登録（第六条／第十五条第一項）の件数につきの額（固定 ¥90,000）。 -/
def registeredProducerGroupRegFee : Money := 90_000

/-- 八十七の三（一） 輸出証明書に係る登録発行機関の登録（第二条第四項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def exportCertIssuerRegFee : Money := 90_000

/-- 八十七の三（二） 施設認定農林水産物等の適合施設に係る登録認定機関の登録（第二条第四項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def exportFacilityCertOrgRegFee : Money := 90_000

/-- 八十八（一） 普通肥料の生産の登録（第四条第一項、更新の登録を除く。）の件数につきの額（固定 ¥15,000）。 -/
def ordinaryFertilizerProductionRegFee : Money := 15_000

/-- 八十八（二） 普通肥料の輸入の登録（第四条第四項、更新の登録を除く。）の件数につきの額（固定 ¥15,000）。 -/
def ordinaryFertilizerImportRegFee : Money := 15_000

/-- 八十八（三） 普通肥料の production／輸入の仮登録（第五条、更新の仮登録を除く。）の件数につきの額（固定 ¥15,000）。 -/
def ordinaryFertilizerTempRegFee : Money := 15_000

/-- 八十八（四） 外国生産肥料の登録又は仮登録（第三十三条の二第一項、更新の登録又は仮登録を除く。）の件数につきの額（固定 ¥15,000）。 -/
def foreignFertilizerRegFee : Money := 15_000

/-- 八十九（一） 特定飼料等製造業者の登録（第七条第一項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def specificFeedMakerRegFee : Money := 90_000

/-- 八十九（二） 外国特定飼料等製造業者の登録（第二十一条第一項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def foreignSpecificFeedMakerRegFee : Money := 90_000

/-- 八十九（三） 登録検定機関の登録（第二十七条第一項、更新の登録を除く。）の件数につきの額（固定 ¥90,000）。 -/
def feedTestOrgRegFee : Money := 90_000

theorem laborSafetyInspecBusinessRegFee_pos : laborSafetyInspecBusinessRegFee > 0 := by decide
theorem laborSafetyTrainingInstRegFee_pos : laborSafetyTrainingInstRegFee > 0 := by decide
theorem laborSafetyDesignReviewRegFee_pos : laborSafetyDesignReviewRegFee > 0 := by decide
theorem laborSafetyPerformanceInspecRegFee_pos : laborSafetyPerformanceInspecRegFee > 0 := by decide
theorem laborSafetyIndividualVerifyRegFee_pos : laborSafetyIndividualVerifyRegFee > 0 := by decide
theorem laborSafetyTypeVerifyRegFee_pos : laborSafetyTypeVerifyRegFee > 0 := by decide
theorem workEnvMeasureOrgRegFee_pos : workEnvMeasureOrgRegFee > 0 := by decide
theorem workEnvMeasureCourseInstRegFee_pos : workEnvMeasureCourseInstRegFee > 0 := by decide
theorem smallBizMutualAidApprovalFee_pos : smallBizMutualAidApprovalFee > 0 := by decide
theorem centralWholesaleMarketCertFee_pos : centralWholesaleMarketCertFee > 0 := by decide
theorem exportPlantInspectOrgRegFee_pos : exportPlantInspectOrgRegFee > 0 := by decide
theorem agriProduceInspectOrgRegFee_pos : agriProduceInspectOrgRegFee > 0 := by decide
theorem agriProduceChangeRegFee_pos : agriProduceChangeRegFee > 0 := by decide
theorem agriProduceTypeAreaChangeRegFee_pos : agriProduceTypeAreaChangeRegFee > 0 := by decide
theorem japaneseAgriStdCertOrgRegFee_pos : japaneseAgriStdCertOrgRegFee > 0 := by decide
theorem japaneseAgriStdTestBizRegFee_pos : japaneseAgriStdTestBizRegFee > 0 := by decide
theorem japaneseAgriStdForeignTestBizRegFee_pos : japaneseAgriStdForeignTestBizRegFee > 0 := by decide
theorem registeredProducerGroupRegFee_pos : registeredProducerGroupRegFee > 0 := by decide
theorem exportCertIssuerRegFee_pos : exportCertIssuerRegFee > 0 := by decide
theorem exportFacilityCertOrgRegFee_pos : exportFacilityCertOrgRegFee > 0 := by decide
theorem ordinaryFertilizerProductionRegFee_pos : ordinaryFertilizerProductionRegFee > 0 := by decide
theorem ordinaryFertilizerImportRegFee_pos : ordinaryFertilizerImportRegFee > 0 := by decide
theorem ordinaryFertilizerTempRegFee_pos : ordinaryFertilizerTempRegFee > 0 := by decide
theorem foreignFertilizerRegFee_pos : foreignFertilizerRegFee > 0 := by decide
theorem specificFeedMakerRegFee_pos : specificFeedMakerRegFee > 0 := by decide
theorem foreignSpecificFeedMakerRegFee_pos : foreignSpecificFeedMakerRegFee > 0 := by decide
theorem feedTestOrgRegFee_pos : feedTestOrgRegFee > 0 := by decide

example : laborSafetyInspecBusinessRegFee = 90_000 := by decide
example : laborSafetyTrainingInstRegFee = 90_000 := by decide
example : laborSafetyDesignReviewRegFee = 90_000 := by decide
example : laborSafetyPerformanceInspecRegFee = 90_000 := by decide
example : laborSafetyIndividualVerifyRegFee = 90_000 := by decide
example : laborSafetyTypeVerifyRegFee = 90_000 := by decide
example : workEnvMeasureOrgRegFee = 90_000 := by decide
example : workEnvMeasureCourseInstRegFee = 90_000 := by decide
example : smallBizMutualAidApprovalFee = 150_000 := by decide
example : centralWholesaleMarketCertFee = 15_000 := by decide
example : exportPlantInspectOrgRegFee = 90_000 := by decide
example : agriProduceInspectOrgRegFee = 150_000 := by decide
example : agriProduceChangeRegFee = 150_000 := by decide
example : agriProduceTypeAreaChangeRegFee = 30_000 := by decide
example : japaneseAgriStdCertOrgRegFee = 90_000 := by decide
example : japaneseAgriStdTestBizRegFee = 90_000 := by decide
example : japaneseAgriStdForeignTestBizRegFee = 90_000 := by decide
example : registeredProducerGroupRegFee = 90_000 := by decide
example : exportCertIssuerRegFee = 90_000 := by decide
example : exportFacilityCertOrgRegFee = 90_000 := by decide
example : ordinaryFertilizerProductionRegFee = 15_000 := by decide
example : ordinaryFertilizerImportRegFee = 15_000 := by decide
example : ordinaryFertilizerTempRegFee = 15_000 := by decide
example : foreignFertilizerRegFee = 15_000 := by decide
example : specificFeedMakerRegFee = 90_000 := by decide
example : foreignSpecificFeedMakerRegFee = 90_000 := by decide
example : feedTestOrgRegFee = 90_000 := by decide

end JapanTaxLaw
