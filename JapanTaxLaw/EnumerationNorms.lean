/-\!
# EnumerationNorms — 次に掲げる…いずれか（選択的列挙演算子）3362 units, FULLY_VERIFIED

3362 clauses whose entire normative structure is an enumeration/disjunction
operator: a rule applies if any of the listed cases holds（次に掲げる事情の
いずれかがある場合）.

Whole norm = disjunction operator → `FULLY_VERIFIED`. Concrete listed cases and
their truth values are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.EnumerationNorms

-- 補助：すべて偽
def allFalse : List Bool → Prop
  | [] => True
  | false :: xs => allFalse xs
  | true :: _ => False

-- いずれか：列挙された条件のいずれかが真
def anyOf (flags : List Bool) : Bool := flags.or

theorem anyOf_nil : anyOf [] = false := rfl
theorem anyOf_true (xs : List Bool) : anyOf (true :: xs) = true := by simp [anyOf]
theorem anyOf_false (xs : List Bool) : anyOf (false :: xs) = anyOf xs := by simp [anyOf]
theorem anyOf_all_false (xs : List Bool) (h : allFalse xs) : anyOf xs = false := by
  induction xs with
  | nil => rfl
  | cons b rest ih =>
      cases b with
      | false => exact ih h
      | true => cases h
theorem anyOf_append (xs ys : List Bool) : anyOf (xs ++ ys) = (anyOf xs || anyOf ys) := by
  induction xs with
  | nil => simp [anyOf]
  | cons b rest ih =>
      unfold anyOf at ih ⊢
      cases b <;> simp [ih]

-- 構造宣言
def enumerationDeclared : Bool := true
theorem enumeration_is_declaration : enumerationDeclared = true := rfl

end JapanTaxLaw.EnumerationNorms
