import JapanTaxLaw.TreatyJPUSDirectorsFees
import JapanTaxLaw.TreatyJPUSDirectorsFeesSpec

/-!
# TreatyJPUSDirectorsFeesTests — 第十五条（役員報酬）
-/
namespace JapanTaxLaw.TreatyJPUSDirectorsFeesTests
open JapanTaxLaw.TreatyJPUSDirectorsFees

theorem fees_spec (d : Bool) : directorsFeesTaxableInCompanyState d = JapanTaxLaw.TreatyJPUSDirectorsFeesSpec.directorsFeesTaxableInCompanyStateSpec d := by rfl
example : directorsFeesTaxableInCompanyState true = true := director_fees_source_tax
example : directorsFeesTaxableInCompanyState false = false := non_director_no_source_tax
example : directorsFeesDeclared = true := directors_fees_is_declaration

end JapanTaxLaw.TreatyJPUSDirectorsFeesTests
