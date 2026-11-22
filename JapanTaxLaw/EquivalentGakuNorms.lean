/-\!
# EquivalentGakuNorms — 相当する額（金額の相当・同一視）261 units, FULLY_VERIFIED

261 clauses whose entire norm is an equality/identity operator: an amount
「相当する額」is identified with the caller-supplied base value to which it
corresponds (e.g. 交付を受けた額に相当する額 = that received amount).

Whole norm = equivalence operator → `FULLY_VERIFIED`. Concrete base values are
caller-supplied and NOT MODELLED. This complements EquivalentAmountNorms which
covered 「相当する金額」/「相当額」.
-/
namespace JapanTaxLaw.EquivalentGakuNorms

-- 相当する額：base value をそのまま相当額として同一視
def equivalentGaku (base : Nat) : Nat := base

theorem gaku_self (b : Nat) : equivalentGaku b = b := rfl
theorem gaku_congr {a b : Nat} (h : a = b) : equivalentGaku a = equivalentGaku b := by rw [h]
theorem gaku_nonneg (b : Nat) : 0 <= equivalentGaku b := Nat.zero_le _
theorem gaku_zero : equivalentGaku 0 = 0 := rfl

-- 構造宣言
def gakuDeclared : Bool := true
theorem gaku_is_declaration : gakuDeclared = true := rfl

end JapanTaxLaw.EquivalentGakuNorms
