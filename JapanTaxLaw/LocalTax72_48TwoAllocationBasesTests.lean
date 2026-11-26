import JapanTaxLaw.LocalTax72_48TwoAllocationBasesSpec

/- Kernel-decided boundary checks for 「分割法人が二以上の分割基準を適用すべき事業を併せて行う場合における当該分割法人の事業に係る課税標準額の総額の分割については、これらの事業のうち主たる事業について定められた分割基準によるものとする。」. -/
namespace JapanTaxLaw.LocalTax72_48TwoAllocationBases

open JapanTaxLaw.TaxFinance

example : ¬ inScope 0 := by unfold inScope threshold; decide
example : ¬ inScope 1 := by unfold inScope threshold; decide
example : inScope 2 := by unfold inScope threshold; decide
example : inScope 3 := by unfold inScope threshold; decide
example : inScopeBool 0 = false := by decide
example : inScopeBool 1 = false := by decide
example : inScopeBool 2 = true := by decide
example : inScopeBool 3 = true := by decide
example : inScope 2 ↔ specInScope 2 := agree_scope 2
example (a : Nat) : inScope a ↔ specInScope a := agree_scope a

end JapanTaxLaw.LocalTax72_48TwoAllocationBases
