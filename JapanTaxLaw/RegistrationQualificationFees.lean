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

/-- 三十四の三（一） 特定複合観光施設区域整備法（平成三十年法律第八十号）第三十九条（免許等）のカジノ事業の免許につきの額（固定 ¥150,000）。 -/
def casinoBusinessLicenseFee : Money := 150_000

/-- 三十四の三（二） 同法第百二十四条（免許）のカジノ施設供用事業の免許につきの額（固定 ¥150,000）。 -/
def casinoFacilityOperationBusinessLicenseFee : Money := 150_000

/-- 三十四の三（三） 同法第百四十三条第一項（許可）のカジノ関連機器等製造業、カジノ関連機器等輸入業、
    カジノ関連機器等販売業又はカジノ関連機器等修理業の許可につきの額（固定 ¥150,000）。 -/
def casinoEquipmentManufacturingEtcBusinessLicenseFee : Money := 150_000

/-- 三十六の二（一） 銀行法第五十二条の六十の三（登録）の電子決済等取扱業者の登録につきの額（固定 ¥150,000）。 -/
def electronicPaymentBusinessOperatorRegistrationFee : Money := 150_000

/-- 三十六の二（二） 信用金庫法第八十五条の三第一項（登録）の信用金庫電子決済等取扱業者の登録につきの額（固定 ¥150,000）。 -/
def creditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee : Money := 150_000

/-- 三十六の二（三） 協同組合による金融事業に関する法律第六条の四の三第一項（信用協同組合電子決済等取扱業の登録）の信用協同組合電子決済等取扱業者の登録につきの額（固定 ¥150,000）。 -/
def creditCooperativeElectronicPaymentBusinessOperatorRegistrationFee : Money := 150_000

/-- 三十六の二（四） 銀行法第五十二条の六十の二十五（認定電子決済等取扱事業者協会の認定）の認定電子決済等取扱事業者協会の認定につきの額（固定 ¥150,000）。 -/
def electronicPaymentBusinessAssociationLicenseFee : Money := 150_000

/-- 三十六の二（五） 信用金庫法第八十五条の三の四（認定信用金庫電子決済等取扱事業者協会の認定）の認定信用金庫電子決済等取扱事業者協会の認定につきの額（固定 ¥150,000）。 -/
def creditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee : Money := 150_000

/-- 三十六の三（一） 銀行法第五十二条の六十一の二（登録）の電子決済等代行業者の登録につきの額（固定 ¥90,000）。 -/
def electronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000

/-- 三十六の三（二） 信用金庫法第八十五条の四第一項（登録）の信用金庫電子決済等代行業者の登録につきの額（固定 ¥90,000）。 -/
def creditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000

/-- 三十六の三（三） 労働金庫法第八十九条の五第一項（登録）の労働金庫電子決済等代行業者の登録につきの額（固定 ¥90,000）。 -/
def laborBankElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000

/-- 三十六の三（四） 協同組合による金融事業に関する法律第六条の五の二第一項（信用協同組合電子決済等代行業の登録）の信用協同組合電子決済等代行業者の登録につきの額（固定 ¥90,000）。 -/
def creditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000

/-- 三十六の三（五） 銀行法第五十二条の六十一の十九（認定電子決済等代行事業者協会の認定）の認定電子決済等代行事業者協会の認定につきの額（固定 ¥150,000）。 -/
def electronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000

/-- 三十六の三（六） 信用金庫法第八十五条の九（認定信用金庫電子決済等代行事業者協会の認定）の認定信用金庫電子決済等代行事業者協会の認定につきの額（固定 ¥150,000）。 -/
def creditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000

/-- 三十六の三（七） 労働金庫法第八十九条の十（認定労働金庫電子決済等代行事業者協会の認定）の認定労働金庫電子決済等代行事業者協会の認定につきの額（固定 ¥150,000）。 -/
def laborBankElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000

/-- 三十七（一） 保険業法第三条第一項（免許）、第百八十五条第一項（免許）又は第二百十九条第一項（免許）の
    規定による保険業の新規免許につきの額（固定 ¥150,000）。 -/
def insuranceBusinessLicenseFee : Money := 150_000

/-- 三十七（二） 保険業法第二百七十二条第一項（登録）の少額短期保険業者の登録につきの額（固定 ¥150,000）。 -/
def smallShortTermInsuranceBusinessOperatorRegistrationFee : Money := 150_000

/-- 三十七（三） 保険業法等の一部を改正する法律（平成十七年法律第三十八号）附則第二条第一項
    （特定保険業を行つていた一般社団法人等に関する特例）の特定保険業の認可につきの額（固定 ¥150,000）。 -/
def specialInsuranceBusinessLicenseFee : Money := 150_000

