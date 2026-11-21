import JapanTaxLaw.ReadingSubstitutionMunicipal

/-
# ReadingSubstitutionMunicipalSpec — independent spec for 公共サービス実施民間事業者省令 第三条 読替え

Law id: 418M60000008099
Revision: 418M60000008099_20240401_505M60000008106
Statutory article: 第三条 第2項 (「市又は区若しくは総合区」→「区又は総合区」読替え)
Normative unit: NORM|86a625f4a0733597f47e3f2575103fee40b62748885af002076f1933959a34f4

INDEPENDENT FORMULATION. This module rests its OWN statutory phrase domain
`SpecPhrase`, with its own constructors `src`, `substituted`, `unrelated`, and
its own rewrite function `specSubstitute` (`src ↦ substituted`, every other
constructor fixed). No implementation identifier appears in any `spec*`
definition body. This is a purely STRUCTURAL reading-substitution norm: there
are NO numerals, thresholds or arithmetic. Source correspondence is anchored
solely by the pinned verbatim needle in the implementation doc-comment, so
`spec_literals` is EMPTY by design.

The ONLY bridge is the universal, axiom-free theorem `agreeSubstitute`: after
case analysis on the finite domain and unfolding the two rewrite functions and
the coordinate translation, both sides are definitionally equal. The proof is
just `cases p <;> rfl`. No `by_cases`, no `omega`, no `Classical.choice`, no
`Monotone`, no struct literals as function arguments.

`toSpec : Phrase -> SpecPhrase` is a total coordinate translation between the
two independently declared finite domains; it is used only in the bridge,
never inside a spec formula. The spec restates the same textual rewrite with
its own types rather than restating the implementation.

Variable contract: p is the phrase appearing in 前項; the rule substitutes the
city-inclusive phrase with the city-exclusive one, leaving all other phrases
unchanged. Not modelled: the triggering condition, substantive paragraph rules,
other articles.
-/

namespace JapanTaxLaw.ReadingSubstitutionMunicipal

/-- Spec-local phrase domain. Independent of the implementation type. -/
inductive SpecPhrase where
  | src         -- 「市又は区若しくは総合区」 (city-inclusive)
  | substituted -- 「区又は総合区」 (city-exclusive)
  | unrelated   -- unrelated phrase (identity case)
  deriving BEq, DecidableEq

/-- Independent restatement of the reading substitution. -/
def specSubstitute (p : SpecPhrase) : SpecPhrase :=
  match p with
  | SpecPhrase.src => SpecPhrase.substituted
  | SpecPhrase.substituted => SpecPhrase.substituted
  | SpecPhrase.unrelated => SpecPhrase.unrelated

/-- Total coordinate translation from the implementation domain to the spec domain. -/
def toSpec (p : Phrase) : SpecPhrase :=
  match p with
  | Phrase.cityOrWardOrGeneralWard => SpecPhrase.src
  | Phrase.wardOrGeneralWard => SpecPhrase.substituted
  | Phrase.other => SpecPhrase.unrelated

/-- Universal, kernel-checked correspondence for every phrase.
    Pure `cases ... <;> rfl`: no by_cases/omega/Classical.choice. -/
theorem agreeSubstitute (p : Phrase) :
    toSpec (readingSubstitute p) = specSubstitute (toSpec p) := by
  cases p <;> rfl

end JapanTaxLaw.ReadingSubstitutionMunicipal
