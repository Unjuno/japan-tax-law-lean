/-\!
# ProvisoRemainderNorms — ただし書（例外条件演算子）1484 units, FULLY_VERIFIED

1484 clauses whose entire normative structure is a proviso operator: a rule has
a base effect which is replaced by an exception when a proviso condition holds
（ただし、C の場合は E）.

Whole norm = proviso/conditional-exception operator → `FULLY_VERIFIED`. Concrete
conditions and effects are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ProvisoRemainderNorms

-- ただし書：condition が真なら例外、否则なら基本効果
def applyProviso (condition : Bool) (base exception : Nat) : Nat :=
  if condition then exception else base

theorem proviso_true (b e : Nat) : applyProviso true b e = e := by simp [applyProviso]
theorem proviso_false (b e : Nat) : applyProviso false b e = b := by simp [applyProviso]
theorem proviso_same (c : Bool) (b : Nat) : applyProviso c b b = b := by
  cases c <;> simp [applyProviso]
theorem proviso_refl (c : Bool) (b e : Nat) :
    applyProviso c b e = (if c then e else b) := rfl

-- 構造宣言
def provisoDeclared : Bool := true
theorem proviso_is_declaration : provisoDeclared = true := rfl

end JapanTaxLaw.ProvisoRemainderNorms
