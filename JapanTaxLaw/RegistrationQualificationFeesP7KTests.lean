import JapanTaxLaw.RegistrationQualificationFeesP7K

/-!
# RegistrationQualificationFeesP7K tests — 別表第一（二）第三十二号 百三十〜百三十四 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/ 

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百三十(一) 船舶安全法第六条ノ二 製造・改造修理工事の事業場の認定
example : shipSafetyMfgConversionWorkSiteCertFee = 90_000 := by decide
-- 百三十(二) 船舶安全法第六条ノ三 整備の事業場の認定
example : shipSafetyMaintenanceWorkSiteCertFee = 90_000 := by decide
-- 百三十(三) 船舶安全法第六条ノ四第一項 遠隔支援業務の事業場の認定
example : shipSafetyRemoteSupportWorkSiteCertFee = 90_000 := by decide
-- 百三十(四) 船舶安全法第六条ノ五第一項 登録検定機関の登録
example : shipSafetyVerificationOrgRegFee = 90_000 := by decide
-- 百三十(五) 船舶安全法第六条ノ六 登録検査確認機関の登録
example : shipSafetyInspectionConfirmationOrgRegFee = 90_000 := by decide
-- 百三十(六) 船舶安全法第八条 船級協会の登録
example : shipSafetyClassificationSocietyRegFee = 90_000 := by decide
-- 百三十(七) 船舶安全法第二十八条第五項 登録検査機関の登録
example : shipSafetyInspectionOrgRegFee = 90_000 := by decide
-- 百三十(八) 船舶安全法第二十九条ノ三第二項 証書発給船級協会の登録
example : shipSafetyCertIssuingClassSocietyRegFee = 90_000 := by decide
-- 百三十一(一) 海洋汚染防止法 準用 船舶安全法第六条ノ二 認定
example : marinePollutionMfgWorkSiteCertFee = 90_000 := by decide
-- 百三十一(二) 海洋汚染防止法 準用 船舶安全法第六条ノ三 認定
example : marinePollutionMaintenanceWorkSiteCertFee = 90_000 := by decide
-- 百三十一(三) 廃油処理事業の許可
example : wasteOilDisposalBizPermitFee = 150_000 := by decide
-- 百三十一(四) 登録確認機関の登録
example : marinePollutionRegConfirmationOrgRegFee = 90_000 := by decide
-- 百三十一(五) 船級協会の登録（第十九条の十五第一項）
example : marinePollutionClassSocietyRegArt19No15Fee = 90_000 := by decide
-- 百三十一(六) 船級協会の登録（第十九条の三十第一項）
example : marinePollutionClassSocietyRegArt19No30Fee = 90_000 := by decide
-- 百三十一(七) 船級協会の登録（第十九条の四十六第一項）
example : marinePollutionClassSocietyRegArt19No46Fee = 90_000 := by decide
-- 百三十一(八) 船舶安全法第六条ノ五第一項 準用 登録検定機関の登録
example : marinePollutionVerificationOrgRegViaSafetyActFee = 90_000 := by decide
-- 百三十一(九) 登録検定機関の登録（第四十三条の九第一項）
example : marinePollutionVerificationOrgRegArt43No9Fee = 90_000 := by decide
-- 百三十二 船級協会の登録（船舶保安規程の審査等）
example : shipSecurityClassSocietyRegFee = 90_000 := by decide
-- 百三十二の二(一) 特定船舶の再資源化解体の許可
example : shipRecyclingBizPermitFee = 90_000 := by decide
-- 百三十二の二(二) 船級協会の登録（第三十条第一項）
example : shipRecyclingClassSocietyRegArt30Fee = 90_000 := by decide
-- 百三十二の二(三) 船級協会の登録（第三十一条第一項）
example : shipRecyclingClassSocietyRegArt31Fee = 90_000 := by decide
-- 百三十三(一) 一般旅客定期航路事業の許可
example : generalPassengerRegularRouteBizPermitFee = 90_000 := by decide
-- 百三十三(二) 特定旅客定期航路事業の許可
example : specifiedPassengerRegularRouteBizPermitFee = 90_000 := by decide
-- 百三十三(三) 対外旅客定期航路事業の登録
example : externalPassengerRegularRouteBizRegFee = 90_000 := by decide
-- 百三十三(四) 貨客定期航路事業の登録
example : passengerFreightRegularRouteBizRegFee = 15_000 := by decide
-- 百三十三(五) 旅客不定期航路事業の許可
example : passengerIrregularRouteBizPermitFee = 90_000 := by decide
-- 百三十三(六) 一般不定期航路事業の登録
example : generalIrregularRouteBizRegFee = 15_000 := by decide
-- 百三十三(七) 登録安全統括管理者講習機関の登録
example : registeredSafetyControlManagerTrainingOrgRegFee = 90_000 := by decide
-- 百三十三(八) 登録運航管理者講習機関の登録
example : registeredOperationManagerTrainingOrgRegFee = 90_000 := by decide
-- 百三十四(一) 一般港湾運送事業の許可
example : generalPortTransportBizPermitFee = 90_000 := by decide
-- 百三十四(二) 港湾荷役事業の許可
example : portStevedoringBizPermitFee = 60_000 := by decide
-- 百三十四(三) はしけ／いかだ運送事業の許可
example : lighterOrRaftTransportBizPermitFee = 30_000 := by decide
-- 百三十四(四) 検数／鑑定／検量事業の許可
example : tallySurveyOrMeasurementBizPermitFee = 30_000 := by decide

end JapanTaxLaw
