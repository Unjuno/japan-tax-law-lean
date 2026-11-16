import JapanTaxLaw.RegistrationCommercialTax

/-!
# RegistrationCommercialTaxTable — 登録免許税法 別表第一（二）第二十四号（一）イ〜チ（株式会社等の設立・増加）表 (L4)

Sources (pinned; identical to RegistrationCommercialTax.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15
  (data/raw/342AC0000000035_20261101_508AC0000000021.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as RegistrationCommercialTax.lean / RegistrationTax.lean)

Models the following pinned entries of 別表第一（二）第二十四号（一）（株式会社等の登記）:

  イ　株式会社の設立の登記（ホ及びトに掲げる登記を除く。）資本金の額千分の七
      （これによつて計算した税額が十五万円に満たないときは、申請件数一件につき十五万円）
      [RegistrationCommercialTax.lean の担当]
  ロ　合名会社若しくは合資会社又は一般社団法人等の設立の登記 申請件数一件につき六万円
  ハ　合同会社の設立の登記（ホ及びトに掲げる登記を除く。）資本金の額千分の七
      （これによつて計算した税額が六万円に満たないときは、申請件数一件につき六万円）
  ニ　株式会社又は合同会社の資本金の増加の登記（ヘ及びチに掲げる登記を除く。）
      増加した資本金の額千分の七
      （これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）
  ホ　新設合併又は組織変更若しくは種類の変更による株式会社又は合同会社の設立の登記
      資本金の額千分の一・五
      （新設合併により消滅した会社又は組織変更若しくは種類の変更をした会社の当該当該
       新設合併又は組織変更若しくは種類の変更の直前における資本金の額として財務省令で定めるものを
       超える資本金の額に対応する部分については、千分の七。）
      （これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）
  ヘ　吸収合併による株式会社又は合同会社の資本金の増加の登記
      増加した資本金の額千分の一・五
      （吸収合併により消滅した会社の当該吸収合併の直前における資本金の額として財務省令で定めるものを
       超える資本金の額に対応する部分については、千分の七。）
      （これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）
  ト　新設分割による株式会社又は合同会社の設立の登記
      資本金の額千分の七
      （これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）
  チ　吸収分割による株式会社又は合同会社の資本金の増加の登記
      増加した資本金の額千分の七
      （これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）

Eligibility gates (which item the document matches, whether the caller's
"直前における資本金の額として財務省令で定めるもの" is correct, whether the doc
is within scope at all) are externally established booleans — the model has no way to
judge the scope exceptions and asks the caller. Non-eligible inputs return `none`/`0`
per the same-disciplined caller-supplied-fact pattern as `RegistrationCommercialTax.lean`.

Scope:

* リ（相互会社の設立 ￥300,000）／ヌ（新株予約権の発行による変更 ¥90,000）／
  ル（支店・従たる事務所の設置 ¥60,000）／ヲ（本店・支店等の移転 ¥30,000）／
  ワ（取締役会等事項の変更 ¥3万 or ¥1万）／カ（役員に関する事項の変更 ¥3万・特別 ¥1万）／
  ヨ（支配人の選任 ¥90,000? actually the row shows ¥9万 from ヌ onward, let me not
  enumerate explicitly — those are flat 3/9/30/60/90万-per-item registration fees with
  different factual conditions; modelling them is out of scope of this slice).
* art. 19（定率課税の最低税額 ¥1,000）— 別表第一の欄の stricter floors (Rp ¥30,000/60,000/150,000) に
  よって上書きされるので、本モデルの各欄の最低欄のみで表現し、art. 19 を独立モデル化しない。
* art. 8 債権金額の計算 — 本モデルは登記時の資本金の額に使われる債権金額が確定している前提で計算。
* 申請手数料の計算・件数の積み上げはモデル化しない（各計算は「一件につき」の限度）。
* ホの「新設合併又は組織変更若しくは種類の変更」の判定のほうは caller-established boolean
  （どの法的事由に該当するかは条文の射程による）。
* ホ・ヘの財務省令で定める資本金の直前額（直前における資本金の額として財務省令で定めるもの）は
  本モデルでは計算せず `preMergerCapitalBasis`（caller-computed Money）として受け取る。
  財務省令（登録免許税法施行規則）の当該条文は別表 pin に含まれない（e-Gov 別法令のため未 pin・未検査）。

