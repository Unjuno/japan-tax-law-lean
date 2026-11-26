import JapanTaxLaw.TaxResearchCouncilQuorum

/-! Independent spec: `total >= 1 ∧ present * 3 >= total` (reversed multiplication,
explicit positive guard). Only bridge is universal omega theorem `agreeQuorum`. -/
namespace JapanTaxLaw.TaxResearchCouncilQuorum

@[reducible] def specQuorum (present total : Nat) : Prop :=
  total >= 1 ∧ present * 3 >= total

theorem agreeQuorum (present total : Nat) : specQuorum present total ↔ quorumMet present total := by
  unfold specQuorum quorumMet; omega

end JapanTaxLaw.TaxResearchCouncilQuorum
