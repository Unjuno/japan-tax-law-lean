import JapanTaxLaw.TouristTaxTaxablePassengersSpec

/-! Kernel-decided boundary examples for 国際観光旅客税法施行規則 art.3(2) ホ. -/

namespace JapanTaxLaw.TouristTaxTaxablePassengers

-- (a) 通常の控除: 100 - (10 + 20 + 30) = 40。
example : taxablePassengers 100 10 20 30 = 40 := by decide
example : specTaxablePassengers 100 10 20 30 = 40 := by decide

-- (b) ちょうど零になる境界。
example : taxablePassengers 100 40 30 30 = 0 := by decide

-- (c) 控除が全体を超える場合も零（飽和）。
example : taxablePassengers 100 50 30 30 = 0 := by decide
example : taxablePassengers 0 0 0 0 = 0 := by decide

-- (d) 控除ゼロでは元の旅客数がそのまま残る。
example : taxablePassengers 250 0 0 0 = 250 := by decide

-- (e) 独立仕様との一致（普遍定理の具体点）。
example : specTaxablePassengers 100 10 20 30 = taxablePassengers 100 10 20 30 :=
  agreeTaxablePassengers 100 10 20 30
example : specTaxablePassengers 100 50 30 30 = taxablePassengers 100 50 30 30 :=
  agreeTaxablePassengers 100 50 30 30
example : specTaxablePassengers 7 3 2 1 = taxablePassengers 7 3 2 1 :=
  agreeTaxablePassengers 7 3 2 1

-- (f) 普遍定理の具体適用。
example : taxablePassengers 100 10 20 30 <= 100 := neverExceedsTotal 100 10 20 30
example : taxablePassengers 100 50 30 30 = 0 := zeroWhenExemptionsCoverAll 100 50 30 30 (by decide)
example : taxablePassengers 100 10 20 30 = 40 := by decide

end JapanTaxLaw.TouristTaxTaxablePassengers
