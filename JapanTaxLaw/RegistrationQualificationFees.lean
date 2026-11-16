import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFees — 登録免許税法 別表第一（二）第三十二号（人の資格の登録若しくは認定又は技能証明）L4 モデル (一)〜(九) 帯域

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (same as RegistrationTax.lean / RegistrationCommercialTaxTable.lean pins)
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Models 別表第一（二）第三十二号 (一)〜(九) の flat fee 項目 — pinned raw bytes 逐語:

  （一）イ公認会計士の登録登録件数一件につき六万円
        ロ外国公認会計士の登録登録件数一件につき六万円
  （二）行政書士の登録登録件数一件につき三万円
  （二の二）政治資金監査人の登録登録件数一件につき一万五千円
  （三）弁護士の登録登録件数一件につき六万円
  （四）外国法事務弁護士の登録登録件数一件につき六万円
  （五）イ司法書士の登録登録件数一件につき三万円
        ロ簡裁訴訟代理等関係業務の認定）の認定認定件数一件につき五千円
  （六）イ土地家屋調査士の登録登録件数一件につき三万円
        ロ民間紛争解決手続代理関係業務の認定）の認定認定件数一件につき五千円
  （七）税理士の登録登録件数一件につき六万円
  （八）イ技術士の登録登録件数一件につき三万円
        ロ技術士補の登録登録件数一件につき一万五千円
  （八の二）公認心理師の登録登録件数一件につき一万五千円
  （九）イ（１）医師又は歯科医師の登録登録件数一件につき六万円
        （２）薬剤師の登録登録件数一件につき三万円
        （３）保健師、助産師、看護師、理学療法士、作業療法士、診療放射線技師、
              臨床検査技師、視能訓練士、臨床工学技士又は義肢装具士の登録登録件数一件につき九千円
        ロイ（１）から（３）までに掲げる者に係る登録事項の変更の登録登録件数一件につき千円

Scope & honest boundaries:

* 一件につきの固定額であることを検証するのみ。登録（の要件・適用・聴取）は
  政令により個別審議の対象であり、ここではモデル化しない。
* （十）以降（歯科衛生士・歯科技工士・救急救命士・言語聴覚士・あん摩マツサージ指圧師はり師きゆう師等・
  柔道整復師・管理栄養士・理容師・美容師・社会福祉士等・精神保健福祉士・獣医師・愛玩動物看護師・
  百六十 以降の資格登録項目等）は未モデル化につき未検査（NOT YET COVERED）。
* 「認定件数」と「登録件数」の意味上の区別は非モデル化（一律 Money で扱う）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- （一）イ 公認会計士の登録の件数につきの額（固定 ¥60,000）。 -/
def certifiedPublicAccountantRegistrationFee : Money := 60_000

/-- （一）ロ 外国公認会計士の登録の件数につきの額（固定 ¥60,000）。 -/
def foreignCertifiedPublicAccountantRegistrationFee : Money := 60_000

/-- （二） 行政書士の登録の件数につきの額（固定 ¥30,000）。 -/
def administrativeScrivenerRegistrationFee : Money := 30_000

/-- （二の二） 政治資金監査人の登録の件数につきの額（固定 ¥15,000）。 -/
def politicalFundsComplianceAuditorRegistrationFee : Money := 15_000

/-- （三） 弁護士の登録の件数につきの額（固定 ¥60,000）。 -/
def attorneyRegistrationFee : Money := 60_000

/-- （四） 外国法事務弁護士の登録の件数につきの額（固定 ¥60,000）。 -/
def foreignLegalAffairsAttorneyRegistrationFee : Money := 60_000

/-- （五）イ 司法書士の登録の件数につきの額（固定 ¥30,000）。 -/
def judicialScrivenerRegistrationFee : Money := 30_000

/-- （五）ロ 簡裁訴訟代理等関係業務の認定の件数につきの額（固定 ¥5,000）。 -/
def simplifyCourtLitigationAgencyCertificationFee : Money := 5_000

/-- （六）イ 土地家屋調査士の登録の件数につきの額（固定 ¥30,000）。 -/
def landAndBuildingSurveyorRegistrationFee : Money := 30_000

/-- （六）ロ 民間紛争解決手続代理関係業務の認定の件数につきの額（固定 ¥5,000）。 -/
def alternativeDisputeResolutionAgencyCertificationFee : Money := 5_000

/-- （七） 税理士の登録の件数につきの額（固定 ¥60,000）。 -/
def taxAccountantRegistrationFee : Money := 60_000

/-- （八）イ 技術士の登録の件数につきの額（固定 ¥30,000）。 -/
def registeredEngineerRegistrationFee : Money := 30_000

/-- （八）ロ 技術士補の登録の件数につきの額（固定 ¥15,000）。 -/
def assistantEngineerRegistrationFee : Money := 15_000

