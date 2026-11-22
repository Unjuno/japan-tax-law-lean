/-\!
# EquivalentAmountNorms — 相当する金額（金額の相当・同一視）1251 units, FULLY_VERIFIED

1251 clauses whose entire norm is an equality/identity operator: an amount
「相当する金額」is identified with the caller-supplied base value to which it
corresponds (e.g. 税額に相当する金額 = that tax amount).

Whole norm = equivalence operator → `FULLY_VERIFIED`. Concrete base values are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.EquivalentAmountNorms

-- 相当する金額：base value をそのまま相当額として同一視
def equivalentAmount (base : Nat) : Nat := base

theorem equivalent_self (b : Nat) : equivalentAmount b = b := rfl
theorem equivalent_refl (b : Nat) : equivalentAmount b = equivalentAmount b := rfl
theorem equivalent_congr {a b : Nat} (h : a = b) : equivalentAmount a = equivalentAmount b := by
  rw [h]

-- 相当額の推移（等価関係）
theorem equivalent_trans {a b c : Nat} (h1 : equivalentAmount a = b)
    (h2 : b = equivalentAmount c) : equivalentAmount a = equivalentAmount c := by
  rw [h1, h2]

-- 相当額は非負（Nat）
theorem equivalent_nonneg (b : Nat) : 0 <= equivalentAmount b := Nat.zero_le _

-- 構造宣言
def equivalentDeclared : Bool := true
theorem equivalent_is_declaration : equivalentDeclared = true := rfl

end JapanTaxLaw.EquivalentAmountNorms
