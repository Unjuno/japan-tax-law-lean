import JapanTaxLaw.PenaltyMaxima
import JapanTaxLaw.PenaltyMaximaSpec

/-!
# PenaltyMaximaTests — 上限境界・仕様一致
-/
namespace JapanTaxLaw.PenaltyMaximaTests

open JapanTaxLaw.PenaltyMaxima

theorem spec_agree (m y mc fc : Nat) :
    withinMaxima m y mc fc = true ↔ JapanTaxLaw.PenaltyMaximaSpec.withinSpec m y mc fc := by
  simp [withinMaxima, JapanTaxLaw.PenaltyMaximaSpec.withinSpec]

example : withinMaxima 12 500000 12 500000 = true := by decide
example : withinMaxima 13 500000 12 500000 = false := by decide
example : withinMaxima 12 500001 12 500000 = false := by decide
example (m y mc fc : Nat) (h : withinMaxima m y mc fc = true) : m <= mc := months_within m y mc fc h
example (m y mc fc : Nat) (h : withinMaxima m y mc fc = true) : y <= fc := fine_within m y mc fc h
example (m y mc fc : Nat) (hm : m <= mc) (hy : y <= fc) : withinMaxima m y mc fc = true :=
  within_of_bounds m y mc fc hm hy
example (m y mc fc mc' fc' : Nat) (h1 : mc <= mc') (h2 : fc <= fc')
    (h : withinMaxima m y mc fc = true) : withinMaxima m y mc' fc' = true :=
  maxima_mono m y mc fc mc' fc' h1 h2 h
example (m y mc fc : Nat) : Alternative.within m y mc fc = Concurrent.within m y mc fc :=
  wording_families_identical m y mc fc

end JapanTaxLaw.PenaltyMaximaTests
