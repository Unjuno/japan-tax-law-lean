import JapanTaxLaw.CustomsTariffArt8ReadingSubstitution

/-!
# CustomsTariffArt8ReadingSubstitutionSpec — independent spec for 関税定率法 第八条(14)

Law id: 143AC0000000054 (関税定率法, Act), revision 143AC0000000054_20260601_508AC0000000005
Article: 第八条(14) — in the stated case, 「一年以内に」 in 第六項 is read as
         「一年以内において速やかに」.
Normative unit: NORM|4faefcb5ffeac4edb7ad4af13982cb09a48df4d67afb5f2ff696f74a9ed6059c

The implementation uses `if text = oldPhrase then newPhrase else text`
(PROPOSITIONAL equality). The independent spec states the substitution as a
PROPOSITIONAL relation between input and output (a case-disjunction), and proves
it equivalent to the implementation for all text. Kernel checks axiom-free.

An earlier version used BEq `==` in the `if`; `simp` on that BEq form pulled in
FORBIDDEN Classical.choice via the LawfulBEq coercion. Switching the implementation
to propositional `=` leaves `agree_read_as` depending only on [propext].

Only the single-phrase reading substitution is modeled: no global/recursive
replacement, no surrounding case conditions.

Not modelled: the underlying 第六項 time limit, other reading rules, other
paragraphs/articles, legal correctness.
-/

namespace JapanTaxLaw.CustomsTariffArt8ReadingSubstitution

/-- Independent spec: substitution as a propositional input/output relation. -/
def SpecReadAs (text result : String) : Prop :=
  (text = oldPhrase ∧ result = newPhrase) ∨
  (text ≠ oldPhrase ∧ result = text)

/-- The implementation agrees with the spec, for all text. Axiom-free.
    Case-split on PROPOSITIONAL equality (`by_cases h : text = oldPhrase`);
    `simp [h]` then reduces the propositional `if`. No BEq coercion or
    LawfulBEq instance is involved. -/
theorem agree_read_as (text : String) : SpecReadAs text (readAs text) := by
  unfold readAs SpecReadAs
  by_cases h : text = oldPhrase
  · simp [h]
  · simp [h]

/-- The two phrases are distinct (the substitution is non-trivial). -/
theorem phrases_distinct : oldPhrase ≠ newPhrase := by
  decide

end JapanTaxLaw.CustomsTariffArt8ReadingSubstitution
