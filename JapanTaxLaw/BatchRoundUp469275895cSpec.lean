import JapanTaxLaw.BatchRoundUp469275895c

/-! Independent spec: successor quotient when a remainder exists. -/
namespace JapanTaxLaw.BatchRoundUp469275895c

def specRoundUp (x : Nat) : Nat :=
  if x % unit == 0 then x else (x / unit + 1) * unit

theorem agree_spec_impl (x : Nat) : specRoundUp x = roundUpAmount x := by
  unfold specRoundUp roundUpAmount
  by_cases h : x % unit == 0
  · rw [if_pos h, if_pos h, Nat.add_zero, Nat.mul_comm]
    have hx : x % unit = 0 := by exact decide_eq_true_eq.mp h
    have hdiv : unit * (x / unit) + x % unit = x := Nat.div_add_mod x unit
    rw [hx, Nat.add_zero] at hdiv
    exact hdiv.symm
  · rw [if_neg h, if_neg h, Nat.succ_mul]

end JapanTaxLaw.BatchRoundUp469275895c
