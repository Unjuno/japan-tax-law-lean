import JapanTaxLaw.LocalTax92DemandWithin20DaysSpec

/- Kernel-decided boundary checks for 「特別徴収義務者が納期限（更正又は決定があつた場合においては、不足金額の納期限をいう。以下ゴルフ場利用税について同じ。）までにゴルフ場利用税に係る地方団体の徴収金を完納しない場合においては、道府県の徴税吏員は、納期限後二十日以内に、督促状を発しなければならない。」. -/
namespace JapanTaxLaw.LocalTax92DemandWithin20Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 19 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 20 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 21 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 19 = true := by decide  -- bool
example : inScopeBool 20 = true := by decide  -- bool
example : inScopeBool 21 = false := by decide  -- bool
example : inScope 20 ↔ specInScope 20 := agree_scope 20
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax92DemandWithin20Days
