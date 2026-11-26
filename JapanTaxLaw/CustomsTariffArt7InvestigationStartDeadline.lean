import JapanTaxLaw.TaxFinance

/-
# CustomsTariffArt7InvestigationStartDeadline — 関税定率法 第七条(7)（期間）

Sources (pinned):

  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Revision: 143AC0000000054_20260601_508AC0000000005
  Enforcement date: 2026-06-01
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  SHA-256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Article caption: （相殺関税）
  Source path: LawBody[1]/MainProvision/MainProvision[16]/Article:7/Article#7/
               Paragraph#7/ParagraphSentence/Sentence#1
  Normative unit id: NORM|30ed71fa6118f5875097cd20a81a022db6c3de058f41c43787932def13cc9ec6
  Pinned needle (verbatim, no alteration):
    「前項の調査は、当該調査を開始した日から一年以内に終了するものとする。」

Scoped claim: an EFFECT norm — a TEMPORAL/DEADLINE rule. The investigation
referred to in the preceding paragraph must be completed 一年以内 (within one
year), measured from 当該調査を開始した日 (the day the investigation started).
This is a DIFFERENT unit from the art.7(31) deadline, which is measured from a
request under 第二十九項 (see CustomsTariffArt7InvestigationDeadline.lean);
both share the same one-year length but have different triggers and source
paragraphs.

Variable contract (meaning / unit / domain / type):
  oneYearDays : Nat — abstract length of 一年 in days. NOT fixed to 365: the
    statute does not specify a calendar conversion, so the exact day count is
    an explicit caller-established parameter (unit: 日; domain Nat).
  start : Nat — abstract day-count of 調査開始日 from a common epoch (unit: 日).
  completion : Nat — abstract day-count of 調査終了日 from the same epoch.
  yearCount : Nat = 1 — derived solely from the verbatim needle's 一年.
  withinDeadline := completion ≤ start + yearCount * oneYearDays.
  Boundary: 以内 is INCLUSIVE — completion exactly at the deadline qualifies.

Out of scope: what the investigation is, how it is started, the calendar
conversion of 一年 into days, the preceding paragraph's content, and legal
correctness — all caller-established or left pending. No `sorry`, `admit`,
`axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadline

/-- 一年 (one year): count derived from the verbatim needle (一年). -/
def yearCount : Nat := 1

/-- Within the one-year deadline, measured from the investigation start. -/
def withinDeadline (oneYearDays start completion : Nat) : Prop :=
  completion ≤ start + yearCount * oneYearDays

/-- 以内 is inclusive: completion exactly at the boundary qualifies. -/
theorem at_deadline (oneYearDays start : Nat) :
    withinDeadline oneYearDays start (start + yearCount * oneYearDays) := by
  unfold withinDeadline
  exact Nat.le_refl _

/-- Completion strictly before the deadline also qualifies. -/
theorem before_deadline (oneYearDays start offset : Nat) (h : offset ≤ oneYearDays) :
    withinDeadline oneYearDays start (start + offset) := by
  unfold withinDeadline yearCount
  rw [Nat.one_mul]
  exact Nat.add_le_add_left h start

/-- Completion one day past the deadline fails (kernel-decided). -/
theorem one_day_past_fails (oneYearDays start : Nat) :
    ¬ withinDeadline oneYearDays start (start + yearCount * oneYearDays + 1) := by
  unfold withinDeadline
  exact Nat.not_succ_le_self (start + yearCount * oneYearDays)

theorem yearCount_value : yearCount = 1 := rfl

end JapanTaxLaw.CustomsTariffArt7InvestigationStartDeadline
