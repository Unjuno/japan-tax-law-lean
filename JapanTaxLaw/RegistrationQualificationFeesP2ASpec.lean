import JapanTaxLaw.RegistrationQualificationFeesP2A

/-!
# RegistrationQualificationFeesP2A spec — independent restatement of
   登録免許税法 別表第一（二）第三十二号 五十九〜六十八

Sources (pinned; identical to RegistrationQualificationFeesP2A.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 五十九〜六十八 の flat 額 from the statutory text itself.
六十五（注）のデーミング規定（条件解除は新たな免許とみなす）は金額なし（spec def を作らない）。

Scope boundaries identical to the implementation (五十八 以前・六十九 以降は NOT YET COVERED;
政令で定めるものの該当性等は caller-established).
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 五十九（一） 一般信書便事業の許可。 -/
def specGeneralMailBusinessPermitFee : Money := 90_000
/-- Spec: 五十九（二） 特定信書便事業の許可。 -/
def specSpecifiedMailBusinessPermitFee : Money := 30_000
/-- Spec: 六十 消防の設備等に係る登録検定機関の登録。 -/
def specFireEquipmentInspectionRegFee : Money := 150_000
/-- Spec: 六十一 債権管理回収業の許可。 -/
def specDebtCollectionBusinessPermitFee : Money := 150_000
/-- Spec: 六十二 会社の電子公告に係る調査機関の登録（会社法第九百四十一条）。 -/
def specCompanyElectronicNoticeRegFee : Money := 90_000
/-- Spec: 六十三 外国人の技能実習監理団体の許可／事業の区分の変更の許可。 -/
def specForeignTraineeMonitorPermitFee : Money := 15_000
/-- Spec: 六十四 通関業の許可。 -/
def specCustomsBrokeragePermitFee : Money := 90_000
/-- Spec: 六十五（一） 酒類の製造免許（政令で定める製造免許を除く）。 -/
def specLiquorManufactureLicenseFee : Money := 150_000
/-- Spec: 六十五（二）イ 酒母の製造免許。 -/
def specSakeSeedMashLicenseFee : Money := 90_000
/-- Spec: 六十五（二）ロ もろみの製造免許。 -/
def specMoromiProductionLicenseFee : Money := 120_000
/-- Spec: 六十五（三）イ 酒類販売業（小売のみ条件）。 -/
def specLiquorRetailOnlyLicenseFee : Money := 30_000
/-- Spec: 六十五（三）ロ 酒類販売業／代理業／媒介業。 -/
def specLiquorRetailLicenseFee : Money := 90_000
/-- Spec: 六十五（三）ハ 小売条件の解除（販売場 1 箇所あたり、箇所数は caller-established）。 -/
def specLiquorRetailConditionRemovalFeePerPlace : Money := 60_000
/-- Spec: 六十六（一） 製造たばこの特定販売業の登録。 -/
def specTobaccoSpecificRetailRegFee : Money := 150_000
/-- Spec: 六十六（二） 製造たばこの卸売販売業の登録。 -/
def specTobaccoWholesaleRegFee : Money := 90_000
/-- Spec: 六十六（三） 製造たばこの小売販売業の許可。 -/
def specTobaccoRetailPermitFee : Money := 15_000
/-- Spec: 六十六（四） 製造たばこの出張販売の小売販売許可。 -/
def specTobaccoMobileSalesPermitFee : Money := 3_000
/-- Spec: 六十七（一） 塩製造業の登録。 -/
def specSaltManufacturerRegFee : Money := 150_000
/-- Spec: 六十七（二） 塩特定販売業の登録。 -/
def specSaltSpecifiedSellerRegFee : Money := 150_000
/-- Spec: 六十七（三） 塩卸売業の登録。 -/
def specSaltWholesalerRegFee : Money := 90_000
/-- Spec: 六十八 著作権等管理事業者の登録。 -/
def specCopyrightManagementBusinessRegFee : Money := 90_000

example : specGeneralMailBusinessPermitFee = 90_000 := by decide
example : specSpecifiedMailBusinessPermitFee = 30_000 := by decide
example : specFireEquipmentInspectionRegFee = 150_000 := by decide
example : specDebtCollectionBusinessPermitFee = 150_000 := by decide
example : specCompanyElectronicNoticeRegFee = 90_000 := by decide
example : specForeignTraineeMonitorPermitFee = 15_000 := by decide
example : specCustomsBrokeragePermitFee = 90_000 := by decide
example : specLiquorManufactureLicenseFee = 150_000 := by decide
example : specSakeSeedMashLicenseFee = 90_000 := by decide
example : specMoromiProductionLicenseFee = 120_000 := by decide
example : specLiquorRetailOnlyLicenseFee = 30_000 := by decide
example : specLiquorRetailLicenseFee = 90_000 := by decide
example : specLiquorRetailConditionRemovalFeePerPlace = 60_000 := by decide
example : specTobaccoSpecificRetailRegFee = 150_000 := by decide
example : specTobaccoWholesaleRegFee = 90_000 := by decide
example : specTobaccoRetailPermitFee = 15_000 := by decide
example : specTobaccoMobileSalesPermitFee = 3_000 := by decide
example : specSaltManufacturerRegFee = 150_000 := by decide
example : specSaltSpecifiedSellerRegFee = 150_000 := by decide
example : specSaltWholesalerRegFee = 90_000 := by decide
example : specCopyrightManagementBusinessRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP2A : Bool :=
  specGeneralMailBusinessPermitFee == generalMailBusinessPermitFee &&
  specSpecifiedMailBusinessPermitFee == specifiedMailBusinessPermitFee &&
  specFireEquipmentInspectionRegFee == fireEquipmentInspectionRegFee &&
  specDebtCollectionBusinessPermitFee == debtCollectionBusinessPermitFee &&
  specCompanyElectronicNoticeRegFee == companyElectronicNoticeRegFee &&
  specForeignTraineeMonitorPermitFee == foreignTraineeMonitorPermitFee &&
  specCustomsBrokeragePermitFee == customsBrokeragePermitFee &&
  specLiquorManufactureLicenseFee == liquorManufactureLicenseFee &&
  specSakeSeedMashLicenseFee == sakeSeedMashLicenseFee &&
  specMoromiProductionLicenseFee == moromiProductionLicenseFee &&
  specLiquorRetailOnlyLicenseFee == liquorRetailOnlyLicenseFee &&
  specLiquorRetailLicenseFee == liquorRetailLicenseFee &&
  specLiquorRetailConditionRemovalFeePerPlace == liquorRetailConditionRemovalFeePerPlace &&
  specTobaccoSpecificRetailRegFee == tobaccoSpecificRetailRegFee &&
  specTobaccoWholesaleRegFee == tobaccoWholesaleRegFee &&
  specTobaccoRetailPermitFee == tobaccoRetailPermitFee &&
  specTobaccoMobileSalesPermitFee == tobaccoMobileSalesPermitFee &&
  specSaltManufacturerRegFee == saltManufacturerRegFee &&
  specSaltSpecifiedSellerRegFee == saltSpecifiedSellerRegFee &&
  specSaltWholesalerRegFee == saltWholesalerRegFee &&
  specCopyrightManagementBusinessRegFee == copyrightManagementBusinessRegFee

example : agreeRegistrationQualificationFeesP2A = true := by decide

end JapanTaxLaw
