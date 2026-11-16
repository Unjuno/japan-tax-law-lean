import JapanTaxLaw.RegistrationQualificationFeesP3D

/-!
# RegistrationQualificationFeesP3DSpec spec — independent restatement of
    登録免許税法 別表第一（二）第三十二号 八十三〜八十九

Sources (pinned; identical to RegistrationQualificationFeesP3D.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 八十三〜八十九 の flat 額 from the statutory text itself.
本範囲には割合やデーミング規定はなく、全 27 件が一件につきの固定額（金額なしの行なし）。

Scope boundaries identical to the implementation (八十二 以前・九十 以降は NOT YET COVERED;
「更新の登録を除く」「政令で定めるものに限る」等の適用判定は caller-established).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 八十三（一） 労働安全衛生法 検査業者の登録。 -/
def specLaborSafetyInspecBusinessRegFee : Money := 90_000
/-- Spec: 八十三（二） 労働安全衛生法 登録教習機関の登録。 -/
def specLaborSafetyTrainingInstRegFee : Money := 90_000
/-- Spec: 八十三（三） 労働安全衛生法 登録設計審査等機関の登録。 -/
def specLaborSafetyDesignReviewRegFee : Money := 90_000
/-- Spec: 八十三（四） 労働安全衛生法 登録性能検査機関の登録。 -/
def specLaborSafetyPerformanceInspecRegFee : Money := 90_000
/-- Spec: 八十三（五） 労働安全衛生法 登録個別検定機関の登録。 -/
def specLaborSafetyIndividualVerifyRegFee : Money := 90_000
/-- Spec: 八十三（六） 労働安全衛生法 登録型式検定機関の登録。 -/
def specLaborSafetyTypeVerifyRegFee : Money := 90_000
/-- Spec: 八十四（一） 作業環境測定機関の登録。 -/
def specWorkEnvMeasureOrgRegFee : Money := 90_000
/-- Spec: 八十四（二） 登録講習機関の登録。 -/
def specWorkEnvMeasureCourseInstRegFee : Money := 90_000
/-- Spec: 八十四の二 中小事業主共済事業の認可。 -/
def specSmallBizMutualAidApprovalFee : Money := 150_000
/-- Spec: 八十五 中央卸売市場の認定。 -/
def specCentralWholesaleMarketCertFee : Money := 15_000
/-- Spec: 八十五の二 輸出植物等の登録検査機関の登録。 -/
def specExportPlantInspectOrgRegFee : Money := 90_000
/-- Spec: 八十六（一） 農産物検査 登録検査機関の登録。 -/
def specAgriProduceInspectOrgRegFee : Money := 150_000
/-- Spec: 八十六（二） 農産物検査 変更登録（区分の増加）。 -/
def specAgriProduceChangeRegFee : Money := 150_000
/-- Spec: 八十六（三） 農産物検査 変更登録（種類・区域の増加）。 -/
def specAgriProduceTypeAreaChangeRegFee : Money := 30_000
/-- Spec: 八十七（一） 日本農林規格 登録認証機関／登録外国認証機関。 -/
def specJapaneseAgriStdCertOrgRegFee : Money := 90_000
/-- Spec: 八十七（二） 日本農林規格 登録試験業者。 -/
def specJapaneseAgriStdTestBizRegFee : Money := 90_000
/-- Spec: 八十七（三） 日本農林規格 登録外国試験業者。 -/
def specJapaneseAgriStdForeignTestBizRegFee : Money := 90_000
/-- Spec: 八十七の二 登録生産者団体の登録／変更の登録。 -/
def specRegisteredProducerGroupRegFee : Money := 90_000
/-- Spec: 八十七の三（一） 登録発行機関の登録。 -/
def specExportCertIssuerRegFee : Money := 90_000
/-- Spec: 八十七の三（二） 登録認定機関の登録。 -/
def specExportFacilityCertOrgRegFee : Money := 90_000
/-- Spec: 八十八（一） 普通肥料の生産の登録。 -/
def specOrdinaryFertilizerProductionRegFee : Money := 15_000
/-- Spec: 八十八（二） 普通肥料の輸入の登録。 -/
def specOrdinaryFertilizerImportRegFee : Money := 15_000
/-- Spec: 八十八（三） 普通肥料の仮登録。 -/
def specOrdinaryFertilizerTempRegFee : Money := 15_000
/-- Spec: 八十八（四） 外国生産肥料の登録／仮登録。 -/
def specForeignFertilizerRegFee : Money := 15_000
/-- Spec: 八十九（一） 特定飼料等製造業者の登録。 -/
def specSpecificFeedMakerRegFee : Money := 90_000
/-- Spec: 八十九（二） 外国特定飼料等製造業者の登録。 -/
def specForeignSpecificFeedMakerRegFee : Money := 90_000
/-- Spec: 八十九（三） 登録検定機関の登録。 -/
def specFeedTestOrgRegFee : Money := 90_000

example : specLaborSafetyInspecBusinessRegFee = 90_000 := by decide
example : specLaborSafetyTrainingInstRegFee = 90_000 := by decide
example : specLaborSafetyDesignReviewRegFee = 90_000 := by decide
example : specLaborSafetyPerformanceInspecRegFee = 90_000 := by decide
example : specLaborSafetyIndividualVerifyRegFee = 90_000 := by decide
example : specLaborSafetyTypeVerifyRegFee = 90_000 := by decide
example : specWorkEnvMeasureOrgRegFee = 90_000 := by decide
example : specWorkEnvMeasureCourseInstRegFee = 90_000 := by decide
example : specSmallBizMutualAidApprovalFee = 150_000 := by decide
example : specCentralWholesaleMarketCertFee = 15_000 := by decide
example : specExportPlantInspectOrgRegFee = 90_000 := by decide
example : specAgriProduceInspectOrgRegFee = 150_000 := by decide
example : specAgriProduceChangeRegFee = 150_000 := by decide
example : specAgriProduceTypeAreaChangeRegFee = 30_000 := by decide
example : specJapaneseAgriStdCertOrgRegFee = 90_000 := by decide
example : specJapaneseAgriStdTestBizRegFee = 90_000 := by decide
example : specJapaneseAgriStdForeignTestBizRegFee = 90_000 := by decide
example : specRegisteredProducerGroupRegFee = 90_000 := by decide
example : specExportCertIssuerRegFee = 90_000 := by decide
example : specExportFacilityCertOrgRegFee = 90_000 := by decide
example : specOrdinaryFertilizerProductionRegFee = 15_000 := by decide
example : specOrdinaryFertilizerImportRegFee = 15_000 := by decide
example : specOrdinaryFertilizerTempRegFee = 15_000 := by decide
example : specForeignFertilizerRegFee = 15_000 := by decide
example : specSpecificFeedMakerRegFee = 90_000 := by decide
example : specForeignSpecificFeedMakerRegFee = 90_000 := by decide
example : specFeedTestOrgRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP3D : Bool :=
  specLaborSafetyInspecBusinessRegFee == laborSafetyInspecBusinessRegFee &&
  specLaborSafetyTrainingInstRegFee == laborSafetyTrainingInstRegFee &&
  specLaborSafetyDesignReviewRegFee == laborSafetyDesignReviewRegFee &&
  specLaborSafetyPerformanceInspecRegFee == laborSafetyPerformanceInspecRegFee &&
  specLaborSafetyIndividualVerifyRegFee == laborSafetyIndividualVerifyRegFee &&
  specLaborSafetyTypeVerifyRegFee == laborSafetyTypeVerifyRegFee &&
  specWorkEnvMeasureOrgRegFee == workEnvMeasureOrgRegFee &&
  specWorkEnvMeasureCourseInstRegFee == workEnvMeasureCourseInstRegFee &&
  specSmallBizMutualAidApprovalFee == smallBizMutualAidApprovalFee &&
  specCentralWholesaleMarketCertFee == centralWholesaleMarketCertFee &&
  specExportPlantInspectOrgRegFee == exportPlantInspectOrgRegFee &&
  specAgriProduceInspectOrgRegFee == agriProduceInspectOrgRegFee &&
  specAgriProduceChangeRegFee == agriProduceChangeRegFee &&
  specAgriProduceTypeAreaChangeRegFee == agriProduceTypeAreaChangeRegFee &&
  specJapaneseAgriStdCertOrgRegFee == japaneseAgriStdCertOrgRegFee &&
  specJapaneseAgriStdTestBizRegFee == japaneseAgriStdTestBizRegFee &&
  specJapaneseAgriStdForeignTestBizRegFee == japaneseAgriStdForeignTestBizRegFee &&
  specRegisteredProducerGroupRegFee == registeredProducerGroupRegFee &&
  specExportCertIssuerRegFee == exportCertIssuerRegFee &&
  specExportFacilityCertOrgRegFee == exportFacilityCertOrgRegFee &&
  specOrdinaryFertilizerProductionRegFee == ordinaryFertilizerProductionRegFee &&
  specOrdinaryFertilizerImportRegFee == ordinaryFertilizerImportRegFee &&
  specOrdinaryFertilizerTempRegFee == ordinaryFertilizerTempRegFee &&
  specForeignFertilizerRegFee == foreignFertilizerRegFee &&
  specSpecificFeedMakerRegFee == specificFeedMakerRegFee &&
  specForeignSpecificFeedMakerRegFee == foreignSpecificFeedMakerRegFee &&
  specFeedTestOrgRegFee == feedTestOrgRegFee

example : agreeRegistrationQualificationFeesP3D = true := by decide

end JapanTaxLaw
