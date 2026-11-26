import JapanTaxLaw.TaxResearchCouncilQuorum

/-! Independent spec: `total >= 1 ∧ present * 3 >= total` (reversed multiplication,
explicit positive guard). Only bridge is universal omega theorem `agreeQuorum`. -/
namespace JapanTaxLaw.TaxResearchCouncilQuorum

@[reducible] def specQuorum (present total : Nat) : Prop :=
  total >= 1 ∧ present * 3 >= total

theorem agreeQuorum (present total : Nat) : specQuorum present total ↔ quorumMet present total := by
  unfold specQuorum quorumMet
  constructor
  · intro h
    exact ⟨(Nat.succ_le_iff).mp h.1, by simpa [Nat.mul_comm] using h.2⟩
  · intro hq
    exact ⟨(Nat.succ_le_iff).mpr hq.1, by simpa [Nat.mul_comm] using hq.2⟩

end JapanTaxLaw.TaxResearchCouncilQuorum
