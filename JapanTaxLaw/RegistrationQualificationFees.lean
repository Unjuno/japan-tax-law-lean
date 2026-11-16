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

/-- （二十六）イ 船舶職員及び小型船舶操縦者法第二十三条の五（登録及び小型船舶操縦免許証）の
    一級小型船舶操縦士の登録につきの額（固定 ¥2,000）。 -/
def smallVesselClass1RegistrationFee : Money := 2_000

/-- （二十六）ロ 二級小型船舶操縦士の登録につきの額（固定 ¥1,800）。 -/
def smallVesselClass2RegistrationFee : Money := 1_800

/-- （二十六）ハ 特殊小型船舶操縦士の登録につきの額（固定 ¥1,500）。 -/
def smallVesselClassSpecialRegistrationFee : Money := 1_500

/-- （二十七）イ（１） 水先法第九条第一項（登録及び水先免状）の一級水先人の登録につきの額（固定 ¥60,000）。 -/
def pilotClass1RegistrationFee : Money := 60_000

/-- （二十七）イ（２） 水先法第九条第一項の二級水先人の登録につきの額（固定 ¥30,000）。 -/
def pilotClass2RegistrationFee : Money := 30_000

/-- （二十七）イ（３） 水先法第九条第一項の三級水先人の登録につきの額（固定 ¥15,000）。 -/
def pilotClass3RegistrationFee : Money := 15_000

/-- （二十八） 海難審判法（昭和二十二年法律第百三十五号）第二十一条第一項（登録）の海事補佐人の登録につきの額（固定 ¥30,000）。 -/
def maritimeAssistantExaminerRegistrationFee : Money := 30_000

/-- （三十）イ 定期運送用操縦士の技能証明につきの額（固定 ¥18,000）。 -/
def airlineTransportPilotLicenseFee : Money := 18_000

/-- （三十）ロ 事業用操縦士の技能証明につきの額（固定 ¥7,500）。 -/
def commercialPilotLicenseFee : Money := 7_500

/-- （三十）ハ 自家用操縦士の技能証明につきの額（固定 ¥3,000）。 -/
def privatePilotLicenseFee : Money := 3_000

/-- （三十）ニ 准定期運送用操縦士の技能証明につきの額（固定 ¥6,000）。 -/
def associateAirlineTransportPilotLicenseFee : Money := 6_000

/-- （三十）ホ 一等航空士又は航空機関士の技能証明につきの額（固定 ¥12,000）。 -/
def class1FlightEngineerOrNavigatorLicenseFee : Money := 12_000

/-- （三十）ヘ 二等航空士の技能証明につきの額（固定 ¥7,500）。 -/
def class2FlightNavigatorLicenseFee : Money := 7_500

/-- （三十）ト 航空通信士の技能証明につきの額（固定 ¥3,000）。 -/
def aviationCommunicationsOfficerLicenseFee : Money := 3_000

/-- （三十）チ 一等航空整備士の技能証明につきの額（固定 ¥9,000）。 -/
def class1AircraftMaintenanceEngineerLicenseFee : Money := 9_000

/-- （三十）リ 二等航空整備士の技能証明につきの額（固定 ¥6,000）。 -/
def class2AircraftMaintenanceEngineerLicenseFee : Money := 6_000

/-- （三十）ヌ 一等航空運航整備士の技能証明につきの額（固定 ¥6,000）。 -/
def class1AircraftOperationEngineerLicenseFee : Money := 6_000

/-- （三十）ル 二等航空運航整備士の技能証明につきの額（固定 ¥3,000）。 -/
def class2AircraftOperationEngineerLicenseFee : Money := 3_000

/-- （三十）ヲ 航空工場整備士の技能証明につきの額（固定 ¥9,000）。 -/
def aircraftFactoryMaintenanceEngineerLicenseFee : Money := 9_000

/-- （三十）ワ 一等無人航空機操縦士の技能証明（更新の技能証明を除く。）につきの額（固定 ¥3,000）。 -/
def class1UnmannedAircraftPilotLicenseFee : Money := 3_000

/-- （三十）カ 耐空検査員の認定につきの額（固定 ¥6,000）。 -/
def airworthinessInspectorAuthorizationFee : Money := 6_000

