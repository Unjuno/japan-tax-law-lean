import JapanTaxLaw.ServiceYearFractionRoundDown

/-!
# ServiceYearFractionRoundDown spec — 一年未満切捨ての独立定式
Sources (pinned): law 347M50000040042, revision 347M50000040042_20251231_507M60000040072.
Independent restatement: 剰余を引いてから除算（(m - m%12)/12）。
-/

namespace JapanTaxLaw.ServiceYearFractionRoundDown

def specRound (m : Nat) : Nat := (m - m % 12) / 12

example : specRound 11 = 0 := by decide
example : specRound 23 = 1 := by decide

def agreeServiceYearFractionRoundDown : Bool :=
  [0, 1, 11, 12, 13, 23, 24, 35, 120].all fun m => roundDownToYear m == specRound m

example : agreeServiceYearFractionRoundDown = true := by decide

end JapanTaxLaw.ServiceYearFractionRoundDown
