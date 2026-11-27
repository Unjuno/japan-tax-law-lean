import JapanTaxLaw.LocalTax53CapitalOver100MSpec

/- Kernel-decided boundary checks for 「納税申告書に係る事業年度開始の日（公共法人等にあつては、前年四月一日）現在における資本金の額又は出資金の額が一億円を超える法人」. -/
namespace JapanTaxLaw.LocalTax53CapitalOver100M

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : ¬ inScope 99999999 := by unfold inScope threshold; decide  -- threshold_below
example : ¬ inScope 100000000 := by unfold inScope threshold; decide  -- threshold_at (STRICT: excluded)
example : inScope 100000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 99999999 = false := by decide  -- bool
example : inScopeBool 100000000 = false := by decide  -- bool
example : inScopeBool 100000001 = true := by decide  -- bool
example : inScope 100000000 ↔ specInScope 100000000 := agree_scope 100000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax53CapitalOver100M