/-- （三十一）イ 不動産の鑑定評価に関する法律第十五条（登録）の不動産鑑定士の登録につきの額（固定 ¥60,000）。 -/
def realEstateAppraiserRegistrationFee : Money := 60_000

/-- （三十三）イ 建築基準法（昭和二十五年法律第二百一号）第七十七条の五十八第一項（登録）の
    一級建築基準適合判定資格者の登録につきの額（固定 ¥10,000）。 -/
def class1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee : Money := 10_000

/-- （三十三）ロ 二級建築基準適合判定資格者の登録につきの額（固定 ¥5,000）。 -/
def class2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee : Money := 5_000

/-- （三十三）ハ 構造計算適合判定資格者の登録につきの額（固定 ¥10,000）。 -/
def structureCalculationAssessmentQualifiedOfficerRegistrationFee : Money := 10_000

/-- （三十四） マンションの管理の適正化の推進に関する法律（平成十二年法律第百四十九号）第三十条第一項（登録）の
    マンション管理士の登録につきの額（固定 ¥9,000）。 -/
def mansionManagementOfficerRegistrationFee : Money := 9_000

/-- （三十五）イ 測量法（昭和二十四年法律第百八十八号）第四十九条第一項（測量士及び測量士補の登録）の
    測量士の登録につきの額（固定 ¥30,000）。 -/
def surveyorRegistrationFee : Money := 30_000

/-- （三十五）ロ 測量士補の登録につきの額（固定 ¥15,000）。 -/
def surveyorAssistantRegistrationFee : Money := 15_000

/-- 三十二の二（一） 医療分野の研究開発に資するための匿名加工医療情報及び仮名加工医療情報に関する法律
    （平成二十九年法律第二十八号）第九条第一項（認定）の認定匿名加工医療情報作成事業者の認定につきの額（固定 ¥150,000）。 -/
def anonymousMedicalInfoCreationBusinessLicenseFee : Money := 150_000

/-- 三十二の二（二） 同法第三十三条（認定）の認定仮名加工医療情報作成事業者の認定につきの額（固定 ¥150,000）。 -/
def pseudonymousMedicalInfoCreationBusinessLicenseFee : Money := 150_000

/-- 三十二の二（三） 同法第四十一条（認定）の認定仮名加工医療情報利用事業者の認定につきの額（固定 ¥150,000）。 -/
def pseudonymousMedicalInfoUtilizationBusinessLicenseFee : Money := 150_000

/-- 三十二の二（四） 同法第四十五条（認定）の認定医療情報等取扱受託事業者の認定につきの額（固定 ¥150,000）。 -/
def medicalInfoHandlingContractorLicenseFee : Money := 150_000

/-- 三十三 認定個人情報保護団体の認定（個人情報の保護に関する法律（平成十五年法律第五十七号）第四十七条第一項（認定）、（政令で定めるものに限る。）につきの額（固定 ¥90,000）。 -/
def personalInfoProtectionAssociationLicenseFee : Money := 90_000

/-- 三十四 警備業法（昭和四十七年法律第百十七号）第二十三条第三項（登録講習機関の登録）の
    警備員等に係る登録講習機関の登録につきの額（固定 ¥90,000）。 -/
def securityGuardTrainingInstitutionRegistrationFee : Money := 90_000

/-- 三十四の二 インターネット異性紹介事業を利用して児童を誘引する行為の規制等に関する法律
    （平成十五年法律第八十三号）第十八条第一項（登録誘引情報提供機関の登録）の
    インターネット異性紹介事業者に係る登録誘引情報提供機関の登録につきの額（固定 ¥15,000）。 -/
def internetMatchmakingSolicitationInfoProviderRegistrationFee : Money := 15_000

theorem class1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee_pos :
    class1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee > 0 := by decide
theorem class2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee_pos :
    class2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee > 0 := by decide
theorem structureCalculationAssessmentQualifiedOfficerRegistrationFee_pos :
    structureCalculationAssessmentQualifiedOfficerRegistrationFee > 0 := by decide
