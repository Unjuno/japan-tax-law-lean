import JapanTaxLaw.LocalTaxIncomeBracket4MTo1B

/-! # LocalTaxIncomeBracket4MTo1B spec — (四百万, 十億] 区間 (law 325AC0000000226 / art.9の2)
原文の「四百万」「十億」を円単位の境界として再記述する。 -/

namespace JapanTaxLaw.LocalTaxIncomeBracket4MTo1B

def specLowerYen : Nat := 4_000_000
def specUpperYen : Nat := 1_000_000_000

def specInBracket (yen : Nat) : Bool :=
  yen > specLowerYen && yen <= specUpperYen

example : specInBracket 4_000_000 = false := by decide
example : specInBracket 1_000_000_000 = true := by decide

def agreeLocalTaxIncomeBracket4MTo1B : Bool :=
  [0, 3_999_999, 4_000_000, 4_000_001, 1_000_000_000, 1_000_000_001].all fun x =>
    inBracket x == specInBracket x

example : agreeLocalTaxIncomeBracket4MTo1B = true := by decide

end JapanTaxLaw.LocalTaxIncomeBracket4MTo1B