Floor placement (modeling candidate): 各部分の税額は applyFloor（当該部分）で計算し、
ホ・ヘの千分の七の部分とは別に合計して三万円の下限を適用する。
「計算した税額が…に満たないときは、申請件数一件につき…」は合計額に対する判定と読んだのは、
同表の他の類似欄の記述法と整合させるためのモデル化であり（イノホ…）、一律ではないことを記録する。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

inductive Commercial24Item where
  | itemI | itemRo | itemHa | itemNi | itemHo | itemHe | itemTo | itemChi
  deriving DecidableEq, Repr

/-- イ以外の合名等設立 item 共用: 番千七(Item ニ・チ共通の税率)。 -/
def commercial24DefaultMilleRate : TaxRate := ⟨7, 1000, by decide⟩

/-- ホ・ヘ共用: 千分の一・五 (1.5/1000)。 -/
def commercial24LowMilleRate : TaxRate := ⟨15, 10000, by decide⟩

/-- ホ・ヘにおいて適用: 資本金の額（増加額）の "直前における資本金の額として
    財務省令で定めるものを超える資本金の額に対応する部分" は 千分の七。
    すなわち min(capital, preMergerCapitalBasis) の部分は 1.5‰、
    超える部分 max 0 (capital - preMergerCapitalBasis) の部分は 7‰。 -/
def mergedCompanyPortionTax (amount preMergerCapitalBasis : Money) : Money :=
  let portion1 := min amount preMergerCapitalBasis
  let portion2 := amount - portion1
  TaxRate.applyFloor commercial24LowMilleRate portion1 +
    TaxRate.applyFloor commercial24DefaultMilleRate portion2

/-- ホ: 新設合併又は組織変更若しくは種類の変更による株式会社又は合同会社の設立の登記。
    資本金の額千分の一・五（直前における資本金の額として財務省令で定めるものを超える部分は千分の七）。
    計算税額が三万円に満たないときは、申請件数一件につき三万円。 -/
def newMergerFormationTax (capital preMergerCapitalBasis : Money) : Money :=
  let computed := mergedCompanyPortionTax capital preMergerCapitalBasis
  if computed < 30_000 then 30_000 else computed

/-- ヘ: 吸収合併による株式会社又は合同会社の資本金の増加の登記。
    増加した資本金の額千分の一・五（吸収合併により消滅した会社の直前における資本金の額として
    財務省令で定めるものを超える資本金の額に対応する部分は千分の七）。
    計算税額が三万円に満たないときは、申請件数一件につき三万円。 -/
def absorptionMergerIncreaseTax (increase preMergerCapitalBasis : Money) : Money :=
  let computed := mergedCompanyPortionTax increase preMergerCapitalBasis
  if computed < 30_000 then 30_000 else computed

/-- ロ: 合名会社若しくは合資会社又は一般社団法人等の設立の登記。
    申請件数一件につき六万円。 -/
def gmporGeneralFormationTax : Money := 60_000

/-- ハ: 合同会社の設立の登記（ホ及びトに掲げる登記を除く。）。
    資本金の額千分の七（これによつて計算した税額が六万円に満たないときは、申請件数一件につき六万円）。 -/
def goudoushaFormationTax (capital : Money) : Money :=
  let computed := TaxRate.applyFloor commercial24DefaultMilleRate capital
  if computed < 60_000 then 60_000 else computed

/-- ニ: 株式会社又は合同会社の資本金の増加の登記（ヘ及びチに掲げる登記を除く。）。
    増加した資本金の額千分の七（これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）。 -/
def capitalIncreaseTax (increase : Money) : Money :=
  let computed := TaxRate.applyFloor commercial24DefaultMilleRate increase
  if computed < 30_000 then 30_000 else computed

/-- ト: 新設分割による株式会社又は合同会社の設立の登記。
    資本金の額千分の七（これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）。 -/
def newDivisionalFormationTax (capital : Money) : Money :=
  let computed := TaxRate.applyFloor commercial24DefaultMilleRate capital
  if computed < 30_000 then 30_000 else computed

