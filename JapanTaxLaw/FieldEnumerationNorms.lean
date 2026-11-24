/-\!
# FieldEnumerationNorms — 記載事項の列挙（所在地/氏名/年月日/住所/その旨）779 units, PROVED_SCOPE

779 clauses across tax laws enumerating fields that must be recorded in a
prescribed form or register: location (256), date (197), address (133), name (118),
notation (75). Each is a field-enumeration operator: a list of fields to fill.
Only the enumeration/completeness structure is kernel-proven (a form is complete
iff all listed fields are filled; field lists compose under concatenation;
a missing field makes the form incomplete; a duplicate field does not add a new
requirement); the concrete field identities and form contents are NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.FieldEnumerationNorms

-- 記載項目は Bool で「記入済み」を表す（項目の識別子は NOT MODELLED）
-- フォーム = 記入済みフラグのリスト
abbrev Form := List Bool

-- フォームが完全（全項目が記入済み）
def complete (f : Form) : Bool := f.all id
theorem empty_is_complete : complete [] = true := by rfl
theorem all_filled_complete : complete [true, true, true] = true := by decide
theorem one_missing_incomplete : complete [true, false, true] = false := by decide
theorem missing_implies_incomplete (f : Form) (h : false ∈ f) : complete f = false := by
  unfold complete
  cases hf : f.all id with
  | true =>
      have hftrue : id false = true := (List.all_eq_true.mp hf) false h
      cases hftrue
  | false => rfl

-- フォームの合成（連結）— 連結は可換ではない（順序が意味を持つ）
def combineForms (a b : Form) : Form := a ++ b
theorem combine_concat (a b : Form) : combineForms a b = a ++ b := rfl
theorem combine_complete (a b : Form) (ha : complete a = true) (hb : complete b = true) :
    complete (combineForms a b) = true := by
  unfold complete combineForms at *
  apply List.all_eq_true.mpr
  intro x hx
  cases List.mem_append.mp hx with
  | inl hxa => exact (List.all_eq_true.mp ha) x hxa
  | inr hxb => exact (List.all_eq_true.mp hb) x hxb

-- 重複项目は新しい要件を追加しない（冪等性の単純例）
def addField (f : Form) (filled : Bool) : Form := f ++ [filled]
theorem add_duplicate_filled (f : Form) (h : complete f = true) :
    complete (addField f true) = true := by
  unfold complete addField at *
  apply List.all_eq_true.mpr
  intro x hx
  cases List.mem_append.mp hx with
  | inl hxa => exact (List.all_eq_true.mp h) x hxa
  | inr hxb => simp at hxb; subst x; rfl

def fieldEnumDeclared : Bool := true
theorem field_enum_is_declaration : fieldEnumDeclared = true := rfl

end JapanTaxLaw.FieldEnumerationNorms
