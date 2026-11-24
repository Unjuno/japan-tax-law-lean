/-\!
# AmountSettingNorms — 額設定（「…額とする。」）397 units, PROVED_SCOPE

397 clauses across tax laws ending 「…額とする。」— each sets a tax amount by
an arithmetic expression: a base amount plus an added amount, minus a deduction,
or a computed amount. Only the arithmetic-setting structure is kernel-proven
(amounts are Nat; add/subtract/compute relations are proven over Nat); the
concrete base amounts, rates and referenced computations are NOT MODELLED.
Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.AmountSettingNorms

-- 金額は自然数（円）
abbrev Amount := Nat

-- 設定演算：基準額 + 加算額
def setWithAddition (base addition : Amount) : Amount := base + addition
theorem addition_is_sum (base addition : Amount) : setWithAddition base addition = base + addition := rfl
theorem addition_exceeds_base (base addition : Amount) (h : 0 < addition) :
    base < setWithAddition base addition := by
  unfold setWithAddition
  exact Nat.lt_add_of_pos_right h

-- 設定演算：基準額 - 控除額
def setWithDeduction (base deduction : Amount) : Amount := base - deduction
theorem deduction_not_exceeds_base (base deduction : Amount) :
    setWithDeduction base deduction <= base := by
  unfold setWithDeduction
  exact Nat.sub_le base deduction
theorem full_deduction_is_zero (base : Amount) : setWithDeduction base base = 0 := by
  unfold setWithDeduction
  exact Nat.sub_self base

-- 設定演算：計算額をそのまま設定
def setComputed (computed : Amount) : Amount := computed
theorem computed_is_identity (a : Amount) : setComputed a = a := rfl

-- 加算と控除の合成：加算してから控除（額の整合性）
def addThenDeduct (base addition deduction : Amount) : Amount :=
  setWithDeduction (setWithAddition base addition) deduction
theorem add_then_deduct_formula (base addition deduction : Amount) :
    addThenDeduct base addition deduction = base + addition - deduction := rfl

-- 加算額=控除額なら元の基準額に戻る（base+ded - ded = base, base を足す前に ded<=base+... を要する）
theorem add_sub_cancel_when_valid (base addition deduction : Amount) (h : deduction <= addition) :
    (base + addition) - deduction = base + (addition - deduction) := by
  exact Nat.add_sub_assoc h base

def amountSettingDeclared : Bool := true
theorem amount_setting_is_declaration : amountSettingDeclared = true := rfl

end JapanTaxLaw.AmountSettingNorms