/-- 三十七（四） 保険業法第二百八十六条（登録）の保険仲立人の登録につきの額（固定 ¥90,000）。 -/
def insuranceBrokerRegistrationFee : Money := 90_000

/-- 三十七（五） 保険業法第二百七十六条の特定保険募集人の登録（同法第二条第二十四項に規定する所属保険会社等からの委託又は
    同法第二百七十五条第三項に規定する保険募集再委託者からの再委託（一時的な必要に基づき期限を付して行われる委託又は
    再委託で財務省令で定めるものを除く。）を受けた者に係るものに限る。）につきの額（固定 ¥15,000）。 -/
def specialInsuranceSolicitorRegistrationFee : Money := 15_000

/-- 三十七（六） 保険業法第九十九条第七項（業務の範囲等）の保険金信託業務の認可につきの額（固定 ¥150,000）。 -/
def insuranceClaimsTrustBusinessLicenseFee : Money := 150_000

/-- 三十八（一） 信託業法（平成十六年法律第百五十四号）第三条（免許）又は第五十三条第一項（免許）の
    規定による信託業の免許につきの額（固定 ¥150,000）。 -/
def trustBusinessLicenseFee : Money := 150_000

/-- 三十八（二） 信託業法第七条第一項（登録）の管理型信託会社の登録につきの額（固定 ¥150,000）。 -/
def managementTypeTrustCompanyRegistrationFee : Money := 150_000

/-- 三十八（三） 信託業法第五十四条第一項（登録）の管理型外国信託会社の登録につきの額（固定 ¥150,000）。 -/
def managementTypeForeignTrustCompanyRegistrationFee : Money := 150_000

/-- 三十八（四） 信託業法第五十条の二第一項（信託法第三条第三号に掲げる方法によつてする信託についての特例）の
    自己信託に係る事務に関する事業の登録につきの額（固定 ¥150,000）。 -/
def selfTrustBusinessRegistrationFee : Money := 150_000

/-- 三十八（五） 信託業法第五十二条第一項（特定大学技術移転事業に係る信託についての特例）の
    特定大学技術移転事業承認事業者の登録につきの額（固定 ¥150,000）。 -/
def technologyTransferApprovalBusinessOperatorRegistrationFee : Money := 150_000

/-- 三十九 担保付社債信託法（昭和二十八年法律第百九号）第三条（免許）の担保付社債に関する
    信託事業の免許につきの額（固定 ¥150,000）。 -/
def securedBondTrustBusinessLicenseFee : Money := 150_000

/-- 三十九の二 事業性融資の推進等に関する法律（令和六年法律第五十二号）第三十二条（免許）の
    企業価値担保権に関する信託業務の免許につきの額（固定 ¥150,000）。 -/
def enterpriseValueCollateralRightTrustBusinessLicenseFee : Money := 150_000

/-- 四十（一） 金融商品取引法（昭和二十三年法律第二十五号）第八十条第一項（免許）の
    金融商品市場の開設の免許につきの額（固定 ¥150,000）。 -/
def financialInstrumentsMarketEstablishmentLicenseFee : Money := 150_000

/-- 四十（二） 金融商品取引法第八十七条の二第一項ただし書（国際協力排出削減量に係る取引を行う市場の開設等の認可）の
    認可につきの額（固定 ¥150,000）。 -/
def internationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee : Money := 150_000

/-- 四十（三） 金融商品取引法第百一条の十七第一項（組織変更の認可）の組織変更の認可につきの額（固定 ¥150,000）。 -/
def organizationalChangeApprovalFee : Money := 150_000

/-- 四十（四） 金融商品取引法第六十七条の十二（規則の認可）の店頭売買有価証券市場の開設の認可につきの額（固定 ¥150,000）。 -/
def overTheCounterSecuritiesTradingMarketEstablishmentApprovalFee : Money := 150_000

/-- 四十（五） 金融商品取引法第百五十五条第一項（認可）の外国市場取引の認可につきの額（固定 ¥150,000）。 -/
def foreignMarketTradingApprovalFee : Money := 150_000

/-- 四十（六） 金融商品取引法第百六条の十第一項又は第三項ただし書（認可等）の認可につきの額（固定 ¥150,000）。 -/
def financialInstrumentsExchangeHoldingCompanyApprovalFee : Money := 150_000

/-- 四十（七） 金融商品取引法第七十八条第一項（認定金融商品取引業協会の認定）の認定金融商品取引業協会の認定につきの額（固定 ¥150,000）。 -/
def certifiedFinancialInstrumentsBusinessAssociationAuthorizationFee : Money := 150_000

/-- 四十（八） 金融商品取引法第七十九条の七第一項（認定投資者保護団体の目的及び業務）の認定投資者保護団体の認定につきの額（固定 ¥90,000）。 -/
def certifiedInvestorProtectionAssociationAuthorizationFee : Money := 90_000

/-- 四十一（一） 金融商品取引法第二十九条（登録）の金融商品取引業者の登録につきの額（固定 ¥150,000）。 -/
def financialInstrumentsBusinessOperatorRegistrationFee : Money := 150_000

/-- 四十一（二） 金融商品取引法第三十一条第四項（変更登録等）の変更登録につきの額（固定 ¥150,000）。 -/
def financialInstrumentsBusinessOperatorRegistrationChangeFee : Money := 150_000

/-- 四十一（三） 金融商品取引法第三十条第一項（認可）の業務の認可につきの額（固定 ¥150,000）。 -/
def financialInstrumentsBusinessApprovalFee : Money := 150_000

/-- 四十一（四） 金融商品取引法第五十九条第一項（引受業務の一部の許可）の引受業務の許可につきの額（固定 ¥90,000）。 -/
def underwritingBusinessPartApprovalFee : Money := 90_000

/-- 四十一（五） 金融商品取引法第六十条第一項（取引所取引業務の許可）の取引所取引業務の許可につきの額（固定 ¥150,000）。 -/
def exchangeTradingBusinessApprovalFee : Money := 150_000

/-- 四十一（六） 金融商品取引法第六十条の十四第一項（電子店頭デリバティブ取引等業務の許可）の電子店頭デリバティブ取引等業務の許可につきの額（固定 ¥150,000）。 -/
def electronicOverTheCounterDerivativesTradingBusinessApprovalFee : Money := 150_000

/-- 四十一（七） 金融商品取引法第六十六条（登録）の金融商品仲介業者の登録につきの額（固定 ¥90,000）。 -/
def financialInstrumentsIntermediaryBusinessOperatorRegistrationFee : Money := 90_000

/-- 四十一（八） 金融商品取引法第六十六条の二十七（登録）の信用格付業者の登録につきの額（固定 ¥90,000）。 -/
def creditRatingBusinessOperatorRegistrationFee : Money := 90_000

/-- 四十一（九） 金融商品取引法第六十六条の七十一（登録）の投資運用関係業務受託業者の登録につきの額（固定 ¥90,000）。 -/
def investmentManagementRelatedServicesContractorRegistrationFee : Money := 90_000

/-- 四十一（十） 金融商品取引法第六十六条の七十五第四項（変更登録等）の変更登録につきの額（固定 ¥90,000）。 -/
def investmentManagementRelatedServicesContractorRegistrationChangeFee : Money := 90_000

/-- 四十一（十一） 金融商品取引法第百五十六条の二（免許）の金融商品取引清算機関の金融商品債務引受業の免許につきの額（固定 ¥150,000）。 -/
def financialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee : Money := 150_000

/-- 四十一（十二） 金融商品取引法第百五十六条の二十の二（免許）の外国金融商品取引清算機関の金融商品債務引受業の免許につきの額（固定 ¥150,000）。 -/
def foreignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee : Money := 150_000

/-- 四十四 金融商品取引法第百五十六条の二十四第一項（免許及び免許の申請）の証券金融会社の免許につきの額（固定 ¥150,000）。 -/
def securitiesFinanceCompanyLicenseFee : Money := 150_000

/-- 四十五 金融業者の貸付業務のための社債の発行等に関する法律（平成十一年法律第三十二号）第三条（登録）の
    特定金融会社等の登録につきの額（固定 ¥150,000）。 -/
def specificFinanceCompanyRegistrationFee : Money := 150_000

/-- 四十六（一） 貸金業法（昭和五十八年法律第三十二号）第三条第一項（登録）の
    内閣総理大臣がする貸金業者の登録につきの額（固定 ¥150,000）。 -/
def moneyLendingBusinessOperatorRegistrationFee : Money := 150_000

/-- 四十六（二） 貸金業法第二十四条の二十五第二項（登録講習機関の登録）の登録につきの額（固定 ¥90,000）。 -/
def moneyLendingBusinessOperatorTrainingManagerRegistrationFee : Money := 90_000

/-- 四十七（一） 無尽業法（昭和六年法律第四十二号）第二条第一項（免許）の無尽業の免許につきの額（固定 ¥150,000）。 -/
def mujinBusinessLicenseFee : Money := 150_000

/-- 四十七（二） 無尽業法第七条第三号（認可）の無尽会社の出張所又は代理店の設置の認可につきの額（固定 ¥90,000）。 -/
def mujinCompanyBranchOrAgentEstablishmentApprovalFee : Money := 90_000

