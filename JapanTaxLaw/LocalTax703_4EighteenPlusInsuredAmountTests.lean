import JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmountSpec

/- Kernel-decided boundary checks for 「所得割総額、資産割総額、被保険者均等割総額、十八歳以上被保険者均等割総額及び世帯別平等割総額の合計額」. -/
namespace JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 17 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 18 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 19 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 17 = false := by decide  -- bool
example : inScopeBool 18 = true := by decide  -- bool
example : inScopeBool 19 = true := by decide  -- bool
example : inScope 18 ↔ specInScope 18 := agree_scope 18
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax703_4EighteenPlusInsuredAmount
