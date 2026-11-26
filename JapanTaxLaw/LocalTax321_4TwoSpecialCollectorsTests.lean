import JapanTaxLaw.LocalTax321_4TwoSpecialCollectorsSpec

/- Kernel-decided boundary checks for 「この場合において、特別徴収義務者として二以上の者を指定したときは、給与所得に係る特別徴収税額をこれらの者が当該年度中にそれぞれ支払うべき給与の額に按分して、これを徴収させることができる。」. -/
namespace JapanTaxLaw.LocalTax321_4TwoSpecialCollectors

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

end JapanTaxLaw.LocalTax321_4TwoSpecialCollectors