/-- 四十八（一） 金融サービスの提供及び利用環境の整備等に関する法律（平成十二年法律第百一号）第十二条（登録）の
    金融サービス仲介業者の登録につきの額（固定 ¥90,000）。 -/
def financialServicesIntermediaryBusinessOperatorRegistrationFee : Money := 90_000

/-- 四十八（二） 同法第十六条第一項（変更登録等）の変更登録につきの額（固定 ¥90,000）。 -/
def financialServicesIntermediaryBusinessOperatorRegistrationChangeFee : Money := 90_000

/-- 四十九（一） 資金決済に関する法律（平成二十一年法律第五十九号）第七条（第三者型発行者の登録）の
    第三者型前払式支払手段の発行者の登録につきの額（固定 ¥150,000）。 -/
def thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee : Money := 150_000

/-- 四十九（二） 資金決済に関する法律第三十七条（資金移動業者の登録）の資金移動業者の登録につきの額（固定 ¥150,000）。 -/
def moneyTransferBusinessOperatorRegistrationFee : Money := 150_000

/-- 四十九（三） 資金決済に関する法律第四十一条第一項（変更登録等）の変更登録につきの額（固定 ¥150,000）。 -/
def moneyTransferBusinessOperatorRegistrationChangeFee : Money := 150_000

/-- 四十九（四） 資金決済に関する法律第六十二条の三（電子決済手段等取引業者の登録）の電子決済手段等取引業者の登録につきの額（固定 ¥150,000）。 -/
def electronicSettlementTransactionsBusinessOperatorRegistrationFee : Money := 150_000

/-- 四十九（五） 資金決済に関する法律第六十二条の七第一項（変更登録等）の変更登録につきの額（固定 ¥150,000）。 -/
def electronicSettlementTransactionsBusinessOperatorRegistrationChangeFee : Money := 150_000

/-- 四十九（六） 資金決済に関する法律第六十三条の二（暗号資産交換業者の登録）の暗号資産交換業者の登録につきの額（固定 ¥150,000）。 -/
def cryptoAssetExchangeBusinessOperatorRegistrationFee : Money := 150_000

/-- 四十九（七） 資金決済に関する法律第六十三条の二十二の二（電子決済手段・暗号資産サービス仲介業者の登録）の
    電子決済手段・暗号資産サービス仲介業者の登録につきの額（固定 ¥90,000）。 -/
def electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee : Money := 90_000

/-- 四十九（八） 資金決済に関する法律第六十三条の二十二の六第一項（変更登録等）の変更登録につきの額（固定 ¥90,000）。 -/
def electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee : Money := 90_000

/-- 四十九（九） 資金決済に関する法律第六十三条の二十三（為替取引分析業者の許可）の為替取引分析業者の許可につきの額（固定 ¥150,000）。 -/
def exchangeTransactionAnalysisBusinessApprovalFee : Money := 150_000

/-- 四十九（十） 資金決済に関する法律第六十三条の三十三第一項（業務の種別の変更の許可等）の変更の許可につきの額（固定 ¥150,000）。 -/
def exchangeTransactionAnalysisBusinessKindChangeApprovalFee : Money := 150_000

/-- 四十九（十一） 資金決済に関する法律第六十四条第一項（資金清算機関の免許等）の資金清算業の免許につきの額（固定 ¥150,000）。 -/
def fundsClearingBusinessLicenseFee : Money := 150_000

/-- 四十九（十二） 資金決済に関する法律第八十七条（認定資金決済事業者協会の認定）の認定資金決済事業者協会の認定につきの額（固定 ¥150,000）。 -/
def certifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee : Money := 150_000

/-- 五十（一） 公認会計士法第三十四条の二十四（有限責任監査法人の登録）の登録につきの額（固定 ¥150,000）。 -/
def limitedLiabilityAuditCorporationRegistrationFee : Money := 150_000

/-- 五十（二） 公認会計士法第三十四条の三十四の二（登録上場会社等監査人の登録）の登録につきの額（固定 ¥90,000）。 -/
def registeredListedCompanyAuditorRegistrationFee : Money := 90_000

/-- 五十（三） 公認会計士法第十六条第一項（実務補習）の実務補習団体等の認定につきの額（固定 ¥150,000）。 -/
def practicalTrainingCorporationAuthorizationFee : Money := 150_000

/-- 五十の二 消費者安全法（平成二十一年法律第五十号）第十条の三第一項（登録試験機関の登録）の
    消費生活相談員に係る登録試験機関の登録につきの額（固定 ¥150,000）。 -/
def consumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee : Money := 150_000

/-- 五十の三 消費者の財産的被害等の集団的な回復のための民事の裁判手続の特例に関する法律（平成二十五年法律第九十六号）
    第七十一条第一項（特定適格消費者団体の認定）の認定につきの額（固定 ¥15,000）。 -/
