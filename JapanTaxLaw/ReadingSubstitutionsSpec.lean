import JapanTaxLaw.ReadingSubstitutions

/-! Independent structural spec: each pinned substitution has a non-empty
source phrase and a different target phrase. -/

namespace JapanTaxLaw.ReadingSubstitutions

def specValidPair (src dst : String) : Prop := src ≠ "" ∧ src ≠ dst

def tableValid : Bool :=
  substitutionTable.all (fun t => t.2.1 != "" && t.2.1 != t.2.2)

theorem allPairsValid : tableValid = true := by
  native_decide

theorem countIs196 : pairCount = 196 := by native_decide

end JapanTaxLaw.ReadingSubstitutions
