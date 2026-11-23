import JapanTaxLaw.TreatyJPUSResidentDefinition
import JapanTaxLaw.TreatyJPUSResidentDefinitionSpec

/-!
# TreatyJPUSResidentDefinitionTests — 第四条１・２（居住者の定義）
-/
namespace JapanTaxLaw.TreatyJPUSResidentDefinitionTests
open JapanTaxLaw.TreatyJPUSResidentDefinition

theorem resident_spec (w : Bool) : isResident w = JapanTaxLaw.TreatyJPUSResidentDefinitionSpec.isResidentSpec w := by rfl
theorem us_spec (a b c : Bool) : usResident a b c = JapanTaxLaw.TreatyJPUSResidentDefinitionSpec.usResidentSpec a b c := by rfl
example : isResident false = false := source_only_not_resident
example : isResident true = true := worldwide_income_resident
example : usResident true true true = true := us_resident_all
example : usResident false true true = false := jp_resident_not_us
example : usResident true false true = false := no_presence_not_us
example : usResident true true false = false := third_country_not_us
example (a b c : Bool) (h : usResident a b c = true) : a = true := us_resident_requires_not_jp a b c h
example : residentDefinitionDeclared = true := resident_definition_is_declaration

end JapanTaxLaw.TreatyJPUSResidentDefinitionTests
