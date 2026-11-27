import JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300kSpec

/- Kernel-decided boundary checks for 「前条第一項の規定により申告すべき納税管理人について虚偽の申告をし、又は偽りその他不正の手段により同項の承認若しくは同条第二項の認定を受けたときは、その違反行為をした者は、三十万円以下の罰金に処する。」. -/
namespace JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 299999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 300000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 300001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 299999 = true := by decide  -- bool
example : inScopeBool 300000 = true := by decide  -- bool
example : inScopeBool 300001 = false := by decide  -- bool
example : inScope 300000 ↔ specInScope 300000 := agree_scope 300000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax30FalseTaxManagerFineWithin300k
