import JapanTaxLaw.TaxFinance

/-!
# RegistrationQualificationFeesP2A — 登録免許税法 別表第一（二）第三十二号 五十九〜六十八 の flat fee モデル (W-A)

Sources (pinned):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json
  section 開始マーカー: "三十二　人の資格の登録若しくは認定又は技能証明"（\u3000 は全角空白）

Models 別表第一（二）第三十二号 の 五十九〜六十八 の flat fee 項目（pinned raw bytes 逐語、金額は日本語数字で検証して Arabic に変換）:

  五十九（一） 一般信書便事業の許可 ... 一件につき九万円            → ¥90,000
  五十九（二） 特定信書便事業の許可 ... 一件につき三万円            → ¥30,000
  六十         消防の設備等に係る登録検定機関の登録 ... 一件につき十五万円 → ¥150,000
  六十一       債権管理回収業の許可 ... 一件につき十五万円          → ¥150,000
  六十二       会社の電子公告に係る調査機関の登録 ... 一件につき九万円   → ¥90,000
  六十三       外国人の技能実習監理団体の許可／事業の区分の変更の許可 ... 一件につき一万五千円 → ¥15,000
  六十四       通関業の許可 ... 一件につき九万円                  → ¥90,000
  六十五（一） 酒類の製造免許 ... 一件につき十五万円              → ¥150,000
  六十五（二）イ 酒母の製造免許 ... 一件につき九万円               → ¥90,000
  六十五（二）ロ もろみの製造免許 ... 一件につき十二万円            → ¥120,000
  六十五（三）イ 酒類販売業（小売のみ条件）... 一件につき三万円       → ¥30,000
  六十五（三）ロ 酒類販売業／代理業／媒介業 ... 一件につき九万円       → ¥90,000
  六十五（三）ハ 小売条件の解除 ... 販売場の数一箇所につき六万円        → ¥60,000 / 箇所
  六十六（一） 製造たばこの特定販売業の登録 ... 一件につき十五万円     → ¥150,000
  六十六（二） 製造たばこの卸売販売業の登録 ... 一件につき九万円       → ¥90,000
  六十六（三） 製造たばこの小売販売業の許可 ... 一件につき一万五千円    → ¥15,000
  六十六（四） 製造たばこの出張販売の小売販売許可 ... 一件につき三千円  → ¥3,000
  六十七（一） 塩製造業の登録 ... 一件につき十五万円               → ¥150,000
  六十七（二） 塩特定販売業の登録 ... 一件につき十五万円             → ¥150,000
  六十七（三） 塩卸売業の登録 ... 一件につき九万円                 → ¥90,000
  六十八       著作権等管理事業者の登録 ... 一件につき九万円         → ¥90,000

六十二 は会社法（法律番号なし）第九百四十一条（調査機関の登録）を参照する。
六十五（注）「酒税法（昭和二十八年法律第六号）第十一条第二項（製造免許等の条件）の規定による
酒類の販売業の免許に付された（三）イに規定する条件の全部又は一部の解除は、新たな当該免許とみなす。」
はデーミング規定で金額なし。doc-comment に記載するが fee def は作らない。

Scope & honest boundaries:

* 一件につき／一箇所につきの固定額であることを検証するのみ。登録・免許・許可・認可の
  要件・適用・更新の有無・政令で定めるものの該当性は caller-established とし、
  ここではモデル化しない。
* 六十五（一）の「試験のためにする酒類の製造免許その他政令で定める製造免許を除く。」、
  六十五（三）の「同条第二項の規定により期限を付して行う免許を除く。」、
  六十六（三）（四）の「期限が付された許可を除く。」は適用判定ゲートであり、
  金額定数には反映しない（caller-established）。
* 六十五（三）ハ は一件ではなく「販売場の数一箇所につき」。本モジュールは 1 箇所あたりの
  定数 PerPlace のみを与え、箇所数を掛ける Nat 掛け算は行わない（箇所数は caller-established）。