/-- （八の二） 公認心理師の登録の件数につきの額（固定 ¥15,000）。 -/
def certifiedPsychologistRegistrationFee : Money := 15_000

/-- （九）イ（１） 医師又は歯科医師の登録の件数につきの額（固定 ¥60,000）。 -/
def physicianDentistRegistrationFee : Money := 60_000

/-- （九）イ（２） 薬剤師の登録の件数につきの額（固定 ¥30,000）。 -/
def pharmacistRegistrationFee : Money := 30_000

/-- （九）イ（３） 保健師、助産師、看護師、理学療法士、作業療法士、診療放射線技師、
    臨床検査技師、視能訓練士、臨床工学技士又は義肢装具士の登録の件数につきの額（固定 ¥9,000）。 -/
def healthNurseEtcRegistrationFee : Money := 9_000

/-- （十）イ 歯科衛生士法第六条第一項（登録）の歯科衛生士の登録につきの額（固定 ¥9,000）。 -/
def dentalHygienistRegistrationFee : Money := 9_000

/-- （十の二）イ 歯科技工士法第六条第一項（登録）の歯科技工士の登録につきの額（固定 ¥9,000）。 -/
def dentalTechnicianRegistrationFee : Money := 9_000

/-- （十一）イ 救急救命士法第六条第一項（登録）の救急救命士の登録につきの額（固定 ¥9,000）。 -/
def emergencyMedicalTechnicianRegistrationFee : Money := 9_000

/-- （十二）イ 言語聴覚士法第六条第一項（登録）の言語聴覚士の登録につきの額（固定 ¥9,000）。 -/
def speechLanguageHearingTherapistRegistrationFee : Money := 9_000

/-- （十三）イ あん摩マツサージ指圧師、はり師、きゆう師等に関する法律第三条の三第一項（登録）の
    あん摩マツサージ指圧師、はり師又はきゆう師の登録につきの額（固定 ¥9,000）。 -/
def anmaMassageShiatsuPractitionerRegistrationFee : Money := 9_000

/-- （十四）イ 柔道整復師法第六条第一項（登録）の柔道整復師の登録につきの額（固定 ¥9,000）。 -/
def judoTherapistRegistrationFee : Money := 9_000

/-- （十五） 栄養士法第四条第三項（登録）の管理栄養士の登録につきの額（固定 ¥15,000）。 -/
def dieticianRegistrationFee : Money := 15_000

/-- （十六）イ 理容師法第五条の二第一項（登録）の理容師の登録につきの額（固定 ¥9,000）。 -/
def barberRegistrationFee : Money := 9_000

/-- （十七）イ 美容師法第五条の二第一項（登録）の美容師の登録につきの額（固定 ¥9,000）。 -/
def hairdresserRegistrationFee : Money := 9_000

/-- （十八）イ 社会福祉士及び介護福祉士法第二十八条（登録）の社会福祉士の登録につきの額（固定 ¥15,000）。 -/
def socialWorkerRegistrationFee : Money := 15_000

/-- （十八）ロ 同法第四十二条第一項（登録）の介護福祉士の登録若しくは同法附則第四条第一項（登録）の
    准介護福祉士の登録につきの額（固定 ¥9,000）。 -/
def careWorkerRegistrationFee : Money := 9_000

/-- （十九） 精神保健福祉士法第二十八条（登録）の精神保健福祉士の登録につきの額（固定 ¥15,000）。 -/
def mentalHealthWorkerRegistrationFee : Money := 15_000

/-- （二十）イ 獣医師法第七条第一項（登録）の獣医師の登録につきの額（固定 ¥30,000）。 -/
def veterinarianRegistrationFee : Money := 30_000

/-- （二十）ロ 獣医師法附則第十五項（獣医師法の準用）において準用する同法第七条第一項の獣医仮免状の所有者の登録につきの額（固定 ¥9,000）。 -/
def provisionalVeterinarianRegistrationFee : Money := 9_000

/-- （二十一）イ 社会保険労務士法第十四条の二第一項（登録）の社会保険労務士の登録につきの額（固定 ¥30,000）。 -/
def socialInsuranceLabourConsultantRegistrationFee : Money := 30_000

/-- （二十一）ロ 社会保険労務士法第二条第二項（社会保険労務士の業務）の紛争解決手続代理業務試験に合格した旨の付記申請につきの額（固定 ¥5,000）。 -/
def socialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee : Money := 5_000

/-- （二十二）イ 作業環境測定法第七条（登録）の第一種作業環境測定士の登録につきの額（固定 ¥30,000）。 -/
def workingEnvironmentMeasurementOfficerType1RegistrationFee : Money := 30_000

/-- （二十二）ロ 作業環境測定法第七条（登録）の第二種作業環境測定士の登録につきの額（固定 ¥15,000）。 -/
def workingEnvironmentMeasurementOfficerType2RegistrationFee : Money := 15_000

