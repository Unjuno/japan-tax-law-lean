import JapanTaxLaw.LocalTax703_5AdultEqualCharge18Spec

/- Kernel-decided boundary checks for 「市町村は、国民健康保険税の納税義務者又はその世帯に属する被保険者が出産する予定の場合又は出産した場合には、政令で定める基準に従い当該市町村の条例で定めるところにより、当該納税義務者に対して課する所得割額、被保険者均等割額及び十八歳以上被保険者均等割額を減額するものとする。」. -/
namespace JapanTaxLaw.LocalTax703_5AdultEqualCharge18

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

end JapanTaxLaw.LocalTax703_5AdultEqualCharge18
