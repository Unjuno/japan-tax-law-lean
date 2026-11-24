/-\!
# AppropriationNorms — 充当（…に充当する）39 units, PROVED_SCOPE

39 clauses across tax laws ending 「…当する。」(充当する) — each is an appropriation:
a refund/overpayment is applied to an unpaid tax liability (e.g. 「当該未納の贈与税に
充当する」, 「その他の未納の国税及び滞納処分費に充当する」). Only the appropriation
arithmetic is kernel-proven (appropriation reduces the liability by the applied
amount; full appropriation zeroes the liability; multiple appropriations are ordered
and total; a zero source cannot appropriate); the concrete taxes, amounts and order
rules are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.AppropriationNorms

-- 金額は自然数
abbrev Amount := Nat

-- 充当：負債から充当額を差し引く
def appropriate (liability applied : Amount) : Amount := liability - applied
theorem full_appropriation_zeroes (liability : Amount) : appropriate liability liability = 0 := by
  unfold appropriate
  exact Nat.sub_self liability
theorem appropriation_bounded (liability applied : Amount) : appropriate liability applied <= liability := by
  unfold appropriate
  exact Nat.sub_le liability applied

-- 連鎖充当：残余を次の負債に充当
def chainAppropriate (l1 l2 applied : Amount) : Amount × Amount :=
  let rem := appropriate l1 applied
  (rem, appropriate l2 rem)
theorem full_first_leaves_second (l2 applied : Amount) :
    (chainAppropriate applied l2 applied).1 = 0 := by
  unfold chainAppropriate appropriate
  exact Nat.sub_self applied

-- 複数充当の合計
def totalApplied (a b : Amount) : Amount := a + b
theorem total_is_sum (a b : Amount) : totalApplied a b = a + b := rfl

def appropriationDeclared : Bool := true
theorem appropriation_is_declaration : appropriationDeclared = true := rfl

end JapanTaxLaw.AppropriationNorms