/-- チ: 吸収分割による株式会社又は合同会社の資本金の増加の登記。
    増加した資本金の額千分の七（これによつて計算した税額が三万円に満たないときは、申請件数一件につき三万円）。 -/
def absorptionDivisionIncreaseTax (increase : Money) : Money :=
  let computed := TaxRate.applyFloor commercial24DefaultMilleRate increase
  if computed < 30_000 then 30_000 else computed

/-- リ: 相互会社の設立（新設合併又は組織変更による設立を含む。）の登記。
    申請件数一件につき三十万円。 -/
def mutualCompanyFormationFee : Money := 300_000

/-- ヌ: 新株予約権の発行による変更の登記。申請件数一件につき九万円。 -/
def shareSubscriptionModificationFee : Money := 90_000

/-- ル: 支店又は従たる事務所の設置の登記。
    支店又は従たる事務所の数「一箇所につき」六万円（件数 × 六万円）。 -/
def branchInstallationFee (branchCount : Nat) : Money := branchCount * 60_000

/-- ヲ: 本店若しくは主たる事務所又は支店若しくは従たる事務所の移転の登記。
    同じく「一箇所につき」三万円（件数 × 三万円）。 -/
def relocationFee (branchCount : Nat) : Money := branchCount * 30_000

/-- ワ: 取締役会、監査役会、監査等委員会若しくは指名委員会等又は理事会に関する事項の
    変更の登記。申請件数一件につき三万円。 -/
def boardMattersModificationFee : Money := 30_000

/-- カ: 取締役、代表取締役若しくは特別取締役、会計参与、監査役、会計監査人、
    指名委員会等の委員、執行役若しくは代表執行役若しくは社員又は理事、監事、
    代表理事若しくは評議員に関する事項の変更（会社又は相互会社若しくは一般社団法人等
    の代表に関する事項の変更を含む。）の登記。
    申請件数一件につき三万円。
    ただし、資本金の額が一億円以下の会社又は一般社団法人等については、一万円。
    `capital` は externally established な当該株式会社等の資本金の額。 -/
def directorMattersModificationFee (capital : Money) : Money :=
  if capital ≤ 100_000_000 then 10_000 else 30_000

/-- ヨ: 支配人の選任の登記又はその代理権の消滅の登記。
    申請件数一件につき三万円。 -/
def representativeAttachmentFee : Money := 30_000

theorem mutualCompanyFormationFee_pos : mutualCompanyFormationFee > 0 := by decide
theorem shareSubscriptionModificationFee_pos : shareSubscriptionModificationFee > 0 := by decide
theorem boardMattersModificationFee_pos : boardMattersModificationFee > 0 := by decide
theorem representativeAttachmentFee_pos : representativeAttachmentFee > 0 := by decide
theorem branchInstallationFee_succ_pos (n : Nat) : branchInstallationFee (n + 1) > 0 := by
  unfold branchInstallationFee
  exact Nat.mul_pos (Nat.succ_pos n) (by decide : 0 < 60_000)

example : mutualCompanyFormationFee = 300_000 := by decide
example : shareSubscriptionModificationFee = 90_000 := by decide
example : branchInstallationFee 0 = 0 := by decide
example : branchInstallationFee 1 = 60_000 := by decide
example : branchInstallationFee 2 = 120_000 := by decide
example : relocationFee 0 = 0 := by decide
example : relocationFee 1 = 30_000 := by decide
example : relocationFee 3 = 90_000 := by decide
example : boardMattersModificationFee = 30_000 := by decide
example : directorMattersModificationFee 0 = 10_000 := by decide
example : directorMattersModificationFee 100_000_000 = 10_000 := by decide
example : directorMattersModificationFee 100_000_001 = 30_000 := by decide
example : representativeAttachmentFee = 30_000 := by decide

/-- タ: 役員等の職務執行の停止若しくは職務代行者の選任等の登記。
    申請件数一件につき三万円。 -/
def officerSuspensionFee : Money := 30_000

/-- レ: 会社又は相互会社若しくは一般社団法人等の解散の登記。
    申請件数一件につき三万円。 -/
def dissolutionFee : Money := 30_000

