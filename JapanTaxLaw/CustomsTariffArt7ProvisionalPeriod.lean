import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7ProvisionalPeriod — 関税定率法 第七条(3)（期間）REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|bc9ece29b2b61de2536a557c4d241b619e5f147f15451aad8242eaea7e175af5
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#3/Item#3/ItemSentence/Column#2/Sentence#1
  Article caption: （相殺関税）

原文逐語（pinned, 一字一句改変なし）:
  「暫定措置がとられた日の九十日前の日以後第一項の規定による指定がされた日の前日までの期間」

Norm kind: REFERENCE — a bounded date interval. It defines the period from
九十日前の日以後 (on or after the day 九十 days before the day the
provisional measure was taken) through 指定がされた日の前日まで (up to and including
the day before the designation under paragraph 1 was made). The computable slice
models this as an inclusive Nat interval [lo, hi] with lo = measure - 90 and
hi = designation - 1, both derived structurally from the verbatim needle.

Variable contract (meaning / unit / domain / type):
  Time : Nat — abstract day-count from a common epoch (unit: 日; domain Nat).
  offsetDays : Nat = 90 (derived from the verbatim needle's 九十日前).
  interval lo hi t := lo ≤ t ∧ t ≤ hi  (以後 and まで both inclusive).
  lo := measure - offsetDays (the 九十日前の日); hi := designation - 1 (前日).
  Underflow (measure < offsetDays, or designation = 0) is NOT MODELLED; callers
  must supply lo ≤ hi. No calendar arithmetic (months/leap years) is modelled.

Scope: only the interval-membership comparison. What the provisional measure and
the designation are, the 第一項 mechanism, and legal correctness are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod

open JapanTaxLaw.TaxFinance

/-- 九十 (offset days, derived from the verbatim needle). -/
def offsetDays : Nat := 90

/-- 九十日前の日: the day `offsetDays` before the measure date. -/
def lowerBound (measure : Nat) : Nat := measure - offsetDays

/-- 指定がされた日の前日: the day before the designation date. -/
def upperBound (designation : Nat) : Nat := designation - 1

/-- 「…の日以後…の前日までの期間」: inclusive interval [lo, hi]. -/
def inPeriod (lo hi t : Nat) : Prop := lo ≤ t ∧ t ≤ hi

/-- The measure-minus-offset day is inside the period (以後 inclusive). -/
theorem measure_day_in (measure designation : Nat) (h : lowerBound measure ≤ upperBound designation) :
    inPeriod (lowerBound measure) (upperBound designation) (lowerBound measure) := by
  exact ⟨Nat.le_refl _, h⟩

/-- The day before designation is inside the period (まで inclusive). -/
theorem designation_eve_in (measure designation : Nat) (h : lowerBound measure ≤ upperBound designation) :
    inPeriod (lowerBound measure) (upperBound designation) (upperBound designation) := by
  exact ⟨h, Nat.le_refl _⟩

end JapanTaxLaw.CustomsTariffArt7ProvisionalPeriod
