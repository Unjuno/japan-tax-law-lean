import JapanTaxLaw.CustomsTariffArt7ExtensionPara17Spec

/-!
# CustomsTariffArt7ExtensionPara17Tests — kernel-checked checks for 関税定率法 第七条(27)

Verifies the CONDITION case label 「第十七項の規定により延長する場合」:
the paragraph number 17 extracted structurally, the decidable discrimination of
the para-17 extension case, and universal agreement with the independent spec.
-/

namespace JapanTaxLaw.CustomsTariffArt7ExtensionPara17

-- Paragraph number derived from the verbatim 第十七項.
example : extensionParagraph = 17 := rfl

-- The para-17 case is recognised; other bases are not.
example : isPara17Extension ExtensionBasis.para17 = true := rfl
example : isPara17Extension ExtensionBasis.other = false := rfl

-- The two bases are distinct.
example : ExtensionBasis.para17 ≠ ExtensionBasis.other := by decide

-- Universal agreement with the independent propositional spec.
example (e : ExtensionBasis) :
    (isPara17Extension e = true) ↔ SpecIsPara17Extension e :=
  agree_is_para17_extension e

end JapanTaxLaw.CustomsTariffArt7ExtensionPara17
