import JapanTaxLaw.RegistrationQualificationFees

/-!
# RegistrationQualificationFees tests — 別表第一（二）第三十二号 (一)〜(九) smoke checks

Decidable smoke tests for the flat qualification registration fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- （一）イ／ロ 公認会計士・外国公認会計士
example : certifiedPublicAccountantRegistrationFee = 60_000 := by decide
example : foreignCertifiedPublicAccountantRegistrationFee = 60_000 := by decide
-- （二）行政書士 ／ （二の二）政治資金監査人
example : administrativeScrivenerRegistrationFee = 30_000 := by decide
example : politicalFundsComplianceAuditorRegistrationFee = 15_000 := by decide
-- （三）弁護士 ／ （四）外国法事務弁護士
example : attorneyRegistrationFee = 60_000 := by decide
example : foreignLegalAffairsAttorneyRegistrationFee = 60_000 := by decide
-- （五）司法書士 ／ 簡裁訴訟代理等関係業務の認定
example : judicialScrivenerRegistrationFee = 30_000 := by decide
example : simplifyCourtLitigationAgencyCertificationFee = 5_000 := by decide
-- （六）土地家屋調査士 ／ 民間紛争解決手続代理関係業務の認定
example : landAndBuildingSurveyorRegistrationFee = 30_000 := by decide
example : alternativeDisputeResolutionAgencyCertificationFee = 5_000 := by decide
-- （七）税理士
example : taxAccountantRegistrationFee = 60_000 := by decide
-- （八）技術士 ／ 技術士補
example : registeredEngineerRegistrationFee = 30_000 := by decide
example : assistantEngineerRegistrationFee = 15_000 := by decide
-- （八の二）公認心理師
example : certifiedPsychologistRegistrationFee = 15_000 := by decide
-- （九）医師又は歯科医師／薬剤師／保健師、助産師、看護師等／登録事項の変更
example : physicianDentistRegistrationFee = 60_000 := by decide
example : pharmacistRegistrationFee = 30_000 := by decide
example : healthNurseEtcRegistrationFee = 9_000 := by decide
example : registrationModificationFee = 1_000 := by decide
-- （十）〜（十三） 歯科衛生士・歯科技工士・救急救命士・言語聴覚士・あん摩・きゆう師
example : dentalHygienistRegistrationFee = 9_000 := by decide
example : dentalTechnicianRegistrationFee = 9_000 := by decide
example : emergencyMedicalTechnicianRegistrationFee = 9_000 := by decide
example : speechLanguageHearingTherapistRegistrationFee = 9_000 := by decide
example : anmaMassageShiatsuPractitionerRegistrationFee = 9_000 := by decide
-- （十四）柔道整復師 ／ （十五）管理栄養士 ／ （十六）理容師 ／ （十七）美容師
example : judoTherapistRegistrationFee = 9_000 := by decide
example : dieticianRegistrationFee = 15_000 := by decide
example : barberRegistrationFee = 9_000 := by decide
example : hairdresserRegistrationFee = 9_000 := by decide
-- （十八）社会福祉士・介護福祉士 ／ （十九）精神保健福祉士
example : socialWorkerRegistrationFee = 15_000 := by decide
example : careWorkerRegistrationFee = 9_000 := by decide
example : mentalHealthWorkerRegistrationFee = 15_000 := by decide
-- （二十）獣医師／仮免状の所有者 ／ （二十の二）愛玩動物看護師
example : veterinarianRegistrationFee = 30_000 := by decide
example : provisionalVeterinarianRegistrationFee = 9_000 := by decide
example : petAnimalNurseRegistrationFee = 9_000 := by decide
-- （二十一）社会保険労務士（イ 登録／ロ 紛争解決手続代理業務試験合格の付記）
example : socialInsuranceLabourConsultantRegistrationFee = 30_000 := by decide
example : socialInsuranceLabourConsultantConciliationTestAppendedRegistrationFee = 5_000 := by decide
-- （二十二）作業環境測定士（イ 第一種／ロ 第二種）
example : workingEnvironmentMeasurementOfficerType1RegistrationFee = 30_000 := by decide
example : workingEnvironmentMeasurementOfficerType2RegistrationFee = 15_000 := by decide
-- （二十二の二）キャリアコンサルタント ／ （二十三）計量士 ／ （二十三の二）情報処理安全確保支援士 ／ （二十四）弁理士
example : careerConsultantRegistrationFee = 9_000 := by decide
example : metrologyOfficerRegistrationFee = 30_000 := by decide
example : informationProcessingSecuritySupportSpecialistRegistrationFee = 9_000 := by decide
example : patentAttorneyRegistrationFee = 60_000 := by decide
-- （二十六）小型船舶操縦士（イ 一級／ロ 二級／ハ 特殊）
example : smallVesselClass1RegistrationFee = 2_000 := by decide
example : smallVesselClass2RegistrationFee = 1_800 := by decide
example : smallVesselClassSpecialRegistrationFee = 1_500 := by decide
-- （二十七）水先人（イ（１）一級／（２）二級／（３）三級）
example : pilotClass1RegistrationFee = 60_000 := by decide
example : pilotClass2RegistrationFee = 30_000 := by decide
example : pilotClass3RegistrationFee = 15_000 := by decide
-- （二十八）海事補佐人 ／ （二十九）海事代理士
example : maritimeAssistantExaminerRegistrationFee = 30_000 := by decide
example : maritimeAgentRegistrationFee = 30_000 := by decide
-- （三十）航空従事者技能証明（イ〜ヨ：定期運送用操縦士〜操縦技能審査員）
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
-- （三十一）不動産鑑定士 ／ （三十二）一級建築士
example : realEstateAppraiserRegistrationFee = 60_000 := by decide
example : firstClassArchitectRegistrationFee = 60_000 := by decide
-- （三十三）〜（三十五） 建築基準適合判定資格者／マンション管理士／測量士・測量士補
example : class1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee = 10_000 := by decide
example : class2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee = 5_000 := by decide
example : structureCalculationAssessmentQualifiedOfficerRegistrationFee = 10_000 := by decide
example : mansionManagementOfficerRegistrationFee = 9_000 := by decide
example : surveyorRegistrationFee = 30_000 := by decide
example : surveyorAssistantRegistrationFee = 15_000 := by decide
-- 三十二の二（認定匿名加工医療情報作成事業者等）／三十三 認定個人情報保護団体／三十四 警備員登録講習機関／三十四の二 登録誘引情報提供機関
example : anonymousMedicalInfoCreationBusinessLicenseFee = 150_000 := by decide
example : pseudonymousMedicalInfoCreationBusinessLicenseFee = 150_000 := by decide
example : pseudonymousMedicalInfoUtilizationBusinessLicenseFee = 150_000 := by decide
example : medicalInfoHandlingContractorLicenseFee = 150_000 := by decide
example : personalInfoProtectionAssociationLicenseFee = 90_000 := by decide
example : securityGuardTrainingInstitutionRegistrationFee = 90_000 := by decide
example : internetMatchmakingSolicitationInfoProviderRegistrationFee = 15_000 := by decide

end JapanTaxLaw
