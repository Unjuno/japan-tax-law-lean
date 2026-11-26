import JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350

/-!
# LocalTaxEnforcementArt4AnnualAmount350Spec — independent spec

Law id: 329M50000002023 (地方税法施行規則), revision from INVENTORY.
Art.4 supplementary-provision table cell CONDITION 「年３５０万円以下の金額　（（２１））」.
Normative unit: NORM|c8d9f6f7319a50729e1de85ce41a2c51e37f8a03b6cf39647b6bb44bfe202fb1

The implementation states the cap as a direct <= inequality; the spec states it
as the absence of the strict reverse inequality, representationally distinct.
Equivalence is proved in the kernel using Nat-specific core lemmas. Axiom-free;
no decide/simp/propext/omega.

Not modelled: table-row label, surrounding table structure, legal correctness.
-/

namespace JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350

/-- Independent spec: the limit is not less than the annual amount. -/
def SpecWithinLimit (annualAmount : Nat) : Prop :=
  ¬ amountLimit < annualAmount

/-- The implementation condition and the independent spec agree. -/
theorem within_limit_spec_agreement (n : Nat) : withinLimit n ↔ SpecWithinLimit n := by
  constructor
  · intro h
    exact Nat.not_lt_of_ge h
  · intro h
    exact Nat.le_of_not_gt h

end JapanTaxLaw.LocalTaxEnforcementArt4AnnualAmount350
