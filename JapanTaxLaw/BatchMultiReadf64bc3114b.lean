import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf64bc3114b

def sourcePhraseText0 : String := "符号Ｄ"
def replacementPhraseText0 : String := "符号Ｆ"
def sourcePhraseText1 : String := "０．０１０５"
def replacementPhraseText1 : String := "０．０１２２５"
def sourcePhraseText2 : String := "０．００７"
def replacementPhraseText2 : String := "０．０１０５"
def sourcePhraseText3 : String := "０．００３５"
def replacementPhraseText3 : String := "０．００７"
def sourcePhraseText4 : String := "０．００４６７"
def replacementPhraseText4 : String := "０．００９３３"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadf64bc3114b
