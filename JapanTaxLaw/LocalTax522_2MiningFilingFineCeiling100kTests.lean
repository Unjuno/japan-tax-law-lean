import JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100kSpec

/- Kernel-decided boundary checks for 「市町村は、鉱産税の納税者が正当な事由がなくて前条の規定による申告書を同条に規定する申告書の提出期限までに提出しなかつた場合においては、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」. -/
namespace JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 99999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 100000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 100001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 99999 = true := by decide  -- bool
example : inScopeBool 100000 = true := by decide  -- bool
example : inScopeBool 100001 = false := by decide  -- bool
example : inScope 100000 ↔ specInScope 100000 := agree_scope 100000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax522_2MiningFilingFineCeiling100k
