import JapanTaxLaw.TaxFinance

/-
# TrainingPeriodOneYear — 地価税法施行規則 第三条(6)(1)（修業期間が一年以上であること）

Pinned source:
  Law id: 403M50000040031
  Official title: 地価税法施行規則 (Land Value Tax Act Enforcement Ordinance / 省令)
  Law type: MinisterialOrdinance (省令)
  Revision: 403M50000040031_20260401_508M60000040010
  Raw snapshot: data/raw/403M50000040031_20260401_508M60000040010.law.json
  sha256: 05474a3f79500c643a169b991d9a1cefe7d03dea229849424d511a9f3db13816
  Statutory article: 第三条 (art. 3), 第六項 (6), 第一号 (1)
  Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:3/Article#3/
               Paragraph#6/Item#1/ItemSentence/Sentence#1
  Normative unit id: NORM|f419b346978e27bf42b959afb590a4b25283346677b360f6c0c6e56d429b8c8f

原文逐語（pinned, 一字一句改変なし, CONDITION, verbatim-unique in whole law）:
  「修業期間が一年以上であること。」

Variable contract:
  `trainingFloorYears : Nat := 1` = 一年 (inclusive lower bound: 以上).
  `meetsTrainingPeriod (years : Nat) : Bool := decide (trainingFloorYears <= years)`.
  Unit 年 (whole years); domain Nat. 「以上」 = inclusive `>=`.

Scope: ONLY this explicit numeric training-period condition is modelled —
item 1 of paragraph 6, one of SIX conjunctive requirements in that paragraph.
This predicate alone must NOT be used as the whole paragraph-6 test; the other
five items are caller-established and NOT MODELLED. The qualification it belongs
to and the definition of 修業 are likewise NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TrainingPeriodOneYear

/-- 一年 — inclusive lower bound (以上). Unit 年; domain Nat. -/
def trainingFloorYears : Nat := 1

/-- 「修業期間が一年以上」: years >= 1. -/
def meetsTrainingPeriod (years : Nat) : Bool :=
  decide (trainingFloorYears <= years)

/-- 以上 is inclusive: exactly one year qualifies. -/
theorem floor_inclusive : meetsTrainingPeriod 1 = true := by
  unfold meetsTrainingPeriod trainingFloorYears
  decide

/-- Zero years does not satisfy the condition. -/
theorem zero_false : meetsTrainingPeriod 0 = false := by
  unfold meetsTrainingPeriod trainingFloorYears
  decide

/-- Two years also qualifies. -/
theorem two_true : meetsTrainingPeriod 2 = true := by
  unfold meetsTrainingPeriod trainingFloorYears
  decide

end JapanTaxLaw.TrainingPeriodOneYear
