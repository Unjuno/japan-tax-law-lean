import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP8N — 登録免許税法 別表第一（二）第三十二号 百五十二〜百五十九 の flat fee モデル (W-N)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  担当範囲原文: art32_152_159.txt（百五十二〜百五十九、UTF-8）。

Models 別表第一（二）第三十二号 の 百五十二〜百五十九 の flat fee 項目（pinned raw bytes 逐語、
金額は日本語数字で検証して Arabic に変換）。原文の「〜件数一件につき△△円」は 39 箇所で、
割合（千分の△）は本範囲に存在しない。全 39 件を一件につきの固定額としてモデル化する。

  amount breakdown: 九万円 19 件（90,000）／ 十五万円 11 件（150,000）／
                    三万円 7 件（30,000）／ 一万五千円 2 件（15,000）＝ 39 件。

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録・認定の要件・適用は
  caller-established とし、ここではモデル化しない。
* 「更新の登録（／認定）を除く」「測量士が受ける登録を除く。」「財務省令で定めるものに限る」
  「財務省令で定めるもの」「同条第一項第二号に掲げる者が受けるものに限る。」「対象とする製品の種類の増加に
  係るものに限る。」「実施区域の増加に係るものに限る。」等の適用判定は caller-established とし、
  金額定数には反映しない（Bool を式に入れていない）。軽減額の別 def も作らない。
* 原文に「既に…については一万五千円」型の軽減例外・デーミング規定・金額なし fee 行は存在しない
  （既に／政令／割合／千分／みな の出現 0 回を確認）。全 39 行を fee def 化。
* 百五十六の三(二) はイ・ロの細目で、それぞれ独立した「一件につき三万円」の fee 行として
  2 件の def を与える。百五十九(四) の pinned txt 末尾は「九万」で切れているが、pinned JSON
  全文では「九万円」が完在し、金額は 90,000 としてモデル化する。
* 百五十一 以前・百六十 以降は NOT YET COVERED。「認定件数」「登録件数」の意味上の区別は
  非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 百五十二(一) 測量法第五十五条第一項（測量業者の登録）の測量業者の登録（更新の登録及び同法第四十九条第一項（測量士及び測量士補の登録）の測量士が受ける登録を除く。）の登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」「測量士が受ける登録を除く。」の該当性は caller-established。 -/
def surveyorBizRegFee : Money := 90_000

/-- 百五十二(二) 測量法第五十条第三号又は第四号（登録養成施設の登録）の登録（更新の登録を除く。）の登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」の該当性は caller-established。 -/
def surveyorTrainingFacilityRegFee : Money := 90_000

/-- 百五十三 屋外広告物法（昭和二十四年法律第百八十九号）第十条第二項第三号イ（登録試験機関の登録）の登録の登録件数一件につき十五万円（固定 ¥150,000）。 -/
def outdoorAdDisplayExamOrgRegFee : Money := 150_000

/-- 百五十四(一) 建築士法第十条の三第一項第一号（登録講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def structuralDesignArchitectTrainingOrgRegFee : Money := 90_000

/-- 百五十四(二) 建築士法第二十二条の二（登録講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def architectTrainingOrgArticle22RegFee : Money := 90_000

/-- 百五十四(三) 建築士法第二十四条第二項（登録講習機関の登録）の登録（更新の登録を除く。）の登録件数一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def architectTrainingOrgArticle24RegFee : Money := 90_000

/-- 百五十五(一) 住宅の品質確保の促進等に関する法律（平成十一年法律第八十一号）第五条第一項（登録住宅性能評価機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredHousingPerformanceEvalOrgRegFee : Money := 90_000

/-- 百五十五(二) 住宅の品質確保の促進等に関する法律第十三条（登録講習機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def housingPerfTrainingOrgRegFee : Money := 90_000

/-- 百五十五(三) 住宅の品質確保の促進等に関する法律第三十一条第一項又は第三十三条第一項（登録住宅型式性能認定等機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredHousingModelCertOrgRegFee : Money := 90_000

/-- 百五十五(四) 住宅の品質確保の促進等に関する法律第五十九条第一項（登録試験機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def housingExamOrgRegFee : Money := 90_000

/-- 百五十五の二(一) 建築物のエネルギー消費性能の向上等に関する法律（平成二十七年法律第五十三号）第十四条第一項（登録建築物エネルギー消費性能判定機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredBuildingEnergyPerfAssessOrgRegFee : Money := 90_000

/-- 百五十五の二(二) 建築物のエネルギー消費性能の向上等に関する法律第十七条第一項（登録建築物エネルギー消費性能評価機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredBuildingEnergyPerfEvalOrgRegFee : Money := 90_000

