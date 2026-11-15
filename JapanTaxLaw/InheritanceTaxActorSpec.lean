import JapanTaxLaw.InheritanceTaxActor

/-!
# InheritanceTaxActor specification — independent restatement of 相続税法（昭和二十五年法律第七十三号）
                       Act art. 1の3 (clause (一) first block)

Source (pinned):
https://laws.e-gov.go.jp/law/325AC0000000073
Revision: 325AC0000000073_20260401_506AC0000000008
Amendment enforcement date: 2026-04-01 (CurrentEnforced)

Act art. 1の3 (relevant portion), verbatim from the pinned text:
  次の各号のいずれかに掲げる者は、この法律により、相続税を納める義務がある。
  一相続又は遺贈（贈与をした老人の死亡により効力を生ずる贈与を含む。以下同じ。）
  により財産を取得した次に掲げる者であつて、当該財産を取得した時においてこの法律の施行地
  に住所を有するもの イ一時居住者でない個人 …

This module restates the actor-scope rule independently of the implementation in
InheritanceTaxActor.lean. The spec fixes the sufficient conditions for an
affirmative tax obligation judgment in this slice:
  個人 ∧ 施行地に住所 ∧ 一時居住者でない ∧ 相続又は遺贈により財産を取得した
(Clause (一) 外国人被相続人/非居住被相続人特例は spec の範囲外。)

Axiom discipline: all theorems are proved by `cases`/`simp`/`rcases` over
Verdict constructors. No `sorry`, `admit`, or unverified axioms.
-/

namespace JapanTaxLaw

namespace InheritanceTaxActorSpec

/-- Sufficient sources of an affirmative judgment in Act art. 1の3 clause (一)
    first-block (compliant resident who acquired by inheritance or bequest). -/
inductive InheritanceActAcquisitionJudgment : InheritanceTaxActorFacts → Prop where
  | residentInheritance (f : InheritanceTaxActorFacts)
      (hI : f.isIndividual = Verdict.yes)
      (hRes : f.isResidentInJapanAtAcquisition = Verdict.yes)
      (hTemp : f.isNotTemporaryResident = Verdict.yes)
      (hAcq : f.acquiredThroughInheritanceOrBequest = Verdict.yes) :
      InheritanceActAcquisitionJudgment f

end InheritanceTaxActorSpec

open InheritanceTaxActorSpec

/-- Spec → impl: an affirmative judgment is an obligation. -/
theorem spec_inheritance_act_acquisition_sound (f : InheritanceTaxActorFacts)
    (h : InheritanceActAcquisitionJudgment f) : owesInheritanceTaxVerdict f = Verdict.yes := by
  cases h with
  | residentInheritance hI hRes hTemp hAcq =>
      exact inheritance_plus_bequest_with_resident_implies_owes f hI hRes hTemp hAcq

/-- Impl → spec: every affirmative output is witnessed by a compliant resident judgment. -/
theorem spec_inheritance_act_acquisition_complete (f : InheritanceTaxActorFacts)
    (h : owesInheritanceTaxVerdict f = Verdict.yes) : InheritanceActAcquisitionJudgment f := by
  unfold owesInheritanceTaxVerdict at h
  cases hI : f.isIndividual <;> cases hRes : f.isResidentInJapanAtAcquisition <;>
    cases hTemp : f.isNotTemporaryResident <;> cases hAcq : f.acquiredThroughInheritanceOrBequest <;>
    simp [isResidentCompliantIndividual, isAcquirerOfInheritorProp, hI, hRes, hTemp, hAcq, Verdict.and] at h
  exact InheritanceActAcquisitionJudgment.residentInheritance _ hI hRes hTemp hAcq

/-- Facts extraction iff lemma used by the spec complete direction. -/
theorem isResidentCompliantIndividual_eq_and (f : InheritanceTaxActorFacts) :
    isResidentCompliantIndividual f = Verdict.and f.isIndividual
      (Verdict.and f.isResidentInJapanAtAcquisition f.isNotTemporaryResident) := by
  unfold isResidentCompliantIndividual at *; rfl

end JapanTaxLaw
