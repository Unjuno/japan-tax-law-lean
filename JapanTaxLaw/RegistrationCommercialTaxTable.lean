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
