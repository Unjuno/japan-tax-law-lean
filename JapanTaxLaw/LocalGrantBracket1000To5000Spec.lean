import JapanTaxLaw.LocalGrantBracket1000To5000

/-! # LocalGrantBracket1000To5000 spec — (千億, 五千億] 区間 (law 325AC0000000226 / art.72の21)
原文の「千億」「五千億」をそのまま境界として再記述する。 -/

namespace JapanTaxLaw.LocalGrantBracket1000To5000

def specLowerOku : Nat := 1000
def specUpperOku : Nat := 5000

def specInBracket (oku : Nat) : Bool :=
  oku > specLowerOku && oku <= specUpperOku

example : specInBracket 1000 = false := by decide
example : specInBracket 5000 = true := by decide

def agreeLocalGrantBracket1000To5000 : Bool :=
  [0, 999, 1000, 1001, 3000, 5000, 5001].all fun x => inBracket x == specInBracket x

example : agreeLocalGrantBracket1000To5000 = true := by decide

end JapanTaxLaw.LocalGrantBracket1000To5000