* 五十八 以前・六十九 以降（W-B スライス）は未モデル化につき未検査（NOT YET COVERED）。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 五十九（一） 一般信書便事業の許可の件数につきの額（固定 ¥90,000）。 -/
def generalMailBusinessPermitFee : Money := 90_000

/-- 五十九（二） 特定信書便事業の許可の件数につきの額（固定 ¥30,000）。 -/
def specifiedMailBusinessPermitFee : Money := 30_000

/-- 六十 消防の設備等に係る登録検定機関の登録の件数につきの額（固定 ¥150,000）。 -/
def fireEquipmentInspectionRegFee : Money := 150_000

/-- 六十一 債権管理回収業の許可の件数につきの額（固定 ¥150,000）。 -/
def debtCollectionBusinessPermitFee : Money := 150_000

/-- 六十二 会社の電子公告に係る調査機関の登録の件数につきの額（固定 ¥90,000）。
    会社法第九百四十一条（調査機関の登録）の登録（更新の登録を除く。）。 -/
def companyElectronicNoticeRegFee : Money := 90_000

/-- 六十三 外国人の技能実習監理団体の許可／事業の区分の変更の許可の件数につきの額（固定 ¥15,000）。 -/
def foreignTraineeMonitorPermitFee : Money := 15_000

/-- 六十四 通関業の許可の件数につきの額（固定 ¥90,000）。 -/
def customsBrokeragePermitFee : Money := 90_000

/-- 六十五（一） 酒類の製造免許の件数につきの額（固定 ¥150,000）。
    「試験のためにする酒類の製造免許その他政令で定める製造免許を除く。」は caller-established。 -/
def liquorManufactureLicenseFee : Money := 150_000

/-- 六十五（二）イ 酒母の製造免許の件数につきの額（固定 ¥90,000）。 -/
def sakeSeedMashLicenseFee : Money := 90_000

/-- 六十五（二）ロ もろみの製造免許の件数につきの額（固定 ¥120,000）。 -/
def moromiProductionLicenseFee : Money := 120_000

/-- 六十五（三）イ 酒類の販売業の免許（全品目につき小売に限る旨の条件付き）の件数につきの額（固定 ¥30,000）。 -/
def liquorRetailOnlyLicenseFee : Money := 30_000

/-- 六十五（三）ロ 酒類の販売業／販売の代理業若しくは媒介業の免許の件数につきの額（固定 ¥90,000）。 -/
def liquorRetailLicenseFee : Money := 90_000

/-- 六十五（三）ハ 小売に限る旨の条件の解除は、**販売場の数 × 本額**（販売場の数一箇所につき ¥60,000）。
    本定数は 1 箇所あたりの額 PerPlace であり、箇所数は caller-established。
    Nat 掛け算はモジュール内で行わず、caller が本定数を渡して算出する。 -/
def liquorRetailConditionRemovalFeePerPlace : Money := 60_000

/-- 六十六（一） 製造たばこの特定販売業の登録の件数につきの額（固定 ¥150,000）。 -/
def tobaccoSpecificRetailRegFee : Money := 150_000

/-- 六十六（二） 製造たばこの卸売販売業の登録の件数につきの額（固定 ¥90,000）。 -/
def tobaccoWholesaleRegFee : Money := 90_000

/-- 六十六（三） 製造たばこの小売販売業の許可の件数につきの額（固定 ¥15,000）。 -/
def tobaccoRetailPermitFee : Money := 15_000

/-- 六十六（四） 製造たばこの出張販売の小売販売の許可の件数につきの額（固定 ¥3,000）。 -/
def tobaccoMobileSalesPermitFee : Money := 3_000

/-- 六十七（一） 塩製造業者の登録の件数につきの額（固定 ¥150,000）。 -/
def saltManufacturerRegFee : Money := 150_000

/-- 六十七（二） 塩特定販売業者の登録の件数につきの額（固定 ¥150,000）。 -/
def saltSpecifiedSellerRegFee : Money := 150_000

/-- 六十七（三） 塩卸売業者の登録の件数につきの額（固定 ¥90,000）。 -/
def saltWholesalerRegFee : Money := 90_000