def specificQualifiedConsumerGroupAuthorizationFee : Money := 15_000

theorem thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee_pos :
    thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee > 0 := by decide
theorem moneyTransferBusinessOperatorRegistrationFee_pos :
    moneyTransferBusinessOperatorRegistrationFee > 0 := by decide
theorem moneyTransferBusinessOperatorRegistrationChangeFee_pos :
    moneyTransferBusinessOperatorRegistrationChangeFee > 0 := by decide
theorem electronicSettlementTransactionsBusinessOperatorRegistrationFee_pos :
    electronicSettlementTransactionsBusinessOperatorRegistrationFee > 0 := by decide
theorem electronicSettlementTransactionsBusinessOperatorRegistrationChangeFee_pos :
    electronicSettlementTransactionsBusinessOperatorRegistrationChangeFee > 0 := by decide
theorem cryptoAssetExchangeBusinessOperatorRegistrationFee_pos :
    cryptoAssetExchangeBusinessOperatorRegistrationFee > 0 := by decide
theorem electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee_pos :
    electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee > 0 := by decide
theorem electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee_pos :
    electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee > 0 := by decide
theorem exchangeTransactionAnalysisBusinessApprovalFee_pos :
    exchangeTransactionAnalysisBusinessApprovalFee > 0 := by decide
theorem exchangeTransactionAnalysisBusinessKindChangeApprovalFee_pos :
    exchangeTransactionAnalysisBusinessKindChangeApprovalFee > 0 := by decide
theorem fundsClearingBusinessLicenseFee_pos : fundsClearingBusinessLicenseFee > 0 := by decide
theorem certifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee_pos :
    certifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee > 0 := by decide
theorem limitedLiabilityAuditCorporationRegistrationFee_pos :
    limitedLiabilityAuditCorporationRegistrationFee > 0 := by decide
theorem registeredListedCompanyAuditorRegistrationFee_pos :
    registeredListedCompanyAuditorRegistrationFee > 0 := by decide
theorem practicalTrainingCorporationAuthorizationFee_pos :
    practicalTrainingCorporationAuthorizationFee > 0 := by decide
theorem consumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee_pos :
    consumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee > 0 := by decide
theorem specificQualifiedConsumerGroupAuthorizationFee_pos :
    specificQualifiedConsumerGroupAuthorizationFee > 0 := by decide

example : thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee = 150_000 := by decide
example : moneyTransferBusinessOperatorRegistrationFee = 150_000 := by decide
example : moneyTransferBusinessOperatorRegistrationChangeFee = 150_000 := by decide
example : electronicSettlementTransactionsBusinessOperatorRegistrationFee = 150_000 := by decide
example : electronicSettlementTransactionsBusinessOperatorRegistrationChangeFee = 150_000 := by decide
example : cryptoAssetExchangeBusinessOperatorRegistrationFee = 150_000 := by decide
example : electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee = 90_000 := by decide
example : electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee = 90_000 := by decide
example : exchangeTransactionAnalysisBusinessApprovalFee = 150_000 := by decide
example : exchangeTransactionAnalysisBusinessKindChangeApprovalFee = 150_000 := by decide
example : fundsClearingBusinessLicenseFee = 150_000 := by decide
example : certifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee = 150_000 := by decide
example : limitedLiabilityAuditCorporationRegistrationFee = 150_000 := by decide
example : registeredListedCompanyAuditorRegistrationFee = 90_000 := by decide
example : practicalTrainingCorporationAuthorizationFee = 150_000 := by decide
example : consumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee = 150_000 := by decide
example : specificQualifiedConsumerGroupAuthorizationFee = 15_000 := by decide

/-- 四十八（三） 同法第四十条（認定金融サービス仲介業協会の認定）の認定金融サービス仲介業協会の認定につきの額（固定 ¥150,000）。 -/
def certifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee : Money := 150_000

theorem securitiesFinanceCompanyLicenseFee_pos : securitiesFinanceCompanyLicenseFee > 0 := by decide
theorem specificFinanceCompanyRegistrationFee_pos : specificFinanceCompanyRegistrationFee > 0 := by decide
theorem moneyLendingBusinessOperatorRegistrationFee_pos : moneyLendingBusinessOperatorRegistrationFee > 0 := by decide
theorem moneyLendingBusinessOperatorTrainingManagerRegistrationFee_pos :
    moneyLendingBusinessOperatorTrainingManagerRegistrationFee > 0 := by decide
theorem mujinBusinessLicenseFee_pos : mujinBusinessLicenseFee > 0 := by decide
theorem mujinCompanyBranchOrAgentEstablishmentApprovalFee_pos :
    mujinCompanyBranchOrAgentEstablishmentApprovalFee > 0 := by decide
