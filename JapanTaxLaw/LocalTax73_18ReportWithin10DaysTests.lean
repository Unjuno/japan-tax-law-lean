import JapanTaxLaw.LocalTax73_18ReportWithin10DaysSpec

/- Kernel-decided boundary checks for 「市町村長は、前項の規定による申告書若しくは報告書を受け取つた場合又は自ら不動産の取得の事実を発見した場合には、その日から十日以内に当該申告書若しくは報告書を道府県知事に送付し、又は当該取得の事実を通知するものとする。」. -/
namespace JapanTaxLaw.LocalTax73_18ReportWithin10Days

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 9 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 10 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 11 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 9 = true := by decide  -- bool
example : inScopeBool 10 = true := by decide  -- bool
example : inScopeBool 11 = false := by decide  -- bool
example : inScope 10 ↔ specInScope 10 := agree_scope 10
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax73_18ReportWithin10Days
