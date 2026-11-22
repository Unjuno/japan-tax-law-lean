import JapanTaxLaw.CustomsTariffArt8ExtensionPara20Spec

/-!
# CustomsTariffArt8ExtensionPara20Tests — kernel-checked checks for 関税定率法 第八条(30)

Verifies the CONDITION case label 「第二十項の規定により延長する場合」: the
paragraph number 20 extracted structurally, the decidable discrimination of the
para-20 extension case, and universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt8ExtensionPara20

-- Paragraph number derived from the verbatim 第二十項.
example : extensionParagraph = 20 := rfl

-- The para-20 case is recognised; other bases are not.
example : isPara20Extension ExtensionBasis.para20 = true := rfl
example : isPara20Extension ExtensionBasis.other = false := rfl

-- The two bases are distinct.
example : ExtensionBasis.para20 ≠ ExtensionBasis.other := by decide

-- Universal agreement with the independent propositional spec.
example (e : ExtensionBasis) :
    (isPara20Extension e = true) ↔ SpecIsPara20Extension e :=
  agree_is_para20_extension e

end JapanTaxLaw.CustomsTariffArt8ExtensionPara20