/-- ソ: 会社若しくは一般社団法人等の継続の登記、合併を無効とする判決が確定した場合における
    合併により消滅した会社若しくは相互会社若しくは一般社団法人等の回復の登記又は
    会社若しくは相互会社若しくは一般社団法人等の設立の無効若しくはその設立の取消しの登記。
    申請件数一件につき三万円。 -/
def companyContinuationFee : Money := 30_000

/-- ツ: 登記事項の変更、消滅又は廃止の登記（これらの登記のうちイからソまでに掲げるものを除く。）。
    申請件数一件につき三万円。 -/
def residualRegistrationModificationFee : Money := 30_000

/-- ネ: 登記の更正の登記。申請件数一件につき二万円。 -/
def registrationCorrectionFee : Money := 20_000

/-- ナ: 登記の抹消の登記。申請件数一件につき二万円。 -/
def registrationErasureFee : Money := 20_000

/-- （二）外国会社又は外国相互会社の登記（イ）営業所の設置の登記（ロに掲げる登記を除く。）。
    営業所の数「一箇所につき」九万円。 -/
def foreignCompanyOfficeInstallationFee (officeCount : Nat) : Money := officeCount * 90_000

/-- （二）ロ 営業所を設置していない場合の外国会社の登記又は
    当該営業所を設置していない外国会社が初めて設置する一の営業所の設置の登記。
    申請件数一件につき六万円。 -/
def foreignCompanyFirstOfficeFee : Money := 60_000

/-- （二）ハ イ、ロ及びニに掲げる登記以外の登記。申請件数一件につき九千円。 -/
def foreignCompanyOtherRegistrationFee : Money := 9_000

/-- （二）ニ 登記の更正の登記又は登記の抹消。申請件数一件につき六千円。 -/
def foreignCompanyCorrectionErasureFee : Money := 6_000

/-- （三）イ 清算人又は代表清算人の登記（外国会社又は外国相互会社の清算に係る登記を含む）。
    申請件数一件につき九千円。 -/
def liquidatorRegistrationFee : Money := 9_000

/-- （三）ロ 清算人若しくは代表清算人の職務執行の停止若しくはその取消し若しくは変更又は
    清算人若しくは代表清算人の職務代行者の選任、解任若しくは変更の登記。
    申請件数一件につき六千円。 -/
def liquidatorModificationFee : Money := 6_000

/-- （三）ハ 清算の結了の登記。申請件数一件につき二千円。 -/
def liquidationCompletionFee : Money := 2_000

/-- （三）ニ 登記事項の変更、消滅若しくは廃止の登記（これらの登記のうちロに掲げるものを除く。）、
    登記の更正の登記又は登記の抹消。申請件数一件につき六千円。 -/
def liquidationOtherModificationFee : Money := 6_000

theorem officerSuspensionFee_pos : officerSuspensionFee > 0 := by decide
theorem dissolutionFee_pos : dissolutionFee > 0 := by decide
theorem companyContinuationFee_pos : companyContinuationFee > 0 := by decide
theorem residualRegistrationModificationFee_pos : residualRegistrationModificationFee > 0 := by decide
theorem registrationCorrectionFee_pos : registrationCorrectionFee > 0 := by decide
theorem registrationErasureFee_pos : registrationErasureFee > 0 := by decide
theorem foreignCompanyFirstOfficeFee_pos : foreignCompanyFirstOfficeFee > 0 := by decide
theorem foreignCompanyOtherRegistrationFee_pos : foreignCompanyOtherRegistrationFee > 0 := by decide
theorem foreignCompanyCorrectionErasureFee_pos : foreignCompanyCorrectionErasureFee > 0 := by decide
theorem liquidatorRegistrationFee_pos : liquidatorRegistrationFee > 0 := by decide
theorem liquidatorModificationFee_pos : liquidatorModificationFee > 0 := by decide
theorem liquidationCompletionFee_pos : liquidationCompletionFee > 0 := by decide
theorem liquidationOtherModificationFee_pos : liquidationOtherModificationFee > 0 := by decide
theorem foreignCompanyOfficeInstallationFee_succ_pos (n : Nat) :
    foreignCompanyOfficeInstallationFee (n + 1) > 0 := by
  unfold foreignCompanyOfficeInstallationFee
  exact Nat.mul_pos (Nat.succ_pos n) (by decide : 0 < 90_000)

