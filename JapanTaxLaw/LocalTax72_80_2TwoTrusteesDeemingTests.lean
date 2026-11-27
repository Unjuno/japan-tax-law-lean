import JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeemingSpec

/- Kernel-decided boundary checks for 「一の法人課税信託等の受託者が二以上ある場合には、各受託者の当該法人課税信託等に係る信託資産等は、当該法人課税信託等の信託事務を主宰する受託者（次項において「主宰受託者」という。）の信託資産等とみなして、この節の規定を適用する。」. -/
namespace JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_80_2TwoTrusteesDeeming
