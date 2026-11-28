import JapanTaxLaw.LocalTax314_2DependentExcessOver840001StrictSpec

/- Kernel-decided boundary checks for 「六十三万円から当該特定親族の前年の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額（当該乗じた金額が十万円の整数倍の金額から八万円を控除した金額でないときは、十万円の整数倍の金額から八万円を控除した金額で当該乗じた金額に満たないもののうち最も多い金額とする。）を控除した金額」. -/
namespace JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = false := by decide  -- zero
example : inScopeBool 1 = false := by decide  -- small_input
example : inScopeBool 840_000 = false := by decide  -- threshold_below
example : inScopeBool 840_001 = false := by decide  -- threshold_at (exclusive)
example : inScopeBool 840_002 = true := by decide  -- threshold_above
example : ¬ inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : ¬ inScope 840_001 := by unfold inScope; decide  -- threshold_at (exclusive, Prop)
example : inScope 840_002 := by unfold inScope; decide  -- outside (Prop, above)
example : inScope 840_002 ↔ specInScope 840_002 := agree_scope 840_002
example (yen : Nat) : inScope yen ↔ specInScope yen := agree_scope yen

end JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict
