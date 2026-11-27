import JapanTaxLaw.LocalTaxBracketAtMost195

/-! # LocalTaxBracketAtMost195 spec — 195万円以下の独立定式 (law 325AC0000000226 / art.37の2)
原文の金額を上限として再記述する。 -/

namespace JapanTaxLaw.LocalTaxBracketAtMost195

def specLimitYen : Nat := 1_950_000

def specAtMost (yen : Nat) : Bool := yen <= specLimitYen

example : specAtMost 1_950_000 = true := by decide
example : specAtMost 1_950_001 = false := by decide

def agreeLocalTaxBracketAtMost195 : Bool :=
  [0, 1_949_999, 1_950_000, 1_950_001, 9_000_000].all fun x => atMost x == specAtMost x

example : agreeLocalTaxBracketAtMost195 = true := by decide

end JapanTaxLaw.LocalTaxBracketAtMost195
