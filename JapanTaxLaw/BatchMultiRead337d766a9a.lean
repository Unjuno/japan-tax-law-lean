import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead337d766a9a

def sourcePhraseText0 : String := "とし、非課税適用申告書"
def replacementPhraseText0 : String := "とし、同条第十二項第一号又は第三号に定める申告書"
def sourcePhraseText1 : String := "で、非課税適用申告書"
def replacementPhraseText1 : String := "で、これらの号に定める申告書"
def sourcePhraseText2 : String := "（非課税適用申告書"
def replacementPhraseText2 : String := "（これらの号に定める申告書"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead337d766a9a
