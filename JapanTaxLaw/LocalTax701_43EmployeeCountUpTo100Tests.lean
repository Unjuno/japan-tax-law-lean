import JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100Spec

/- Kernel-decided boundary checks for 「前項の場合において、第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定の基礎となる事業所等のうち、課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等として政令で定めるもの（当該課税標準の算定期間の中途において廃止された事業所等を除く。）については、当該課税標準の算定期間に属する各月の末日現在における従業者の数を合計した数を当該課税標準の算定期間の月数で除して得た数をもつて前項の課税標準の算定期間の末日現在の従業者の数と」. -/
namespace JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100

open JapanTaxLaw.TaxFinance

example : inScopeBool 0 = true := by decide  -- zero
example : inScopeBool 1 = true := by decide  -- small_input
example : inScopeBool 99 = true := by decide  -- threshold_below
example : inScopeBool 100 = true := by decide  -- threshold_at (inclusive)
example : inScopeBool 101 = false := by decide  -- threshold_above
example : inScope 0 := by unfold inScope; decide  -- zero (Prop)
example : inScope 100 := by unfold inScope; decide  -- threshold_at (inclusive, Prop)
example : ¬ inScope 101 := by unfold inScope; decide  -- outside (Prop)
example : inScope 100 ↔ specInScope 100 := agree_scope 100
example (employees : Nat) : inScope employees ↔ specInScope employees := agree_scope employees

end JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100