/-- （二十二の二） 職業能力開発促進法（昭和四十四年法律第六十四号）第三十条の十九第一項（キャリアコンサルタントの登録）の
    キャリアコンサルタントの登録（更新の登録を除く。）につきの額（固定 ¥9,000）。 -/
def careerConsultantRegistrationFee : Money := 9_000

/-- （二十三） 計量法（平成四年法律第五十一号）第百二十二条第一項（登録）の計量士の登録につきの額（固定 ¥30,000）。 -/
def metrologyOfficerRegistrationFee : Money := 30_000

/-- （二十三の二） 情報処理の促進に関する法律（昭和四十五年法律第九十号）第十二条第一項（登録）の
    情報処理安全確保支援士の登録（更新の登録を除く。）につきの額（固定 ¥9,000）。 -/
def informationProcessingSecuritySupportSpecialistRegistrationFee : Money := 9_000

/-- （二十四） 弁理士法（平成十二年法律第四十九号）第十七条第一項（登録）の弁理士の登録につきの額（固定 ¥60,000）。 -/
def patentAttorneyRegistrationFee : Money := 60_000

theorem socialInsuranceLabourConsultantRegistrationFee_pos : socialInsuranceLabourConsultantRegistrationFee > 0 := by decide
theorem socialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee_pos :
    socialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee > 0 := by decide
theorem workingEnvironmentMeasurementOfficerType1RegistrationFee_pos :
    workingEnvironmentMeasurementOfficerType1RegistrationFee > 0 := by decide
theorem workingEnvironmentMeasurementOfficerType2RegistrationFee_pos :
    workingEnvironmentMeasurementOfficerType2RegistrationFee > 0 := by decide
theorem careerConsultantRegistrationFee_pos : careerConsultantRegistrationFee > 0 := by decide
theorem metrologyOfficerRegistrationFee_pos : metrologyOfficerRegistrationFee > 0 := by decide
theorem informationProcessingSecuritySupportSpecialistRegistrationFee_pos :
    informationProcessingSecuritySupportSpecialistRegistrationFee > 0 := by decide
theorem patentAttorneyRegistrationFee_pos : patentAttorneyRegistrationFee > 0 := by decide

example : socialInsuranceLabourConsultantRegistrationFee = 30_000 := by decide
example : socialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee = 5_000 := by decide
example : workingEnvironmentMeasurementOfficerType1RegistrationFee = 30_000 := by decide
example : workingEnvironmentMeasurementOfficerType2RegistrationFee = 15_000 := by decide
example : careerConsultantRegistrationFee = 9_000 := by decide
example : metrologyOfficerRegistrationFee = 30_000 := by decide
example : informationProcessingSecuritySupportSpecialistRegistrationFee = 9_000 := by decide
example : patentAttorneyRegistrationFee = 60_000 := by decide

/-- （二十の二）イ 愛玩動物看護師法第六条第一項（登録）の愛玩動物看護師の登録につきの額（固定 ¥9,000）。 -/
def petAnimalNurseRegistrationFee : Money := 9_000

theorem dentalHygienistRegistrationFee_pos : dentalHygienistRegistrationFee > 0 := by decide
theorem dentalTechnicianRegistrationFee_pos : dentalTechnicianRegistrationFee > 0 := by decide
theorem emergencyMedicalTechnicianRegistrationFee_pos : emergencyMedicalTechnicianRegistrationFee > 0 := by decide
theorem speechLanguageHearingTherapistRegistrationFee_pos : speechLanguageHearingTherapistRegistrationFee > 0 := by decide
theorem anmaMassageShiatsuPractitionerRegistrationFee_pos : anmaMassageShiatsuPractitionerRegistrationFee > 0 := by decide
theorem judoTherapistRegistrationFee_pos : judoTherapistRegistrationFee > 0 := by decide
theorem dieticianRegistrationFee_pos : dieticianRegistrationFee > 0 := by decide
theorem barberRegistrationFee_pos : barberRegistrationFee > 0 := by decide
theorem hairdresserRegistrationFee_pos : hairdresserRegistrationFee > 0 := by decide
theorem socialWorkerRegistrationFee_pos : socialWorkerRegistrationFee > 0 := by decide
theorem careWorkerRegistrationFee_pos : careWorkerRegistrationFee > 0 := by decide
theorem mentalHealthWorkerRegistrationFee_pos : mentalHealthWorkerRegistrationFee > 0 := by decide
theorem veterinarianRegistrationFee_pos : veterinarianRegistrationFee > 0 := by decide
theorem provisionalVeterinarianRegistrationFee_pos : provisionalVeterinarianRegistrationFee > 0 := by decide
theorem petAnimalNurseRegistrationFee_pos : petAnimalNurseRegistrationFee > 0 := by decide
example : dentalHygienistRegistrationFee = 9_000 := by decide
example : dentalTechnicianRegistrationFee = 9_000 := by decide
example : emergencyMedicalTechnicianRegistrationFee = 9_000 := by decide
example : speechLanguageHearingTherapistRegistrationFee = 9_000 := by decide
example : anmaMassageShiatsuPractitionerRegistrationFee = 9_000 := by decide
example : judoTherapistRegistrationFee = 9_000 := by decide
example : dieticianRegistrationFee = 15_000 := by decide
example : barberRegistrationFee = 9_000 := by decide
example : hairdresserRegistrationFee = 9_000 := by decide
example : socialWorkerRegistrationFee = 15_000 := by decide
example : careWorkerRegistrationFee = 9_000 := by decide
example : mentalHealthWorkerRegistrationFee = 15_000 := by decide
example : veterinarianRegistrationFee = 30_000 := by decide
example : provisionalVeterinarianRegistrationFee = 9_000 := by decide
example : petAnimalNurseRegistrationFee = 9_000 := by decide

