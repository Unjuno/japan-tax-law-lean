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

/-- Spec: (三十）イ 定期運送用操縦士の技能証明。 -/
def specAirlineTransportPilotLicenseFee : Money := 18_000
/-- Spec: (三十）ロ 事業用操縦士の技能証明。 -/
def specCommercialPilotLicenseFee : Money := 7_500
/-- Spec: (三十）ハ 自家用操縦士の技能証明。 -/
def specPrivatePilotLicenseFee : Money := 3_000
/-- Spec: (三十）ニ 准定期運送用操縦士の技能証明。 -/
def specAssociateAirlineTransportPilotLicenseFee : Money := 6_000
/-- Spec: (三十）ホ 一等航空士又は航空機関士の技能証明。 -/
def specClass1FlightEngineerOrNavigatorLicenseFee : Money := 12_000
/-- Spec: (三十）ヘ 二等航空士の技能証明。 -/
def specClass2FlightNavigatorLicenseFee : Money := 7_500
/-- Spec: (三十）ト 航空通信士の技能証明。 -/
def specAviationCommunicationsOfficerLicenseFee : Money := 3_000
/-- Spec: (三十）チ 一等航空整備士の技能証明。 -/
def specClass1AircraftMaintenanceEngineerLicenseFee : Money := 9_000
/-- Spec: (三十）リ 二等航空整備士の技能証明。 -/
def specClass2AircraftMaintenanceEngineerLicenseFee : Money := 6_000
/-- Spec: (三十）ヌ 一等航空運航整備士の技能証明。 -/
def specClass1AircraftOperationEngineerLicenseFee : Money := 6_000
/-- Spec: (三十）ル 二等航空運航整備士の技能証明。 -/
def specClass2AircraftOperationEngineerLicenseFee : Money := 3_000
/-- Spec: (三十）ヲ 航空工場整備士の技能証明。 -/
def specAircraftFactoryMaintenanceEngineerLicenseFee : Money := 9_000
/-- Spec: (三十）ワ 一等無人航空機操縦士の技能証明。 -/
def specClass1UnmannedAircraftPilotLicenseFee : Money := 3_000
/-- Spec: (三十）カ 耐空検査員の認定。 -/
def specAirworthinessInspectorAuthorizationFee : Money := 6_000
/-- Spec: (三十）ヨ 操縦技能審査員の認定。 -/
def specPilotSkillExaminerAuthorizationFee : Money := 3_000

/-- Spec: (三十一）イ 不動産鑑定士の登録。 -/
def specRealEstateAppraiserRegistrationFee : Money := 60_000
/-- Spec: (三十二） 一級建築士の登録。 -/
def specFirstClassArchitectRegistrationFee : Money := 60_000

/-- Spec: (三十三）イ 一級建築基準適合判定資格者の登録。 -/
def specClass1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee : Money := 10_000
/-- Spec: (三十三）ロ 二級建築基準適合判定資格者の登録。 -/
def specClass2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee : Money := 5_000
/-- Spec: (三十三）ハ 構造計算適合判定資格者の登録。 -/
def specStructureCalculationAssessmentQualifiedOfficerRegistrationFee : Money := 10_000
/-- Spec: (三十四） マンション管理士の登録。 -/
def specMansionManagementOfficerRegistrationFee : Money := 9_000
/-- Spec: (三十五）イ 測量士の登録。 -/
def specSurveyorRegistrationFee : Money := 30_000
/-- Spec: (三十五）ロ 測量士補の登録。 -/
def specSurveyorAssistantRegistrationFee : Money := 15_000
/-- Spec: 三十二の二（一） 認定匿名加工医療情報作成事業者の認定。 -/
def specAnonymousMedicalInfoCreationBusinessLicenseFee : Money := 150_000
/-- Spec: 三十二の二（二） 認定仮名加工医療情報作成事業者の認定。 -/
def specPseudonymousMedicalInfoCreationBusinessLicenseFee : Money := 150_000
/-- Spec: 三十二の二（三） 認定仮名加工医療情報利用事業者の認定。 -/
def specPseudonymousMedicalInfoUtilizationBusinessLicenseFee : Money := 150_000
/-- Spec: 三十二の二（四） 認定医療情報等取扱受託事業者の認定。 -/
def specMedicalInfoHandlingContractorLicenseFee : Money := 150_000
/-- Spec: 三十三 認定個人情報保護団体の認定。 -/
def specPersonalInfoProtectionAssociationLicenseFee : Money := 90_000
/-- Spec: 三十四 警備員等に係る登録講習機関の登録。 -/
def specSecurityGuardTrainingInstitutionRegistrationFee : Money := 90_000
/-- Spec: 三十四の二 登録誘引情報提供機関の登録。 -/
def specInternetMatchmakingSolicitationInfoProviderRegistrationFee : Money := 15_000

/-- Spec: 三十四の三（一） カジノ事業の免許。 -/
def specCasinoBusinessLicenseFee : Money := 150_000
/-- Spec: 三十四の三（二） カジノ施設供用事業の免許。 -/
def specCasinoFacilityOperationBusinessLicenseFee : Money := 150_000
/-- Spec: 三十四の三（三） カジノ関連機器等製造業等の許可。 -/
def specCasinoEquipmentManufacturingEtcBusinessLicenseFee : Money := 150_000
/-- Spec: 三十四の三（四） カジノ関連機器等外国製造業の認定。 -/
def specCasinoEquipmentForeignManufacturingLicenseFee : Money := 150_000

/-- Spec: 三十六の二（一） 電子決済等取扱業者の登録。 -/
def specElectronicPaymentBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 三十六の二（二） 信用金庫電子決済等取扱業者の登録。 -/
def specCreditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 三十六の二（三） 信用協同組合電子決済等取扱業者の登録。 -/
def specCreditCooperativeElectronicPaymentBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 三十六の二（四） 認定電子決済等取扱事業者協会の認定。 -/
def specElectronicPaymentBusinessAssociationLicenseFee : Money := 150_000
/-- Spec: 三十六の二（五） 認定信用金庫電子決済等取扱事業者協会の認定。 -/
def specCreditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee : Money := 150_000
/-- Spec: 三十六の二（六） 認定信用協同組合電子決済等取扱事業者協会の認定。 -/
def specCreditCooperativeElectronicPaymentBusinessAssociationLicenseFee : Money := 150_000

/-- Spec: 三十六の三（一） 電子決済等代行業者の登録。 -/
def specElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 三十六の三（二） 信用金庫電子決済等代行業者の登録。 -/
def specCreditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 三十六の三（三） 労働金庫電子決済等代行業者の登録。 -/
def specLaborBankElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 三十六の三（四） 信用協同組合電子決済等代行業者の登録。 -/
def specCreditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 三十六の三（五） 認定電子決済等代行事業者協会の認定。 -/
def specElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000
/-- Spec: 三十六の三（六） 認定信用金庫電子決済等代行事業者協会の認定。 -/
def specCreditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000
/-- Spec: 三十六の三（七） 認定労働金庫電子決済等代行事業者協会の認定。 -/
def specLaborBankElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000
/-- Spec: 三十六の三（八） 認定信用協同組合電子決済等代行事業者協会の認定。 -/
def specCreditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee : Money := 150_000

/-- Spec: 三十七（一） 保険業の新規免許。 -/
def specInsuranceBusinessLicenseFee : Money := 150_000
/-- Spec: 三十七（二） 少額短期保険業者の登録。 -/
def specSmallShortTermInsuranceBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 三十七（三） 特定保険業の認可。 -/
def specSpecialInsuranceBusinessLicenseFee : Money := 150_000
/-- Spec: 三十七（四） 保険仲立人の登録。 -/
def specInsuranceBrokerRegistrationFee : Money := 90_000
/-- Spec: 三十七（五） 特定保険募集人の登録。 -/
def specSpecialInsuranceSolicitorRegistrationFee : Money := 15_000
/-- Spec: 三十七（六） 保険金信託業務の認可。 -/
def specInsuranceClaimsTrustBusinessLicenseFee : Money := 150_000
/-- Spec: 三十七（七） 保険持株会社に係る認可。 -/
def specInsuranceHoldingCompanyLicenseFee : Money := 150_000

/-- Spec: 三十八（一） 信託業の免許。 -/
def specTrustBusinessLicenseFee : Money := 150_000
/-- Spec: 三十八（二） 管理型信託会社の登録。 -/
def specManagementTypeTrustCompanyRegistrationFee : Money := 150_000
/-- Spec: 三十八（三） 管理型外国信託会社の登録。 -/
def specManagementTypeForeignTrustCompanyRegistrationFee : Money := 150_000
/-- Spec: 三十八（四） 自己信託に係る事務に関する事業の登録。 -/
def specSelfTrustBusinessRegistrationFee : Money := 150_000
/-- Spec: 三十八（五） 特定大学技術移転事業承認事業者の登録。 -/
def specTechnologyTransferApprovalBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 三十八（六） 信託契約代理店の登録。 -/
def specTrustContractAgentRegistrationFee : Money := 90_000

/-- Spec: 三十九 担保付社債に関する信託事業の免許。 -/
def specSecuredBondTrustBusinessLicenseFee : Money := 150_000
/-- Spec: 三十九の二 企業価値担保権に関する信託業務の免許。 -/
def specEnterpriseValueCollateralRightTrustBusinessLicenseFee : Money := 150_000
/-- Spec: 四十（一） 金融商品市場の開設の免許。 -/
def specFinancialInstrumentsMarketEstablishmentLicenseFee : Money := 150_000
/-- Spec: 四十（二） 国際協力排出削減量に係る取引を行う市場の開設等の認可。 -/
def specInternationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee : Money := 150_000
/-- Spec: 四十（三） 組織変更の認可。 -/
def specOrganizationalChangeApprovalFee : Money := 150_000
/-- Spec: 四十（四） 店頭売買有価証券市場の開設の認可。 -/
def specOverTheCounterSecuritiesTradingMarketEstablishmentApprovalFee : Money := 150_000
/-- Spec: 四十（五） 外国市場取引の認可。 -/
def specForeignMarketTradingApprovalFee : Money := 150_000
/-- Spec: 四十（六） 金融商品取引所持株会社に係る認可。 -/
def specFinancialInstrumentsExchangeHoldingCompanyApprovalFee : Money := 150_000
/-- Spec: 四十（七） 認定金融商品取引業協会の認定。 -/
def specCertifiedFinancialInstrumentsBusinessAssociationAuthorizationFee : Money := 150_000
/-- Spec: 四十（八） 認定投資者保護団体の認定。 -/
def specCertifiedInvestorProtectionAssociationAuthorizationFee : Money := 90_000
/-- Spec: 四十（九） 自主規制業務の認可。 -/
def specSelfRegulationBusinessApprovalFee : Money := 150_000

/-- Spec: 四十一（一） 金融商品取引業者の登録。 -/
def specFinancialInstrumentsBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 四十一（二） 金融商品取引業者の変更登録。 -/
def specFinancialInstrumentsBusinessOperatorRegistrationChangeFee : Money := 150_000
/-- Spec: 四十一（三） 金融商品取引業の業務の認可。 -/
def specFinancialInstrumentsBusinessApprovalFee : Money := 150_000
/-- Spec: 四十一（四） 引受業務の一部の許可。 -/
def specUnderwritingBusinessPartApprovalFee : Money := 90_000
/-- Spec: 四十一（五） 取引所取引業務の許可。 -/
def specExchangeTradingBusinessApprovalFee : Money := 150_000
/-- Spec: 四十一（六） 電子店頭デリバティブ取引等業務の許可。 -/
def specElectronicOverTheCounterDerivativesTradingBusinessApprovalFee : Money := 150_000
/-- Spec: 四十一（七） 金融商品仲介業者の登録。 -/
def specFinancialInstrumentsIntermediaryBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 四十一（八） 信用格付業者の登録。 -/
def specCreditRatingBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 四十一（九） 投資運用関係業務受託業者の登録。 -/
def specInvestmentManagementRelatedServicesContractorRegistrationFee : Money := 90_000
/-- Spec: 四十一（十） 投資運用関係業務受託業者の変更登録。 -/
def specInvestmentManagementRelatedServicesContractorRegistrationChangeFee : Money := 90_000
/-- Spec: 四十一（十一） 金融商品取引清算機関の金融商品債務引受業の免許。 -/
def specFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee : Money := 150_000
/-- Spec: 四十一（十二） 外国金融商品取引清算機関の金融商品債務引受業の免許。 -/
def specForeignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee : Money := 150_000
/-- Spec: 四十一（十三） 連携金融商品債務引受業務の認可。 -/
def specFinancialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee : Money := 150_000

/-- Spec: 四十四 証券金融会社の免許。 -/
def specSecuritiesFinanceCompanyLicenseFee : Money := 150_000
/-- Spec: 四十五 特定金融会社等の登録。 -/
def specSpecificFinanceCompanyRegistrationFee : Money := 150_000
/-- Spec: 四十六（一） 貸金業者の登録。 -/
def specMoneyLendingBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 四十六（二） 貸金業務取扱主任者に係る登録講習機関の登録。 -/
def specMoneyLendingBusinessOperatorTrainingManagerRegistrationFee : Money := 90_000
/-- Spec: 四十七（一） 無尽業の免許。 -/
def specMujinBusinessLicenseFee : Money := 150_000
/-- Spec: 四十七（二） 無尽会社の出張所又は代理店の設置の認可。 -/
def specMujinCompanyBranchOrAgentEstablishmentApprovalFee : Money := 90_000
/-- Spec: 四十八（一） 金融サービス仲介業者の登録。 -/
def specFinancialServicesIntermediaryBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 四十八（二） 金融サービス仲介業者の変更登録。 -/
def specFinancialServicesIntermediaryBusinessOperatorRegistrationChangeFee : Money := 90_000
/-- Spec: 四十八（三） 認定金融サービス仲介業協会の認定。 -/
def specCertifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee : Money := 150_000

/-- Spec: 四十九（一） 第三者型前払式支払手段の発行者の登録。 -/
def specThirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee : Money := 150_000
/-- Spec: 四十九（二） 資金移動業者の登録。 -/
def specMoneyTransferBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 四十九（三） 資金移動業者の変更登録。 -/
def specMoneyTransferBusinessOperatorRegistrationChangeFee : Money := 150_000
/-- Spec: 四十九（四） 電子決済手段等取引業者の登録。 -/
def specElectronicSettlementTransactionsBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 四十九（五） 電子決済手段等取引業者の変更登録。 -/
def specElectronicSettlementTransactionsBusinessOperatorRegistrationChangeFee : Money := 150_000
/-- Spec: 四十九（六） 暗号資産交換業者の登録。 -/
def specCryptoAssetExchangeBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 四十九（七） 電子決済手段・暗号資産サービス仲介業者の登録（固定 ¥90,000）。 -/
def specElectronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee : Money := 90_000
/-- Spec: 四十九（八） 電子決済手段・暗号資産サービス仲介業者の変更登録。 -/
def specElectronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee : Money := 90_000
/-- Spec: 四十九（九） 為替取引分析業者の許可。 -/
def specExchangeTransactionAnalysisBusinessApprovalFee : Money := 150_000
/-- Spec: 四十九（十） 為替取引分析業者の業務の種別の変更の許可。 -/
def specExchangeTransactionAnalysisBusinessKindChangeApprovalFee : Money := 150_000
/-- Spec: 四十九（十一） 資金清算業の免許。 -/
def specFundsClearingBusinessLicenseFee : Money := 150_000
/-- Spec: 四十九（十二） 認定資金決済事業者協会の認定。 -/
def specCertifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee : Money := 150_000
/-- Spec: 五十（一） 有限責任監査法人の登録。 -/
def specLimitedLiabilityAuditCorporationRegistrationFee : Money := 150_000
/-- Spec: 五十（二） 登録上場会社等監査人の登録。 -/
def specRegisteredListedCompanyAuditorRegistrationFee : Money := 90_000
/-- Spec: 五十（三） 実務補習団体等の認定。 -/
def specPracticalTrainingCorporationAuthorizationFee : Money := 150_000
/-- Spec: 五十の二 消費生活相談員に係る登録試験機関の登録。 -/
def specConsumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee : Money := 150_000
/-- Spec: 五十の三 特定適格消費者団体の認定。 -/
def specSpecificQualifiedConsumerGroupAuthorizationFee : Money := 15_000

/-- Spec: 五十一（一） 電気通信事業者の登録。 -/
def specTelecommunicationsBusinessOperatorRegistrationFee : Money := 150_000
/-- Spec: 五十一（二） 認定送信型対電気通信設備サイバー攻撃対処協会の認定。 -/
def specCertifiedAntiCyberAttackAssociationAuthorizationFee : Money := 150_000
/-- Spec: 五十一（三） 電気通信主任技術者に係る登録講習機関の登録。 -/
def specTelecommunicationsTechnologyMainEngineerCourseRegistrationFee : Money := 90_000
/-- Spec: 五十一（四） 端末機器に係る登録認定機関の登録。 -/
def specTelecommunicationsTerminalEquipmentRegistrationAuthorizationFee : Money := 90_000
/-- Spec: 五十二 特定電子メール等に係る登録送信適正化機関の登録。 -/
def specSpecificEmailTransmissionOptimizationRegistrationFee : Money := 90_000
/-- Spec: 五十三（一） 認定認証事業者の認定。 -/
def specCertifiedAuthenticationBusinessOperatorAuthorizationFee : Money := 90_000
/-- Spec: 五十三（二） 認定外国認証事業者の認定。 -/
def specCertifiedForeignAuthenticationBusinessOperatorAuthorizationFee : Money := 90_000
/-- Spec: 五十三の二 認定電子委任状取扱事業者の認定。 -/
def specElectronicAgentAuthorizationBusinessOperatorAuthorizationFee : Money := 90_000

/-- Spec: 五十四（一） 無線局の免許（放送用は ¥150,000、それ以外は ¥30,000）。 -/
def specRadioStationLicenseFee (broadcasting : Bool) : Money := if broadcasting then 150_000 else 30_000
/-- Spec: 五十四（二） 無線局の登録（¥30,000）。 -/
def specRadioStationRegistrationFee : Money := 30_000
/-- Spec: 五十四（三） 検査等事業者の登録（¥90,000）。 -/
def specRadioEquipmentInspectionBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 五十四（四） 外国点検事業者の登録（¥90,000）。 -/
def specForeignRadioEquipmentInspectionBusinessOperatorRegistrationFee : Money := 90_000
/-- Spec: 五十四（五） 登録証明機関の登録（¥90,000）。 -/
def specRadioEquipmentCertificationBodyRegistrationFee : Money := 90_000
/-- Spec: 五十四（六） 登録周波数終了対策機関の登録（¥90,000）。 -/
def specRadioFrequencyTerminationMeasureBodyRegistrationFee : Money := 90_000
/-- Spec: 五十五（一） 認定基幹放送事業者の認定（¥90,000）。 -/
def specCertifiedCoreBroadcastingBusinessOperatorAuthorizationFee : Money := 90_000
/-- Spec: 五十五（二） 登録一般放送事業者の登録／変更登録（¥90,000）。 -/
def specRegisteredGeneralBroadcastingBusinessOperatorFee : Money := 90_000
/-- Spec: 五十五（三） 認定放送持株会社の認定（¥150,000）。 -/
def specCertifiedBroadcastingHoldingCompanyAuthorizationFee : Money := 150_000

example : specRadioStationLicenseFee false = 30_000 := by decide
example : specRadioStationLicenseFee true = 150_000 := by decide
example : specRadioStationRegistrationFee = 30_000 := by decide
example : specRadioEquipmentInspectionBusinessOperatorRegistrationFee = 90_000 := by decide
example : specForeignRadioEquipmentInspectionBusinessOperatorRegistrationFee = 90_000 := by decide
example : specRadioEquipmentCertificationBodyRegistrationFee = 90_000 := by decide
example : specRadioFrequencyTerminationMeasureBodyRegistrationFee = 90_000 := by decide
example : specCertifiedCoreBroadcastingBusinessOperatorAuthorizationFee = 90_000 := by decide
example : specRegisteredGeneralBroadcastingBusinessOperatorFee = 90_000 := by decide
example : specCertifiedBroadcastingHoldingCompanyAuthorizationFee = 150_000 := by decide
example : specTelecommunicationsBusinessOperatorRegistrationFee = 150_000 := by decide
example : specCertifiedAntiCyberAttackAssociationAuthorizationFee = 150_000 := by decide
example : specTelecommunicationsTechnologyMainEngineerCourseRegistrationFee = 90_000 := by decide
example : specTelecommunicationsTerminalEquipmentRegistrationAuthorizationFee = 90_000 := by decide
example : specSpecificEmailTransmissionOptimizationRegistrationFee = 90_000 := by decide
example : specCertifiedAuthenticationBusinessOperatorAuthorizationFee = 90_000 := by decide
example : specCertifiedForeignAuthenticationBusinessOperatorAuthorizationFee = 90_000 := by decide
example : specElectronicAgentAuthorizationBusinessOperatorAuthorizationFee = 90_000 := by decide
example : specThirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee = 150_000 := by decide
example : specMoneyTransferBusinessOperatorRegistrationFee = 150_000 := by decide
example : specMoneyTransferBusinessOperatorRegistrationChangeFee = 150_000 := by decide
example : specElectronicSettlementTransactionsBusinessOperatorRegistrationFee = 150_000 := by decide
example : specElectronicSettlementTransactionsBusinessOperatorRegistrationChangeFee = 150_000 := by decide
example : specCryptoAssetExchangeBusinessOperatorRegistrationFee = 150_000 := by decide
example : specElectronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee = 90_000 := by decide
example : specElectronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee = 90_000 := by decide
example : specExchangeTransactionAnalysisBusinessApprovalFee = 150_000 := by decide
example : specExchangeTransactionAnalysisBusinessKindChangeApprovalFee = 150_000 := by decide
example : specFundsClearingBusinessLicenseFee = 150_000 := by decide
example : specCertifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee = 150_000 := by decide
example : specLimitedLiabilityAuditCorporationRegistrationFee = 150_000 := by decide
example : specRegisteredListedCompanyAuditorRegistrationFee = 90_000 := by decide
example : specPracticalTrainingCorporationAuthorizationFee = 150_000 := by decide
example : specConsumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee = 150_000 := by decide
example : specSpecificQualifiedConsumerGroupAuthorizationFee = 15_000 := by decide
example : specSecuritiesFinanceCompanyLicenseFee = 150_000 := by decide
example : specSpecificFinanceCompanyRegistrationFee = 150_000 := by decide
example : specMoneyLendingBusinessOperatorRegistrationFee = 150_000 := by decide
example : specMoneyLendingBusinessOperatorTrainingManagerRegistrationFee = 90_000 := by decide
example : specMujinBusinessLicenseFee = 150_000 := by decide
example : specMujinCompanyBranchOrAgentEstablishmentApprovalFee = 90_000 := by decide
example : specFinancialServicesIntermediaryBusinessOperatorRegistrationFee = 90_000 := by decide
example : specFinancialServicesIntermediaryBusinessOperatorRegistrationChangeFee = 90_000 := by decide
example : specCertifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee = 150_000 := by decide
example : specFinancialInstrumentsBusinessOperatorRegistrationFee = 150_000 := by decide
example : specFinancialInstrumentsBusinessOperatorRegistrationChangeFee = 150_000 := by decide
example : specFinancialInstrumentsBusinessApprovalFee = 150_000 := by decide
example : specUnderwritingBusinessPartApprovalFee = 90_000 := by decide
example : specExchangeTradingBusinessApprovalFee = 150_000 := by decide
example : specElectronicOverTheCounterDerivativesTradingBusinessApprovalFee = 150_000 := by decide
example : specFinancialInstrumentsIntermediaryBusinessOperatorRegistrationFee = 90_000 := by decide
example : specCreditRatingBusinessOperatorRegistrationFee = 90_000 := by decide
example : specInvestmentManagementRelatedServicesContractorRegistrationFee = 90_000 := by decide
example : specInvestmentManagementRelatedServicesContractorRegistrationChangeFee = 90_000 := by decide
example : specFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee = 150_000 := by decide
example : specForeignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee = 150_000 := by decide
example : specFinancialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee = 150_000 := by decide
example : specSecuredBondTrustBusinessLicenseFee = 150_000 := by decide
example : specEnterpriseValueCollateralRightTrustBusinessLicenseFee = 150_000 := by decide
example : specFinancialInstrumentsMarketEstablishmentLicenseFee = 150_000 := by decide
example : specInternationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee = 150_000 := by decide
example : specOrganizationalChangeApprovalFee = 150_000 := by decide
example : specOverTheCounterSecuritiesTradingMarketEstablishmentApprovalFee = 150_000 := by decide
example : specForeignMarketTradingApprovalFee = 150_000 := by decide
example : specFinancialInstrumentsExchangeHoldingCompanyApprovalFee = 150_000 := by decide
example : specCertifiedFinancialInstrumentsBusinessAssociationAuthorizationFee = 150_000 := by decide
example : specCertifiedInvestorProtectionAssociationAuthorizationFee = 90_000 := by decide
example : specSelfRegulationBusinessApprovalFee = 150_000 := by decide
example : specTrustBusinessLicenseFee = 150_000 := by decide
example : specManagementTypeTrustCompanyRegistrationFee = 150_000 := by decide
example : specManagementTypeForeignTrustCompanyRegistrationFee = 150_000 := by decide
example : specSelfTrustBusinessRegistrationFee = 150_000 := by decide
example : specTechnologyTransferApprovalBusinessOperatorRegistrationFee = 150_000 := by decide
example : specTrustContractAgentRegistrationFee = 90_000 := by decide
example : specInsuranceBusinessLicenseFee = 150_000 := by decide
example : specSmallShortTermInsuranceBusinessOperatorRegistrationFee = 150_000 := by decide
example : specSpecialInsuranceBusinessLicenseFee = 150_000 := by decide
example : specInsuranceBrokerRegistrationFee = 90_000 := by decide
example : specSpecialInsuranceSolicitorRegistrationFee = 15_000 := by decide
example : specInsuranceClaimsTrustBusinessLicenseFee = 150_000 := by decide
example : specInsuranceHoldingCompanyLicenseFee = 150_000 := by decide
example : specElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : specCreditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : specLaborBankElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : specCreditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee = 90_000 := by decide
example : specElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : specCreditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : specLaborBankElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : specCreditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee = 150_000 := by decide
example : specElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : specCreditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : specCreditCooperativeElectronicPaymentBusinessOperatorRegistrationFee = 150_000 := by decide
example : specElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : specCreditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : specCreditCooperativeElectronicPaymentBusinessAssociationLicenseFee = 150_000 := by decide
example : specCasinoBusinessLicenseFee = 150_000 := by decide
example : specCasinoFacilityOperationBusinessLicenseFee = 150_000 := by decide
example : specCasinoEquipmentManufacturingEtcBusinessLicenseFee = 150_000 := by decide
example : specCasinoEquipmentForeignManufacturingLicenseFee = 150_000 := by decide
example : specClass1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee = 10_000 := by decide
example : specClass2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee = 5_000 := by decide
example : specStructureCalculationAssessmentQualifiedOfficerRegistrationFee = 10_000 := by decide
example : specMansionManagementOfficerRegistrationFee = 9_000 := by decide
example : specSurveyorRegistrationFee = 30_000 := by decide
example : specSurveyorAssistantRegistrationFee = 15_000 := by decide
example : specAnonymousMedicalInfoCreationBusinessLicenseFee = 150_000 := by decide
example : specPseudonymousMedicalInfoCreationBusinessLicenseFee = 150_000 := by decide
example : specPseudonymousMedicalInfoUtilizationBusinessLicenseFee = 150_000 := by decide
example : specMedicalInfoHandlingContractorLicenseFee = 150_000 := by decide
example : specPersonalInfoProtectionAssociationLicenseFee = 90_000 := by decide
example : specSecurityGuardTrainingInstitutionRegistrationFee = 90_000 := by decide
example : specInternetMatchmakingSolicitationInfoProviderRegistrationFee = 15_000 := by decide
example : specRealEstateAppraiserRegistrationFee = 60_000 := by decide
example : specFirstClassArchitectRegistrationFee = 60_000 := by decide
example : specAirlineTransportPilotLicenseFee = 18_000 := by decide
example : specCommercialPilotLicenseFee = 7_500 := by decide
example : specPrivatePilotLicenseFee = 3_000 := by decide
example : specAssociateAirlineTransportPilotLicenseFee = 6_000 := by decide
example : specClass1FlightEngineerOrNavigatorLicenseFee = 12_000 := by decide
example : specClass2FlightNavigatorLicenseFee = 7_500 := by decide
example : specAviationCommunicationsOfficerLicenseFee = 3_000 := by decide
example : specClass1AircraftMaintenanceEngineerLicenseFee = 9_000 := by decide
example : specClass2AircraftMaintenanceEngineerLicenseFee = 6_000 := by decide
example : specClass1AircraftOperationEngineerLicenseFee = 6_000 := by decide
example : specClass2AircraftOperationEngineerLicenseFee = 3_000 := by decide
example : specAircraftFactoryMaintenanceEngineerLicenseFee = 9_000 := by decide
example : specClass1UnmannedAircraftPilotLicenseFee = 3_000 := by decide
example : specAirworthinessInspectorAuthorizationFee = 6_000 := by decide
example : specPilotSkillExaminerAuthorizationFee = 3_000 := by decide
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
    specMaritimeAgentRegistrationFee == maritimeAgentRegistrationFee &&
    specAirlineTransportPilotLicenseFee == airlineTransportPilotLicenseFee &&
    specCommercialPilotLicenseFee == commercialPilotLicenseFee &&
    specPrivatePilotLicenseFee == privatePilotLicenseFee &&
    specAssociateAirlineTransportPilotLicenseFee == associateAirlineTransportPilotLicenseFee &&
    specClass1FlightEngineerOrNavigatorLicenseFee == class1FlightEngineerOrNavigatorLicenseFee &&
    specClass2FlightNavigatorLicenseFee == class2FlightNavigatorLicenseFee &&
    specAviationCommunicationsOfficerLicenseFee == aviationCommunicationsOfficerLicenseFee &&
    specClass1AircraftMaintenanceEngineerLicenseFee == class1AircraftMaintenanceEngineerLicenseFee &&
    specClass2AircraftMaintenanceEngineerLicenseFee == class2AircraftMaintenanceEngineerLicenseFee &&
    specClass1AircraftOperationEngineerLicenseFee == class1AircraftOperationEngineerLicenseFee &&
    specClass2AircraftOperationEngineerLicenseFee == class2AircraftOperationEngineerLicenseFee &&
    specAircraftFactoryMaintenanceEngineerLicenseFee == aircraftFactoryMaintenanceEngineerLicenseFee &&
    specClass1UnmannedAircraftPilotLicenseFee == class1UnmannedAircraftPilotLicenseFee &&
    specAirworthinessInspectorAuthorizationFee == airworthinessInspectorAuthorizationFee &&
    specPilotSkillExaminerAuthorizationFee == pilotSkillExaminerAuthorizationFee &&
    specRealEstateAppraiserRegistrationFee == realEstateAppraiserRegistrationFee &&
    specFirstClassArchitectRegistrationFee == firstClassArchitectRegistrationFee &&
    specClass1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee == class1BuildingStandardsAssessmentQualifiedOfficerRegistrationFee &&
    specClass2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee == class2BuildingStandardsAssessmentQualifiedOfficerRegistrationFee &&
    specStructureCalculationAssessmentQualifiedOfficerRegistrationFee == structureCalculationAssessmentQualifiedOfficerRegistrationFee &&
    specMansionManagementOfficerRegistrationFee == mansionManagementOfficerRegistrationFee &&
    specSurveyorRegistrationFee == surveyorRegistrationFee &&
    specSurveyorAssistantRegistrationFee == surveyorAssistantRegistrationFee &&
    specAnonymousMedicalInfoCreationBusinessLicenseFee == anonymousMedicalInfoCreationBusinessLicenseFee &&
    specPseudonymousMedicalInfoCreationBusinessLicenseFee == pseudonymousMedicalInfoCreationBusinessLicenseFee &&
    specPseudonymousMedicalInfoUtilizationBusinessLicenseFee == pseudonymousMedicalInfoUtilizationBusinessLicenseFee &&
    specMedicalInfoHandlingContractorLicenseFee == medicalInfoHandlingContractorLicenseFee &&
    specPersonalInfoProtectionAssociationLicenseFee == personalInfoProtectionAssociationLicenseFee &&
    specSecurityGuardTrainingInstitutionRegistrationFee == securityGuardTrainingInstitutionRegistrationFee &&
    specInternetMatchmakingSolicitationInfoProviderRegistrationFee == internetMatchmakingSolicitationInfoProviderRegistrationFee &&
    specCasinoBusinessLicenseFee == casinoBusinessLicenseFee &&
    specCasinoFacilityOperationBusinessLicenseFee == casinoFacilityOperationBusinessLicenseFee &&
    specCasinoEquipmentManufacturingEtcBusinessLicenseFee == casinoEquipmentManufacturingEtcBusinessLicenseFee &&
    specCasinoEquipmentForeignManufacturingLicenseFee == casinoEquipmentForeignManufacturingLicenseFee &&
    specElectronicPaymentBusinessOperatorRegistrationFee == electronicPaymentBusinessOperatorRegistrationFee &&
    specCreditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee == creditDepositoryAssociationElectronicPaymentBusinessOperatorRegistrationFee &&
    specCreditCooperativeElectronicPaymentBusinessOperatorRegistrationFee == creditCooperativeElectronicPaymentBusinessOperatorRegistrationFee &&
    specElectronicPaymentBusinessAssociationLicenseFee == electronicPaymentBusinessAssociationLicenseFee &&
    specCreditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee == creditDepositoryAssociationElectronicPaymentBusinessAssociationLicenseFee &&
    specCreditCooperativeElectronicPaymentBusinessAssociationLicenseFee == creditCooperativeElectronicPaymentBusinessAssociationLicenseFee &&
    specElectronicPaymentProxyBusinessOperatorRegistrationFee == electronicPaymentProxyBusinessOperatorRegistrationFee &&
    specCreditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee == creditDepositoryAssociationElectronicPaymentProxyBusinessOperatorRegistrationFee &&
    specLaborBankElectronicPaymentProxyBusinessOperatorRegistrationFee == laborBankElectronicPaymentProxyBusinessOperatorRegistrationFee &&
    specCreditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee == creditCooperativeElectronicPaymentProxyBusinessOperatorRegistrationFee &&
    specElectronicPaymentProxyBusinessAssociationLicenseFee == electronicPaymentProxyBusinessAssociationLicenseFee &&
    specCreditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee == creditDepositoryAssociationElectronicPaymentProxyBusinessAssociationLicenseFee &&
    specLaborBankElectronicPaymentProxyBusinessAssociationLicenseFee == laborBankElectronicPaymentProxyBusinessAssociationLicenseFee &&
    specCreditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee == creditCooperativeElectronicPaymentProxyBusinessAssociationLicenseFee &&
    specInsuranceBusinessLicenseFee == insuranceBusinessLicenseFee &&
    specSmallShortTermInsuranceBusinessOperatorRegistrationFee == smallShortTermInsuranceBusinessOperatorRegistrationFee &&
    specSpecialInsuranceBusinessLicenseFee == specialInsuranceBusinessLicenseFee &&
    specInsuranceBrokerRegistrationFee == insuranceBrokerRegistrationFee &&
    specSpecialInsuranceSolicitorRegistrationFee == specialInsuranceSolicitorRegistrationFee &&
    specInsuranceClaimsTrustBusinessLicenseFee == insuranceClaimsTrustBusinessLicenseFee &&
    specInsuranceHoldingCompanyLicenseFee == insuranceHoldingCompanyLicenseFee &&
    specTrustBusinessLicenseFee == trustBusinessLicenseFee &&
    specManagementTypeTrustCompanyRegistrationFee == managementTypeTrustCompanyRegistrationFee &&
    specManagementTypeForeignTrustCompanyRegistrationFee == managementTypeForeignTrustCompanyRegistrationFee &&
    specSelfTrustBusinessRegistrationFee == selfTrustBusinessRegistrationFee &&
    specTechnologyTransferApprovalBusinessOperatorRegistrationFee == technologyTransferApprovalBusinessOperatorRegistrationFee &&
    specTrustContractAgentRegistrationFee == trustContractAgentRegistrationFee &&
    specSecuredBondTrustBusinessLicenseFee == securedBondTrustBusinessLicenseFee &&
    specEnterpriseValueCollateralRightTrustBusinessLicenseFee == enterpriseValueCollateralRightTrustBusinessLicenseFee &&
    specFinancialInstrumentsMarketEstablishmentLicenseFee == financialInstrumentsMarketEstablishmentLicenseFee &&
    specInternationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee == internationalCooperationEmissionsReductionAmountTradingMarketEstablishmentApprovalFee &&
    specOrganizationalChangeApprovalFee == organizationalChangeApprovalFee &&
    specOverTheCounterSecuritiesTradingMarketEstablishmentApprovalFee == overTheCounterSecuritiesTradingMarketEstablishmentApprovalFee &&
    specForeignMarketTradingApprovalFee == foreignMarketTradingApprovalFee &&
    specFinancialInstrumentsExchangeHoldingCompanyApprovalFee == financialInstrumentsExchangeHoldingCompanyApprovalFee &&
    specCertifiedFinancialInstrumentsBusinessAssociationAuthorizationFee == certifiedFinancialInstrumentsBusinessAssociationAuthorizationFee &&
    specCertifiedInvestorProtectionAssociationAuthorizationFee == certifiedInvestorProtectionAssociationAuthorizationFee &&
    specSelfRegulationBusinessApprovalFee == selfRegulationBusinessApprovalFee &&
    specFinancialInstrumentsBusinessOperatorRegistrationFee == financialInstrumentsBusinessOperatorRegistrationFee &&
    specFinancialInstrumentsBusinessOperatorRegistrationChangeFee == financialInstrumentsBusinessOperatorRegistrationChangeFee &&
    specFinancialInstrumentsBusinessApprovalFee == financialInstrumentsBusinessApprovalFee &&
    specUnderwritingBusinessPartApprovalFee == underwritingBusinessPartApprovalFee &&
    specExchangeTradingBusinessApprovalFee == exchangeTradingBusinessApprovalFee &&
    specElectronicOverTheCounterDerivativesTradingBusinessApprovalFee == electronicOverTheCounterDerivativesTradingBusinessApprovalFee &&
    specFinancialInstrumentsIntermediaryBusinessOperatorRegistrationFee == financialInstrumentsIntermediaryBusinessOperatorRegistrationFee &&
    specCreditRatingBusinessOperatorRegistrationFee == creditRatingBusinessOperatorRegistrationFee &&
    specInvestmentManagementRelatedServicesContractorRegistrationFee == investmentManagementRelatedServicesContractorRegistrationFee &&
    specInvestmentManagementRelatedServicesContractorRegistrationChangeFee == investmentManagementRelatedServicesContractorRegistrationChangeFee &&
    specFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee == financialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee &&
    specForeignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee == foreignFinancialInstrumentsClearingOrganizationDebtAssumptionBusinessLicenseFee &&
    specFinancialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee == financialInstrumentsClearingOrganizationLinkedDebtAssumptionBusinessApprovalFee &&
    specSecuritiesFinanceCompanyLicenseFee == securitiesFinanceCompanyLicenseFee &&
    specSpecificFinanceCompanyRegistrationFee == specificFinanceCompanyRegistrationFee &&
    specMoneyLendingBusinessOperatorRegistrationFee == moneyLendingBusinessOperatorRegistrationFee &&
    specMoneyLendingBusinessOperatorTrainingManagerRegistrationFee == moneyLendingBusinessOperatorTrainingManagerRegistrationFee &&
    specMujinBusinessLicenseFee == mujinBusinessLicenseFee &&
    specMujinCompanyBranchOrAgentEstablishmentApprovalFee == mujinCompanyBranchOrAgentEstablishmentApprovalFee &&
    specFinancialServicesIntermediaryBusinessOperatorRegistrationFee == financialServicesIntermediaryBusinessOperatorRegistrationFee &&
    specFinancialServicesIntermediaryBusinessOperatorRegistrationChangeFee == financialServicesIntermediaryBusinessOperatorRegistrationChangeFee &&
    specCertifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee == certifiedFinancialServicesIntermediaryBusinessAssociationAuthorizationFee &&
    specThirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee == thirdPartyPrepaidPaymentInstrumentIssuerRegistrationFee &&
    specMoneyTransferBusinessOperatorRegistrationFee == moneyTransferBusinessOperatorRegistrationFee &&
    specMoneyTransferBusinessOperatorRegistrationChangeFee == moneyTransferBusinessOperatorRegistrationChangeFee &&
    specElectronicSettlementTransactionsBusinessOperatorRegistrationFee == electronicSettlementTransactionsBusinessOperatorRegistrationFee &&
    specElectronicSettlementTransactionsBusinessOperatorRegistrationChangeFee == electronicSettlementTransactionsBusinessOperatorRegistrationChangeFee &&
    specCryptoAssetExchangeBusinessOperatorRegistrationFee == cryptoAssetExchangeBusinessOperatorRegistrationFee &&
    specElectronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee == electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationFee &&
    specElectronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee == electronicSettlementServiceAndCryptoAssetServiceIntermediaryRegistrationChangeFee &&
    specExchangeTransactionAnalysisBusinessApprovalFee == exchangeTransactionAnalysisBusinessApprovalFee &&
    specExchangeTransactionAnalysisBusinessKindChangeApprovalFee == exchangeTransactionAnalysisBusinessKindChangeApprovalFee &&
    specFundsClearingBusinessLicenseFee == fundsClearingBusinessLicenseFee &&
    specCertifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee == certifiedFundsSettlementBusinessOperatorAssociationAuthorizationFee &&
    specLimitedLiabilityAuditCorporationRegistrationFee == limitedLiabilityAuditCorporationRegistrationFee &&
    specRegisteredListedCompanyAuditorRegistrationFee == registeredListedCompanyAuditorRegistrationFee &&
    specPracticalTrainingCorporationAuthorizationFee == practicalTrainingCorporationAuthorizationFee &&
    specConsumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee == consumerLivelihoodSupportConsultantExaminationInstitutionRegistrationFee &&
    specSpecificQualifiedConsumerGroupAuthorizationFee == specificQualifiedConsumerGroupAuthorizationFee &&
    specTelecommunicationsBusinessOperatorRegistrationFee == telecommunicationsBusinessOperatorRegistrationFee &&
    specCertifiedAntiCyberAttackAssociationAuthorizationFee == certifiedAntiCyberAttackAssociationAuthorizationFee &&
    specTelecommunicationsTechnologyMainEngineerCourseRegistrationFee == telecommunicationsTechnologyMainEngineerCourseRegistrationFee &&
    specTelecommunicationsTerminalEquipmentRegistrationAuthorizationFee == telecommunicationsTerminalEquipmentRegistrationAuthorizationFee &&
    specSpecificEmailTransmissionOptimizationRegistrationFee == specificEmailTransmissionOptimizationRegistrationFee &&
    specCertifiedAuthenticationBusinessOperatorAuthorizationFee == certifiedAuthenticationBusinessOperatorAuthorizationFee &&
    specCertifiedForeignAuthenticationBusinessOperatorAuthorizationFee == certifiedForeignAuthenticationBusinessOperatorAuthorizationFee &&
    specElectronicAgentAuthorizationBusinessOperatorAuthorizationFee == electronicAgentAuthorizationBusinessOperatorAuthorizationFee &&
    specRadioStationLicenseFee false == radioStationLicenseFee false &&
    specRadioStationLicenseFee true == radioStationLicenseFee true &&
    specRadioStationRegistrationFee == radioStationRegistrationFee &&
    specRadioEquipmentInspectionBusinessOperatorRegistrationFee == radioEquipmentInspectionBusinessOperatorRegistrationFee &&
    specForeignRadioEquipmentInspectionBusinessOperatorRegistrationFee == foreignRadioEquipmentInspectionBusinessOperatorRegistrationFee &&
    specRadioEquipmentCertificationBodyRegistrationFee == radioEquipmentCertificationBodyRegistrationFee &&
    specRadioFrequencyTerminationMeasureBodyRegistrationFee == radioFrequencyTerminationMeasureBodyRegistrationFee &&
    specCertifiedCoreBroadcastingBusinessOperatorAuthorizationFee == certifiedCoreBroadcastingBusinessOperatorAuthorizationFee &&
    specRegisteredGeneralBroadcastingBusinessOperatorFee == registeredGeneralBroadcastingBusinessOperatorFee &&
    specCertifiedBroadcastingHoldingCompanyAuthorizationFee == certifiedBroadcastingHoldingCompanyAuthorizationFee

example : agreeRegistrationQualificationFees = true := by decide

end JapanTaxLaw
