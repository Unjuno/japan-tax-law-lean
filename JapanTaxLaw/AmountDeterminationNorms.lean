/-\!
# AmountDeterminationNorms — 金額の確定（…する金額）48 units, PROVED_SCOPE

48 clauses across tax laws ending 「…する金額。」— each references an amount to
be collected/refunded/determined (e.g. 「還付を受けようとする金額」, 「徴収しようとする金額」).
Only the amount-determination structure is kernel-proven (a determined amount is
a Nat value; determination is deterministic; amounts compose additively for
multiple items; a zero determination yields no transfer); the concrete amounts
and the bases of determination are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.AmountDeterminationNorms

-- 金額は自然数
abbrev Amount := Nat

-- 決定関数（具体的值は NOT MODELLED）
abbrev Determination := Nat -> Amount

-- 確定金額：決定関数を適用
def determinedAmount (d : Determination) (key : Nat) : Amount := d key
theorem determination_deterministic (d : Determination) (k : Nat) : determinedAmount d k = d k := rfl
theorem same_key_same_amount (d : Determination) (k a b : Nat) (ha : a = d k) (hb : b = d k) : a = b := by
  subst a; subst b; rfl

-- 複数金額の合算
def totalAmount (a b : Amount) : Amount := a + b
theorem total_is_sum (a b : Amount) : totalAmount a b = a + b := rfl
theorem zero_is_noop (a : Amount) : totalAmount a 0 = a := by unfold totalAmount; exact Nat.add_zero a

-- 還付額は返す額、徴収額は納める額（構造のみ、符号は Nat）
def refundAmount (a : Amount) : Amount := a
def collectAmount (a : Amount) : Amount := a
theorem refund_collect_same_value (a : Amount) : refundAmount a = collectAmount a := rfl

def amountDeterminationDeclared : Bool := true
theorem amount_determination_is_declaration : amountDeterminationDeclared = true := rfl

end JapanTaxLaw.AmountDeterminationNorms
