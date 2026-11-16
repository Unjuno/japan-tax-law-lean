import JapanTaxLaw.RegistrationQualificationFeesP7K

/-!
# RegistrationQualificationFeesP7KSpec spec — independent restatement of
       登録免許税法 別表第一（二）第三十二号 百三十〜百三十四

Sources (pinned; identical to RegistrationQualificationFeesP7K.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百三十〜百三十四 の flat 額 from the statutory text itself.
全 33 件が一件につきの固定額（割合なし、デーミング規定・金額なし行なし）。
scope boundaries identical to the implementation（百二十九 以前・百三十五 以降は NOT YET COVERED;
「財務省令で定めるものを除く」「政令で定める許可を除く」「更新の登録／許可を除く。」
「既に…一万五千円」の軽減額、（注）のみなし規定はすべて caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百三十(一) 船舶安全法第六条ノ二 製造・改造修理工事の事業場の認定。 -/
def specShipSafetyMfgConversionWorkSiteCertFee : Money := 90_000
/-- Spec: 百三十(二) 船舶安全法第六条ノ三 整備の事業場の認定。 -/
def specShipSafetyMaintenanceWorkSiteCertFee : Money := 90_000
/-- Spec: 百三十(三) 船舶安全法第六条ノ四第一項 遠隔支援業務の事業場の認定。 -/
def specShipSafetyRemoteSupportWorkSiteCertFee : Money := 90_000
/-- Spec: 百三十(四) 船舶安全法第六条ノ五第一項 登録検定機関の登録。 -/
def specShipSafetyVerificationOrgRegFee : Money := 90_000
/-- Spec: 百三十(五) 船舶安全法第六条ノ六 登録検査確認機関の登録。 -/
def specShipSafetyInspectionConfirmationOrgRegFee : Money := 90_000
/-- Spec: 百三十(六) 船舶安全法第八条 船級協会の登録。 -/
def specShipSafetyClassificationSocietyRegFee : Money := 90_000
/-- Spec: 百三十(七) 船舶安全法第二十八条第五項 登録検査機関の登録。 -/
def specShipSafetyInspectionOrgRegFee : Money := 90_000
/-- Spec: 百三十(八) 船舶安全法第二十九条ノ三第二項 証書発給船級協会の登録。 -/
def specShipSafetyCertIssuingClassSocietyRegFee : Money := 90_000
/-- Spec: 百三十一(一) 海洋汚染防止法 準用 船舶安全法第六条ノ二 認定。 -/
def specMarinePollutionMfgWorkSiteCertFee : Money := 90_000
/-- Spec: 百三十一(二) 海洋汚染防止法 準用 船舶安全法第六条ノ三 認定。 -/
def specMarinePollutionMaintenanceWorkSiteCertFee : Money := 90_000
/-- Spec: 百三十一(三) 廃油処理事業の許可。 -/
def specWasteOilDisposalBizPermitFee : Money := 150_000
/-- Spec: 百三十一(四) 登録確認機関の登録。 -/
def specMarinePollutionRegConfirmationOrgRegFee : Money := 90_000
/-- Spec: 百三十一(五) 船級協会の登録（第十九条の十五第一項）。 -/
def specMarinePollutionClassSocietyRegArt19No15Fee : Money := 90_000
/-- Spec: 百三十一(六) 船級協会の登録（第十九条の三十第一項）。 -/
def specMarinePollutionClassSocietyRegArt19No30Fee : Money := 90_000
/-- Spec: 百三十一(七) 船級協会の登録（第十九条の四十六第一項）。 -/
def specMarinePollutionClassSocietyRegArt19No46Fee : Money := 90_000
/-- Spec: 百三十一(八) 船舶安全法第六条ノ五第一項 準用 登録検定機関の登録。 -/
def specMarinePollutionVerificationOrgRegViaSafetyActFee : Money := 90_000
/-- Spec: 百三十一(九) 登録検定機関の登録（第四十三条の九第一項）。 -/
def specMarinePollutionVerificationOrgRegArt43No9Fee : Money := 90_000
/-- Spec: 百三十二 船級協会の登録（船舶保安規程の審査等）。 -/
def specShipSecurityClassSocietyRegFee : Money := 90_000
/-- Spec: 百三十二の二(一) 特定船舶の再資源化解体の許可。 -/
def specShipRecyclingBizPermitFee : Money := 90_000
/-- Spec: 百三十二の二(二) 船級協会の登録（第三十条第一項）。 -/
def specShipRecyclingClassSocietyRegArt30Fee : Money := 90_000
/-- Spec: 百三十二の二(三) 船級協会の登録（第三十一条第一項）。 -/
def specShipRecyclingClassSocietyRegArt31Fee : Money := 90_000
/-- Spec: 百三十三(一) 一般旅客定期航路事業の許可。 -/
def specGeneralPassengerRegularRouteBizPermitFee : Money := 90_000
/-- Spec: 百三十三(二) 特定旅客定期航路事業の許可。 -/
def specSpecifiedPassengerRegularRouteBizPermitFee : Money := 90_000
/-- Spec: 百三十三(三) 対外旅客定期航路事業の登録。 -/
def specExternalPassengerRegularRouteBizRegFee : Money := 90_000
/-- Spec: 百三十三(四) 貨客定期航路事業の登録。 -/
def specPassengerFreightRegularRouteBizRegFee : Money := 15_000
/-- Spec: 百三十三(五) 旅客不定期航路事業の許可。 -/
def specPassengerIrregularRouteBizPermitFee : Money := 90_000
/-- Spec: 百三十三(六) 一般不定期航路事業の登録。 -/
def specGeneralIrregularRouteBizRegFee : Money := 15_000
/-- Spec: 百三十三(七) 登録安全統括管理者講習機関の登録。 -/
def specRegisteredSafetyControlManagerTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十三(八) 登録運航管理者講習機関の登録。 -/
def specRegisteredOperationManagerTrainingOrgRegFee : Money := 90_000
/-- Spec: 百三十四(一) 一般港湾運送事業の許可。 -/
def specGeneralPortTransportBizPermitFee : Money := 90_000
/-- Spec: 百三十四(二) 港湾荷役事業の許可。 -/
def specPortStevedoringBizPermitFee : Money := 60_000
/-- Spec: 百三十四(三) はしけ／いかだ運送事業の許可。 -/
def specLighterOrRaftTransportBizPermitFee : Money := 30_000
/-- Spec: 百三十四(四) 検数／鑑定／検量事業の許可。 -/
def specTallySurveyOrMeasurementBizPermitFee : Money := 30_000

example : specShipSafetyMfgConversionWorkSiteCertFee = 90_000 := by decide
example : specShipSafetyMaintenanceWorkSiteCertFee = 90_000 := by decide
example : specShipSafetyRemoteSupportWorkSiteCertFee = 90_000 := by decide
example : specShipSafetyVerificationOrgRegFee = 90_000 := by decide
example : specShipSafetyInspectionConfirmationOrgRegFee = 90_000 := by decide
example : specShipSafetyClassificationSocietyRegFee = 90_000 := by decide
example : specShipSafetyInspectionOrgRegFee = 90_000 := by decide
example : specShipSafetyCertIssuingClassSocietyRegFee = 90_000 := by decide
example : specMarinePollutionMfgWorkSiteCertFee = 90_000 := by decide
example : specMarinePollutionMaintenanceWorkSiteCertFee = 90_000 := by decide
example : specWasteOilDisposalBizPermitFee = 150_000 := by decide
example : specMarinePollutionRegConfirmationOrgRegFee = 90_000 := by decide
example : specMarinePollutionClassSocietyRegArt19No15Fee = 90_000 := by decide
example : specMarinePollutionClassSocietyRegArt19No30Fee = 90_000 := by decide
example : specMarinePollutionClassSocietyRegArt19No46Fee = 90_000 := by decide
example : specMarinePollutionVerificationOrgRegViaSafetyActFee = 90_000 := by decide
example : specMarinePollutionVerificationOrgRegArt43No9Fee = 90_000 := by decide
example : specShipSecurityClassSocietyRegFee = 90_000 := by decide
example : specShipRecyclingBizPermitFee = 90_000 := by decide
example : specShipRecyclingClassSocietyRegArt30Fee = 90_000 := by decide
example : specShipRecyclingClassSocietyRegArt31Fee = 90_000 := by decide
example : specGeneralPassengerRegularRouteBizPermitFee = 90_000 := by decide
example : specSpecifiedPassengerRegularRouteBizPermitFee = 90_000 := by decide
example : specExternalPassengerRegularRouteBizRegFee = 90_000 := by decide
example : specPassengerFreightRegularRouteBizRegFee = 15_000 := by decide
example : specPassengerIrregularRouteBizPermitFee = 90_000 := by decide
example : specGeneralIrregularRouteBizRegFee = 15_000 := by decide
example : specRegisteredSafetyControlManagerTrainingOrgRegFee = 90_000 := by decide
example : specRegisteredOperationManagerTrainingOrgRegFee = 90_000 := by decide
example : specGeneralPortTransportBizPermitFee = 90_000 := by decide
example : specPortStevedoringBizPermitFee = 60_000 := by decide
example : specLighterOrRaftTransportBizPermitFee = 30_000 := by decide
example : specTallySurveyOrMeasurementBizPermitFee = 30_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP7K : Bool :=
  specShipSafetyMfgConversionWorkSiteCertFee == shipSafetyMfgConversionWorkSiteCertFee &&
  specShipSafetyMaintenanceWorkSiteCertFee == shipSafetyMaintenanceWorkSiteCertFee &&
  specShipSafetyRemoteSupportWorkSiteCertFee == shipSafetyRemoteSupportWorkSiteCertFee &&
  specShipSafetyVerificationOrgRegFee == shipSafetyVerificationOrgRegFee &&
  specShipSafetyInspectionConfirmationOrgRegFee == shipSafetyInspectionConfirmationOrgRegFee &&
  specShipSafetyClassificationSocietyRegFee == shipSafetyClassificationSocietyRegFee &&
  specShipSafetyInspectionOrgRegFee == shipSafetyInspectionOrgRegFee &&
  specShipSafetyCertIssuingClassSocietyRegFee == shipSafetyCertIssuingClassSocietyRegFee &&
  specMarinePollutionMfgWorkSiteCertFee == marinePollutionMfgWorkSiteCertFee &&
  specMarinePollutionMaintenanceWorkSiteCertFee == marinePollutionMaintenanceWorkSiteCertFee &&
  specWasteOilDisposalBizPermitFee == wasteOilDisposalBizPermitFee &&
  specMarinePollutionRegConfirmationOrgRegFee == marinePollutionRegConfirmationOrgRegFee &&
  specMarinePollutionClassSocietyRegArt19No15Fee == marinePollutionClassSocietyRegArt19No15Fee &&
  specMarinePollutionClassSocietyRegArt19No30Fee == marinePollutionClassSocietyRegArt19No30Fee &&
  specMarinePollutionClassSocietyRegArt19No46Fee == marinePollutionClassSocietyRegArt19No46Fee &&
  specMarinePollutionVerificationOrgRegViaSafetyActFee == marinePollutionVerificationOrgRegViaSafetyActFee &&
  specMarinePollutionVerificationOrgRegArt43No9Fee == marinePollutionVerificationOrgRegArt43No9Fee &&
  specShipSecurityClassSocietyRegFee == shipSecurityClassSocietyRegFee &&
  specShipRecyclingBizPermitFee == shipRecyclingBizPermitFee &&
  specShipRecyclingClassSocietyRegArt30Fee == shipRecyclingClassSocietyRegArt30Fee &&
  specShipRecyclingClassSocietyRegArt31Fee == shipRecyclingClassSocietyRegArt31Fee &&
  specGeneralPassengerRegularRouteBizPermitFee == generalPassengerRegularRouteBizPermitFee &&
  specSpecifiedPassengerRegularRouteBizPermitFee == specifiedPassengerRegularRouteBizPermitFee &&
  specExternalPassengerRegularRouteBizRegFee == externalPassengerRegularRouteBizRegFee &&
  specPassengerFreightRegularRouteBizRegFee == passengerFreightRegularRouteBizRegFee &&
  specPassengerIrregularRouteBizPermitFee == passengerIrregularRouteBizPermitFee &&
  specGeneralIrregularRouteBizRegFee == generalIrregularRouteBizRegFee &&
  specRegisteredSafetyControlManagerTrainingOrgRegFee == registeredSafetyControlManagerTrainingOrgRegFee &&
  specRegisteredOperationManagerTrainingOrgRegFee == registeredOperationManagerTrainingOrgRegFee &&
  specGeneralPortTransportBizPermitFee == generalPortTransportBizPermitFee &&
  specPortStevedoringBizPermitFee == portStevedoringBizPermitFee &&
  specLighterOrRaftTransportBizPermitFee == lighterOrRaftTransportBizPermitFee &&
  specTallySurveyOrMeasurementBizPermitFee == tallySurveyOrMeasurementBizPermitFee

example : agreeRegistrationQualificationFeesP7K = true := by decide

end JapanTaxLaw
