import JapanTaxLaw.SavingsGroupFine

/-!
# SavingsGroupFineSpec — independent spec for 納税貯蓄組合法 art. 14

The independent definition uses the raw statute numeral 十万 (100_000) and a
different clamping formulation (if-then-else) from the implementation's `min`.
Agreement is checked in the Lean kernel.
-/

namespace JapanTaxLaw.SavingsGroupFineSpec

def specFineCap : Nat := 100_000

def specFineAmount (assessed : Nat) : Nat :=
  if assessed <= 100_000 then assessed else 100_000

def agreeFineCap : Prop :=
  specFineCap = JapanTaxLaw.SavingsGroupFine.administrativeFineCap

def agreeFineAmount (a : Nat) : Prop :=
  specFineAmount a = JapanTaxLaw.SavingsGroupFine.fineAmount a

theorem agree_fine_cap : agreeFineCap := by
  unfold agreeFineCap specFineCap JapanTaxLaw.SavingsGroupFine.administrativeFineCap
  rfl

theorem agree_fine_amount (a : Nat) : agreeFineAmount a := by
  unfold agreeFineAmount specFineAmount JapanTaxLaw.SavingsGroupFine.fineAmount
  unfold JapanTaxLaw.SavingsGroupFine.administrativeFineCap
  by_cases h : a <= 100_000
  · simp [h]
  · have h' : 100_000 <= a := by omega
    simp [h, Nat.min_eq_right h']

end JapanTaxLaw.SavingsGroupFineSpec
