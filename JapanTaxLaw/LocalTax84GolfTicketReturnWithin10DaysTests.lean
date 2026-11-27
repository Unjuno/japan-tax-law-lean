import JapanTaxLaw.LocalTax84GolfTicketReturnWithin10DaysSpec

/- Kernel-decided boundary checks for 「第二項の証票の交付を受けた者は、当該ゴルフ場に係るゴルフ場利用税の特別徴収の義務が消滅した場合においては、その消滅した日から十日以内にその証票を道府県知事に返さなければならない。」. -/
namespace JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 9 = true := by decide  -- threshold_below
example : inScopeBool 10 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 11 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope threshold; decide  -- zero (Prop)
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at (inclusive, Prop)
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax84GolfTicketReturnWithin10Days