/-- 百五十五の三 都市緑地法（昭和四十八年法律第七十二号）第九十五条第一項（登録調査機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def urbanGreenSpaceSurveyOrgRegFee : Money := 90_000

/-- 百五十六(一) 廃棄物の処理及び清掃に関する法律（昭和四十五年法律第百三十七号）第九条の八第一項又は第十五条の四の二第一項の一般廃棄物又は産業廃棄物の再生利用の認定の一件につき十五万円（固定 ¥150,000）。 -/
def generalIndustrialWasteRecycleCertFee : Money := 150_000

/-- 百五十六(二) 廃棄物の処理及び清掃に関する法律第九条の九第一項又は第十五条の四の三第一項の一般廃棄物又は産業廃棄物の広域的な処理の認定の一件につき十五万円（固定 ¥150,000）。 -/
def generalIndustrialWasteWideAreaCertFee : Money := 150_000

/-- 百五十六(三) 廃棄物の処理及び清掃に関する法律第九条の十第一項又は第十五条の四の四第一項の一般廃棄物又は産業廃棄物の無害化処理の認定の一件につき十五万円（固定 ¥150,000）。 -/
def generalIndustrialWasteDetoxCertFee : Money := 150_000

/-- 百五十六(四) 一般廃棄物又は産業廃棄物の処理に係る変更の認定（当該処理の内容に関する事項の変更の認定で財務省令で定めるものに限る。）の一件につき三万円（固定 ¥30,000）。
        「財務省令で定めるものに限る。」の該当性は caller-established。 -/
def wasteProcessingChangeCertFee : Money := 30_000

/-- 百五十六の二(一) 資源の有効な利用の促進に関する法律（平成三年法律第四十八号）第五十四条第三項の自主回収・再資源化事業計画の認定の一件につき十五万円（固定 ¥150,000）。 -/
def usedSpecifiedRecycledProductPlanCertFee : Money := 150_000

/-- 百五十六の二(二) 資源の有効な利用の促進に関する法律第五十五条第一項の自主回収・再資源化事業計画の変更の認定（同法第五十四条第二項第四号の対象製品の種類の増加に係るものに限る。）の一件につき三万円（固定 ¥30,000）。
        「種類の増加に係るものに限る。」は caller-established。 -/
def usedSpecifiedRecycledProductPlanChangeCertFee : Money := 30_000

/-- 百五十六の三(一) 使用済小型電子機器等の再資源化の促進に関する法律（平成二十四年法律第五十七号）第十条第三項の規定による再資源化事業計画の認定の一件につき十五万円（固定 ¥150,000）。 -/
def usedSmallElectronicsRecyclePlanCertFee : Money := 150_000

/-- 百五十六の三(二)イ 使用済小型電子機器等の再資源化の促進に関する法律第十条第二項第四号の収集を行おうとする区域の増加に係る再資源化事業計画の変更の認定で財務省令で定めるものの一件につき三万円（固定 ¥30,000）。
        「財務省令で定めるもの」の該当性は caller-established。 -/
def usedSmallElectronicsPlanChangeAreaCertFee : Money := 30_000

/-- 百五十六の三(二)ロ 使用済小型電子機器等の再資源化の促進に関する法律第十条第二項第六号の収集、運搬若しくは処分を行う者又は業務の種別の増加に係る再資源化事業計画の変更の認定の一件につき三万円（固定 ¥30,000）。 -/
def usedSmallElectronicsPlanChangeOperatorCertFee : Money := 30_000

/-- 百五十六の四(一) プラスチックに係る資源循環の促進等に関する法律（令和三年法律第六十号）第三十九条第三項の規定による自主回収・再資源化事業計画の認定の一件につき十五万円（固定 ¥150,000）。 -/
def plasticProductRecyclePlanCertFee : Money := 150_000

/-- 百五十六の四(二) プラスチックに係る資源循環の促進等に関する法律第四十八条第三項の再資源化事業計画の認定（同条第一項第二号に掲げる者が受けるものに限る。）の一件につき十五万円（固定 ¥150,000）。
        「同条第一項第二号に掲げる者が受けるものに限る。」は caller-established。 -/
def plasticWasteRecyclePlanCertFee : Money := 150_000

/-- 百五十六の五(一) 資源循環の促進のための再資源化事業等の高度化に関する法律（令和六年法律第四十一号）第十一条第一項の高度再資源化事業計画の認定の一件につき十五万円（固定 ¥150,000）。 -/
def advancedRecyclePlanCertFee : Money := 150_000

