import JapanTaxLaw.LocalPrivilege

/-!
# LocalPrivilege specification — independent restatement of 地方税法（昭和二十五年法律第二百二十六号）
                       Act art. 7 （受益に因る不均一課税及び一部課税）

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000226
Revision: 325AC0000000226_20261101_508AC0000000002
Amendment enforcement date: 2026-11-01 (CurrentEnforced)

Act art. 7, verbatim from the pinned text:
  第七条 地方団体は、その一部に対して特に利益がある事件に関しては、不均一の課税をし、又はその一部に課税をすることができる.

This module restates Act art. 7's two permissions independently of the implementation
in LocalPrivilege.lean. The spec fixes the two affirmative permissions:
  (i) 不均一の課税をすることができる（不均一課税）
  (ii) その一部に課税をすることができる（一部課税）

Axiom discipline: all theorems are proved by `cases`/`simp`/`rcases` over
Verdict constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace LocalPrivilegeSpec

/-- Sufficient sources of an affirmative Act art. 7 outcome. -/
inductive LocalPrivilegeJudgment : LocalPrivilegeFacts → Prop where
  | unevenOnly (f : LocalPrivilegeFacts)
      (hI : f.isLocalEntity = Verdict.yes)
      (hP : f.specialBenefitApplies = Verdict.yes) : LocalPrivilegeJudgment f
  | partOnly (f : LocalPrivilegeFacts)
      (hI : f.isLocalEntity = Verdict.yes)
      (hP : f.specialBenefitApplies = Verdict.yes) : LocalPrivilegeJudgment f

end LocalPrivilegeSpec

open LocalPrivilegeSpec

/-- Spec → impl: an affirmatively established judgment yields both permissions. -/
theorem spec_local_privilege_sound (f : LocalPrivilegeFacts)
    (h : LocalPrivilegeJudgment f) :
    mayLevyUnevenForBenefit f = Verdict.yes ∧ mayLevyOnPartOnlyForBenefit f = Verdict.yes := by
  cases h with
  | unevenOnly hI hP => exact local_entity_benefit_sufficient f hI hP
  | partOnly hI hP   => exact local_entity_benefit_sufficient f hI hP

/-- Impl → spec: any affirmative outcome is witnessed by the judgment. -/
theorem spec_local_privilege_complete_mayLevyUneven (f : LocalPrivilegeFacts)
    (h : mayLevyUnevenForBenefit f = Verdict.yes) : LocalPrivilegeJudgment f := by
  cases hI : f.isLocalEntity <;> cases hP : f.specialBenefitApplies <;>
    simp [mayLevyUnevenForBenefit, hI, hP, Verdict.and] at h
  exact LocalPrivilegeJudgment.unevenOnly f hI hP

theorem spec_local_privilege_complete_mayLevyOnPart (f : LocalPrivilegeFacts)
    (h : mayLevyOnPartOnlyForBenefit f = Verdict.yes) : LocalPrivilegeJudgment f := by
  cases hI : f.isLocalEntity <;> cases hP : f.specialBenefitApplies <;>
    simp [mayLevyOnPartOnlyForBenefit, hI, hP, Verdict.and] at h
  exact LocalPrivilegeJudgment.partOnly f hI hP

end JapanTaxLaw
