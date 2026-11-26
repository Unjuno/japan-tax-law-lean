import JapanTaxLaw.Below200kYen

/-! # Below200kYen spec — 20万円未満の独立定式 (law 340CO0000000096 / art.182の2)
「未満」を後継者による `amount + 1 <= 200000` として再記述する。 -/

namespace JapanTaxLaw.Below200kYen

def specLimitYen : Nat := 200_000

def specBelow (amount : Nat) : Bool := amount + 1 <= specLimitYen

example : specBelow 199_999 = true := by decide
example : specBelow 200_000 = false := by decide

def agreeBelow200kYen : Bool :=
  [0, 1, 199_998, 199_999, 200_000, 200_001].all fun a => below a == specBelow a

example : agreeBelow200kYen = true := by decide

end JapanTaxLaw.Below200kYen
