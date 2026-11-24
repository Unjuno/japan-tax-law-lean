import JapanTaxLaw.LocalTax37_2BandUpTo195

/-
# LocalTax37_2BandUpTo195Spec — independent spec, 地方税法 第三十七条の二(11)

Independent formula reuses no implementation identifier. Universal axiom-free
equivalence. Boundary examples stay in the Tests module.
-/

namespace JapanTaxLaw.LocalTax37_2BandUpTo195

open JapanTaxLaw.TaxFinance

def specInBand (amount : Money) : Prop := amount <= 1_950_000

theorem agree_in_band (amount : Money) :
    inBand amount ↔ specInBand amount := by
  unfold inBand specInBand upperInclusiveYen
  rfl

end JapanTaxLaw.LocalTax37_2BandUpTo195
