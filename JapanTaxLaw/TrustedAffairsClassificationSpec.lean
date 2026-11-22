import JapanTaxLaw.TrustedAffairsClassification

/-!
# TrustedAffairsClassification spec — 第一号法定受託事務 の独立定式
Sources (pinned): law 504CO0000000300, revision 504CO0000000300_20260401_508CO0000000083.
Independent restatement: 指定区分 = {第一号法定受託事務(0)}、その他(1) 対象外。
-/

namespace JapanTaxLaw.TrustedAffairsClassification

def specAffair (a : Nat) : Bool := a == 0

example : specAffair 0 = true := by decide
example : specAffair 1 = false := by decide

def agreeTrustedAffairsClassification : Bool :=
  [0, 1, 2].all fun a => isTrustedAffair a == specAffair a

example : agreeTrustedAffairsClassification = true := by decide

end JapanTaxLaw.TrustedAffairsClassification
