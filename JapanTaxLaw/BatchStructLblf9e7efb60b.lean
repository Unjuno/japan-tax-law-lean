import JapanTaxLaw.TaxFinance

/-! Generated record of a structural item label. This is NOT a norm: there is
    no legal condition, effect or obligation here. Only the declared label
    domain invariant is kernel-checked. -/
namespace JapanTaxLaw.BatchStructLblf9e7efb60b

def labelCode : Nat × Nat := (2, 0)

def validCode (c : Nat × Nat) : Bool := decide (0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2))

theorem label_valid : validCode labelCode = true := by
  unfold validCode labelCode
  decide

end JapanTaxLaw.BatchStructLblf9e7efb60b
