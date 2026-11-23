import JapanTaxLaw.TreatyJPUSDefinitions
import JapanTaxLaw.TreatyJPUSDefinitionsSpec

/-!
# TreatyJPUSDefinitionsTests — 条約第三条（L3 別層）
-/
namespace JapanTaxLaw.TreatyJPUSDefinitionsTests

open JapanTaxLaw.TreatyJPUSDefinitions

example : isPerson PersonCat.individual = true := individual_is_person
example : isPerson PersonCat.corporation = true := corporation_is_person
example : isPerson PersonCat.otherBody = true := otherBody_is_person
example (t : Nat) (xs : List Nat) : inUS t (t :: xs) = false := territory_excluded t xs
example (t : Nat) (xs : List Nat) (h : t ∉ xs) : inUS t xs = true := territory_included t xs h
example : definitionsDeclared = true := definitions_is_declaration

end JapanTaxLaw.TreatyJPUSDefinitionsTests
