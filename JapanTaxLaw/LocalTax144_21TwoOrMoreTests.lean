import JapanTaxLaw.LocalTax144_21TwoOrMoreSpec

/- Kernel-decided boundary checks for 「二人以上の者が代表者を定めて免税軽油使用者証の交付を受けることができる。」. -/
namespace JapanTaxLaw.LocalTax144_21TwoOrMore

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

end JapanTaxLaw.LocalTax144_21TwoOrMore