theorem financialServicesIntermediaryBusinessOperatorRegistrationFee_pos :
    financialServicesIntermediaryBusinessOperatorRegistrationFee > 0 := by decide
theorem financialServicesIntermediaryBusinessOperatorRegistrationChangeFee_pos :
    financialServicesIntermediaryBusinessOperatorRegistrationChangeFee > 0 := by decide
theorem certifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee_pos :
    certifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee > 0 := by decide

example : securitiesFinanceCompanyLicenseFee = 150_000 := by decide
example : specificFinanceCompanyRegistrationFee = 150_000 := by decide
example : moneyLendingBusinessOperatorRegistrationFee = 150_000 := by decide
example : moneyLendingBusinessOperatorTrainingManagerRegistrationFee = 90_000 := by decide
example : mujinBusinessLicenseFee = 150_000 := by decide
example : mujinCompanyBranchOrAgentEstablishmentApprovalFee = 90_000 := by decide
example : financialServicesIntermediaryBusinessOperatorRegistrationFee = 90_000 := by decide
example : financialServicesIntermediaryBusinessOperatorRegistrationChangeFee = 90_000 := by decide
example : certifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee = 150_000 := by decide

/-- 四十一（十三） 金融商品取引法第百五十六条の二十の十六第一項（他の金融商品取引清算機関等と連携する場合の認可）の
    連攜金融商品債務引受業務の認可につきの額（固定 ¥150,000）。 -/
def financialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee : Money := 150_000

theorem financialInstrumentsBusinessOperatorRegistrationFee_pos : financialInstrumentsBusinessOperatorRegistrationFee > 0 := by decide
theorem financialInstrumentsBusinessOperatorRegistrationChangeFee_pos :
    financialInstrumentsBusinessOperatorRegistrationChangeFee > 0 := by decide
theorem financialInstrumentsBusinessApprovalFee_pos : financialInstrumentsBusinessApprovalFee > 0 := by decide
theorem underwritingBusinessPartApprovalFee_pos : underwritingBusinessPartApprovalFee > 0 := by decide
theorem exchangeTradingBusinessApprovalFee_pos : exchangeTradingBusinessApprovalFee > 0 := by decide
theorem electronicOverTheCounterDerivativesTradingBusinessApprovalFee_pos :
    electronicOverTheCounterDerivativesTradingBusinessApprovalFee > 0 := by decide
theorem financialInstrumentsIntermediaryBusinessOperatorRegistrationFee_pos :
    financialInstrumentsIntermediaryBusinessOperatorRegistrationFee > 0 := by decide
theorem creditRatingBusinessOperatorRegistrationFee_pos :
    creditRatingBusinessOperatorRegistrationFee > 0 := by decide
theorem investmentManagementRelatedServicesContractorRegistrationFee_pos :
    investmentManagementRelatedServicesContractorRegistrationFee > 0 := by decide
theorem investmentManagementRelatedServicesContractorRegistrationChangeFee_pos :
    investmentManagementRelatedServicesContractorRegistrationChangeFee > 0 := by decide
theorem financialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee_pos :
    financialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee > 0 := by decide
theorem foreignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee_pos :
    foreignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee > 0 := by decide
theorem financialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee_pos :
    financialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee > 0 := by decide

example : financialInstrumentsBusinessOperatorRegistrationFee = 150_000 := by decide
example : financialInstrumentsBusinessOperatorRegistrationChangeFee = 150_000 := by decide
example : financialInstrumentsBusinessApprovalFee = 150_000 := by decide
example : underwritingBusinessPartApprovalFee = 90_000 := by decide
example : exchangeTradingBusinessApprovalFee = 150_000 := by decide
example : electronicOverTheCounterDerivativesTradingBusinessApprovalFee = 150_000 := by decide
example : financialInstrumentsIntermediaryBusinessOperatorRegistrationFee = 90_000 := by decide
example : creditRatingBusinessOperatorRegistrationFee = 90_000 := by decide
example : investmentManagementRelatedServicesContractorRegistrationFee = 90_000 := by decide
example : investmentManagementRelatedServicesContractorRegistrationChangeFee = 90_000 := by decide
example : financialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee = 150_000 := by decide
example : foreignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee = 150_000 := by decide
example : financialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee = 150_000 := by decide

/-- 四十（九） 金融商品取引法第百二条の十四（自主規制法人による自主規制業務）の自主規制業務の認可につきの額（固定 ¥150,000）。 -/
def selfRegulationBusinessApprovalFee : Money := 150_000

