import JapanTaxLaw.TaxFinance

/-
# ConsumptionTaxReformEnforcementDateReiwa2 — 消費税抜本改革法 附則第一条（令和二年四月一日施行）

Pinned source:
  Law id: 424AC0000000068
  Official title: 社会保障の安定財源の確保等を図る税制の抜本的な改革を行うための消費税法の一部を改正する等の法律
  Law type: Act (法律)
  Revision: 424AC0000000068_20250401_506AC0000000046
  Raw snapshot: data/raw/424AC0000000068_20250401_506AC0000000046.law.json
  sha256: 86ab35fb645863e452014e3d70e0f8a6e00f3c7d0a48569c520499c06dadca64
  Statutory article: 附則 第一条 (Supplementary Provision art. 1), 第一項 (1)
  Source path: LawBody[10]/SupplProvision/SupplProvision[1]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|72bedb96918f8630e1e4d2cf714e85d493634f87c4d6f26078b56bc4eeeae491

原文逐語（pinned, 一字一句改変なし, REFERENCE, verbatim-unique in whole law）:
  「この法律は、令和二年四月一日から施行する。」

Variable contract:
  `eraYear`, `month`, `day : Nat` are the Japanese-era year, calendar month and
  calendar day components of a date. The pinned enforcement date is
  (令和二, 四, 一) = (2, 4, 1). Unit: era-year / month / day; domain Nat.
  `isEnforcementDate y m d : Bool` is true exactly at that triple.

Scope: ONLY the fixed enforcement date stated in this supplementary provision
is modelled. Calendar conversion to the Gregorian era, other supplementary
articles and enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2

/-- 令和二年 — the era-year component. -/
def enforcementEraYear : Nat := 2

/-- 四月 — the month component. -/
def enforcementMonth : Nat := 4

/-- 一日 — the day component. -/
def enforcementDay : Nat := 1

/-- 「令和八年四月一日から施行する」: the date triple. -/
def isEnforcementDate (y m d : Nat) : Bool :=
  decide (y == enforcementEraYear && m == enforcementMonth && d == enforcementDay)

theorem at_date_true : isEnforcementDate 2 4 1 = true := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  decide

theorem wrong_year_false : isEnforcementDate 1 4 1 = false := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  decide

theorem wrong_day_false : isEnforcementDate 2 4 2 = false := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  decide

end JapanTaxLaw.ConsumptionTaxReformEnforcementDateReiwa2
