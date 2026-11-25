import JapanTaxLaw.TaxFinance

/-! Generated batch template for a 読替え norm.
    The quoted phrases are recorded verbatim; the whole-phrase rewrite is
    exhaustive over the declared three-constructor domain. The applicability
    trigger is caller-established and is NOT resolved by this pipeline. -/
namespace JapanTaxLaw.BatchRead35633e22ae

def sourcePhraseText : String := "日の属する年の六月一日以後"
def replacementPhraseText : String := "日以後"

inductive Phrase where
  | original | replacement | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original => Phrase.replacement
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem applies_to_quoted : applyReading Phrase.original = Phrase.replacement := by rfl
theorem leaves_replacement : applyReading Phrase.replacement = Phrase.replacement := by rfl
theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchRead35633e22ae
