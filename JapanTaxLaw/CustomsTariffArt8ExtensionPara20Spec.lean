import JapanTaxLaw.CustomsTariffArt8ExtensionPara20

/-!
# CustomsTariffArt8ExtensionPara20Spec — independent spec for 関税定率法 第八条(30)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(30) — CONDITION case label 「第二十項の規定により延長する場合」:
         the case where a designated period is extended under paragraph 20.
Normative unit: NORM|49816f0201acd08b02754683d53a55008f897714937b0ffa08fdce6bba139efc

The implementation is `isPara20Extension : ExtensionBasis -> Bool`. The
independent spec states the discrimination as a propositional equality `e = para20`.
Representationally distinct (Bool function vs. equality) yet equivalent for all
inputs (ExtensionBasis has exactly two constructors). Axiom-free by exhaustive
cases with rfl/cases-h — no `decide`/`simp`/`propext`.

Not modelled: anchor date, five-year cap, paragraph-20 substance, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8ExtensionPara20

/-- Independent spec: the para-20 extension case as propositional equality. -/
def SpecIsPara20Extension (e : ExtensionBasis) : Prop :=
  e = ExtensionBasis.para20

/-- Universal agreement. Axiom-free by exhaustive cases. -/
theorem agree_is_para20_extension (e : ExtensionBasis) :
    (isPara20Extension e = true) ↔ SpecIsPara20Extension e := by
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

end JapanTaxLaw.CustomsTariffArt8ExtensionPara20
