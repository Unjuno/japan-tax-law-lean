import JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonthsSpec

/- Kernel-decided boundary checks for 「この場合において、正当な事由がなくて当該税務官署が当該更正又は決定の請求を受けた日から三月以内に更正又は決定をしないときは、道府県知事は、当該税務官署を監督する税務官署に更正又は決定をすべき旨を請求することができる。」. -/
namespace JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 4 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScopeBool 4 = false := by decide  -- bool
example : inScope 3 ↔ specInScope 3 := agree_scope 3
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_40DecisionWithinThreeMonths