theorem mansionManagementOfficerRegistrationFee_pos :
    mansionManagementOfficerRegistrationFee > 0 := by decide
theorem surveyorRegistrationFee_pos : surveyorRegistrationFee > 0 := by decide
theorem surveyorAssistantRegistrationFee_pos : surveyorAssistantRegistrationFee > 0 := by decide
theorem anonymousMedicalInfoCreationBusinessLicenseFee_pos :
    anonymousMedicalInfoCreationBusinessLicenseFee > 0 := by decide
theorem pseudonymousMedicalInfoCreationBusinessLicenseFee_pos :
    pseudonymousMedicalInfoCreationBusinessLicenseFee > 0 := by decide
theorem pseudonymousMedicalInfoUtilizationBusinessLicenseFee_pos :
    pseudonymousMedicalInfoUtilizationBusinessLicenseFee > 0 := by decide
theorem medicalInfoHandlingContractorLicenseFee_pos :
    medicalInfoHandlingContractorLicenseFee > 0 := by decide
theorem personalInfoProtectionAssociationLicenseFee_pos :
    personalInfoProtectionAssociationLicenseFee > 0 := by decide
theorem securityGuardTrainingInstitutionRegistrationFee_pos :
    securityGuardTrainingInstitutionRegistrationFee > 0 := by decide
theorem internetMatchmakingSolicitationInfoProviderRegistrationFee_pos :
    internetMatchmakingSolicitationInfoProviderRegistrationFee > 0 := by decide

example : class1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee = 10_000 := by decide
example : class2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee = 5_000 := by decide
example : structureCalculationAssessmentQualifiedOfficerRegistrationFee = 10_000 := by decide
example : mansionManagementOfficerRegistrationFee = 9_000 := by decide
example : surveyorRegistrationFee = 30_000 := by decide
example : surveyorAssistantRegistrationFee = 15_000 := by decide
example : anonymousMedicalInfoCreationBusinessLicenseFee = 150_000 := by decide
example : pseudonymousMedicalInfoCreationBusinessLicenseFee = 150_000 := by decide
example : pseudonymousMedicalInfoUtilizationBusinessLicenseFee = 150_000 := by decide
example : medicalInfoHandlingContractorLicenseFee = 150_000 := by decide
example : personalInfoProtectionAssociationLicenseFee = 90_000 := by decide
example : securityGuardTrainingInstitutionRegistrationFee = 90_000 := by decide
example : internetMatchmakingSolicitationInfoProviderRegistrationFee = 15_000 := by decide

/-- （三十二） 建築士法（昭和二十五年法律第二百二号）第五条第一項（登録）の一級建築士の登録につきの額（固定 ¥60,000）。 -/
def firstClassArchitectRegistrationFee : Money := 60_000

theorem realEstateAppraiserRegistrationFee_pos : realEstateAppraiserRegistrationFee > 0 := by decide
theorem firstClassArchitectRegistrationFee_pos : firstClassArchitectRegistrationFee > 0 := by decide

example : realEstateAppraiserRegistrationFee = 60_000 := by decide
example : firstClassArchitectRegistrationFee = 60_000 := by decide
-- （三十一）ロ 変更の登録につきの額は既モデル化の `registrationModificationFee`（¥1,000）
--   （同一モジュール内で別証明済／保留）

/-- （三十）ヨ 操縦技能審査員の認定につきの額（固定 ¥3,000）。 -/
def pilotSkillExaminerAuthorizationFee : Money := 3_000

