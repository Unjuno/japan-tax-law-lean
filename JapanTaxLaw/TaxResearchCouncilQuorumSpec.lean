import JapanTaxLaw.TaxResearchCouncilQuorum

/-! Independent spec: `total >= 1 ∧ present * 3 >= total` (reversed multiplication,
explicit positive guard). The bridge is a constructive equivalence: Nat's
`0 < t` and `1 <= t` coincide, and multiplication commutes. -/
namespace JapanTaxLaw.TaxResearchCouncilQuorum

@[reducible] def specQuorum (present total : Nat) : Prop :=
  total >= 1 ∧ present * 3 >= total

theorem agreeQuorum (present total : Nat) : specQuorum present total ↔ quorumMet present total := by
  unfold specQuorum quorumMet
  constructor
  · intro h
    constructor
    · exact h.1
    · simpa [Nat.mul_comm] using h.2
  · intro h
    constructor
    · exact h.1
    · simpa [Nat.mul_comm] using h.2

end JapanTaxLaw.TaxResearchCouncilQuorum