theorem securedBondTrustBusinessLicenseFee_pos : securedBondTrustBusinessLicenseFee > 0 := by decide
theorem enterpriseValueCollateralRightTrustBusinessLicenseFee_pos :
    enterpriseValueCollateralRightTrustBusinessLicenseFee > 0 := by decide
theorem financialInstrumentsMarketEstablishmentLicenseFee_pos :
    financialInstrumentsMarketEstablishmentLicenseFee > 0 := by decide
theorem internationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee_pos :
    internationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee > 0 := by decide
theorem organizationalChangeApprovalFee_pos : organizationalChangeApprovalFee > 0 := by decide
theorem overTheCounterSecuritiesTradingMarketEstablishmentApprovalFee_pos :
    overTheCounterSecuritiesTradingMarketEstablishmentApprovalFee > 0 := by decide
theorem foreignMarketTradingApprovalFee_pos : foreignMarketTradingApprovalFee > 0 := by decide
theorem financialInstrumentsExchangeHoldingCompanyApprovalFee_pos :
    financialInstrumentsExchangeHoldingCompanyApprovalFee > 0 := by decide
theorem certifiedFinancialInstrumentsBusinessAssociationAuthorizationFee_pos :
    certifiedFinancialInstrumentsBusinessAssociationAuthorizationFee > 0 := by decide
theorem certifiedInvestorProtectionAssociationAuthorizationFee_pos :
    certifiedInvestorProtectionAssociationAuthorizationFee > 0 := by decide
theorem selfRegulationBusinessApprovalFee_pos : selfRegulationBusinessApprovalFee > 0 := by decide

example : securedBondTrustBusinessLicenseFee = 150_000 := by decide
example : enterpriseValueCollateralRightTrustBusinessLicenseFee = 150_000 := by decide
example : financialInstrumentsMarketEstablishmentLicenseFee = 150_000 := by decide
example : internationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee = 150_000 := by decide
example : organizationalChangeApprovalFee = 150_000 := by decide
example : overTheCounterSecuritiesTradingMarketEstablishmentApprovalFee = 150_000 := by decide
example : foreignMarketTradingApprovalFee = 150_000 := by decide
example : financialInstrumentsExchangeHoldingCompanyApprovalFee = 150_000 := by decide
example : certifiedFinancialInstrumentsBusinessAssociationAuthorizationFee = 150_000 := by decide
example : certifiedInvestorProtectionAssociationAuthorizationFee = 90_000 := by decide
example : selfRegulationBusinessApprovalFee = 150_000 := by decide

/-- 三十八（六） 信託業法第六十七条第一項（登録）の信託契約代理店の登録につきの額（固定 ¥90,000）。 -/
def trustContractAgentRegistrationFee : Money := 90_000

theorem trustBusinessLicenseFee_pos : trustBusinessLicenseFee > 0 := by decide
theorem managementTypeTrustCompanyRegistrationFee_pos : managementTypeTrustCompanyRegistrationFee > 0 := by decide
theorem managementTypeForeignTrustCompanyRegistrationFee_pos : managementTypeForeignTrustCompanyRegistrationFee > 0 := by decide
theorem selfTrustBusinessRegistrationFee_pos : selfTrustBusinessRegistrationFee > 0 := by decide
theorem technologyTransferApprovalBusinessOperatorRegistrationFee_pos :
    technologyTransferApprovalBusinessOperatorRegistrationFee > 0 := by decide
theorem trustContractAgentRegistrationFee_pos : trustContractAgentRegistrationFee > 0 := by decide

example : trustBusinessLicenseFee = 150_000 := by decide
example : managementTypeTrustCompanyRegistrationFee = 150_000 := by decide
example : managementTypeForeignTrustCompanyRegistrationFee = 150_000 := by decide
example : selfTrustBusinessRegistrationFee = 150_000 := by decide
example : technologyTransferApprovalBusinessOperatorRegistrationFee = 150_000 := by decide
example : trustContractAgentRegistrationFee = 90_000 := by decide

/-- 三十七（七） 保険業法第二百七十一条の十八第一項又は第三項ただし書（保険持株会社に係る認可等）の認可につきの額（固定 ¥150,000）。 -/
def insuranceHoldingCompanyLicenseFee : Money := 150_000

theorem insuranceBusinessLicenseFee_pos : insuranceBusinessLicenseFee > 0 := by decide
theorem smallShortTermInsuranceBusinessOperatorRegistrationFee_pos :
    smallShortTermInsuranceBusinessOperatorRegistrationFee > 0 := by decide
