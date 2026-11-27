import JapanTaxLaw.LocalTax72_2CapitalCeiling100MSpec

/- Kernel-decided boundary checks for 「資本金の額又は出資金の額が一億円以下の法人であるかどうか及び資本又は出資を有しない法人であるかどうかの判定並びに前項第一号ロ（１）又は（２）に掲げる法人に該当するものであるかどうかの判定に関し必要な事項の判定（次号に掲げる判定を除く。）」. -/
namespace JapanTaxLaw.LocalTax72_2CapitalCeiling100M

open JapanTaxLaw.TaxFinance

example : inScope 0 := by unfold inScope threshold; decide  -- zero
example : inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 99999999 := by unfold inScope threshold; decide  -- threshold_below
example : inScope 100000000 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : ¬ inScope 100000001 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = true := by decide  -- bool
example : inScopeBool 1 = true := by decide  -- bool
example : inScopeBool 99999999 = true := by decide  -- bool
example : inScopeBool 100000000 = true := by decide  -- bool
example : inScopeBool 100000001 = false := by decide  -- bool
example : inScope 100000000 ↔ specInScope 100000000 := agree_scope 100000000
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_2CapitalCeiling100M
