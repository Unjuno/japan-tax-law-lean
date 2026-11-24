import JapanTaxLaw.LocalCorporateDeductionLimitRate6

/-!
# LocalCorporateDeductionLimitRate6 spec — 6/100 の独立定式
Sources (pinned): law 325CO0000000245, revision 325CO0000000245_20261101_508CO0000000083,
art. 48の13 (第四十八条の十三). Independent restatement: limit×6/100。
-/

namespace JapanTaxLaw.LocalCorporateDeductionLimitRate6

def specDeductionLimit (limit : Nat) : Nat :=
  limit * 6 / 100

example : specDeductionLimit 100 = 6 := by decide

def agreeLocalCorporateDeductionLimitRate6 : Bool :=
  [0, 1, 5, 6, 7, 99, 100, 101, 999, 1_000, 123_457].all fun b =>
    corporateDeductionLimit b == specDeductionLimit b

example : agreeLocalCorporateDeductionLimitRate6 = true := by decide

end JapanTaxLaw.LocalCorporateDeductionLimitRate6
