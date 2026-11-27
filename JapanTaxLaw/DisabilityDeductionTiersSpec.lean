import JapanTaxLaw.DisabilityDeductionTiers

/-! # DisabilityDeductionTiers spec — 二段階額の独立定式 (law 325AC0000000226 / art.37)
「一万円＝1×10000」「十万円＝10×10000」として再記述する。 -/

namespace JapanTaxLaw.DisabilityDeductionTiers

def specStandardPerPerson : Nat := 1 * 10000
def specSpecialPerPerson : Nat := 10 * 10000

def specPerPerson (isSpecial : Bool) : Nat :=
  if isSpecial then specSpecialPerPerson else specStandardPerPerson

def specTotal (isSpecial : Bool) (persons : Nat) : Nat :=
  specPerPerson isSpecial * persons

def agreeDisabilityDeductionTiers : Bool :=
  [false, true].all fun b =>
    [0, 1, 2, 10].all fun n => total b n == specTotal b n

example : agreeDisabilityDeductionTiers = true := by decide

end JapanTaxLaw.DisabilityDeductionTiers
