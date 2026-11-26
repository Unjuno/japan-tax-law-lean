import JapanTaxLaw.LocalTax63CovidRevenueCeiling70PercentSpec

/- Kernel-decided boundary checks for 「新型コロナウイルス感染症及びそのまん延防止のための措置の影響により当該中小事業者等の事業収入割合が百分の七十以下となる場合（前号に掲げる場合を除く。）」. -/
namespace JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 69 := by unfold inScope threshold; decide  -- below_limit
example : inScope 70 := by unfold inScope threshold; decide  -- limit_at (以内/以下 inclusive)
example : ¬ inScope 71 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 69 = true := by decide  -- bool
example : inScopeBool 70 = true := by decide  -- bool
example : inScopeBool 71 = false := by decide  -- bool
example : inScope 70 ↔ specInScope 70 := agree_scope 70
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax63CovidRevenueCeiling70Percent