example : officerSuspensionFee = 30_000 := by decide
example : dissolutionFee = 30_000 := by decide
example : companyContinuationFee = 30_000 := by decide
example : residualRegistrationModificationFee = 30_000 := by decide
example : registrationCorrectionFee = 20_000 := by decide
example : registrationErasureFee = 20_000 := by decide
example : foreignCompanyOfficeInstallationFee 0 = 0 := by decide
example : foreignCompanyOfficeInstallationFee 1 = 90_000 := by decide
example : foreignCompanyOfficeInstallationFee 3 = 270_000 := by decide
example : foreignCompanyFirstOfficeFee = 60_000 := by decide
example : foreignCompanyOtherRegistrationFee = 9_000 := by decide
example : foreignCompanyCorrectionErasureFee = 6_000 := by decide
example : liquidatorRegistrationFee = 9_000 := by decide
example : liquidatorModificationFee = 6_000 := by decide
example : liquidationCompletionFee = 2_000 := by decide
example : liquidationOtherModificationFee = 6_000 := by decide

/-- 二十五（一） 特定目的会社の設立の登記。申請件数一件につき三万円。 -/
def spcFormationFee : Money := 30_000

/-- 二十五（二） 特定目的会社の登記で（一）（三）に掲げる登記以外の登記。
    申請件数一件につき一万五千円。 -/
def spcOtherRegistrationFee : Money := 15_000

/-- 二十五（三） 特定目的会社の登記の抹消。申請件数一件につき一万円。 -/
def spcErasureFee : Money := 10_000

/-- 二十六（一） 投資法人の設立の登記。申請件数一件につき三万円。 -/
def investmentCorporationFormationFee : Money := 30_000

/-- 二十六（二） 投資法人の登記で（一）（三）に掲げる登記以外の登記。
    申請件数一件につき一万五千円。 -/
def investmentCorporationOtherRegistrationFee : Money := 15_000

/-- 二十六（三） 投資法人の登記の抹消。申請件数一件につき一万円。 -/
def investmentCorporationErasureFee : Money := 10_000

/-- 二十七（一）イ 有限責任事業組合契約の効力の発生の登記（（二）の登記を除く）。
    申請件数一件につき六万円。 -/
def llpContractEffectivenessFee : Money := 60_000

/-- 二十七（一）ロ 有限責任事業組合契約の従たる事務所の設置の登記。
    申請件数一件につき六万円。 -/
def llpBranchInstallationFee : Money := 60_000

/-- 二十七（一）ハ 有限責任事業組合契約の主たる事務所又は従たる事務所の移転の登記。
    申請件数一件につき三万円。 -/
def llpMoveFee : Money := 30_000

/-- 二十七（一）ニ 有限責任事業組合契約の組合員に関する事項の変更の登記。
    申請件数一件につき一万円。 -/
def llpPartnerModificationFee : Money := 10_000

/-- 二十七（一）ホ 有限責任事業組合契約の組合員の業務執行の停止又は
    業務代行者の選任の登記。申請件数一件につき三万円。 -/
def llpPartnerSuspensionFee : Money := 30_000

/-- 二十七（一）ヘ 有限責任事業組合契約の組合契約の登記で
    イからホまで、ト及びチに掲げる登記以外の登記。申請件数一件につき三万円。 -/
def llpOtherRegistrationFee : Money := 30_000

/-- 二十七（一）ト 有限責任事業組合契約の登記の更正の登記。
    申請件数一件につき二万円。 -/
def llpCorrectionFee : Money := 20_000

/-- 二十七（一）チ 有限責任事業組合契約の登記の抹消の登記。
    申請件数一件につき二万円。 -/
def llpErasureFee : Money := 20_000

/-- 二十七（二）イ 有限責任事業組合契約の清算に係る登記の清算人の登記。
    申請件数一件につき六千円。 -/
def llpLiquidatorRegistrationFee : Money := 6_000

/-- 二十七（二）ロ 有限責任事業組合契約の清算に係る登記で
    イ、ハ及びニに掲げる登記以外の登記。申請件数一件につき六千円。 -/
def llpLiquidatorOtherFee : Money := 6_000

