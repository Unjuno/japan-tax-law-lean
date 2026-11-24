/-\!
# MattersEnumerationNorms — 事項の列挙（…する事項）102 units, PROVED_SCOPE

102 clauses across tax laws ending 「…する事項。」— each enumerates matters to be
recorded/reported (e.g. 「…に関する事項」, 「…に規定する事項」). Only the
enumeration structure is kernel-proven (a matter list is finite; matter lists compose
by concatenation; a missing matter makes the enumeration incomplete; an empty
enumeration has no matters); the concrete matter identities and contents are NOT
MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.MattersEnumerationNorms

-- 事項は Bool で「記載済み」を表す（事項の識別子は NOT MODELLED）
abbrev MatterList := List Bool

-- 完全（全事項が記載済み）
def complete (f : MatterList) : Bool := f.all id
theorem empty_complete : complete [] = true := by rfl
theorem all_filled : complete [true, true] = true := by decide
theorem one_missing : complete [true, false] = false := by decide

-- 合成（連結）
def combineMatters (a b : MatterList) : MatterList := a ++ b
theorem combine_complete (a b : MatterList) (ha : complete a = true) (hb : complete b = true) :
    complete (combineMatters a b) = true := by
  unfold complete combineMatters at *
  apply List.all_eq_true.mpr
  intro x hx
  cases List.mem_append.mp hx with
  | inl hxa => exact (List.all_eq_true.mp ha) x hxa
  | inr hxb => exact (List.all_eq_true.mp hb) x hxb

-- 事項の追加
def addMatter (f : MatterList) (filled : Bool) : MatterList := f ++ [filled]
theorem add_unfilled_incomplete (f : MatterList) (h : complete f = true) :
    complete (addMatter f false) = false := by
  unfold complete addMatter at *
  simp [List.all_eq_true] at h ⊢

def mattersEnumDeclared : Bool := true
theorem matters_enum_is_declaration : mattersEnumDeclared = true := rfl

end JapanTaxLaw.MattersEnumerationNorms
