import JapanTaxLaw.ForeignDesignation

/-!
# ForeignDesignation spec — 指定外国 台湾 の独立定式
Sources (pinned): law 337CO0000000227, revision 337CO0000000227_20260401_508CO0000000083.
Independent restatement: 指定外国 = {台湾(0)}、その他(1) は対象外。
-/

namespace JapanTaxLaw.ForeignDesignation

def specDesignated (c : Nat) : Bool := c == 0

example : specDesignated 0 = true := by decide
example : specDesignated 1 = false := by decide

def agreeForeignDesignation : Bool :=
  [0, 1, 2].all fun c => isDesignatedForeign c == specDesignated c

example : agreeForeignDesignation = true := by decide

end JapanTaxLaw.ForeignDesignation
