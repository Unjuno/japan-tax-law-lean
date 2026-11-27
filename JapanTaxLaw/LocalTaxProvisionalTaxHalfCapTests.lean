import JapanTaxLaw.LocalTaxProvisionalTaxHalfCapSpec

/- Kernel-decided boundary checks for 「ただし、当該徴収することができる額の総額は、仮算定税額の二分の一に相当する額を超えることができない。」. -/
namespace JapanTaxLaw.LocalTaxProvisionalTaxHalfCap

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 4 = false := by decide  -- zero
example : inScopeBool 1 4 = false := by decide  -- threshold_below / small_input
example : inScopeBool 2 4 = false := by decide  -- threshold_at (STRICT: equality excluded)
example : inScopeBool 3 4 = true := by decide  -- threshold_above
example : inScope 3 4 := by unfold inScope; decide  -- threshold_above (Prop)
example : ¬ inScope 2 4 := by unfold inScope; decide  -- threshold_at (Prop)
example : inScope 3 4 ↔ specInScope 3 4 := agree_scope 3 4
example (amount base : Nat) : inScope amount base ↔ specInScope amount base := agree_scope amount base

end JapanTaxLaw.LocalTaxProvisionalTaxHalfCap
