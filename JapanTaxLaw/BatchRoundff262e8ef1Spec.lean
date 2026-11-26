import JapanTaxLaw.BatchRoundff262e8ef1

/-! Independent spec: subtract the remainder instead of dividing and
    multiplying. Agreement is proved for every Nat amount. -/
namespace JapanTaxLaw.BatchRoundff262e8ef1

def specTruncate (x : Nat) : Nat := x - x % unit

theorem agree_spec_impl (x : Nat) : specTruncate x = truncateAmount x := by
  unfold specTruncate truncateAmount
  have h : x = (x / unit * unit) + x % unit := by
    rw [Nat.mul_comm]
    exact (Nat.div_add_mod x unit).symm
  exact Nat.sub_eq_of_eq_add h

end JapanTaxLaw.BatchRoundff262e8ef1
