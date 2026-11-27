import JapanTaxLaw.LocalTaxBracketOver4000

/-! # LocalTaxBracketOver4000 spec — 4000万円超の独立定式 (law 325AC0000000226 / art.37の2)
原文の金額を境界（除外）として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracketOver4000

def specLimitYen : Nat := 40_000_000

def specOver4000 (yen : Nat) : Bool := yen > specLimitYen

example : specOver4000 40_000_000 = false := by decide
example : specOver4000 40_000_001 = true := by decide

def agreeLocalTaxBracketOver4000 : Bool :=
  [0, 39_999_999, 40_000_000, 40_000_001, 100_000_000].all fun x =>
    over4000 x == specOver4000 x

example : agreeLocalTaxBracketOver4000 = true := by decide

end JapanTaxLaw.LocalTaxBracketOver4000