theorem airlineTransportPilotLicenseFee_pos : airlineTransportPilotLicenseFee > 0 := by decide
theorem commercialPilotLicenseFee_pos : commercialPilotLicenseFee > 0 := by decide
theorem privatePilotLicenseFee_pos : privatePilotLicenseFee > 0 := by decide
theorem associateAirlineTransportPilotLicenseFee_pos : associateAirlineTransportPilotLicenseFee > 0 := by decide
theorem class1FlightEngineerOrNavigatorLicenseFee_pos : class1FlightEngineerOrNavigatorLicenseFee > 0 := by decide
theorem class2FlightNavigatorLicenseFee_pos : class2FlightNavigatorLicenseFee > 0 := by decide
theorem aviationCommunicationsOfficerLicenseFee_pos : aviationCommunicationsOfficerLicenseFee > 0 := by decide
theorem class1AircraftMaintenanceEngineerLicenseFee_pos : class1AircraftMaintenanceEngineerLicenseFee > 0 := by decide
theorem class2AircraftMaintenanceEngineerLicenseFee_pos : class2AircraftMaintenanceEngineerLicenseFee > 0 := by decide
theorem class1AircraftOperationEngineerLicenseFee_pos : class1AircraftOperationEngineerLicenseFee > 0 := by decide
theorem class2AircraftOperationEngineerLicenseFee_pos : class2AircraftOperationEngineerLicenseFee > 0 := by decide
theorem aircraftFactoryMaintenanceEngineerLicenseFee_pos : aircraftFactoryMaintenanceEngineerLicenseFee > 0 := by decide
theorem class1UnmannedAircraftPilotLicenseFee_pos : class1UnmannedAircraftPilotLicenseFee > 0 := by decide
theorem airworthinessInspectorAuthorizationFee_pos : airworthinessInspectorAuthorizationFee > 0 := by decide
theorem pilotSkillExaminerAuthorizationFee_pos : pilotSkillExaminerAuthorizationFee > 0 := by decide

example : airlineTransportPilotLicenseFee = 18_000 := by decide
example : commercialPilotLicenseFee = 7_500 := by decide
example : privatePilotLicenseFee = 3_000 := by decide
example : associateAirlineTransportPilotLicenseFee = 6_000 := by decide
example : class1FlightEngineerOrNavigatorLicenseFee = 12_000 := by decide
example : class2FlightNavigatorLicenseFee = 7_500 := by decide
example : aviationCommunicationsOfficerLicenseFee = 3_000 := by decide
example : class1AircraftMaintenanceEngineerLicenseFee = 9_000 := by decide
example : class2AircraftMaintenanceEngineerLicenseFee = 6_000 := by decide
example : class1AircraftOperationEngineerLicenseFee = 6_000 := by decide
example : class2AircraftOperationEngineerLicenseFee = 3_000 := by decide
example : aircraftFactoryMaintenanceEngineerLicenseFee = 9_000 := by decide
example : class1UnmannedAircraftPilotLicenseFee = 3_000 := by decide
example : airworthinessInspectorAuthorizationFee = 6_000 := by decide
example : pilotSkillExaminerAuthorizationFee = 3_000 := by decide

/-- （二十九） 海事代理士法（昭和二十六年法律第三十二号）第九条第一項（登録）の海事代理士の登録につきの額（固定 ¥30,000）。 -/
def maritimeAgentRegistrationFee : Money := 30_000

theorem smallVesselClass1RegistrationFee_pos : smallVesselClass1RegistrationFee > 0 := by decide
theorem smallVesselClass2RegistrationFee_pos : smallVesselClass2RegistrationFee > 0 := by decide
theorem smallVesselClassSpecialRegistrationFee_pos : smallVesselClassSpecialRegistrationFee > 0 := by decide
theorem pilotClass1RegistrationFee_pos : pilotClass1RegistrationFee > 0 := by decide
theorem pilotClass2RegistrationFee_pos : pilotClass2RegistrationFee > 0 := by decide
theorem pilotClass3RegistrationFee_pos : pilotClass3RegistrationFee > 0 := by decide
theorem maritimeAssistantExaminerRegistrationFee_pos : maritimeAssistantExaminerRegistrationFee > 0 := by decide
theorem maritimeAgentRegistrationFee_pos : maritimeAgentRegistrationFee > 0 := by decide

example : smallVesselClass1RegistrationFee = 2_000 := by decide
example : smallVesselClass2RegistrationFee = 1_800 := by decide
example : smallVesselClassSpecialRegistrationFee = 1_500 := by decide
example : pilotClass1RegistrationFee = 60_000 := by decide
example : pilotClass2RegistrationFee = 30_000 := by decide
example : pilotClass3RegistrationFee = 15_000 := by decide
example : maritimeAssistantExaminerRegistrationFee = 30_000 := by decide
example : maritimeAgentRegistrationFee = 30_000 := by decide

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
