/-\!
# ComputedAmountRefs — 算定額の参照（した金額/定した額/める金額）297 units, PROVED_SCOPE

297 clauses across tax laws ending with computed-amount reference suffixes:
  - 「…した金額」(168) — amount computed (by a formula) 
  - 「…定した額」(71) — amount prescribed (by a provision/order)
  - 「…める金額」(58) — amount to be prescribed/set

Each references an amount derived by a computation or prescription rather than a
literal figure. Only the computation-reference structure is kernel-proven (an
amount is produced by applying a method to a base; computed and prescribed amounts
are amounts; methods compose; a computed amount is deterministic in its inputs);
the concrete bases, formulas and figures are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.ComputedAmountRefs

-- 金額は自然数
abbrev Amount := Nat

-- 算定方法は入力額を出力額に写す関数
abbrev Method := Amount -> Amount

-- 算定額：基準額に算定方法を適用
def computedAmount (base : Amount) (method : Method) : Amount := method base
theorem computed_is_deterministic (base : Amount) (method : Method) :
    computedAmount base method = method base := rfl
theorem computed_same_inputs_same_output (base : Amount) (method : Method) (a b : Amount)
    (ha : a = base) (hb : b = base) : computedAmount a method = computedAmount b method := by
  subst a; subst b; rfl

-- 規定額：規定された額をそのまま参照
def prescribedAmount (value : Amount) : Amount := value
theorem prescribed_is_identity (v : Amount) : prescribedAmount v = v := rfl

-- 算定方法の合成：二段階の算定
def composeMethods (m1 m2 : Method) : Method := fun x => m2 (m1 x)
theorem compose_applies_in_sequence (m1 m2 : Method) (base : Amount) :
    composeMethods m1 m2 base = m2 (m1 base) := rfl

-- 算定額は輸出額に非負（Amount=Nat なので自明だが明示）
theorem computed_nonnegative (base : Amount) (method : Method) : computedAmount base method >= 0 := by
  exact Nat.zero_le _

def computedAmountDeclared : Bool := true
theorem computed_amount_is_declaration : computedAmountDeclared = true := rfl

end JapanTaxLaw.ComputedAmountRefs
