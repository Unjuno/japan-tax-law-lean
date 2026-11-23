import JapanTaxLaw.ExclusionRemainderNorms
import JapanTaxLaw.ExclusionRemainderNormsSpec

/-!
# ExclusionRemainderNormsTests — 除外演算子
-/
namespace JapanTaxLaw.ExclusionRemainderNormsTests

open JapanTaxLaw.ExclusionRemainderNorms

theorem spec_agreement (base exception : List Nat) :
    exclude base exception = JapanTaxLaw.ExclusionRemainderNormsSpec.excludeSpec base exception := by
  simp [exclude, JapanTaxLaw.ExclusionRemainderNormsSpec.excludeSpec]

example (xs : List Nat) : exclude xs [] = xs := exclude_empty xs
example (xs : List Nat) : exclude xs xs = [] := exclude_self xs
example (xs : List Nat) (x : Nat) (h : x ∈ xs) : x ∉ exclude xs [x] := exclude_removes xs x h
example (b e : List Nat) : (exclude b e) ⊆ b := exclude_subseteq b e
example (b e : List Nat) (x : Nat) (hx : x ∈ b) (h : x ∉ e) : x ∈ exclude b e := exclude_preserves b e x hx h
example : exclusionDeclared = true := exclusion_is_declaration

end JapanTaxLaw.ExclusionRemainderNormsTests
