import JapanTaxLaw.LocalTaxArt154Capacity30Condition

/-!
# LocalTaxArt154Capacity30ConditionSpec — independent spec

Law id: 325AC0000000226 (地方税法), revision from INVENTORY.
Art.154(1) table cell CONDITION 「（１）　乗車定員が三十人以下のもの」.
Normative unit: NORM|aada7e0359814b0a7a3a59ef923563944d9083c679e564d3bab228d790ecbabd

The implementation states the cap as a direct <= inequality; the spec states it
as the absence of the strict reverse inequality, representationally distinct.
Equivalence is proved in the kernel using Nat-specific core lemmas. Axiom-free;
no decide/simp/propext/omega.

Not modelled: surrounding table structure, legal correctness.
-/

namespace JapanTaxLaw.LocalTaxArt154Capacity30Condition

/-- Independent spec: the limit is not less than the capacity. -/
def SpecWithinLimit (capacity : Nat) : Prop :=
  ¬ capacityLimit < capacity

/-- The implementation condition and the independent spec agree. -/
theorem within_limit_spec_agreement (n : Nat) : withinLimit n ↔ SpecWithinLimit n := by
  constructor
  · intro h
    exact Nat.not_lt_of_ge h
  · intro h
    exact Nat.le_of_not_gt h

end JapanTaxLaw.LocalTaxArt154Capacity30Condition
