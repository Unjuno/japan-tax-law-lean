import JapanTaxLaw.BatchStructLbl8ec7fdb326

/-! Independent spec: explicit branch form of the same domain predicate. -/
namespace JapanTaxLaw.BatchStructLbl8ec7fdb326

def specValid (c : Nat × Nat) : Bool :=
  if c.1 = 0 then false else (if c.2 = 0 then true else true)

theorem agree_spec_impl (c : Nat × Nat) (h : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2)) :
    specValid c = validCode c := by
  unfold specValid validCode
  rcases h with ⟨h1, h2⟩
  have hn : ¬ c.1 = 0 := Nat.ne_of_gt h1
  rw [if_neg hn]
  simp only [ite_self]
  have hh : 0 < c.1 ∧ (c.2 = 0 ∨ 0 < c.2) := ⟨h1, h2⟩
  exact (decide_eq_true_eq.mpr hh).symm

end JapanTaxLaw.BatchStructLbl8ec7fdb326
