import JapanTaxLaw.TaxFinance

/-
# UsForcesTreatyEnforcementDateReiwa8 — 米軍地位協定国税臨時特例法 附則第一条（令和八年四月一日施行）

Pinned source:
  Law id: 327AC0000000113
  Official title: 日本国とアメリカ合衆国との間の相互協力及び安全保障条約第六条に基づく施設及び区域並びに日本国における合衆国軍隊の地位に関する協定の実施に伴う国税通則法等の臨時特例に関する法律
  Law type: Act (法律)
  Revision: 327AC0000000113_20260401_508AC0000000012
  Raw snapshot: data/raw/327AC0000000113_20260401_508AC0000000012.law.json
  sha256: bb30245b6c74180d4f0f4b4187dc07d41893717bed1506bf82cb545adac8434a
  Statutory article: 附則 第一条 (Supplementary Provision art. 1), 第一項 (1)
  Source path: LawBody[10]/SupplProvision/SupplProvision[1]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|b5137b6e0cf7a11197d82dd9d52fe925860b459cc31e1a7119ffd4cbf270c61b

原文逐語（pinned, 一字一句改変なし, REFERENCE, verbatim-unique in whole law）:
  「この法律は、令和八年四月一日から施行する。」

Variable contract:
  `eraYear`, `month`, `day : Nat` are the Japanese-era year, calendar month and
  calendar day components of a date. The pinned enforcement date is
  (令和八, 四, 一) = (8, 4, 1). Unit: era-year / month / day; domain Nat.
  `isEnforcementDate y m d : Bool` is true exactly at that triple.

Scope: ONLY the fixed enforcement date stated in this supplementary provision
is modelled. Calendar conversion to the Gregorian era, other supplementary
articles and enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8

/-- 令和八年 — the era-year component. -/
def enforcementEraYear : Nat := 8

/-- 四月 — the month component. -/
def enforcementMonth : Nat := 4

/-- 一日 — the day component. -/
def enforcementDay : Nat := 1

/-- 「令和八年四月一日から施行する」: the date triple. -/
def isEnforcementDate (y m d : Nat) : Bool :=
  decide (y == enforcementEraYear && m == enforcementMonth && d == enforcementDay)

theorem at_date_true : isEnforcementDate 8 4 1 = true := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  decide

theorem wrong_year_false : isEnforcementDate 7 4 1 = false := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  decide

theorem wrong_day_false : isEnforcementDate 8 4 2 = false := by
  unfold isEnforcementDate enforcementEraYear enforcementMonth enforcementDay
  decide

end JapanTaxLaw.UsForcesTreatyEnforcementDateReiwa8
