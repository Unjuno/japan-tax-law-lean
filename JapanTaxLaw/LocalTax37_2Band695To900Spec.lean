import JapanTaxLaw.LocalTax37_2Band695To900

/-
# LocalTax37_2Band695To900Spec — independent spec, 地方税法 第三十七条の二(11)

Independent formula reuses no implementation identifier. Universal axiom-free
equivalence. Boundary examples stay in the Tests module.
-/

namespace JapanTaxLaw.LocalTax37_2Band695To900

open JapanTaxLaw.TaxFinance

def specInBand (amount : Money) : Prop := Nat.succ 6_950_000 ≤ amount ∧ amount ≤ 9_000_000

theorem agree_in_band (amount : Money) :
    inBand amount ↔ specInBand amount := by
  unfold inBand specInBand lowerExclusiveYen upperInclusiveYen
  
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

end JapanTaxLaw.LocalTax37_2Band695To900
