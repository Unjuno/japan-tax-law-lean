import JapanTaxLaw.ResidentClassificationNorms
import JapanTaxLaw.ResidentClassificationNormsSpec

/-!
# ResidentClassificationNormsTests — 居住者分類
-/
namespace JapanTaxLaw.ResidentClassificationNormsTests

open JapanTaxLaw.ResidentClassificationNorms

example : classifyResidence 0 = .resident := class_resident
example : classifyResidence 1 = .nonResident := class_nonresident
example : classifyResidence 2 = .temporary := class_temporary
example : isTaxableResident .resident = true := resident_taxable
example : isTaxableResident .temporary = true := temporary_taxable
example : isTaxableResident .nonResident = false := nonresident_not_resident_tax
example (c : Nat) (x y : ResidenceClass)
    (hx : classifyResidence c = x) (hy : classifyResidence c = y) : x = y :=
  class_exclusive c x y hx hy
example : residenceDeclared = true := residence_is_declaration

end JapanTaxLaw.ResidentClassificationNormsTests
