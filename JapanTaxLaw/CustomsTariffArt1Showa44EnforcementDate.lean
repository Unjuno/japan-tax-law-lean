import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt1Showa44EnforcementDate — 関税定率法 附則第一条（施行期日）REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|f5b0c58ff722cf183a1f093f7781bb702342f46bb63ff38fa4ec48985ec483ec
  Source path: LawBody[21]/SupplProvision/SupplProvision[1]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （施行期日）

原文逐語（pinned, 一字一句改変なし）:
  「この法律は、昭和四十四年四月一日から施行する。」

Norm kind: REFERENCE — a temporal-application (時間的適用) clause fixing a
supplementary-provision enforcement date of this Act. The computable slice models
the enforcement date (era 昭和, era-year 44, month 4, day 1 —
all extracted structurally from the needle's kanji numerals) and a predicate
`inForce` determining whether the Act is in force on a given date within 昭和.
All statutory strings injected from the queue/raw; no hand-typed statutory text.

Variable contract (meaning / unit / domain / type):
  Date : structure — era year/month/day as Nat (unit 年/月/日; domain Nat).
  enforcementDate : Date = 昭和 44年4月1日.
  leDate : Date -> Date -> Prop — lexicographic (year, month, day) order.
  inForce d := leDate enforcementDate d (in force ON and AFTER that date).
  Cross-era comparison is NOT MODELLED (the statute fixes one era, 昭和).

Scope: only enforcement-date comparison within 昭和. Gregorian identification of
昭和 year 1, cross-era transitions, other supplementary provisions, and legal
correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate

open JapanTaxLaw.TaxFinance

/-- A date within the fixed era (昭和): era year/month/day. -/
structure Date where
  year : Nat
  month : Nat
  day : Nat

/-- 施行期日: 昭和 44年4月1日 (derived from needle). -/
def enforcementDate : Date := ⟨44, 4, 1⟩

/-- Lexicographic order on (year, month, day) within the fixed era. -/
def leDate (a b : Date) : Prop :=
  a.year < b.year ∨
  (a.year = b.year ∧ (a.month < b.month ∨ (a.month = b.month ∧ a.day <= b.day)))

/-- この法律は、当該日から施行する: in force on and after enforcementDate. -/
def inForce (d : Date) : Prop := leDate enforcementDate d

/-- The enforcement date is 昭和 44年4月1日. -/
theorem enforcement_date_components : enforcementDate = ⟨44, 4, 1⟩ := rfl

end JapanTaxLaw.CustomsTariffArt1Showa44EnforcementDate
