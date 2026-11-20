import JapanTaxLaw.LocalGasolineRate

/-! Independent restatement of 地方揮発油税法 art.4: bare Nat from 原文「四千四百円」。 -/

namespace JapanTaxLaw.LocalGasolineRate

def specRate : Nat := 4_400

example : specRate = 4_400 := by decide

def agreeLocalGasolineRate : Bool := localGasolineRate == specRate

example : agreeLocalGasolineRate = true := by decide

end JapanTaxLaw.LocalGasolineRate
