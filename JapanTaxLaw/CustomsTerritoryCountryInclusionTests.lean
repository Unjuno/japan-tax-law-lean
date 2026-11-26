import JapanTaxLaw.CustomsTerritoryCountryInclusionSpec

/-
# CustomsTerritoryCountryInclusionTests — kernel-decided boundary checks
-/

namespace JapanTaxLaw.CustomsTerritoryCountryInclusion

example : asCountry 0 = 1 := by decide
example : asCountry 1 = 1 := by decide
example : asCountry 2 = 2 := by decide
example : asCountry 3 = 3 := by decide
example : specAsCountry 0 = 1 := by decide
example : specAsCountry 1 = 1 := by decide
example : asCountry 0 = specAsCountry 0 := by decide
example : asCountry 1 = specAsCountry 1 := by decide
example (x : Nat) : asCountry x = specAsCountry x := agree_as_country x
example : asCountry 9 = specAsCountry 9 := agree_as_country 9

end JapanTaxLaw.CustomsTerritoryCountryInclusion
