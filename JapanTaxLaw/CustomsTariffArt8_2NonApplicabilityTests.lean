import JapanTaxLaw.CustomsTariffArt8_2NonApplicabilitySpec

/-!
# CustomsTariffArt8_2NonApplicabilityTests — kernel-checked checks for 関税定率法 第八条の二(2)

Verifies the CONDITION 「前項の規定は、次の各号のいずれかに該当する場合には、適用しない。」:
the enumerated items (1, 2) disable the preceding paragraph; other cases do not.
-/

namespace JapanTaxLaw.CustomsTariffArt8_2NonApplicability

-- Two enumerated items extracted structurally from Paragraph#2.
example : enumeratedItemCount = 2 := rfl

-- Listed items disable the preceding paragraph; the catch-all does not.
example : precedingParagraphApplies Case.item1 = false := item1_not_applies
example : precedingParagraphApplies Case.item2 = false := item2_not_applies
example : precedingParagraphApplies Case.other = true := other_applies

-- The three cases are pairwise distinct.
example : Case.item1 ≠ Case.item2 := by decide
example : Case.item1 ≠ Case.other := by decide
example : Case.item2 ≠ Case.other := by decide

-- Universal agreement with the independent spec (axiom-free).
example (c : Case) : (precedingParagraphApplies c = false) ↔ SpecListedCase c :=
  agree_non_applicability c

end JapanTaxLaw.CustomsTariffArt8_2NonApplicability
