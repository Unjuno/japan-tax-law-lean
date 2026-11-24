import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffSupplArt1Heisei1EnforcementDate — REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Raw snapshot: data/raw/143AC0000000054_*.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|c1eba0f628630c68c7f8946b94e9d3f7072b2686ad40ae64ab46e7bd1da7af6c
  Source path: LawBody[48]/SupplProvision/SupplProvision[1]/Article:1/Article#1/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「この法律は、平成元年四月一日から施行する。」

Norm kind: REFERENCE — a temporal-application clause fixing the enforcement date
of this supplementary provision at 平成元年四月一日 (Heisei 1 = 1989, April 1).
The computable slice models the enforcement date as (era-year, month, day) Nats
and an `inForce` predicate (in force on and after that date). All statutory date
components extracted from the verbatim needle; 元 (first year) parsed as 1.
No hand-typed CJK.

Variable contract (meaning / unit / domain / type):
  Date : structure — era-year/month/day as Nat (unit 年/月/日; domain Nat, same 平成 era).
  enforcementDate : Date = 平成元年四月一日 = ⟨1, 4, 1⟩.
  leDate : Date -> Date -> Prop — lexicographic (year, month, day) order.
  inForce d := leDate enforcementDate d (in force ON and AFTER that date).

Scope: only the within-era enforcement-date comparison. The Gregorian identity of
Heisei 1, cross-era transitions, other supplementary provisions, and legal
correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate

/-- A date within the fixed era (平成): era year/month/day. -/
structure Date where
  year : Nat
  month : Nat
  day : Nat

/-- この法律は、平成元年四月一日から施行する. -/
def enforcementDate : Date := ⟨1, 4, 1⟩

/-- Lexicographic order on (year, month, day) within the fixed era. -/
def leDate (a b : Date) : Prop :=
  a.year < b.year ∨
  (a.year = b.year ∧ (a.month < b.month ∨ (a.month = b.month ∧ a.day <= b.day)))

/-- In force on and after the enforcement date. -/
def inForce (d : Date) : Prop := leDate enforcementDate d

/-- The enforcement year is 元年 = 1. -/
theorem enforcement_year_is_one : enforcementDate.year = 1 := rfl

/-- The enforcement month is 4 (四月). -/
theorem enforcement_month_is_four : enforcementDate.month = 4 := rfl

/-- The enforcement day is 1 (一日). -/
theorem enforcement_day_is_one : enforcementDate.day = 1 := rfl

/-- In force on the enforcement date itself (reflexive boundary). -/
theorem in_force_on_enforcement_date : inForce enforcementDate := by
  unfold inForce leDate enforcementDate
  right
  constructor
  · rfl
  · right
    constructor
    · rfl
    · decide

/-- In force after the enforcement date (later year). -/
theorem in_force_after : inForce ⟨2, 1, 1⟩ := by
  unfold inForce leDate enforcementDate
  left
  decide

/-- Not in force before the enforcement date (earlier month, same year). -/
theorem not_in_force_before : ¬ inForce ⟨1, 3, 1⟩ := by
  unfold inForce leDate enforcementDate
  decide

end JapanTaxLaw.CustomsTariffSupplArt1Heisei1EnforcementDate