/-- （九）ロ イ（１）から（３）までに掲げる者に係る登録事項の変更の登録の件数につきの額（固定 ¥1,000）。 -/
def registrationModificationFee : Money := 1_000

theorem certifiedPublicAccountantRegistrationFee_pos : certifiedPublicAccountantRegistrationFee > 0 := by decide
theorem foreignCertifiedPublicAccountantRegistrationFee_pos :
    foreignCertifiedPublicAccountantRegistrationFee > 0 := by decide
theorem administrativeScrivenerRegistrationFee_pos : administrativeScrivenerRegistrationFee > 0 := by decide
theorem politicalFundsComplianceAuditorRegistrationFee_pos :
    politicalFundsComplianceAuditorRegistrationFee > 0 := by decide
theorem attorneyRegistrationFee_pos : attorneyRegistrationFee > 0 := by decide
theorem foreignLegalAffairsAttorneyRegistrationFee_pos :
    foreignLegalAffairsAttorneyRegistrationFee > 0 := by decide
theorem judicialScrivenerRegistrationFee_pos : judicialScrivenerRegistrationFee > 0 := by decide
theorem simplifyCourtLitigationAgencyCertificationFee_pos :
    simplifyCourtLitigationAgencyCertificationFee > 0 := by decide
theorem landAndBuildingSurveyorRegistrationFee_pos : landAndBuildingSurveyorRegistrationFee > 0 := by decide
theorem alternativeDisputeResolutionAgencyCertificationFee_pos :
    alternativeDisputeResolutionAgencyCertificationFee > 0 := by decide
theorem taxAccountantRegistrationFee_pos : taxAccountantRegistrationFee > 0 := by decide
theorem registeredEngineerRegistrationFee_pos : registeredEngineerRegistrationFee > 0 := by decide
theorem assistantEngineerRegistrationFee_pos : assistantEngineerRegistrationFee > 0 := by decide
theorem certifiedPsychologistRegistrationFee_pos : certifiedPsychologistRegistrationFee > 0 := by decide
theorem physicianDentistRegistrationFee_pos : physicianDentistRegistrationFee > 0 := by decide
theorem pharmacistRegistrationFee_pos : pharmacistRegistrationFee > 0 := by decide
theorem healthNurseEtcRegistrationFee_pos : healthNurseEtcRegistrationFee > 0 := by decide
theorem registrationModificationFee_pos : registrationModificationFee > 0 := by decide

-- ==== kernel-decided smoke checks ====

example : certifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : foreignCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : administrativeScrivenerRegistrationFee = 30_000 := by decide
example : politicalFundsComplianceAuditorRegistrationFee = 15_000 := by decide
example : attorneyRegistrationFee = 60_000 := by decide
example : foreignLegalAffairsAttorneyRegistrationFee = 60_000 := by decide
example : judicialScrivenerRegistrationFee = 30_000 := by decide
example : simplifyCourtLitigationAgencyCertificationFee = 5_000 := by decide
example : landAndBuildingSurveyorRegistrationFee = 30_000 := by decide
example : alternativeDisputeResolutionAgencyCertificationFee = 5_000 := by decide
example : taxAccountantRegistrationFee = 60_000 := by decide
example : registeredEngineerRegistrationFee = 30_000 := by decide
example : assistantEngineerRegistrationFee = 15_000 := by decide
example : certifiedPsychologistRegistrationFee = 15_000 := by decide
example : physicianDentistRegistrationFee = 60_000 := by decide
example : pharmacistRegistrationFee = 30_000 := by decide
example : healthNurseEtcRegistrationFee = 9_000 := by decide
example : registrationModificationFee = 1_000 := by decide

end JapanTaxLaw
