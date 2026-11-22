import JapanTaxLaw.InspectionCity

/-!
# InspectionCity spec — 検査対象市町村2区分 の独立定式
Sources (pinned): law 333CO0000000117, revision 333CO0000000117_20010106_412CO0000000304.
Independent restatement: 対象 = {指定都市(0),総務大臣指定市(1)}、その他(2) 対象外。
-/

namespace JapanTaxLaw.InspectionCity

def specCity (c : Nat) : Bool := c == 0 || c == 1

example : specCity 0 = true := by decide
example : specCity 1 = true := by decide
example : specCity 2 = false := by decide

def agreeInspectionCity : Bool :=
  [0, 1, 2, 3].all fun c => isInspectionCity c == specCity c

example : agreeInspectionCity = true := by decide

end JapanTaxLaw.InspectionCity
