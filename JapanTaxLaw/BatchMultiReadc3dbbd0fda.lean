import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadc3dbbd0fda

def sourcePhraseText0 : String := "二百八十七分の二百四十三又は二百八十七分の四十四"
def replacementPhraseText0 : String := "三十六分の十六又は三十六分の二十"
def sourcePhraseText1 : String := "揮発油税又は地方揮発油税"
def replacementPhraseText1 : String := "とん税又は特別とん税"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadc3dbbd0fda