/-- 二十七（二）ハ 有限責任事業組合契約の清算に係る清算結了の登記。
    申請件数一件につき二千円。 -/
def llpLiquidationCompletionFee : Money := 2_000

/-- 二十七（二）ニ 有限責任事業組合契約の清算に係る登記の更正の登記又は登記の抹消。
    申請件数一件につき六千円。 -/
def llpLiquidatorCorrectionErasureFee : Money := 6_000

theorem spcFormationFee_pos : spcFormationFee > 0 := by decide
theorem spcOtherRegistrationFee_pos : spcOtherRegistrationFee > 0 := by decide
theorem spcErasureFee_pos : spcErasureFee > 0 := by decide
theorem investmentCorporationFormationFee_pos : investmentCorporationFormationFee > 0 := by decide
theorem investmentCorporationOtherRegistrationFee_pos :
    investmentCorporationOtherRegistrationFee > 0 := by decide
theorem investmentCorporationErasureFee_pos : investmentCorporationErasureFee > 0 := by decide
theorem llpContractEffectivenessFee_pos : llpContractEffectivenessFee > 0 := by decide
theorem llpBranchInstallationFee_pos : llpBranchInstallationFee > 0 := by decide
theorem llpMoveFee_pos : llpMoveFee > 0 := by decide
theorem llpPartnerModificationFee_pos : llpPartnerModificationFee > 0 := by decide
theorem llpPartnerSuspensionFee_pos : llpPartnerSuspensionFee > 0 := by decide
theorem llpOtherRegistrationFee_pos : llpOtherRegistrationFee > 0 := by decide
theorem llpCorrectionFee_pos : llpCorrectionFee > 0 := by decide
theorem llpErasureFee_pos : llpErasureFee > 0 := by decide
theorem llpLiquidatorRegistrationFee_pos : llpLiquidatorRegistrationFee > 0 := by decide
theorem llpLiquidatorOtherFee_pos : llpLiquidatorOtherFee > 0 := by decide
theorem llpLiquidationCompletionFee_pos : llpLiquidationCompletionFee > 0 := by decide
theorem llpLiquidatorCorrectionErasureFee_pos :
    llpLiquidatorCorrectionErasureFee > 0 := by decide

example : spcFormationFee = 30_000 := by decide
example : spcOtherRegistrationFee = 15_000 := by decide
example : spcErasureFee = 10_000 := by decide
example : investmentCorporationFormationFee = 30_000 := by decide
example : investmentCorporationOtherRegistrationFee = 15_000 := by decide
example : investmentCorporationErasureFee = 10_000 := by decide
example : llpContractEffectivenessFee = 60_000 := by decide
example : llpBranchInstallationFee = 60_000 := by decide
example : llpMoveFee = 30_000 := by decide
example : llpPartnerModificationFee = 10_000 := by decide
example : llpPartnerSuspensionFee = 30_000 := by decide
example : llpOtherRegistrationFee = 30_000 := by decide
example : llpCorrectionFee = 20_000 := by decide
example : llpErasureFee = 20_000 := by decide
example : llpLiquidatorRegistrationFee = 6_000 := by decide
example : llpLiquidatorOtherFee = 6_000 := by decide
example : llpLiquidationCompletionFee = 2_000 := by decide
example : llpLiquidatorCorrectionErasureFee = 6_000 := by decide

/-- 二十八（一）イ 投資事業有限責任組合契約の効力の発生の登記。
    申請件数一件につき三万円。 -/
def viclpContractEffectivenessFee : Money := 30_000

/-- 二十八（一）ロ イ、ハ及びニに掲げる登記以外の登記。
    申請件数一件につき一万五千円。 -/
def viclpOtherRegistrationFee : Money := 15_000

/-- 二十八（一）ハ 登記の更正の登記。申請件数一件につき一万円。 -/
def viclpCorrectionFee : Money := 10_000

/-- 二十八（一）ニ 登記の抹消申請件数。申請件数一件につき一万円。 -/
def viclpErasureFee : Money := 10_000

/-- 二十八（二）イ 組合契約の清算に係る清算人の登記。
    申請件数一件につき六千円。 -/
def viclpLiquidatorRegistrationFee : Money := 6_000

