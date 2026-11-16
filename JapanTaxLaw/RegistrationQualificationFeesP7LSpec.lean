import JapanTaxLaw.RegistrationQualificationFeesP7L

/-!
# RegistrationQualificationFeesP7LSpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百三十五〜百三十九

Sources (pinned; identical to RegistrationQualificationFeesP7L.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百三十五〜百三十九 の flat 額 from the statutory text itself.
全 33 件が一件につきの固定額（割合なし、デーミング規定・金額なし行なし）。
scope boundaries identical to the implementation（百三十四 以前・百四十 以降は NOT YET COVERED;
「更新の登録／許可を除く」「財務省令で定めるものに限る／除く」、（注）のみなし規定の適用判定は
すべて caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百三十五 内航海運業の登録。 -/
def specDomesticCoastalShippingBizRegFee : Money := 90_000
/-- Spec: 百三十六(一) 海技免許講習の登録。 -/
def specMaritimeOfficerLicenseTrainingCourseRegFee : Money := 90_000
/-- Spec: 百三十六(二) 海技免状更新講習の登録。 -/
def specMaritimeLicenseRenewalTrainingCourseRegFee : Money := 90_000
/-- Spec: 百三十六(三) 登録船舶職員養成施設の登録。 -/
def specRegisteredSeafarerTrainingFacilityRegFee : Money := 90_000
/-- Spec: 百三十六(四) 登録漁ろう操船講習機関の登録。 -/
def specRegisteredFishingOperationTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十六(五) 登録小型船舶教習所の登録。 -/
def specRegisteredSmallVesselTrainingSchoolRegFee : Money := 90_000
/-- Spec: 百三十六(六) 操縦免許証更新講習の登録（準用）。 -/
def specOperationLicenseRenewalTrainingCourseRegFee : Money := 90_000
/-- Spec: 百三十六(七) 登録特定操縦免許講習機関の登録。 -/
def specRegisteredSpecificOperationLicenseTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十六(八) 電子通信移行講習の登録。 -/
def specElectronicCommunicationTransitionTrainingRegFee : Money := 90_000
/-- Spec: 百三十六の二(一) 登録水先人養成施設の登録。 -/
def specRegisteredPilotTrainingFacilityRegFee : Money := 90_000
/-- Spec: 百三十六の二(二) 水先免許更新講習の登録。 -/
def specPilotLicenseRenewalTrainingRegFee : Money := 90_000
/-- Spec: 百三十七 船員派遣事業の許可。 -/
def specCrewDispatchBizPermitFee : Money := 90_000
/-- Spec: 百三十七の二(一) 登録生存講習機関の登録。 -/
def specRegisteredSurvivalTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十七の二(二) 登録消火講習機関の登録。 -/
def specRegisteredFireFightingTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十七の二(三) 登録検査機関の登録。 -/
def specRegisteredInspectionOrgRegFee : Money := 90_000
/-- Spec: 百三十八(一)イ 空港等の設置の許可。 -/
def specAirportInstallationPermitFee : Money := 150_000
/-- Spec: 百三十八(一)ロ 航空保安施設の設置の許可。 -/
def specAviationSecurityFacilityInstallationPermitFee : Money := 90_000
/-- Spec: 百三十八(二) 事業場の認定。 -/
def specBusinessFacilityCertificationFee : Money := 90_000
/-- Spec: 百三十八(三) 航空運送事業の許可。 -/
def specAirTransportBizPermitFee : Money := 150_000
/-- Spec: 百三十八(四) 航空機使用事業の許可。 -/
def specAircraftOperationBizPermitFee : Money := 90_000
/-- Spec: 百三十八(五) 外国人国際航空運送事業の許可。 -/
def specForeignInternationalAirTransportBizPermitFee : Money := 150_000
/-- Spec: 百三十八(六) 登録訓練機関の登録。 -/
def specRegisteredTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十八の二(一) 無人航空機検査の登録検査機関の登録。 -/
def specUavInspectionOrgRegFee : Money := 90_000
/-- Spec: 百三十八の二(二) 無人航空機操縦者技能証明の登録講習機関の登録。 -/
def specUavOperationTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十八の二(三) 無人航空機操縦者技能証明の登録更新講習機関の登録。 -/
def specUavOperationRenewalTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十九(一) 第一種貨物利用運送事業の登録。 -/
def specFirstClassFreightForwardingBizRegFee : Money := 90_000
/-- Spec: 百三十九(二) 変更登録（利用運送の増加等）。 -/
def specFreightForwardingChangeRegFee : Money := 15_000
/-- Spec: 百三十九(三) 第二種貨物利用運送事業の許可。 -/
def specSecondClassFreightForwardingBizPermitFee : Money := 120_000
/-- Spec: 百三十九(四) 事業計画の変更の認可。 -/
def specFreightForwardingPlanChangeApprovalFee : Money := 20_000
/-- Spec: 百三十九(五) 国際貨物運送に係る第一種...の登録。 -/
def specInternationalFreightFirstClassRegFee : Money := 90_000
/-- Spec: 百三十九(六) 変更登録（利用運送の区間・業務範囲の増加）。 -/
def specInternationalFreightChangeRegFee : Money := 15_000
/-- Spec: 百三十九(七) 国際貨物運送に係る第二種...の許可。 -/
def specInternationalFreightSecondClassPermitFee : Money := 120_000
/-- Spec: 百三十九(八) 事業計画の変更の認可。 -/
def specInternationalFreightPlanChangeApprovalFee : Money := 20_000

example : specDomesticCoastalShippingBizRegFee = 90_000 := by decide
example : specMaritimeOfficerLicenseTrainingCourseRegFee = 90_000 := by decide
example : specMaritimeLicenseRenewalTrainingCourseRegFee = 90_000 := by decide
example : specRegisteredSeafarerTrainingFacilityRegFee = 90_000 := by decide
example : specRegisteredFishingOperationTrainingOrgRegFee = 90_000 := by decide
example : specRegisteredSmallVesselTrainingSchoolRegFee = 90_000 := by decide
example : specOperationLicenseRenewalTrainingCourseRegFee = 90_000 := by decide
example : specRegisteredSpecificOperationLicenseTrainingOrgRegFee = 90_000 := by decide
example : specElectronicCommunicationTransitionTrainingRegFee = 90_000 := by decide
example : specRegisteredPilotTrainingFacilityRegFee = 90_000 := by decide
example : specPilotLicenseRenewalTrainingRegFee = 90_000 := by decide
example : specCrewDispatchBizPermitFee = 90_000 := by decide
example : specRegisteredSurvivalTrainingOrgRegFee = 90_000 := by decide
example : specRegisteredFireFightingTrainingOrgRegFee = 90_000 := by decide
example : specRegisteredInspectionOrgRegFee = 90_000 := by decide
example : specAirportInstallationPermitFee = 150_000 := by decide
example : specAviationSecurityFacilityInstallationPermitFee = 90_000 := by decide
example : specBusinessFacilityCertificationFee = 90_000 := by decide
example : specAirTransportBizPermitFee = 150_000 := by decide
example : specAircraftOperationBizPermitFee = 90_000 := by decide
example : specForeignInternationalAirTransportBizPermitFee = 150_000 := by decide
example : specRegisteredTrainingOrgRegFee = 90_000 := by decide
example : specUavInspectionOrgRegFee = 90_000 := by decide
example : specUavOperationTrainingOrgRegFee = 90_000 := by decide
example : specUavOperationRenewalTrainingOrgRegFee = 90_000 := by decide
example : specFirstClassFreightForwardingBizRegFee = 90_000 := by decide
example : specFreightForwardingChangeRegFee = 15_000 := by decide
example : specSecondClassFreightForwardingBizPermitFee = 120_000 := by decide
example : specFreightForwardingPlanChangeApprovalFee = 20_000 := by decide
example : specInternationalFreightFirstClassRegFee = 90_000 := by decide
example : specInternationalFreightChangeRegFee = 15_000 := by decide
example : specInternationalFreightSecondClassPermitFee = 120_000 := by decide
example : specInternationalFreightPlanChangeApprovalFee = 20_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP7L : Bool :=
  specDomesticCoastalShippingBizRegFee == domesticCoastalShippingBizRegFee &&
  specMaritimeOfficerLicenseTrainingCourseRegFee == maritimeOfficerLicenseTrainingCourseRegFee &&
  specMaritimeLicenseRenewalTrainingCourseRegFee == maritimeLicenseRenewalTrainingCourseRegFee &&
  specRegisteredSeafarerTrainingFacilityRegFee == registeredSeafarerTrainingFacilityRegFee &&
  specRegisteredFishingOperationTrainingOrgRegFee == registeredFishingOperationTrainingOrgRegFee &&
  specRegisteredSmallVesselTrainingSchoolRegFee == registeredSmallVesselTrainingSchoolRegFee &&
  specOperationLicenseRenewalTrainingCourseRegFee == operationLicenseRenewalTrainingCourseRegFee &&
  specRegisteredSpecificOperationLicenseTrainingOrgRegFee == registeredSpecificOperationLicenseTrainingOrgRegFee &&
  specElectronicCommunicationTransitionTrainingRegFee == electronicCommunicationTransitionTrainingRegFee &&
  specRegisteredPilotTrainingFacilityRegFee == registeredPilotTrainingFacilityRegFee &&
  specPilotLicenseRenewalTrainingRegFee == pilotLicenseRenewalTrainingRegFee &&
  specCrewDispatchBizPermitFee == crewDispatchBizPermitFee &&
  specRegisteredSurvivalTrainingOrgRegFee == registeredSurvivalTrainingOrgRegFee &&
  specRegisteredFireFightingTrainingOrgRegFee == registeredFireFightingTrainingOrgRegFee &&
  specRegisteredInspectionOrgRegFee == registeredInspectionOrgRegFee &&
  specAirportInstallationPermitFee == airportInstallationPermitFee &&
  specAviationSecurityFacilityInstallationPermitFee == aviationSecurityFacilityInstallationPermitFee &&
  specBusinessFacilityCertificationFee == businessFacilityCertificationFee &&
  specAirTransportBizPermitFee == airTransportBizPermitFee &&
  specAircraftOperationBizPermitFee == aircraftOperationBizPermitFee &&
  specForeignInternationalAirTransportBizPermitFee == foreignInternationalAirTransportBizPermitFee &&
  specRegisteredTrainingOrgRegFee == registeredTrainingOrgRegFee &&
  specUavInspectionOrgRegFee == uavInspectionOrgRegFee &&
  specUavOperationTrainingOrgRegFee == uavOperationTrainingOrgRegFee &&
  specUavOperationRenewalTrainingOrgRegFee == uavOperationRenewalTrainingOrgRegFee &&
  specFirstClassFreightForwardingBizRegFee == firstClassFreightForwardingBizRegFee &&
  specFreightForwardingChangeRegFee == freightForwardingChangeRegFee &&
  specSecondClassFreightForwardingBizPermitFee == secondClassFreightForwardingBizPermitFee &&
  specFreightForwardingPlanChangeApprovalFee == freightForwardingPlanChangeApprovalFee &&
  specInternationalFreightFirstClassRegFee == internationalFreightFirstClassRegFee &&
  specInternationalFreightChangeRegFee == internationalFreightChangeRegFee &&
  specInternationalFreightSecondClassPermitFee == internationalFreightSecondClassPermitFee &&
  specInternationalFreightPlanChangeApprovalFee == internationalFreightPlanChangeApprovalFee

example : agreeRegistrationQualificationFeesP7L = true := by decide

end JapanTaxLaw
