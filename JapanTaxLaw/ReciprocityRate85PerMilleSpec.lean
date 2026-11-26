import JapanTaxLaw.ReciprocityRate85PerMille

/-! # ReciprocityRate85PerMille spec — 8.5%の独立定式 (law 337CO0000000227 / art.14)
「百分の八・五」を 85/1000 として再記述する。 -/

namespace JapanTaxLaw.ReciprocityRate85PerMille

def specRateNum : Nat := 85
def specRateDen : Nat := 1000

def specStatutoryRate : Nat := specRateNum

example : specStatutoryRate = 85 := by decide

def agreeReciprocityRate85PerMille : Bool :=
  statutoryRate == specStatutoryRate

example : agreeReciprocityRate85PerMille = true := by decide

end JapanTaxLaw.ReciprocityRate85PerMille
