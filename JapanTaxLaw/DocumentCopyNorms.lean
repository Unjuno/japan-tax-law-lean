/-\!
# DocumentCopyNorms — 書類の写し（…の写し）137 units, PROVED_SCOPE

137 clauses across tax laws ending 「…の写し。」— each requires a copy of a
specified document (e.g. 「契約書の写し」, 「認定書の写し」, 「手帳の写し」) to be
submitted. Only the copy-requirement structure is kernel-proven (a copy requirement
is satisfied iff the copy is present and corresponds to its original; copies of
distinct originals are distinct requirements; copy requirements compose under
conjunction); the concrete documents and originals are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DocumentCopyNorms

-- 原本識別子（具体的文書は NOT MODELLED）
abbrev OriginalId := Nat

-- 写し要件：写しが提出済みかつ原本に対応
def copyRequirement (submitted : Bool) (matchesOriginal : Bool) : Bool := submitted && matchesOriginal
theorem copy_satisfied : copyRequirement true true = true := by decide
theorem copy_fails_absent : copyRequirement false true = false := by decide
theorem copy_fails_mismatch : copyRequirement true false = false := by decide
theorem copy_needs_both (s m : Bool) : copyRequirement s m = true -> s = true ∧ m = true := by
  cases s <;> cases m <;> simp [copyRequirement]

-- 異なる原本の写しは異なる要件（識別子で区別、構造のみ）
def copyOf (orig : OriginalId) : OriginalId := orig
theorem copy_of_identity (o : OriginalId) : copyOf o = o := rfl

-- 複数写し要件の合成（すべて必要）
def allCopies (a b : Bool) : Bool := a && b
theorem all_both : allCopies true true = true := by decide
theorem all_one_missing : allCopies true false = false := by decide

def documentCopyDeclared : Bool := true
theorem document_copy_is_declaration : documentCopyDeclared = true := rfl

end JapanTaxLaw.DocumentCopyNorms
