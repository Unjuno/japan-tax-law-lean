import JapanTaxLaw.RegistrationQualificationFees

/-!
# RegistrationQualificationFees spec — independent restatement of
  登録免許税法 別表第一（二）第三十二号（人の資格の登録若しくは認定又は技能証明）(一)〜(九)

Sources (pinned; identical to RegistrationQualificationFees.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: (same as RegistrationTax.lean pin)

Independent restatement of:
  * 別表第一（二）第三十二号 の (一)〜(九) の各登録件数一件につきの flat 額
from the statutory text itself.

Scope boundaries identical to the implementation (33 に至る以降は未モデル化).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: (一）イ 公認会計士の登録。 -/
def specCertifiedPublicAccountantRegistrationFee : Money := 60_000
/-- Spec: (一）ロ 外国公認会計士の登録。 -/
def specForeignCertifiedPublicAccountantRegistrationFee : Money := 60_000
/-- Spec: (二） 行政書士の登録。 -/
def specAdministrativeScrivenerRegistrationFee : Money := 30_000
/-- Spec: (二の二） 政治資金監査人の登録。 -/
def specPoliticalFundsComplianceAuditorRegistrationFee : Money := 15_000
/-- Spec: (三） 弁護士の登録。 -/
def specAttorneyRegistrationFee : Money := 60_000
/-- Spec: (四） 外国法事務弁護士の登録。 -/
def specForeignLegalAffairsAttorneyRegistrationFee : Money := 60_000
/-- Spec: (五）イ 司法書士の登録。 -/
def specJudicialScrivenerRegistrationFee : Money := 30_000
/-- Spec: (五）ロ 簡裁訴訟代理等関係業務の認定。 -/
def specSimplifyCourtLitigationAgencyCertificationFee : Money := 5_000
/-- Spec: (六）イ 土地家屋調査士の登録。 -/
def specLandAndBuildingSurveyorRegistrationFee : Money := 30_000
/-- Spec: (六）ロ 民間紛争解決手続代理関係業務の認定。 -/
def specAlternativeDisputeResolutionAgencyCertificationFee : Money := 5_000
/-- Spec: (七） 税理士の登録。 -/
def specTaxAccountantRegistrationFee : Money := 60_000
/-- Spec: (八）イ 技術士の登録。 -/
def specRegisteredEngineerRegistrationFee : Money := 30_000
/-- Spec: (八）ロ 技術士補の登録。 -/
def specAssistantEngineerRegistrationFee : Money := 15_000
/-- Spec: (八の二） 公認心理師の登録。 -/
def specCertifiedPsychologistRegistrationFee : Money := 15_000
/-- Spec: (九）イ（１） 医師又は歯科医師の登録。 -/
def specPhysicianDentistRegistrationFee : Money := 60_000
/-- Spec: (九）イ（２） 薬剤師の登録。 -/
def specPharmacistRegistrationFee : Money := 30_000
/-- Spec: (九）イ（３） 保健師、助産師、看護師、理学療法士、作業療法士、診療放射線技師、
    臨床検査技師、視能訓練士、臨床工学技士又は義肢装具士の登録。 -/
def specHealthNurseEtcRegistrationFee : Money := 9_000
/-- Spec: (九）ロ 登録事項の変更の登録。 -/
def specRegistrationModificationFee : Money := 1_000

/-- Spec: (十）イ 歯科衛生士の登録。 -/
def specDentalHygienistRegistrationFee : Money := 9_000
/-- Spec: (十の二）イ 歯科技工士の登録。 -/
def specDentalTechnicianRegistrationFee : Money := 9_000
/-- Spec: (十一）イ 救急救命士の登録。 -/
def specEmergencyMedicalTechnicianRegistrationFee : Money := 9_000
/-- Spec: (十二）イ 言語聴覚士の登録。 -/
def specSpeechLanguageHearingTherapistRegistrationFee : Money := 9_000
/-- Spec: (十三）イ あん摩マツサージ指圧師、はり師、きゆう師の登録。 -/
def specAnmaMassageShiatsuPractitionerRegistrationFee : Money := 9_000
/-- Spec: (十四）イ 柔道整復師の登録。 -/
def specJudoTherapistRegistrationFee : Money := 9_000
/-- Spec: (十五） 管理栄養士の登録。 -/
def specDieticianRegistrationFee : Money := 15_000
/-- Spec: (十六）イ 理容師の登録。 -/
def specBarberRegistrationFee : Money := 9_000
/-- Spec: (十七）イ 美容師の登録。 -/
def specHairdresserRegistrationFee : Money := 9_000
/-- Spec: (十八）イ 社会福祉士の登録。 -/
def specSocialWorkerRegistrationFee : Money := 15_000
/-- Spec: (十八）ロ 介護福祉士又は准介護福祉士の登録。 -/
def specCareWorkerRegistrationFee : Money := 9_000
/-- Spec: (十九） 精神保健福祉士の登録。 -/
def specMentalHealthWorkerRegistrationFee : Money := 15_000
/-- Spec: (二十）イ 獣医師の登録。 -/
def specVeterinarianRegistrationFee : Money := 30_000
/-- Spec: (二十）ロ 獣医師仮免状の所有者の登録。 -/
def specProvisionalVeterinarianRegistrationFee : Money := 9_000
/-- Spec: (二十の二）イ 愛玩動物看護師の登録。 -/
def specPetAnimalNurseRegistrationFee : Money := 9_000

/-- Spec: (二十一）イ 社会保険労務士の登録。 -/
def specSocialInsuranceLabourConsultantRegistrationFee : Money := 30_000
/-- Spec: (二十一）ロ 紛争解決手続代理業務試験合格の付記申請。 -/
def specSocialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee : Money := 5_000
/-- Spec: (二十二）イ 第一種作業環境測定士の登録。 -/
def specWorkingEnvironmentMeasurementOfficerType1RegistrationFee : Money := 30_000
/-- Spec: (二十二）ロ 第二種作業環境測定士の登録。 -/
def specWorkingEnvironmentMeasurementOfficerType2RegistrationFee : Money := 15_000
/-- Spec: (二十二の二） キャリアコンサルタントの登録。 -/
def specCareerConsultantRegistrationFee : Money := 9_000
/-- Spec: (二十三） 計量士の登録。 -/
def specMetrologyOfficerRegistrationFee : Money := 30_000
/-- Spec: (二十三の二） 情報処理安全確保支援士の登録。 -/
def specInformationProcessingSecuritySupportSpecialistRegistrationFee : Money := 9_000
/-- Spec: (二十四） 弁理士の登録。 -/
def specPatentAttorneyRegistrationFee : Money := 60_000

/-- Spec: (二十六）イ 一級小型船舶操縦士の登録。 -/
def specSmallVesselClass1RegistrationFee : Money := 2_000
/-- Spec: (二十六）ロ 二級小型船舶操縦士の登録。 -/
def specSmallVesselClass2RegistrationFee : Money := 1_800
/-- Spec: (二十六）ハ 特殊小型船舶操縦士の登録。 -/
def specSmallVesselClassSpecialRegistrationFee : Money := 1_500
/-- Spec: (二十七）イ（１） 一級水先人の登録。 -/
def specPilotClass1RegistrationFee : Money := 60_000
/-- Spec: (二十七）イ（２） 二級水先人の登録。 -/
def specPilotClass2RegistrationFee : Money := 30_000
/-- Spec: (二十七）イ（３） 三級水先人の登録。 -/
def specPilotClass3RegistrationFee : Money := 15_000
/-- Spec: (二十八） 海事補佐人の登録。 -/
def specMaritimeAssistantExaminerRegistrationFee : Money := 30_000
/-- Spec: (二十九） 海事代理士の登録。 -/
def specMaritimeAgentRegistrationFee : Money := 30_000

example : specSmallVesselClass1RegistrationFee = 2_000 := by decide
example : specSmallVesselClass2RegistrationFee = 1_800 := by decide
example : specSmallVesselClassSpecialRegistrationFee = 1_500 := by decide
example : specPilotClass1RegistrationFee = 60_000 := by decide
example : specPilotClass2RegistrationFee = 30_000 := by decide
example : specPilotClass3RegistrationFee = 15_000 := by decide
example : specMaritimeAssistantExaminerRegistrationFee = 30_000 := by decide
example : specMaritimeAgentRegistrationFee = 30_000 := by decide
example : specSocialInsuranceLabourConsultantRegistrationFee = 30_000 := by decide
example : specSocialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee = 5_000 := by decide
example : specWorkingEnvironmentMeasurementOfficerType1RegistrationFee = 30_000 := by decide
example : specWorkingEnvironmentMeasurementOfficerType2RegistrationFee = 15_000 := by decide
example : specCareerConsultantRegistrationFee = 9_000 := by decide
example : specMetrologyOfficerRegistrationFee = 30_000 := by decide
example : specInformationProcessingSecuritySupportSpecialistRegistrationFee = 9_000 := by decide
example : specPatentAttorneyRegistrationFee = 60_000 := by decide
example : specDentalHygienistRegistrationFee = 9_000 := by decide
example : specDentalTechnicianRegistrationFee = 9_000 := by decide
example : specEmergencyMedicalTechnicianRegistrationFee = 9_000 := by decide
example : specSpeechLanguageHearingTherapistRegistrationFee = 9_000 := by decide
example : specAnmaMassageShiatsuPractitionerRegistrationFee = 9_000 := by decide
example : specJudoTherapistRegistrationFee = 9_000 := by decide
example : specDieticianRegistrationFee = 15_000 := by decide
example : specBarberRegistrationFee = 9_000 := by decide
example : specHairdresserRegistrationFee = 9_000 := by decide
example : specSocialWorkerRegistrationFee = 15_000 := by decide
example : specCareWorkerRegistrationFee = 9_000 := by decide
example : specMentalHealthWorkerRegistrationFee = 15_000 := by decide
example : specVeterinarianRegistrationFee = 30_000 := by decide
example : specProvisionalVeterinarianRegistrationFee = 9_000 := by decide
example : specPetAnimalNurseRegistrationFee = 9_000 := by decide

example : specCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : specForeignCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : specAdministrativeScrivenerRegistrationFee = 30_000 := by decide
example : specPoliticalFundsComplianceAuditorRegistrationFee = 15_000 := by decide
example : specAttorneyRegistrationFee = 60_000 := by decide
example : specForeignLegalAffairsAttorneyRegistrationFee = 60_000 := by decide
example : specJudicialScrivenerRegistrationFee = 30_000 := by decide
example : specSimplifyCourtLitigationAgencyCertificationFee = 5_000 := by decide
example : specLandAndBuildingSurveyorRegistrationFee = 30_000 := by decide
example : specAlternativeDisputeResolutionAgencyCertificationFee = 5_000 := by decide
example : specTaxAccountantRegistrationFee = 60_000 := by decide
example : specRegisteredEngineerRegistrationFee = 30_000 := by decide
example : specAssistantEngineerRegistrationFee = 15_000 := by decide
example : specCertifiedPsychologistRegistrationFee = 15_000 := by decide
example : specPhysicianDentistRegistrationFee = 60_000 := by decide
example : specPharmacistRegistrationFee = 30_000 := by decide
example : specHealthNurseEtcRegistrationFee = 9_000 := by decide
example : specRegistrationModificationFee = 1_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFees : Bool :=
  specCertifiedPublicAccountantRegistrationFee == certifiedPublicAccountantRegistrationFee &&
    specForeignCertifiedPublicAccountantRegistrationFee == foreignCertifiedPublicAccountantRegistrationFee &&
    specAdministrativeScrivenerRegistrationFee == administrativeScrivenerRegistrationFee &&
    specPoliticalFundsComplianceAuditorRegistrationFee == politicalFundsComplianceAuditorRegistrationFee &&
    specAttorneyRegistrationFee == attorneyRegistrationFee &&
    specForeignLegalAffairsAttorneyRegistrationFee == foreignLegalAffairsAttorneyRegistrationFee &&
    specJudicialScrivenerRegistrationFee == judicialScrivenerRegistrationFee &&
    specSimplifyCourtLitigationAgencyCertificationFee == simplifyCourtLitigationAgencyCertificationFee &&
    specLandAndBuildingSurveyorRegistrationFee == landAndBuildingSurveyorRegistrationFee &&
    specAlternativeDisputeResolutionAgencyCertificationFee == alternativeDisputeResolutionAgencyCertificationFee &&
    specTaxAccountantRegistrationFee == taxAccountantRegistrationFee &&
    specRegisteredEngineerRegistrationFee == registeredEngineerRegistrationFee &&
    specAssistantEngineerRegistrationFee == assistantEngineerRegistrationFee &&
    specCertifiedPsychologistRegistrationFee == certifiedPsychologistRegistrationFee &&
    specPhysicianDentistRegistrationFee == physicianDentistRegistrationFee &&
    specPharmacistRegistrationFee == pharmacistRegistrationFee &&
    specHealthNurseEtcRegistrationFee == healthNurseEtcRegistrationFee &&
    specRegistrationModificationFee == registrationModificationFee &&
    specDentalHygienistRegistrationFee == dentalHygienistRegistrationFee &&
    specDentalTechnicianRegistrationFee == dentalTechnicianRegistrationFee &&
    specEmergencyMedicalTechnicianRegistrationFee == emergencyMedicalTechnicianRegistrationFee &&
    specSpeechLanguageHearingTherapistRegistrationFee == speechLanguageHearingTherapistRegistrationFee &&
    specAnmaMassageShiatsuPractitionerRegistrationFee == anmaMassageShiatsuPractitionerRegistrationFee &&
    specJudoTherapistRegistrationFee == judoTherapistRegistrationFee &&
    specDieticianRegistrationFee == dieticianRegistrationFee &&
    specBarberRegistrationFee == barberRegistrationFee &&
    specHairdresserRegistrationFee == hairdresserRegistrationFee &&
    specSocialWorkerRegistrationFee == socialWorkerRegistrationFee &&
    specCareWorkerRegistrationFee == careWorkerRegistrationFee &&
    specMentalHealthWorkerRegistrationFee == mentalHealthWorkerRegistrationFee &&
    specVeterinarianRegistrationFee == veterinarianRegistrationFee &&
    specProvisionalVeterinarianRegistrationFee == provisionalVeterinarianRegistrationFee &&
    specPetAnimalNurseRegistrationFee == petAnimalNurseRegistrationFee &&
    specSocialInsuranceLabourConsultantRegistrationFee == socialInsuranceLabourConsultantRegistrationFee &&
    specSocialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee == socialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee &&
    specWorkingEnvironmentMeasurementOfficerType1RegistrationFee == workingEnvironmentMeasurementOfficerType1RegistrationFee &&
    specWorkingEnvironmentMeasurementOfficerType2RegistrationFee == workingEnvironmentMeasurementOfficerType2RegistrationFee &&
    specCareerConsultantRegistrationFee == careerConsultantRegistrationFee &&
    specMetrologyOfficerRegistrationFee == metrologyOfficerRegistrationFee &&
    specInformationProcessingSecuritySupportSpecialistRegistrationFee == informationProcessingSecuritySupportSpecialistRegistrationFee &&
    specPatentAttorneyRegistrationFee == patentAttorneyRegistrationFee &&
    specSmallVesselClass1RegistrationFee == smallVesselClass1RegistrationFee &&
    specSmallVesselClass2RegistrationFee == smallVesselClass2RegistrationFee &&
    specSmallVesselClassSpecialRegistrationFee == smallVesselClassSpecialRegistrationFee &&
    specPilotClass1RegistrationFee == pilotClass1RegistrationFee &&
    specPilotClass2RegistrationFee == pilotClass2RegistrationFee &&
    specPilotClass3RegistrationFee == pilotClass3RegistrationFee &&
    specMaritimeAssistantExaminerRegistrationFee == maritimeAssistantExaminerRegistrationFee &&
    specMaritimeAgentRegistrationFee == maritimeAgentRegistrationFee

example : agreeRegistrationQualificationFees = true := by decide

end JapanTaxLaw
