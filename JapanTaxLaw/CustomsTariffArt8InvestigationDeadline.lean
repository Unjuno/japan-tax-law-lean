import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt8InvestigationDeadline — 関税定率法 第八条(34)（期間）REFERENCE

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|8e7f2e7760ab18115472d1df642a2e1050aed907df6e99450a2bfef59a875a11
  Source path: LawBody[1]/MainProvision/MainProvision[17]/Article:8/Article#8/
               Paragraph#34/ParagraphSentence/Sentence#1
  Article caption: （不当廉売関税）

原文逐語（pinned, 一字一句改変なし）:
  「前項の調査は、第三十二項の規定による請求があつた日から一年以内に終了するものとする。」

Norm kind: REFERENCE — a temporal-application deadline. The 前項 investigation must
be completed 一年以内 (within one year) from the date of a request under 第三十二項.
The computable slice models the one-year deadline comparison. The year count 1
is derived structurally from the verbatim 一年. The exact calendar-day count of 一年
is NOT MODELLED (abstract oneYearDays parameter).

Variable contract (meaning / unit / domain / type):
  Time : Nat — abstract day count from a common epoch (unit: 日; domain Nat).
  oneYearDays : Nat — number of days in one year (caller-established; NOT fixed).
  request : Nat — the request date under 第三十二項 (unit: 日).
  completion : Nat — the investigation completion date (unit: 日).
  yearCount : Nat = 1 (derived from verbatim 一年).
  withinDeadline o r c := c ≤ r + yearCount * o (以内 inclusive).

Scope: only the one-year deadline comparison. The investigation substance, the
第三十二項 request mechanism, and the calendar conversion of 一年 into days are
NOT MODELLED. Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt8InvestigationDeadline

open JapanTaxLaw.TaxFinance

/-- 一 year (derived from the verbatim needle's 一年). -/
def yearCount : Nat := 1

/-- 「一年以内」: completion is within the deadline (inclusive). -/
def withinDeadline (oneYearDays request completion : Nat) : Prop :=
  completion ≤ request + yearCount * oneYearDays

/-- Completion exactly at the deadline qualifies (以内 inclusive). -/
theorem at_deadline (oneYearDays request : Nat) :
    withinDeadline oneYearDays request (request + yearCount * oneYearDays) := by
  unfold withinDeadline
  exact Nat.le_refl _

/-- Completion after the deadline does not qualify (axiom-free). -/
theorem after_deadline (oneYearDays request : Nat) :
    ¬ withinDeadline oneYearDays request (request + yearCount * oneYearDays + 1) := by
  unfold withinDeadline
  exact Nat.not_succ_le_self _

end JapanTaxLaw.CustomsTariffArt8InvestigationDeadline
