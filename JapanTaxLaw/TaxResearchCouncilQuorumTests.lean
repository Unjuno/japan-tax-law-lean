import JapanTaxLaw.TaxResearchCouncilQuorumSpec

/-! Kernel-decided boundary examples for 税制調査会組織規則 art.7 §1. -/
namespace JapanTaxLaw.TaxResearchCouncilQuorum

example : quorumMet 1 3 := by decide
example : specQuorum 1 3 := by decide
example : quorumMet 2 6 := by decide
example : ¬ quorumMet 0 3 := by decide
example : ¬ quorumMet 1 4 := by decide
example : ¬ quorumMet 0 0 := by decide
example : quorumMet 5 5 := by decide
example : specQuorum 1 3 ↔ quorumMet 1 3 := agreeQuorum 1 3
example : specQuorum 1 4 ↔ quorumMet 1 4 := agreeQuorum 1 4
example : specQuorum 0 0 ↔ quorumMet 0 0 := agreeQuorum 0 0
example : quorumMet 1 3 → quorumMet 2 3 := quorumMonotone 1 2 3 (by decide)
example : ¬ quorumMet 0 7 := notQuorumWhenZeroPresent 7 (by decide)
example : quorumMet 7 7 := allPresentSuffices 7 (by decide)

end JapanTaxLaw.TaxResearchCouncilQuorum
