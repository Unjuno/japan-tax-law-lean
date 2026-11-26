import JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation

/-!
# CustomsTariffArt9_2AllocationDelegationSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.9の2(2) DELEGATION 「前項の割当ての方法、割当てを受ける手続その他同項の規定の適用に関して必要な事項は、政令で定める。」.
Normative unit: NORM|394bf11a8e17fa0cc29bcf58c0b9cfbc097d3c85ea48474966bcde22e685466e

The implementation is an inductive value; the spec states the target as a Prop
equality, representationally distinct. Axiom-free by rfl/cases.

Not modelled: delegated Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation

/-- Independent spec: the delegation target is Cabinet Order. -/
def SpecDelegationTarget (d : DelegationTarget) : Prop :=
  d = DelegationTarget.cabinetOrder

/-- The implementation satisfies the spec. -/
theorem implementation_satisfies_spec : SpecDelegationTarget delegationTarget := rfl

/-- Statute does not satisfy the spec. -/
theorem statute_not_satisfying : ¬ SpecDelegationTarget DelegationTarget.statute := by
  intro h
  cases h

/-- An unspecified target does not satisfy the spec. -/
theorem other_not_satisfying : ¬ SpecDelegationTarget DelegationTarget.other := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt9_2AllocationDelegation
