import JapanTaxLaw.LocalTax382RegistryNoticeWithin10DaysSpec

/- Kernel-decided boundary checks for 「登記所は、土地又は建物の表示に関する登記をしたときは、十日以内に、その旨その他総務省令で定める事項を当該土地又は家屋の所在地の市町村長に通知しなければならない。」. -/
namespace JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9 := by unfold inScope threshold; decide  -- below_limit
example : inScope 10 := by unfold inScope threshold; decide  -- limit_at (以内/以下 inclusive)
example : ¬ inScope 11 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 9 = true := by decide  -- bool
example : inScopeBool 10 = true := by decide  -- bool
example : inScopeBool 11 = false := by decide  -- bool
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax382RegistryNoticeWithin10Days
