import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt1EnforcementDate — 関税定率法 附則第一条（施行期日）REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|21111ed8a33c42e815231a5c0a00eff4d3929eb2c478b1b8de466f6f41097bcc
  Source path: LawBody[19]/SupplProvision/SupplProvision[1]/Article:1/Article#1/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （施行期日）

原文逐語（pinned, 一字一句改変なし）:
  「この法律は、昭和四十二年六月一日から施行する。」

Norm kind: REFERENCE — a temporal-application (時間的適用) clause fixing the
enforcement date of this Act. The computable slice models the enforcement date
(era 昭和, era-year 42, month 6, day 1 — all extracted
structurally from the needle) and a predicate `inForce` that determines whether
the Act is in force on a given date within the same era. All statutory date
components extracted from the verbatim needle — no hand-typed statutory strings.

Variable contract (meaning / unit / domain / type):
  Date : structure — era year/month/day as Nat (unit: 年/月/日; domain Nat).
  enforcementDate : Date = 昭和 四十二年六月一日.
  leDate : Date -> Date -> Prop — lexicographic (year, month, day) order.
  inForce d := leDate enforcementDate d (in force ON and AFTER that date).
  Era comparison across different eras is NOT MODELLED (the statute fixes one
  era, 昭和); cross-era ordering would require an explicit era-rank table.

Scope: only the enforcement-date comparison within 昭和. The identification
of 昭和 year 1 in the Gregorian calendar, cross-era transitions, other
supplementary provisions, and legal correctness are NOT MODELLED. Human legal
review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt1EnforcementDate

open JapanTaxLaw.TaxFinance

/-- A date within the fixed era (昭和): era year/month/day. -/
structure Date where
  year : Nat
  month : Nat
  day : Nat

/-- 施行期日: 昭和 四十二年六月一日 (derived from needle). -/
def enforcementDate : Date := ⟨42, 6, 1⟩

/-- Lexicographic order on (year, month, day) within the fixed era. -/
def leDate (a b : Date) : Prop :=
  a.year < b.year ∨
  (a.year = b.year ∧ (a.month < b.month ∨ (a.month = b.month ∧ a.day <= b.day)))

/-- この法律は、当該日から施行する: in force on and after enforcementDate. -/
def inForce (d : Date) : Prop := leDate enforcementDate d

end JapanTaxLaw.CustomsTariffArt1EnforcementDate
