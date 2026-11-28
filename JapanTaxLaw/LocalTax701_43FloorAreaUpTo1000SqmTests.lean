import JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000SqmSpec

/- Kernel-decided boundary checks for 「前二項の場合において、第一項に規定する事業所床面積の合計面積及び第二項に規定する事業所床面積が千平方メートル以下であるかどうか並びに第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定は課税標準の算定期間の末日の現況によるものとする。」. -/
namespace JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 999 = true := by decide  -- threshold_below
example : inScopeBool 1_000 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 1_001 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 1_000 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 1_001 := by unfold inScope; decide  -- outside (Prop)
example : inScope 1_000 ↔ specInScope 1_000 := agree_scope 1_000
example (sqm : Nat) : inScope sqm ↔ specInScope sqm := agree_scope sqm

end JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm
