import JapanTaxLaw.LocalTax328_8SeparationFineCeiling100kSpec

/- Kernel-decided boundary checks for 「市町村は、分離課税に係る所得割の納税義務者が退職所得申告書を正当な理由がなくて提出しなかつた場合には、その者に対し、当該市町村の条例で十万円以下の過料を科する旨の規定を設けることができる。」. -/
namespace JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k

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

end JapanTaxLaw.LocalTax328_8SeparationFineCeiling100k
