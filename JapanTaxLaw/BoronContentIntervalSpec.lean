import JapanTaxLaw.BoronContentInterval

/-! Independent spec: express the inclusive bounds as strict inequalities one
below/above (`79 < scaled ∧ scaled < 701`). This is a different surface form
whose equivalence with `80 <= scaled ∧ scaled <= 700` is proved universally by
omega. No negations/conditionals, so no Classical.choice is introduced. -/
namespace JapanTaxLaw.BoronContentInterval

@[reducible] def specInRange (scaled : Nat) : Prop :=
  79 < scaled ∧ scaled < 701

theorem agreeRange (scaled : Nat) : specInRange scaled ↔ inBoronRange scaled := by
  unfold specInRange inBoronRange lowerScaled upperScaled
  constructor
  · intro h
    constructor
    · exact h.1
    · exact Nat.le_of_lt_succ h.2
  · intro h
    constructor
    · exact h.1
    · exact Nat.lt_succ_of_le h.2

theorem specLowerIncluded : specInRange 80 := by
  unfold specInRange
  omega

theorem specUpperIncluded : specInRange 700 := by
  unfold specInRange
  omega

end JapanTaxLaw.BoronContentInterval
