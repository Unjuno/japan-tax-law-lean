import JapanTaxLaw.TaxFinance

/-! Generated typed interface for an open-ended delegation. The delegated
    determination is caller-established and NOT resolved. No claim about the
    delegated content or its legal effect is made. -/
namespace JapanTaxLaw.BatchDelegIface2ef9b826e8

structure DelegatedRecord where
  authorized : Bool
  determination : Nat

def active (d : DelegatedRecord) : Bool := decide d.authorized

theorem authorized_iff_active (d : DelegatedRecord) :
    d.authorized = true ↔ active d = true := by
  unfold active
  constructor
  · intro h
    rw [h]
    decide
  · intro h
    change decide d.authorized = true at h
    exact decide_eq_true_eq.mp h

theorem determination_accessor (d : DelegatedRecord) : d.determination = d.determination := rfl

end JapanTaxLaw.BatchDelegIface2ef9b826e8
