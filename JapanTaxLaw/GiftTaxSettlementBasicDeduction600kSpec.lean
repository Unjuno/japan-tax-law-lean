import JapanTaxLaw.GiftTaxSettlementBasicDeduction600k

/-!
# GiftTaxSettlementBasicDeduction600k spec — 60万円控除の独立定式
Sources (pinned): law 325AC0000000073, revision 325AC0000000073_20260401_506AC0000000008,
art. 21の11の2 (第二十一条の十一の二). Independent restatement: max(base−600000, 0)。
-/

namespace JapanTaxLaw.GiftTaxSettlementBasicDeduction600k

def specAfterDeduction (base : Nat) : Nat :=
  if base > 600000 then base - 600000 else 0

example : specAfterDeduction 600001 = 1 := by decide

def agreeGiftTaxSettlementBasicDeduction600k : Bool :=
  [0, 1, 599999, 600000, 600001, 1000000, 1234567].all fun b =>
    afterDeduction b == specAfterDeduction b

example : agreeGiftTaxSettlementBasicDeduction600k = true := by decide

end JapanTaxLaw.GiftTaxSettlementBasicDeduction600k
