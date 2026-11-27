import JapanTaxLaw.CustomsTariffArt16DelegatedExemption

/-!
# CustomsTariffArt16DelegatedExemptionSpec — independent spec

Law id: 143AC0000000054 (関税定率法), revision from INVENTORY.
Art.16(1) DELEGATION 「左の各号に掲げる貨物で輸入されるものについては、政令で定めるところにより、その関税を免除する。」.
Normative unit: NORM|6868ae3dc5dbd0c5012476e69b40a267ebccf7ed6abc90c7a3a695b3cec23df8

The implementation uses inductive values; the spec states both selections as
Prop equalities, representationally distinct. Axiom-free by rfl/cases.

Not modelled: listed goods, Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt16DelegatedExemption

/-- Independent spec of the delegation target. -/
def SpecTarget (d : DelegationTarget) : Prop :=
  d = DelegationTarget.cabinetOrder

/-- Independent spec of the duty effect. -/
def SpecEffect (e : DutyEffect) : Prop :=
  e = DutyEffect.exemption

/-- The target implementation satisfies the spec. -/
theorem target_satisfies_spec : SpecTarget delegationTarget := rfl

/-- The effect implementation satisfies the spec. -/
theorem effect_satisfies_spec : SpecEffect dutyEffect := rfl

/-- Statute does not satisfy the target spec. -/
theorem statute_not_satisfying : ¬ SpecTarget DelegationTarget.statute := by
  intro h
  cases h

/-- Reduction does not satisfy the effect spec. -/
theorem reduction_not_satisfying : ¬ SpecEffect DutyEffect.reduction := by
  intro h
  cases h

end JapanTaxLaw.CustomsTariffArt16DelegatedExemption
