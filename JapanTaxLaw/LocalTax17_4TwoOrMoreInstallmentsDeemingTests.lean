import JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeemingSpec

/- Kernel-decided boundary checks for 「二以上の納期又は二回以上の分割納付若しくは分割納入に係る地方団体の徴収金につき過誤納を生じた場合には、その過誤納金については、その過誤納金の額に相当する地方団体の徴収金に達するまで、納付又は納入の日の順序に従い最後に納付又は納入された金額から順次遡つて求めた金額からなるものとみなして、第一項の規定を適用する。」. -/
namespace JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide  -- zero
example : ¬ inScope 1 := by unfold inScope threshold; decide  -- small_input
example : inScope 2 := by unfold inScope threshold; decide  -- threshold_at (inclusive)
example : inScope 3 := by unfold inScope threshold; decide  -- threshold_above
example : inScopeBool 0 = false := by decide  -- bool
example : inScopeBool 1 = false := by decide  -- bool
example : inScopeBool 2 = true := by decide  -- bool
example : inScopeBool 3 = true := by decide  -- bool
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax17_4TwoOrMoreInstallmentsDeeming
