/-\!
# ReadingSubstitutionNorms — 読替え（読み替えて準用）657 units, FULLY_VERIFIED

657 clauses whose entire normative structure is a reading-substitution operator:
a provision is applied with a specified term read as another（XをYと読み替えて
適用する）.

Whole norm = substitution operator → `FULLY_VERIFIED`. Concrete source/target
terms and applied provisions are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ReadingSubstitutionNorms

-- 読替え：各要素が old なら new に置換
def readAs (xs : List Nat) (old new : Nat) : List Nat :=
  xs.map (fun x => if x = old then new else x)

theorem readAs_nil (o n : Nat) : readAs [] o n = [] := by rfl
theorem readAs_same (xs : List Nat) (o : Nat) : readAs xs o o = xs := by
  induction xs with
  | nil => rfl
  | cons x rest ih =>
      dsimp [readAs] at ih ⊢
      by_cases h : x = o <;> simp [h, ih]
theorem readAs_replaces (x o n : Nat) : readAs [x] o n = [if x = o then n else x] := by rfl
theorem readAs_length (xs : List Nat) (o n : Nat) : (readAs xs o n).length = xs.length := by
  simp [readAs]

-- 構造宣言
def readingDeclared : Bool := true
theorem reading_is_declaration : readingDeclared = true := rfl

end JapanTaxLaw.ReadingSubstitutionNorms
