import JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate

/-!
# DisasterReliefSupplArt1DelegatedEnforcementDateSpec — independent spec

Law id: 322AC0000000175 (災害被害者租税減免法), revision from INVENTORY.
Art.1(1) supplementary DELEGATION 「この法律は、公布の日から起算して一年を超えない範囲内において政令で定める日から施行する。」.
Normative unit: NORM|ad36635987ca63b79c1be8d9f004dd6314ab9fd2925d6c43aa6de45e2c3169fb

The implementation uses inductive values and a direct <= inequality; the spec
states the target as a Prop equality and the cap as absence of the strict
reverse inequality, representationally distinct. Agreements are proved in the
kernel with Nat-specific core lemmas and exhaustive cases. Axiom-free; no
decide/simp/propext/omega.

Not modelled: actual dates, Cabinet Order content, legal correctness.
-/

namespace JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate

/-- Independent spec of the delegation target. -/
def SpecTarget (d : DelegationTarget) : Prop :=
  d = DelegationTarget.cabinetOrder

/-- Independent spec of the delay cap. -/
def SpecWithinCap (delayYears : Nat) : Prop :=
  ¬ maxDelayYears < delayYears

/-- The target implementation and spec agree. -/
theorem target_satisfies_spec : SpecTarget delegationTarget := rfl

/-- Statute does not satisfy the target spec. -/
theorem statute_not_satisfying : ¬ SpecTarget DelegationTarget.statute := by
  intro h
  cases h

/-- The cap implementation and spec agree. -/
theorem cap_spec_agreement (n : Nat) : withinCap n ↔ SpecWithinCap n := by
  constructor
  · intro h
    exact Nat.not_lt_of_ge h
  · intro h
    exact Nat.le_of_not_gt h

end JapanTaxLaw.DisasterReliefSupplArt1DelegatedEnforcementDate
