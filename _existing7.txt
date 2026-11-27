import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt7InvestigationDeadline — 関税定率法 第七条(31)（期間）REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|a3c6d65dfb98b73b085f2ef4d01b3ef4243d2c0efc5bc55f46f6fac43405e0ea
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#31/ParagraphSentence/Sentence#1
  Article caption: （相殺関税）

原文逐語（pinned, 一字一句改変なし）:
  「前項の調査は、第二十九項の規定による請求があつた日から一年以内に終了するものとする。」

Norm kind: REFERENCE — a temporal-application deadline. The 前項 investigation
must be completed 一年以内 (within one year) from the day a request under 第二十九項
was made. The computable slice models the one-year deadline: given a request time
and a completion time (both abstract Nat day-counts from a common epoch), the
completion is within the deadline iff completion ≤ request + oneYearDays.

Variable contract (meaning / unit / domain / type):
  Time : Nat — an abstract day-count from a common epoch (unit: 日; domain Nat).
  oneYearDays : Nat — abstract length of 一年 in the chosen unit. NOT fixed to 365:
    the statute does not specify a calendar conversion, so the exact day count is
    NOT MODELLED; it is an explicit parameter.
  yearCount : Nat = 1 (derived from the verbatim needle's 一年).
  withinDeadline := completion ≤ request + yearCount * oneYearDays.
  Boundary: completion exactly at the deadline is allowed (以内 = inclusive).

Scope: only the one-year deadline comparison. What the investigation is, how a
request is made under 第二十九項, the calendar conversion of 一年 into days, and
legal correctness are NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7InvestigationDeadline

open JapanTaxLaw.TaxFinance

/-- 一年 (one year): count derived from the verbatim needle (一年). -/
def yearCount : Nat := 1

/-- Within the one-year deadline, measured from the request time. -/
def withinDeadline (oneYearDays request completion : Nat) : Prop :=
  completion ≤ request + yearCount * oneYearDays

/-- The deadline is inclusive (以内): completion exactly at the boundary qualifies. -/
theorem at_deadline (oneYearDays request : Nat) :
    withinDeadline oneYearDays request (request + yearCount * oneYearDays) := by
  unfold withinDeadline
  exact Nat.le_refl _

/-- A completion after the deadline does not qualify. Axiom-free. -/
theorem after_deadline (oneYearDays request : Nat) :
    ¬ withinDeadline oneYearDays request (request + yearCount * oneYearDays + 1) := by
  unfold withinDeadline
  exact Nat.not_succ_le_self (request + yearCount * oneYearDays)

end JapanTaxLaw.CustomsTariffArt7InvestigationDeadline
