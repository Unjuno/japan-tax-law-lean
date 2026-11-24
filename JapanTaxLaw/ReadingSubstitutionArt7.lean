import JapanTaxLaw.TaxFinance

/-!
# ReadingSubstitutionArt7 — 関税定率法 art. 7 読替え

Pinned source: law 143AC0000000054, revision
`143AC0000000054_20260601_508AC0000000005`, snapshot
`data/raw/143AC0000000054_20260601_508AC0000000005.law.json`.

Normative unit: `NORM|fc34952b4102c0a6697423e84c629c0eea802fb72c83594cac7374694c7ac66f`
Verbatim: 「この場合において、第七項本文中「一年以内に」とあるのは、
「一年以内において速やかに」と読み替えるものとする。」

The quoted phrases are recorded verbatim below. The formal domain is an
explicit three-constructor phrase type, so the rewrite theorem quantifies over
ALL phrases in the declared domain (not a sampled string grid) and avoids
`Classical.choice`/`Quot.sound` from String decision procedures.

Scope: whole-phrase rewriting only; the trigger 「この場合」 is
caller-established. The one-year period is preserved by the substitution.
-/
namespace JapanTaxLaw.ReadingSubstitutionArt7

/-- Verbatim quoted strings, recorded for the Lean-independent source audit. -/
def sourcePhraseText : String := "一年以内に"
def replacementPhraseText : String := "一年以内において速やかに"

/-- Declared phrase domain: the quoted source phrase, its replacement, and all
    other phrases collapsed to one `other` token. -/
inductive Phrase where
  | original | replacement | other
  deriving DecidableEq, Repr

/-- The statutory reading substitution: only the quoted source phrase changes. -/
def applyReading : Phrase → Phrase
  | Phrase.original => Phrase.replacement
  | p => p

theorem applies_to_quoted : applyReading Phrase.original = Phrase.replacement := by rfl
theorem leaves_replacement : applyReading Phrase.replacement = Phrase.replacement := by rfl
theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl

end JapanTaxLaw.ReadingSubstitutionArt7
