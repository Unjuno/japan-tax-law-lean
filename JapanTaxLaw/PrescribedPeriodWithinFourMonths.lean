import JapanTaxLaw.TaxFinance

/-
# PrescribedPeriodWithinFourMonths — 不当廉売関税等に関する政令 第十七条(1)（四月以内の期間）

Pinned source:
  Law id: 406CO0000000416
  Official title: 不当廉売関税等に関する政令 (Cabinet Order on Anti-Dumping Duties, etc.)
  Law type: CabinetOrder (政令)
  Revision: 406CO0000000416_20260401_508CO0000000085
  Raw snapshot: data/raw/406CO0000000416_20260401_508CO0000000085.law.json
  sha256: d974e780d80a9ce51dec77692539d954417b8382bed7af33a0ba949066e21425
  Statutory article: 第十七条 (art. 17), 第一項 (1)
  Source path: LawBody[2]/MainProvision/MainProvision[23]/Article:17/Article#17/
               Paragraph#1/ParagraphSentence/Sentence#1
  Normative unit id: NORM|037bb6e3fe28f9a5a0fe2cccca2f02f31361d9cab5042c7b8502186955db1cdb

原文逐語（pinned, 一字一句改変なし, DELEGATION, verbatim-unique in whole law）:
  「法第八条第九項に規定する政令で定める期間は、四月以内の期間とする。」

Variable contract:
  `periodMonthCap : Nat := 4` = 四月 (inclusive upper bound: 以内).
  `withinPrescribedPeriod (months : Nat) : Bool := decide (months <= periodMonthCap)`.
  Unit 月 (months); domain Nat (whole months).

Scope: ONLY the explicit numeric period ceiling of the main sentence is
modelled — the upper bound at which the period ordinarily ceases to qualify.
Paragraph 1 also has a proviso extending the period (六月以内／九月以内 in
prescribed cases); that proviso is a separate EXCEPTION unit and is NOT MODELLED
here, so `withinPrescribedPeriod` is not an unconditional period rule. The
underlying 法第八条第九項 matter, what the period measures, other articles and
enforcement rules are NOT MODELLED (caller-established).

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PrescribedPeriodWithinFourMonths

/-- 四月 — inclusive upper bound (以内). Unit 月; domain Nat. -/
def periodMonthCap : Nat := 4

/-- 「四月以内の期間」: the period is at most four months. -/
def withinPrescribedPeriod (months : Nat) : Bool :=
  decide (months <= periodMonthCap)

/-- 以内 is inclusive: exactly four months qualifies. -/
theorem cap_inclusive : withinPrescribedPeriod 4 = true := by
  unfold withinPrescribedPeriod periodMonthCap
  decide

/-- Five months exceeds the ceiling. -/
theorem five_false : withinPrescribedPeriod 5 = false := by
  unfold withinPrescribedPeriod periodMonthCap
  decide

/-- Three months qualifies. -/
theorem three_true : withinPrescribedPeriod 3 = true := by
  unfold withinPrescribedPeriod periodMonthCap
  decide

end JapanTaxLaw.PrescribedPeriodWithinFourMonths
