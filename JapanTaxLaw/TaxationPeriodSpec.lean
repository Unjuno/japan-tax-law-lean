import JapanTaxLaw.TaxationPeriod

/-!
# TaxationPeriod specification — independent restatement of 国税通則法（国税の通則に関する法律）
                        Act art. 2 item 9

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 2 item 9, verbatim from the pinned text:
  九課税期間 国税に関する法律の規定により国税の課税標準の計算の基礎となる期間
  （課税資産の譲渡等（消費税法（昭和六十三年法律第百八号）第二条第一項第九号（定義）
  に規定する課税資産の譲渡等をいい、同項第八号の二に規定する特定資産の譲渡等に
  該当するものを除く。）及び特定課税仕入れ（同法第五条第一項（納税義務者）に規定する
  特定課税仕入れをいう。）に課される消費税（以下「課税資産の譲渡等に係る消費税」と
  いう。）については、同法第十九条（課税期間）に規定する課税期間）をいう。

This module restates the period bifurcation independently of the implementation
in TaxationPeriod.lean. The spec fixes the two period kinds and the
item-9-specific applicability condition.

Axiom discipline: all theorems are proved by `cases`/`simp`/`rcases` over
Verdict constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace TaxationPeriodSpec

/-- Sufficient sources of an affirmative Act art. 2 item 9 outcome. -/
inductive TaxationPeriodJudgment : TaxationPeriodFacts → TaxationPeriodOutcome → Prop where
  | art19Period (f : TaxationPeriodFacts)
      (h : f.isConsumptionTaxQualifiedEvent = Verdict.yes) :
      TaxationPeriodJudgment f .consumptionTaxPeriodArt19
  | generalPeriod (f : TaxationPeriodFacts)
      (h : f.isConsumptionTaxQualifiedEvent = Verdict.no) :
      TaxationPeriodJudgment f .generalPeriodByTheTaxCostLaw

/-- Spec → impl. -/
theorem spec_sound (f : TaxationPeriodFacts) (o : TaxationPeriodOutcome)
    (h : TaxationPeriodJudgment f o) : resolveTaxationPeriod f = o := by
  cases h with
  | art19Period hh => exact consumption_qualified_art19 f hh
  | generalPeriod hh => exact not_consumption_qualified_general f hh

/-- Impl → spec: the art19 outcome is witnessed. -/
theorem spec_complete_art19 (f : TaxationPeriodFacts)
    (h : resolveTaxationPeriod f = .consumptionTaxPeriodArt19) : TaxationPeriodJudgment f .consumptionTaxPeriodArt19 := by
  exact TaxationPeriodJudgment.art19Period f (art19_implies_qualified f h)

/-- Impl → spec: the general outcome is witnessed. -/
theorem spec_complete_general (f : TaxationPeriodFacts)
    (h : resolveTaxationPeriod f = .generalPeriodByTheTaxCostLaw) : TaxationPeriodJudgment f .generalPeriodByTheTaxCostLaw := by
  exact TaxationPeriodJudgment.generalPeriod f (general_implies_not_qualified f h)

end TaxationPeriodSpec

end JapanTaxLaw
