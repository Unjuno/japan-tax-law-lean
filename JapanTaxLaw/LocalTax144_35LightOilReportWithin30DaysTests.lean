import JapanTaxLaw.LocalTax144_35LightOilReportWithin30DaysSpec

/- Kernel-decided boundary checks for 「前項に規定する者以外の者は、軽油の製造をした場合には、当該製造をした日から三十日以内に軽油の製造に関する事実及びその数量その他の総務省令で定める事項を、総務省令で定める道府県知事に報告しなければならない。」. -/
namespace JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 29 := by unfold inScope threshold; decide  -- below_limit
example : inScope 30 := by unfold inScope threshold; decide  -- limit_at (以内/以下 inclusive)
example : ¬ inScope 31 := by unfold inScope threshold; decide  -- above_limit
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 29 = true := by decide  -- bool
example : inScopeBool 30 = true := by decide  -- bool
example : inScopeBool 31 = false := by decide  -- bool
example : inScope 30 ↔ specInScope 30 := agree_scope 30
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax144_35LightOilReportWithin30Days
