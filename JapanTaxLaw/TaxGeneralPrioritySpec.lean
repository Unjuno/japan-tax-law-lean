import JapanTaxLaw.TaxGeneralPriority

/-!
# TaxGeneralPriority spec — independent restatement of 国税通則法 Act art. 4

Source (pinned):
https://laws.e-gov.go.jp/law/337AC0000000066
Revision: 337AC0000000066_20261101_507AC0000000013
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 4, verbatim from the pinned text:
  他の国税に関する法律との関係 この法律に規定する事項と他の国税に関する法律に別段の定めが
  あるものは、その定めるところによる。

This module restates the rule independently of the implementation in
TaxGeneralPriority.lean. The specification fixes the two affirmative
outcomes and their triggers; unknown/conflict corners are exercised by the
test suite.

Axiom discipline: all theorems are proved by `cases`+`simp` over
Verdict constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace TaxGeneralPrioritySpec

/-- Sufficient sources of an affirmative Act art. 4 outcome. -/
inductive MatterPriorityJudgment : MatterPriorityFacts → PriorityOutcome → Prop where
  | otherLawGoverns (f : MatterPriorityFacts) (h : f.distinctElsewhere = Verdict.yes) :
      MatterPriorityJudgment f .applyOtherLaw
  | thisActGoverns (f : MatterPriorityFacts)
      (hD : f.distinctElsewhere = Verdict.no) (hC : f.coveredByThisAct = Verdict.yes) :
      MatterPriorityJudgment f .applyThisAct

end TaxGeneralPrioritySpec

open TaxGeneralPrioritySpec

/-- Witness: the impl resolves to `.applyOtherLaw` iff the other law has a distinct provision. -/
theorem apply_other_law_witness (f : MatterPriorityFacts) :
    resolveThisActPriority f = .applyOtherLaw ↔ f.distinctElsewhere = Verdict.yes := by
  cases hd : f.distinctElsewhere <;> cases hc : f.coveredByThisAct <;>
    simp [resolveThisActPriority, hd, hc]

/-- Witness: the impl resolves to `.applyThisAct` iff no other law provision AND this Act covers it. -/
theorem apply_this_act_witness (f : MatterPriorityFacts) :
    resolveThisActPriority f = .applyThisAct ↔
      (f.distinctElsewhere = Verdict.no ∧ f.coveredByThisAct = Verdict.yes) := by
  cases hd : f.distinctElsewhere <;> cases hc : f.coveredByThisAct <;>
    simp [resolveThisActPriority, hd, hc]

-- ==================== soundness and completeness ====================

/-- Specification → implementation. -/
theorem priority_spec_sound (f : MatterPriorityFacts) (o : PriorityOutcome)
    (h : MatterPriorityJudgment f o) : resolveThisActPriority f = o := by
  cases h with
  | otherLawGoverns hD => exact distinct_yes_other_applies f hD
  | thisActGoverns hD hC => exact distinct_no_covered_yes_this_applies f hD hC

/-- Implementation → specification: the applyOtherLaw outcome is witnessed. -/
theorem priority_spec_complete_applyOtherLaw (f : MatterPriorityFacts)
    (h : resolveThisActPriority f = .applyOtherLaw) : MatterPriorityJudgment f .applyOtherLaw :=
  MatterPriorityJudgment.otherLawGoverns f ((apply_other_law_witness f).mp h)

/-- Implementation → specification: the applyThisAct outcome is witnessed. -/
theorem priority_spec_complete_applyThisAct (f : MatterPriorityFacts)
    (h : resolveThisActPriority f = .applyThisAct) : MatterPriorityJudgment f .applyThisAct := by
  rcases (apply_this_act_witness f).mp h with ⟨hD, hC⟩
  exact MatterPriorityJudgment.thisActGoverns f hD hC

end JapanTaxLaw