/-- 百五十六の五(二) 資源循環の促進のための再資源化事業等の高度化に関する法律第十二条第一項の高度再資源化事業計画の変更の認定（同法第十一条第二項第五号の実施区域の増加に係るものに限る。）の一件につき三万円（固定 ¥30,000）。
        「区域の増加に係るものに限る。」は caller-established。 -/
def advancedRecyclePlanChangeCertFee : Money := 30_000

/-- 百五十六の五(三) 資源循環の促進のための再資源化事業等の高度化に関する法律第十六条第一項の高度分離・回収事業計画の認定の一件につき十五万円（固定 ¥150,000）。 -/
def advancedSeparationRecoveryPlanCertFee : Money := 150_000

/-- 百五十六の五(四) 資源循環の促進のための再資源化事業等の高度化に関する法律第十七条第一項の高度分離・回収事業計画の変更の認定（同法第十六条第二項第五号の実施区域の増加に係るものに限る。）の一件につき三万円（固定 ¥30,000）。
        「区域の増加に係るものに限る。」は caller-established。 -/
def advancedSeparationRecoveryPlanChangeCertFee : Money := 30_000

/-- 百五十六の五(五) 資源循環の促進のための再資源化事業等の高度化に関する法律第二十二条第一項（登録調査機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def advancedRecycleSurveyOrgRegFee : Money := 90_000

/-- 百五十六の六(一) 太陽電池廃棄物の再資源化等の推進に関する法律（令和八年法律第三十三号）第十二条第三項の太陽電池廃棄物再資源化等事業計画の認定の一件につき十五万円（固定 ¥150,000）。 -/
def solarPanelWasteRecyclePlanCertFee : Money := 150_000

/-- 百五十六の六(二) 太陽電池廃棄物の再資源化等の推進に関する法律第十三条第一項の太陽電池廃棄物再資源化等事業計画の変更の認定（同法第十二条第二項第四号の収集区域の増加に係るものに限る。）の一件につき三万円（固定 ¥30,000）。
        「区域の増加に係るものに限る。」は caller-established。 -/
def solarPanelWasteRecyclePlanChangeCertFee : Money := 30_000

/-- 百五十七(一) 環境教育等による環境保全の取組の促進に関する法律（平成十五年法律第百三十号）第十一条第一項（人材認定等事業の登録）の人材認定等事業の登録の一件につき一万五千円（固定 ¥15,000）。 -/
def environmentalHumanResourceCertBizRegFee : Money := 15_000

/-- 百五十七(二) 環境教育等による環境保全の取組の促進に関する法律第二十条の八の規定により読み替えて適用する同法第二十条第一項（体験の機会の場の認定）の主務大臣がする体験の機会の場の認定（更新の認定を除く。）の一件につき一万五千円（固定 ¥15,000）。
        「更新の認定を除く。」は caller-established。 -/
def experienceOpportunitySiteCertFee : Money := 15_000

/-- 百五十八(一) 特定特殊自動車排出ガスの規制等に関する法律（平成十七年法律第五十一号）第十九条第一項（登録特定原動機検査機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredSpecificEngineInspectionOrgRegFee : Money := 90_000

/-- 百五十八(二) 特定特殊自動車排出ガスの規制等に関する法律第二十六条第一項（登録特定特殊自動車検査機関の登録）の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def registeredSpecialVehicleInspectionOrgRegFee : Money := 90_000

/-- 百五十九(一) 絶滅のおそれのある野生動植物の種の保存に関する法律（平成四年法律第七十五号）第三十三条の六第一項（特別国際種事業者の登録）の特別国際種事業者の登録（更新の登録を除く。）の一件につき九万円（固定 ¥90,000）。
        「更新の登録を除く。」は caller-established。 -/
def specialInternationalSpeciesBizRegFee : Money := 90_000

/-- 百五十九(二) 絶滅のおそれのある野生動植物の種の保存に関する法律第二十三条第一項（個体等登録機関の登録）の登録の一件につき九万円（固定 ¥90,000）。 -/
def individualRegistrationOrgRegFee : Money := 90_000

/-- 百五十九(三) 絶滅のおそれのある野生動植物の種の保存に関する法律第三十三条の十五第一項（事業登録機関の登録）の登録の一件につき九万円（固定 ¥90,000）。 -/
def bizRegistrationOrgRegFee : Money := 90_000

/-- 百五十九(四) 絶滅のおそれのある野生動植物の種の保存に関する法律第三十三条の二十六第一項（認定機関の登録）の登録の一件につき九万円（固定 ¥90,000）。
        pinned txt は末尾「九万」で切れているが、pinned JSON の全文では「九万円」が完在（ ¥90,000 ）。 -/