/-- 二十八（二）ロ イ、ハ及びニに掲げる登記以外の登記。
    申請件数一件につき六千円。 -/
def viclpLiquidatorOtherFee : Money := 6_000

/-- 二十八（二）ハ 清算結了の登記。申請件数一件につき二千円。 -/
def viclpLiquidationCompletionFee : Money := 2_000

/-- 二十八（二）ニ 登記の更正の登記又は登記の抹消申請件数。
    申請件数一件につき六千円。 -/
def viclpLiquidatorCorrectionErasureFee : Money := 6_000

/-- 二十八の二（一） 信託法第二百三十二条の限定責任信託の定めの登記。
    申請件数一件につき三万円。 -/
def limitLiabilityTrustProvisionFee : Money := 30_000

/-- 二十八の二（二） 信託法第二百三十三条第一項の規定による
    新事務処理地においてする同法第二百三十二条各号に掲げる事項の登記。
    申請件数一件につき一万五千円。 -/
def limitLiabilityTrustNewDomicileFee : Money := 15_000

/-- 二十八の二（三） （一）、（二）及び（四）から（六）までに掲げる登記以外の登記。
    申請件数一件につき一万五千円。 -/
def limitLiabilityTrustOtherRegistrationFee : Money := 15_000

/-- 二十八の二（四） 登記の更正の登記（（六）ニに掲げる登記を除く。）。
    申請件数一件につき一万円。 -/
def limitLiabilityTrustCorrectionFee : Money := 10_000

/-- 二十八の二（五） 登記の抹消（（六）ニに掲げる登記を除く。）。
    申請件数一件につき一万円。 -/
def limitLiabilityTrustErasureFee : Money := 10_000

/-- 二十八の二（六）イ 清算受託者の登記。申請件数一件につき六千円。 -/
def limitLiabilityTrustLiquidatorRegistrationFee : Money := 6_000

/-- 二十八の二（六）ロ イ、ハ及びニに掲げる登記以外の登記。
    申請件数一件につき六千円。 -/
def limitLiabilityTrustLiquidatorOtherFee : Money := 6_000

/-- 二十八の二（六）ハ 清算結了の登記。申請件数一件につき二千円。 -/
def limitLiabilityTrustLiquidationCompletionFee : Money := 2_000

/-- 二十八の二（六）ニ 登記の更正の登記又は登記の抹消申請件数。
    申請件数一件につき六千円。 -/
def limitLiabilityTrustLiquidatorCorrectionErasureFee : Money := 6_000

theorem viclpContractEffectivenessFee_pos : viclpContractEffectivenessFee > 0 := by decide
theorem viclpOtherRegistrationFee_pos : viclpOtherRegistrationFee > 0 := by decide
theorem viclpCorrectionFee_pos : viclpCorrectionFee > 0 := by decide
theorem viclpErasureFee_pos : viclpErasureFee > 0 := by decide
theorem viclpLiquidatorRegistrationFee_pos : viclpLiquidatorRegistrationFee > 0 := by decide
theorem viclpLiquidatorOtherFee_pos : viclpLiquidatorOtherFee > 0 := by decide
theorem viclpLiquidationCompletionFee_pos : viclpLiquidationCompletionFee > 0 := by decide
theorem viclpLiquidatorCorrectionErasureFee_pos : viclpLiquidatorCorrectionErasureFee > 0 := by decide
theorem limitLiabilityTrustProvisionFee_pos : limitLiabilityTrustProvisionFee > 0 := by decide
theorem limitLiabilityTrustNewDomicileFee_pos : limitLiabilityTrustNewDomicileFee > 0 := by decide
theorem limitLiabilityTrustOtherRegistrationFee_pos : limitLiabilityTrustOtherRegistrationFee > 0 := by decide
theorem limitLiabilityTrustCorrectionFee_pos : limitLiabilityTrustCorrectionFee > 0 := by decide
theorem limitLiabilityTrustErasureFee_pos : limitLiabilityTrustErasureFee > 0 := by decide
theorem limitLiabilityTrustLiquidatorRegistrationFee_pos : limitLiabilityTrustLiquidatorRegistrationFee > 0 := by decide
theorem limitLiabilityTrustLiquidatorOtherFee_pos : limitLiabilityTrustLiquidatorOtherFee > 0 := by decide
theorem limitLiabilityTrustLiquidationCompletionFee_pos : limitLiabilityTrustLiquidationCompletionFee > 0 := by decide
theorem limitLiabilityTrustLiquidatorCorrectionErasureFee_pos : limitLiabilityTrustLiquidatorCorrectionErasureFee > 0 := by decide

