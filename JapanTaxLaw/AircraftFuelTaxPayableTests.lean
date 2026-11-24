import JapanTaxLaw.AircraftFuelTaxPayableSpec

/-! Boundary examples for 航空機燃料税法 art.14(1) item4 (kernel-decided). -/

namespace JapanTaxLaw.AircraftFuelTaxPayable

open JapanTaxLaw.TaxFinance

example : payable 0 0 = 0 := by decide
example : payable 1 1 = 0 := by decide
example : payable 100 0 = 100 := by decide
example : payable 100 40 = 60 := by decide
example : payable 100 99 = 1 := by decide
example : payable 100 100 = 0 := by decide
example : payable 100 101 = 0 := by decide
example : specPayable 100 40 = 60 := by decide
example : specPayable 100 101 = 0 := by decide
example : specPayable 100 40 = payable 100 40 := agreePayable 100 40
example : specPayable 100 101 = payable 100 101 := agreePayable 100 101

end JapanTaxLaw.AircraftFuelTaxPayable
