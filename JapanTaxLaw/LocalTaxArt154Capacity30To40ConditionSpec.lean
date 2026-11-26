import JapanTaxLaw.LocalTaxArt154Capacity30To40Condition

/-!
# LocalTaxArt154Capacity30To40ConditionSpec — independent spec

Law id: 325AC0000000226 (地方税法), revision from INVENTORY.
Art.154(1) table-cell CONDITION 「（２）　乗車定員が三十人を超え、四十人以下のもの」.
Normative unit: NORM|aa32cf8b9a6339adb0c07216fe43e73857aaea91f64393d2c754d5883c44b9bb

The implementation states the interval as a conjunction of a strict lower and
a non-strict upper inequality; the spec states it as the absence of the two
complementary inequalities, representationally distinct. Equivalence is proved
in the kernel using Nat-specific core lemmas and concrete `decide` reductions;
`decide` on concrete Nat comparisons is axiom-free (verified by probe).
Axiom-free; no simp/propext/omega.

Not modelled: surrounding table structure, legal correctness.
-/

namespace JapanTaxLaw.LocalTaxArt154Capacity30To40Condition

/-- Independent spec: neither complement of the interval holds. -/
def SpecWithinInterval (capacity : Nat) : Prop :=
  ¬ capacity <= lowerBound /\ ¬ upperBound < capacity

/-- The implementation interval and the independent spec agree. -/
theorem interval_spec_agreement (c : Nat) : withinInterval c ↔ SpecWithinInterval c := by
  constructor
  · intro h
    constructor
    · exact Nat.not_le_of_gt h.1
    · exact Nat.not_lt_of_ge h.2
  · intro h
    constructor
    · exact Nat.lt_of_not_ge h.1
    · exact Nat.le_of_not_gt h.2

end JapanTaxLaw.LocalTaxArt154Capacity30To40Condition
