import JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700

/-!
# LocalTaxEnforcementArt4AnnualAmount350To700Spec — independent spec

Law id: 329M50000002023 (地方税法施行規則), revision from INVENTORY.
Art.4 supplementary table cell CONDITION 「年３５０万円を超え年７００万円以下の金額　（（２２））」.
Normative unit: NORM|0a52a8975d92d2968ed4d24f279f8b5e8e432b8486f46e012d95bd6d5f5186de

The implementation states the interval as a strict lower and a non-strict upper
inequality; the spec states it as the absence of the two complementary
 inequalities, representationally distinct. Equivalence is proved in the kernel
with Nat-specific core lemmas and concrete `decide` reductions (probe-confirmed
axiom-free). Axiom-free; no simp/propext/omega.

Not modelled: table-row label, surrounding table structure, legal correctness.
-/

namespace JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700

/-- Independent spec: neither complement of the interval holds. -/
def SpecWithinInterval (annualAmount : Nat) : Prop :=
  ¬ annualAmount <= lowerBound /\ ¬ upperBound < annualAmount

/-- The implementation interval and the independent spec agree. -/
theorem interval_spec_agreement (a : Nat) : withinInterval a ↔ SpecWithinInterval a := by
  constructor
  · intro h
    constructor
    · exact Nat.not_le_of_gt h.1
    · exact Nat.not_lt_of_ge h.2
  · intro h
    constructor
    · exact Nat.lt_of_not_ge h.1
    · exact Nat.le_of_not_gt h.2

end JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350To700