example : viclpContractEffectivenessFee = 30_000 := by decide
example : viclpOtherRegistrationFee = 15_000 := by decide
example : viclpCorrectionFee = 10_000 := by decide
example : viclpErasureFee = 10_000 := by decide
example : viclpLiquidatorRegistrationFee = 6_000 := by decide
example : viclpLiquidatorOtherFee = 6_000 := by decide
example : viclpLiquidationCompletionFee = 2_000 := by decide
example : viclpLiquidatorCorrectionErasureFee = 6_000 := by decide
example : limitLiabilityTrustProvisionFee = 30_000 := by decide
example : limitLiabilityTrustNewDomicileFee = 15_000 := by decide
example : limitLiabilityTrustOtherRegistrationFee = 15_000 := by decide
example : limitLiabilityTrustCorrectionFee = 10_000 := by decide
example : limitLiabilityTrustErasureFee = 10_000 := by decide
example : limitLiabilityTrustLiquidatorRegistrationFee = 6_000 := by decide
example : limitLiabilityTrustLiquidatorOtherFee = 6_000 := by decide
example : limitLiabilityTrustLiquidationCompletionFee = 2_000 := by decide
example : limitLiabilityTrustLiquidatorCorrectionErasureFee = 6_000 := by decide

/-- art. 19 は別表第一の欄の最低下限（¥30,000/60,000/150,000）によって上書きされるため
    ここで独立モデル化しない。 -/

theorem commercial24DefaultMilleRate_pos : commercial24DefaultMilleRate.num > 0 := by decide
theorem commercial24LowMilleRate_pos : commercial24LowMilleRate.num > 0 := by decide
theorem commercial24LowMilleRate_lt_default :
    commercial24LowMilleRate.num * commercial24DefaultMilleRate.den <
      commercial24DefaultMilleRate.num * commercial24LowMilleRate.den := by
  decide

example : commercial24DefaultMilleRate.applyFloor 1_000_000_000 = 7_000_000 := by decide
example : commercial24LowMilleRate.applyFloor 1_000_000_000 = 1_500_000 := by decide

example : gmporGeneralFormationTax = 60_000 := by decide
example : goudoushaFormationTax 0 = 60_000 := by decide
example : goudoushaFormationTax 10_000_000_000 = 70_000_000 := by decide
example : goudoushaFormationTax 8_000_000_000 = 56_000_000 := by decide

example : capitalIncreaseTax 0 = 30_000 := by decide
example : capitalIncreaseTax 10_000_000_000 = 70_000_000 := by decide
example : capitalIncreaseTax 4_000_000_000 = 28_000_000 := by decide

example : newDivisionalFormationTax 0 = 30_000 := by decide
example : newDivisionalFormationTax 10_000_000_000 = 70_000_000 := by decide

example : absorptionDivisionIncreaseTax 0 = 30_000 := by decide
example : absorptionDivisionIncreaseTax 10_000_000_000 = 70_000_000 := by decide

example : newMergerFormationTax 0 0 = 30_000 := by decide
example : newMergerFormationTax 0 5_000_000_000 = 30_000 := by decide
example : newMergerFormationTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide
example : newMergerFormationTax 5_000_000_000 5_000_000_000 = 7_500_000 := by decide
example : newMergerFormationTax 7_000_000_000 5_000_000_000 = 7_500_000 + 14_000_000 := by decide
example : newMergerFormationTax 10_000_000_000 10_000_000_000 = 15_000_000 := by decide

example : absorptionMergerIncreaseTax 0 0 = 30_000 := by decide
example : absorptionMergerIncreaseTax 2_000_000_000 5_000_000_000 = 3_000_000 := by decide
example : absorptionMergerIncreaseTax 7_000_000_000 5_000_000_000 = 7_500_000 + 14_000_000 := by decide

end JapanTaxLaw
