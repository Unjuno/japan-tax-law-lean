import JapanTaxLaw.TaxFinance

/-! Generated template for a delegated monetary ceiling. The ceiling is
    caller-established (Nat) and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.BatchDelegLim22682a2bfc

def applies (limit x : Nat) : Bool := decide (x ≤ limit)

theorem at_limit (limit : Nat) : applies limit limit = true := by
  unfold applies
  exact decide_eq_true_eq.mpr (Nat.le_refl limit)

theorem monotone (a b x : Nat) (h : a ≤ b) :
    applies a x = true → applies b x = true := by
  unfold applies
  intro hx
  exact decide_eq_true_eq.mpr (Nat.le_trans (decide_eq_true_eq.mp hx) h)

end JapanTaxLaw.BatchDelegLim22682a2bfc
