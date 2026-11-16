import JapanTaxLaw.RegistrationQualificationFeesP6J

/-!
# RegistrationQualificationFeesP6JSpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百二十五〜百二十九

Sources (pinned; identical to RegistrationQualificationFeesP6J.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百二十五〜百二十九 の flat 額 from the statutory text itself.
全 19 件が一件につきの固定額（割合なし、デーミング規定・金額なし行なし）。
scope boundaries identical to the implementation（百二十四 以前・百三十 以降は NOT YET COVERED;
「政令で定めるものに限る」「更新の登録／許可を除く。」等の適用判定は caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百二十五(一)イ 一般乗合／一般貸切旅客自動車運送事業の許可。 -/
def specGeneralRouteCharterPassengerTransportPermitFee : Money := 90_000
/-- Spec: 百二十五(一)ロ 一般乗用旅客自動車運送事業の許可。 -/
def specGeneralPassengerCarTransportPermitFee : Money := 30_000
/-- Spec: 百二十五(二)イ 路線・営業区域増加の事業計画変更認可。 -/
def specRouteAreaIncreasePlanChangeApprovalFee : Money := 15_000
/-- Spec: 百二十五(二)ロ 営業区域増加の事業計画変更認可。 -/
def specBusinessAreaIncreasePlanChangeApprovalFee : Money := 5_000
/-- Spec: 百二十五(二)ハ 準特定地域の供給輸送力増加の事業計画変更認可。 -/
def specSemiSpecificAreaCapacityIncreasePlanChangeApprovalFee : Money := 5_000
/-- Spec: 百二十五(三) 特定旅客自動車運送事業の許可。 -/
def specSpecifiedPassengerTransportBizPermitFee : Money := 30_000
/-- Spec: 百二十五(四) 一般貨物自動車運送事業の許可。 -/
def specGeneralFreightTransportBizPermitFee : Money := 120_000
/-- Spec: 百二十五(五) 特定貨物自動車運送事業の許可。 -/
def specSpecifiedFreightTransportBizPermitFee : Money := 60_000
/-- Spec: 百二十五(六) 登録貨物軽自動車安全管理者講習機関の登録。 -/
def specRegisteredLightFreightSafetyInstructorTrainingOrgRegFee : Money := 90_000
/-- Spec: 百二十五(七) 登録貨物軽自動車安全管理者定期講習機関の登録。 -/
def specRegisteredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee : Money := 90_000
/-- Spec: 百二十五の二 タクシー運転者 登録実施機関の登録。 -/
def specTaxiDriverRegistrationOrgRegFee : Money := 90_000
/-- Spec: 百二十五の三(一) 自家用有償旅客運送者の登録。 -/
def specPrivatePaidPassengerTransportRegFee : Money := 15_000
/-- Spec: 百二十五の三(二) 自家用有償旅客運送者の変更登録。 -/
def specPrivatePaidPassengerTransportChangeRegFee : Money := 3_000
/-- Spec: 百二十六 自家用自動車の有償貸渡しの許可。 -/
def specPrivateCarPaidLoanPermitFee : Money := 90_000
/-- Spec: 百二十七 運河開設の免許。 -/
def specCanalConstructionLicenseFee : Money := 150_000
/-- Spec: 百二十七の二 港湾の登録確認機関の登録。 -/
def specPortTechnicalStandardVerificationOrgRegFee : Money := 90_000
/-- Spec: 百二十八(一) 船舶・施設の新設等の許可。 -/
def specShipMfgRepairFacilityNewPermitFee : Money := 150_000
/-- Spec: 百二十八(二) 船舶・設備の新設等の許可。 -/
def specShipMfgRepairEquipmentExpansionPermitFee : Money := 30_000
/-- Spec: 百二十九 小型船造船業者の登録。 -/
def specSmallVesselShipbuilderRegFee : Money := 90_000

example : specGeneralRouteCharterPassengerTransportPermitFee = 90_000 := by decide
example : specGeneralPassengerCarTransportPermitFee = 30_000 := by decide
example : specRouteAreaIncreasePlanChangeApprovalFee = 15_000 := by decide
example : specBusinessAreaIncreasePlanChangeApprovalFee = 5_000 := by decide
example : specSemiSpecificAreaCapacityIncreasePlanChangeApprovalFee = 5_000 := by decide
example : specSpecifiedPassengerTransportBizPermitFee = 30_000 := by decide
example : specGeneralFreightTransportBizPermitFee = 120_000 := by decide
example : specSpecifiedFreightTransportBizPermitFee = 60_000 := by decide
example : specRegisteredLightFreightSafetyInstructorTrainingOrgRegFee = 90_000 := by decide
example : specRegisteredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee = 90_000 := by decide
example : specTaxiDriverRegistrationOrgRegFee = 90_000 := by decide
example : specPrivatePaidPassengerTransportRegFee = 15_000 := by decide
example : specPrivatePaidPassengerTransportChangeRegFee = 3_000 := by decide
example : specPrivateCarPaidLoanPermitFee = 90_000 := by decide
example : specCanalConstructionLicenseFee = 150_000 := by decide
example : specPortTechnicalStandardVerificationOrgRegFee = 90_000 := by decide
example : specShipMfgRepairFacilityNewPermitFee = 150_000 := by decide
example : specShipMfgRepairEquipmentExpansionPermitFee = 30_000 := by decide
example : specSmallVesselShipbuilderRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP6J : Bool :=
  specGeneralRouteCharterPassengerTransportPermitFee == generalRouteCharterPassengerTransportPermitFee &&
  specGeneralPassengerCarTransportPermitFee == generalPassengerCarTransportPermitFee &&
  specRouteAreaIncreasePlanChangeApprovalFee == routeAreaIncreasePlanChangeApprovalFee &&
  specBusinessAreaIncreasePlanChangeApprovalFee == businessAreaIncreasePlanChangeApprovalFee &&
  specSemiSpecificAreaCapacityIncreasePlanChangeApprovalFee == semiSpecificAreaCapacityIncreasePlanChangeApprovalFee &&
  specSpecifiedPassengerTransportBizPermitFee == specifiedPassengerTransportBizPermitFee &&
  specGeneralFreightTransportBizPermitFee == generalFreightTransportBizPermitFee &&
  specSpecifiedFreightTransportBizPermitFee == specifiedFreightTransportBizPermitFee &&
  specRegisteredLightFreightSafetyInstructorTrainingOrgRegFee == registeredLightFreightSafetyInstructorTrainingOrgRegFee &&
  specRegisteredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee == registeredLightFreightSafetyInstructorPeriodicTrainingOrgRegFee &&
  specTaxiDriverRegistrationOrgRegFee == taxiDriverRegistrationOrgRegFee &&
  specPrivatePaidPassengerTransportRegFee == privatePaidPassengerTransportRegFee &&
  specPrivatePaidPassengerTransportChangeRegFee == privatePaidPassengerTransportChangeRegFee &&
  specPrivateCarPaidLoanPermitFee == privateCarPaidLoanPermitFee &&
  specCanalConstructionLicenseFee == canalConstructionLicenseFee &&
  specPortTechnicalStandardVerificationOrgRegFee == portTechnicalStandardVerificationOrgRegFee &&
  specShipMfgRepairFacilityNewPermitFee == shipMfgRepairFacilityNewPermitFee &&
  specShipMfgRepairEquipmentExpansionPermitFee == shipMfgRepairEquipmentExpansionPermitFee &&
  specSmallVesselShipbuilderRegFee == smallVesselShipbuilderRegFee

example : agreeRegistrationQualificationFeesP6J = true := by decide

end JapanTaxLaw
