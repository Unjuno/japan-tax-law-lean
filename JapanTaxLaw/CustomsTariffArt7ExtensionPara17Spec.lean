import JapanTaxLaw.CustomsTariffArt7ExtensionPara17

/-!
# CustomsTariffArt7ExtensionPara17Spec — independent spec for 関税定率法 第七条(27)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第七条(27) — CONDITION case label 「第十七項の規定により延長する場合」:
         the case where the designated period is extended under paragraph 17.
Normative unit: NORM|28020c69b3e5d4d0606cd4ef67a43debfc5c5ed5be444e634b6d0acc304ba0c0

The implementation is a Bool function `isPara17Extension : ExtensionBasis -> Bool`.
The independent spec states the same discrimination as a PROPOSITION equality:

  SpecIsPara17Extension e := e = ExtensionBasis.para17

This is representationally distinct (Bool function vs. propositional equality) yet
extensionally equivalent: `isPara17Extension e = true ↔ SpecIsPara17Extension e`.
Kernel checks are axiom-free by exhaustive `cases` with `rfl`/`cases-h` — no
`decide`, no `simp`, no `propext`.

Not modelled: which date anchors the extension cap, the five-year cap, the
substance of paragraphs 17/19/22/24, and legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt7ExtensionPara17

/-- Independent spec: the para-17 extension case as a propositional equality. -/
def SpecIsPara17Extension (e : ExtensionBasis) : Prop :=
  e = ExtensionBasis.para17

/-- Universal agreement. Axiom-free by exhaustive cases with rfl/cases. -/
theorem agree_is_para17_extension (e : ExtensionBasis) :
    (isPara17Extension e = true) ↔ SpecIsPara17Extension e := by
  cases e
  · constructor
    · intro _h
      rfl
    · intro _h
      rfl
  · constructor
    · intro h
      cases h
    · intro h
      cases h

end JapanTaxLaw.CustomsTariffArt7ExtensionPara17