/-- 六十八 著作権等管理事業者の登録の件数につきの額（固定 ¥90,000）。 -/
def copyrightManagementBusinessRegFee : Money := 90_000

theorem generalMailBusinessPermitFee_pos : generalMailBusinessPermitFee > 0 := by decide
theorem specifiedMailBusinessPermitFee_pos : specifiedMailBusinessPermitFee > 0 := by decide
theorem fireEquipmentInspectionRegFee_pos : fireEquipmentInspectionRegFee > 0 := by decide
theorem debtCollectionBusinessPermitFee_pos : debtCollectionBusinessPermitFee > 0 := by decide
theorem companyElectronicNoticeRegFee_pos : companyElectronicNoticeRegFee > 0 := by decide
theorem foreignTraineeMonitorPermitFee_pos : foreignTraineeMonitorPermitFee > 0 := by decide
theorem customsBrokeragePermitFee_pos : customsBrokeragePermitFee > 0 := by decide
theorem liquorManufactureLicenseFee_pos : liquorManufactureLicenseFee > 0 := by decide
theorem sakeSeedMashLicenseFee_pos : sakeSeedMashLicenseFee > 0 := by decide
theorem moromiProductionLicenseFee_pos : moromiProductionLicenseFee > 0 := by decide
theorem liquorRetailOnlyLicenseFee_pos : liquorRetailOnlyLicenseFee > 0 := by decide
theorem liquorRetailLicenseFee_pos : liquorRetailLicenseFee > 0 := by decide
theorem liquorRetailConditionRemovalFeePerPlace_pos : liquorRetailConditionRemovalFeePerPlace > 0 := by decide
theorem tobaccoSpecificRetailRegFee_pos : tobaccoSpecificRetailRegFee > 0 := by decide
theorem tobaccoWholesaleRegFee_pos : tobaccoWholesaleRegFee > 0 := by decide
theorem tobaccoRetailPermitFee_pos : tobaccoRetailPermitFee > 0 := by decide
theorem tobaccoMobileSalesPermitFee_pos : tobaccoMobileSalesPermitFee > 0 := by decide
theorem saltManufacturerRegFee_pos : saltManufacturerRegFee > 0 := by decide
theorem saltSpecifiedSellerRegFee_pos : saltSpecifiedSellerRegFee > 0 := by decide
theorem saltWholesalerRegFee_pos : saltWholesalerRegFee > 0 := by decide
theorem copyrightManagementBusinessRegFee_pos : copyrightManagementBusinessRegFee > 0 := by decide

example : generalMailBusinessPermitFee = 90_000 := by decide
example : specifiedMailBusinessPermitFee = 30_000 := by decide
example : fireEquipmentInspectionRegFee = 150_000 := by decide
example : debtCollectionBusinessPermitFee = 150_000 := by decide
example : companyElectronicNoticeRegFee = 90_000 := by decide
example : foreignTraineeMonitorPermitFee = 15_000 := by decide
example : customsBrokeragePermitFee = 90_000 := by decide
example : liquorManufactureLicenseFee = 150_000 := by decide
example : sakeSeedMashLicenseFee = 90_000 := by decide
example : moromiProductionLicenseFee = 120_000 := by decide
example : liquorRetailOnlyLicenseFee = 30_000 := by decide
example : liquorRetailLicenseFee = 90_000 := by decide
example : liquorRetailConditionRemovalFeePerPlace = 60_000 := by decide
example : tobaccoSpecificRetailRegFee = 150_000 := by decide
example : tobaccoWholesaleRegFee = 90_000 := by decide
example : tobaccoRetailPermitFee = 15_000 := by decide
example : tobaccoMobileSalesPermitFee = 3_000 := by decide
example : saltManufacturerRegFee = 150_000 := by decide
example : saltSpecifiedSellerRegFee = 150_000 := by decide
example : saltWholesalerRegFee = 90_000 := by decide
example : copyrightManagementBusinessRegFee = 90_000 := by decide

end JapanTaxLaw
