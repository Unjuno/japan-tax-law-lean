import JapanTaxLaw.LocalTax73_24TwoYearNewHouseConditionSpec

/- Kernel-decided boundary checks for 「土地を取得した日から二年以内に当該土地の上に特例適用住宅が新築された場合（当該取得をした者（以下この号において「取得者」という。）が当該土地を当該特例適用住宅の新築の時まで引き続き所有している場合又は当該特例適用住宅の新築が当該取得者から当該土地を取得した者により行われる場合に限る。）」. -/
namespace JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = false := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax73_24TwoYearNewHouseCondition
