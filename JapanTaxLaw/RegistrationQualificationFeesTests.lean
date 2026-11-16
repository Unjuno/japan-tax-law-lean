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
-- 三十四の三（一）〜（四） カジノ事業／カジノ施設供用事業／カジノ関連機器等製造業等／外国製造業の認定
example : casinoBusinessLicenseFee = 150_000 := by decide
example : casinoFacilityOperationBusinessLicenseFee = 150_000 := by decide
example : casinoEquipmentManufacturingEtcBusinessLicenseFee = 150_000 := by decide
example : casinoEquipmentForeignManufacturingLicenseFee = 150_000 := by decide
-- 三十六の二（一）〜（六） 電子決済等取扱業者／協会 等の登録・認定（¥150,000 固定）
example : electronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : creditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : electronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : creditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
-- 三十六の三（一）〜（八） 電子決済等代行業者 ¥90,000／代行協会 ¥150,000（¥90,000／¥150,000 固定）
example : electronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : creditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : laborBankElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : creditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : electronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : creditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : laborBankElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : creditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
-- 三十七（一）〜（七） 保険業の新規免許・少額短期保険業者の登録・特定保険業の認可・保険仲立人の登録（¥150,000／¥90,000／¥150,000／¥90,000固定）
example : insuranceBusinessLicenseFee = 150_000 := by decide
example : smallShortTermInsuranceBusinessOperatorRegistrationFee = 150_000 := by decide
example : specialInsuranceBusinessLicenseFee = 150_000 := by decide
example : insuranceBrokerRegistrationFee = 90_000 := by decide
-- 三十七（五）〜（七） 特定保険募集人（¥15,000）・保険金信託業務の認可（¥150,000）・保険持株会社（¥150,000）
example : specialInsuranceSolicitorRegistrationFee = 15_000 := by decide
example : insuranceClaimsTrustBusinessLicenseFee = 150_000 := by decide
example : insuranceHoldingCompanyLicenseFee = 150_000 := by decide
-- 三十八（一）〜（六） 信託業の免許・管理型信託会社／外国信託会社の登録・自己信託登録・特定大学技術移転事業承認事業者の登録
example : trustBusinessLicenseFee = 150_000 := by decide
example : managementTypeTrustCompanyRegistrationFee = 150_000 := by decide
example : managementTypeForeignTrustCompanyRegistrationFee = 150_000 := by decide
example : selfTrustBusinessRegistrationFee = 150_000 := by decide
example : technologyTransferApprovalBusinessOperatorRegistrationFee = 150_000 := by decide
example : trustContractAgentRegistrationFee = 90_000 := by decide
-- 三十九〜三十九の二 担保付社債信託事業の免許／企業価値担保権に関する信託業務の免許（¥150,000）
example : securedBondTrustBusinessLicenseFee = 150_000 := by decide
example : enterpriseValueCollateralRightTrustBusinessLicenseFee = 150_000 := by decide
-- 四十（一）〜（九） 金融商品市場開設の免許・国際協力排出削減量市場認可・組織変更の認可・店頭売買市場認可・外国市場取引の認可・金融商品取引所持株会社認可・認定金融商品取引業協会認定・認定投資者保護団体認定（¥90,000）・自主規制業務認可
example : financialInstrumentsMarketEstablishmentLicenseFee = 150_000 := by decide
example : internationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee = 150_000 := by decide
example : organizationalChangeApprovalFee = 150_000 := by decide
example : overTheCounterSecuritiesTradingMarketEstablishmentApprovalFee = 150_000 := by decide
example : foreignMarketTradingApprovalFee = 150_000 := by decide
example : financialInstrumentsExchangeHoldingCompanyApprovalFee = 150_000 := by decide
example : certifiedFinancialInstrumentsBusinessAssociationAuthorizationFee = 150_000 := by decide
example : certifiedInvestorProtectionAssociationAuthorizationFee = 90_000 := by decide
example : selfRegulationBusinessApprovalFee = 150_000 := by decide
-- 四十一（一）〜（十三） 金融商品取引業者の登録・変更登録・業務の認可・引受業務許可（¥90,000）・取引所取引業務許可・電子店頭デリバティブ取引等業務許可・仲介業者登録（¥90,000）・信用格付業者登録（¥90,000）・投資運用関係業務受託業者登録／変更登録（¥90,000）・金融商品取引清算機関／外国金融商品取引清算機関の金融商品債務引受業免許・連携金融商品債務引受業務認可
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

end JapanTaxLaw