def certificationOrgRegFee : Money := 90_000

theorem surveyorBizRegFee_pos : surveyorBizRegFee > 0 := by decide
theorem surveyorTrainingFacilityRegFee_pos : surveyorTrainingFacilityRegFee > 0 := by decide
theorem outdoorAdDisplayExamOrgRegFee_pos : outdoorAdDisplayExamOrgRegFee > 0 := by decide
theorem structuralDesignArchitectTrainingOrgRegFee_pos : structuralDesignArchitectTrainingOrgRegFee > 0 := by decide
theorem architectTrainingOrgArticle22RegFee_pos : architectTrainingOrgArticle22RegFee > 0 := by decide
theorem architectTrainingOrgArticle24RegFee_pos : architectTrainingOrgArticle24RegFee > 0 := by decide
theorem registeredHousingPerformanceEvalOrgRegFee_pos : registeredHousingPerformanceEvalOrgRegFee > 0 := by decide
theorem housingPerfTrainingOrgRegFee_pos : housingPerfTrainingOrgRegFee > 0 := by decide
theorem registeredHousingModelCertOrgRegFee_pos : registeredHousingModelCertOrgRegFee > 0 := by decide
theorem housingExamOrgRegFee_pos : housingExamOrgRegFee > 0 := by decide
theorem registeredBuildingEnergyPerfAssessOrgRegFee_pos : registeredBuildingEnergyPerfAssessOrgRegFee > 0 := by decide
theorem registeredBuildingEnergyPerfEvalOrgRegFee_pos : registeredBuildingEnergyPerfEvalOrgRegFee > 0 := by decide
theorem urbanGreenSpaceSurveyOrgRegFee_pos : urbanGreenSpaceSurveyOrgRegFee > 0 := by decide
theorem generalIndustrialWasteRecycleCertFee_pos : generalIndustrialWasteRecycleCertFee > 0 := by decide
theorem generalIndustrialWasteWideAreaCertFee_pos : generalIndustrialWasteWideAreaCertFee > 0 := by decide
theorem generalIndustrialWasteDetoxCertFee_pos : generalIndustrialWasteDetoxCertFee > 0 := by decide
theorem wasteProcessingChangeCertFee_pos : wasteProcessingChangeCertFee > 0 := by decide
theorem usedSpecifiedRecycledProductPlanCertFee_pos : usedSpecifiedRecycledProductPlanCertFee > 0 := by decide
theorem usedSpecifiedRecycledProductPlanChangeCertFee_pos : usedSpecifiedRecycledProductPlanChangeCertFee > 0 := by decide
theorem usedSmallElectronicsRecyclePlanCertFee_pos : usedSmallElectronicsRecyclePlanCertFee > 0 := by decide
theorem usedSmallElectronicsPlanChangeAreaCertFee_pos : usedSmallElectronicsPlanChangeAreaCertFee > 0 := by decide
theorem usedSmallElectronicsPlanChangeOperatorCertFee_pos : usedSmallElectronicsPlanChangeOperatorCertFee > 0 := by decide
theorem plasticProductRecyclePlanCertFee_pos : plasticProductRecyclePlanCertFee > 0 := by decide
theorem plasticWasteRecyclePlanCertFee_pos : plasticWasteRecyclePlanCertFee > 0 := by decide
theorem advancedRecyclePlanCertFee_pos : advancedRecyclePlanCertFee > 0 := by decide
theorem advancedRecyclePlanChangeCertFee_pos : advancedRecyclePlanChangeCertFee > 0 := by decide
theorem advancedSeparationRecoveryPlanCertFee_pos : advancedSeparationRecoveryPlanCertFee > 0 := by decide
theorem advancedSeparationRecoveryPlanChangeCertFee_pos : advancedSeparationRecoveryPlanChangeCertFee > 0 := by decide
theorem advancedRecycleSurveyOrgRegFee_pos : advancedRecycleSurveyOrgRegFee > 0 := by decide
theorem solarPanelWasteRecyclePlanCertFee_pos : solarPanelWasteRecyclePlanCertFee > 0 := by decide
theorem solarPanelWasteRecyclePlanChangeCertFee_pos : solarPanelWasteRecyclePlanChangeCertFee > 0 := by decide
theorem environmentalHumanResourceCertBizRegFee_pos : environmentalHumanResourceCertBizRegFee > 0 := by decide
theorem experienceOpportunitySiteCertFee_pos : experienceOpportunitySiteCertFee > 0 := by decide
theorem registeredSpecificEngineInspectionOrgRegFee_pos : registeredSpecificEngineInspectionOrgRegFee > 0 := by decide
theorem registeredSpecialVehicleInspectionOrgRegFee_pos : registeredSpecialVehicleInspectionOrgRegFee > 0 := by decide
theorem specialInternationalSpeciesBizRegFee_pos : specialInternationalSpeciesBizRegFee > 0 := by decide
theorem individualRegistrationOrgRegFee_pos : individualRegistrationOrgRegFee > 0 := by decide
theorem bizRegistrationOrgRegFee_pos : bizRegistrationOrgRegFee > 0 := by decide
theorem certificationOrgRegFee_pos : certificationOrgRegFee > 0 := by decide