theorem specialInsuranceBusinessLicenseFee_pos : specialInsuranceBusinessLicenseFee > 0 := by decide
theorem insuranceBrokerRegistrationFee_pos : insuranceBrokerRegistrationFee > 0 := by decide
theorem specialInsuranceSolicitorRegistrationFee_pos : specialInsuranceSolicitorRegistrationFee > 0 := by decide
theorem insuranceClaimsTrustBusinessLicenseFee_pos : insuranceClaimsTrustBusinessLicenseFee > 0 := by decide
theorem insuranceHoldingCompanyLicenseFee_pos : insuranceHoldingCompanyLicenseFee > 0 := by decide

example : insuranceBusinessLicenseFee = 150_000 := by decide
example : smallShortTermInsuranceBusinessOperatorRegistrationFee = 150_000 := by decide
example : specialInsuranceBusinessLicenseFee = 150_000 := by decide
example : insuranceBrokerRegistrationFee = 90_000 := by decide
example : specialInsuranceSolicitorRegistrationFee = 15_000 := by decide
example : insuranceClaimsTrustBusinessLicenseFee = 150_000 := by decide
example : insuranceHoldingCompanyLicenseFee = 150_000 := by decide

/-- 三十六の三（八） 協同組合による金融事業に関する法律第六条の五の七（認定信用協同組合電子決済等代行事業者協会の認定）の認定信用協同組合電子決済等代行事業者協会の認定につきの額（固定 ¥150,000）。 -/
def creditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000

theorem electronicPaymentProxyBusinessOperatorRegistrationFee_pos : electronicPaymentProxyBusinessOperatorRegistrationFee > 0 := by decide
theorem creditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee_pos :
    creditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee > 0 := by decide
theorem laborBankElectronicPaymentProxyBusinessOperatorRegistrationFee_pos :
    laborBankElectronicPaymentProxyBusinessOperatorRegistrationFee > 0 := by decide
theorem creditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee_pos :
    creditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee > 0 := by decide
theorem electronicPaymentProxyBusinessAssociationLicenseFee_pos : electronicPaymentProxyBusinessAssociationLicenseFee > 0 := by decide
theorem creditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee_pos :
    creditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee > 0 := by decide
theorem laborBankElectronicPaymentProxyBusinessAssociationLicenseFee_pos :
    laborBankElectronicPaymentProxyBusinessAssociationLicenseFee > 0 := by decide
theorem creditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee_pos :
    creditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee > 0 := by decide

example : electronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : creditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : laborBankElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : creditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : electronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : creditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : laborBankElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide

/-- 三十六の二（六） 協同組合による金融事業に関する法律第六条の四の六（認定信用協同組合電子決済等取扱事業者協会の認定）の認定信用協同組合電子決済等取扱事業者協会の認定につきの額（固定 ¥150,000）。 -/
def creditCooperativeElectronicPaymentBusinessAssociationLicenseFee : Money := 150_000

theorem electronicPaymentBusinessOperatorRegistrationFee_pos : electronicPaymentBusinessOperatorRegistrationFee > 0 := by decide
theorem creditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee_pos :
    creditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee > 0 := by decide
theorem creditCooperativeElectronicPaymentBusinessOperatorRegistrationFee_pos :
    creditCooperativeElectronicPaymentBusinessOperatorRegistrationFee > 0 := by decide
theorem electronicPaymentBusinessAssociationLicenseFee_pos : electronicPaymentBusinessAssociationLicenseFee > 0 := by decide
theorem creditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee_pos :
    creditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee > 0 := by decide
theorem creditCooperativeElectronicPaymentBusinessAssociationLicenseFee_pos :
    creditCooperativeElectronicPaymentBusinessAssociationLicenseFee > 0 := by decide

example : electronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : creditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : electronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : creditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide

/-- 三十四の三（四） 同法第百五十条第一項（カジノ関連機器等外国製造業の認定）のカジノ関連機器等外国製造業の認定につきの額（固定 ¥150,000）。 -/
def casinoEquipmentForeignManufacturingLicenseFee : Money := 150_000

theorem casinoBusinessLicenseFee_pos : casinoBusinessLicenseFee > 0 := by decide
theorem casinoFacilityOperationBusinessLicenseFee_pos : casinoFacilityOperationBusinessLicenseFee > 0 := by decide
theorem casinoEquipmentManufacturingEtcBusinessLicenseFee_pos : casinoEquipmentManufacturingEtcBusinessLicenseFee > 0 := by decide
theorem casinoEquipmentForeignManufacturingLicenseFee_pos : casinoEquipmentForeignManufacturingLicenseFee > 0 := by decide

example : casinoBusinessLicenseFee = 150_000 := by decide
example : casinoFacilityOperationBusinessLicenseFee = 150_000 := by decide
example : casinoEquipmentManufacturingEtcBusinessLicenseFee = 150_000 := by decide
example : casinoEquipmentForeignManufacturingLicenseFee = 150_000 := by decide

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
