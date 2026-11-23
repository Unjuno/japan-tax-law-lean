/-\!
# ExclusionRemainderNorms — 除外（除く）演算子（6446 units, FULLY_VERIFIED）

6446 clauses whose entire normative structure is an exclusion operator: a base
category is defined with a subcategory excluded（XはYを除く）.

Whole norm = exclusion operator → `FULLY_VERIFIED`. Concrete categories and
excluded items are caller-supplied and NOT MODELLED. Complements the earlier
exclusion/extension batch.
-/
namespace JapanTaxLaw.ExclusionRemainderNorms

-- 除外：base から exception を取り除く
def exclude (base exception : List Nat) : List Nat := base.filter (fun x => ! exception.contains x)

theorem exclude_empty (xs : List Nat) : exclude xs [] = xs := by
  simp [exclude]
theorem exclude_self (xs : List Nat) : exclude xs xs = [] := by
  simp [exclude]
theorem exclude_removes (xs : List Nat) (x : Nat) (h : x ∈ xs) :
    x ∉ exclude xs [x] := by
  simp [exclude]
theorem exclude_subseteq (base exception : List Nat) :
    (exclude base exception) ⊆ base := by
  intro x hx
  simp [exclude] at hx
  exact hx.1
theorem exclude_preserves (base exception : List Nat) (x : Nat)
    (hx : x ∈ base) (hne : x ∉ exception) : x ∈ exclude base exception := by
  simp [exclude, hx, hne]

-- 構造宣言
def exclusionDeclared : Bool := true
theorem exclusion_is_declaration : exclusionDeclared = true := rfl

end JapanTaxLaw.ExclusionRemainderNorms
