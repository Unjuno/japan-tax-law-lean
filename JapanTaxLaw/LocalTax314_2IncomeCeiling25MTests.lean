import JapanTaxLaw.LocalTax314_2IncomeCeiling25MSpec

/- Kernel-decided boundary checks for 「市町村は、前年の合計所得金額が二千五百万円以下である所得割の納税義務者については、その者の前年の所得について算定した総所得金額、退職所得金額又は山林所得金額から、次の各号に掲げる場合の区分に応じ、当該各号に定める金額を控除するものとする。」. -/
namespace JapanTaxLaw.LocalTax314_2IncomeCeiling25M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 24999999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 25000000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 25000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 24999999 = true := by decide  -- bool
example : inScopeBool 25000000 = true := by decide  -- bool
example : inScopeBool 25000001 = false := by decide  -- bool
example : inScope 25000000 ↔ specInScope 25000000 := agree_scope 25000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax314_2IncomeCeiling25M
