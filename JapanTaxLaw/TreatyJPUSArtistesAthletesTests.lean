import JapanTaxLaw.TreatyJPUSArtistesAthletes
import JapanTaxLaw.TreatyJPUSArtistesAthletesSpec

/-!
# TreatyJPUSArtistesAthletesTests — 第十六条（芸能人及び運動家）
-/
namespace JapanTaxLaw.TreatyJPUSArtistesAthletesTests
open JapanTaxLaw.TreatyJPUSArtistesAthletes

theorem threshold_spec (g : Nat) : sourceTaxIfExceeds10000 g = JapanTaxLaw.TreatyJPUSArtistesAthletesSpec.sourceTaxIfExceeds10000Spec g := by
  unfold sourceTaxIfExceeds10000 JapanTaxLaw.TreatyJPUSArtistesAthletesSpec.sourceTaxIfExceeds10000Spec
  by_cases h : 10000 < g <;> simp [h]
theorem attribution_spec (a d : Bool) : attributionException a d = JapanTaxLaw.TreatyJPUSArtistesAthletesSpec.attributionExceptionSpec a d := by rfl
example : sourceTaxIfExceeds10000 10000 = false := at_10000_no_source_tax
example : sourceTaxIfExceeds10000 10001 = true := above_10000_source_tax
example : sourceTaxIfExceeds10000 9999 = false := below_10000_no_source_tax
example : attributionException true false = true := attributed_no_designation_source_tax
example : attributionException true true = false := designation_no_source_tax
example : attributionException false false = false := not_attributed_no_source_tax
example : artistesAthletesDeclared = true := artistes_athletes_is_declaration

end JapanTaxLaw.TreatyJPUSArtistesAthletesTests
