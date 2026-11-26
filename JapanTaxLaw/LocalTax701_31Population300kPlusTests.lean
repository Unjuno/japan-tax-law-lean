import JapanTaxLaw.LocalTax701_31Population300kPlusSpec

/- Kernel-decided boundary checks for 「イ及びロに掲げる市以外の市で人口（官報で公示された最近の国勢調査の結果による人口その他これに準ずるものとして政令で定める人口をいう。）三十万以上のもののうち政令で指定するもの」. -/
namespace JapanTaxLaw.LocalTax701_31Population300kPlus

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 299999 := by unfold inScope threshold; decide  -- below_limit
example : inScope 300000 := by unfold inScope threshold; decide  -- limit_at (以上 inclusive)
example : inScope 300001 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 299999 = false := by decide  -- bool
example : inScopeBool 300000 = true := by decide  -- bool
example : inScopeBool 300001 = true := by decide  -- bool
example : inScope 300000 ↔ specInScope 300000 := agree_scope 300000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax701_31Population300kPlus
