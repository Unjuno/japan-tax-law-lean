import JapanTaxLaw.GrayscaleLevels

/-!
# GrayscaleLevels spec — 256 以上の独立定式
Sources (pinned): law 415M60000040071, revision 415M60000040071_20260924_506M60000040031.
Independent restatement: Nat.ble 256 levels（Bool レベルの以上）。
-/

namespace JapanTaxLaw.GrayscaleLevels

def specMeets (l : Nat) : Bool := Nat.ble 256 l

example : specMeets 255 = false := by decide
example : specMeets 256 = true := by decide

def agreeGrayscaleLevels : Bool :=
  [0, 1, 255, 256, 257, 1000].all fun l => meetsGrayscaleRequirement l == specMeets l

example : agreeGrayscaleLevels = true := by decide

end JapanTaxLaw.GrayscaleLevels
