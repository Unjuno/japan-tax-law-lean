import JapanTaxLaw.LocalTax72_78PrincipalOfficeLocationSpec

/- Kernel-decided boundary checks for 「その事務所等の所在地（その事務所等が二以上ある場合には、主たるものの所在地）」. -/
namespace JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope lower threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope lower threshold; decide  -- small_input
example : ¬ inScope 1 := by unfold inScope lower threshold; decide  -- threshold_below
example : inScope 2 := by unfold inScope lower threshold; decide  -- threshold_at
example : inScope 3 := by unfold inScope lower threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 1 = false := by decide  -- threshold_below
example : inScopeBool 2 = true := by decide  -- threshold_at
example : inScopeBool 3 = true := by decide  -- threshold_above
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_78PrincipalOfficeLocation