example : surveyorBizRegFee = 90_000 := by decide
example : surveyorTrainingFacilityRegFee = 90_000 := by decide
example : outdoorAdDisplayExamOrgRegFee = 150_000 := by decide
example : structuralDesignArchitectTrainingOrgRegFee = 90_000 := by decide
example : architectTrainingOrgArticle22RegFee = 90_000 := by decide
example : architectTrainingOrgArticle24RegFee = 90_000 := by decide
example : registeredHousingPerformanceEvalOrgRegFee = 90_000 := by decide
example : housingPerfTrainingOrgRegFee = 90_000 := by decide
example : registeredHousingModelCertOrgRegFee = 90_000 := by decide
example : housingExamOrgRegFee = 90_000 := by decide
example : registeredBuildingEnergyPerfAssessOrgRegFee = 90_000 := by decide
example : registeredBuildingEnergyPerfEvalOrgRegFee = 90_000 := by decide
example : urbanGreenSpaceSurveyOrgRegFee = 90_000 := by decide
example : generalIndustrialWasteRecycleCertFee = 150_000 := by decide
example : generalIndustrialWasteWideAreaCertFee = 150_000 := by decide
example : generalIndustrialWasteDetoxCertFee = 150_000 := by decide
example : wasteProcessingChangeCertFee = 30_000 := by decide
example : usedSpecifiedRecycledProductPlanCertFee = 150_000 := by decide
example : usedSpecifiedRecycledProductPlanChangeCertFee = 30_000 := by decide
example : usedSmallElectronicsRecyclePlanCertFee = 150_000 := by decide
example : usedSmallElectronicsPlanChangeAreaCertFee = 30_000 := by decide
example : usedSmallElectronicsPlanChangeOperatorCertFee = 30_000 := by decide
example : plasticProductRecyclePlanCertFee = 150_000 := by decide
example : plasticWasteRecyclePlanCertFee = 150_000 := by decide
example : advancedRecyclePlanCertFee = 150_000 := by decide
example : advancedRecyclePlanChangeCertFee = 30_000 := by decide
example : advancedSeparationRecoveryPlanCertFee = 150_000 := by decide
example : advancedSeparationRecoveryPlanChangeCertFee = 30_000 := by decide
example : advancedRecycleSurveyOrgRegFee = 90_000 := by decide
example : solarPanelWasteRecyclePlanCertFee = 150_000 := by decide
example : solarPanelWasteRecyclePlanChangeCertFee = 30_000 := by decide
example : environmentalHumanResourceCertBizRegFee = 15_000 := by decide
example : experienceOpportunitySiteCertFee = 15_000 := by decide
example : registeredSpecificEngineInspectionOrgRegFee = 90_000 := by decide
example : registeredSpecialVehicleInspectionOrgRegFee = 90_000 := by decide
example : specialInternationalSpeciesBizRegFee = 90_000 := by decide
example : individualRegistrationOrgRegFee = 90_000 := by decide
example : bizRegistrationOrgRegFee = 90_000 := by decide
example : certificationOrgRegFee = 90_000 := by decide

/-- 第三十二号 百六十 遺伝子組換え生物等の輸入に係る登録検査機関の登録
    （遺伝子組換え生物等の使用等の規制による生物の多様性の確保に関する法律
      平成十五年法律第九十七号 第十七条第一項（登録検査機関の登録））— 一件につき ¥90,000。 -/
def geneticallyModifiedOrganismImportInspectionOrgRegFee : Money := 90_000

theorem geneticallyModifiedOrganismImportInspectionOrgRegFee_pos :
    geneticallyModifiedOrganismImportInspectionOrgRegFee > 0 := by decide

example : geneticallyModifiedOrganismImportInspectionOrgRegFee = 90_000 := by decide

end JapanTaxLaw
