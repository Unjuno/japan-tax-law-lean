import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead787ca5e228

def sourcePhraseText0 : String := "構成会社等（"
def replacementPhraseText0 : String := "共同支配会社等（"
def sourcePhraseText1 : String := "を他の構成会社等"
def replacementPhraseText1 : String := "を当該対象各種投資会社等に係る他の共同支配会社等"
def sourcePhraseText2 : String := "他の構成会社等"
def replacementPhraseText2 : String := "当該対象各種投資会社等に係る他の共同支配会社等"
def sourcePhraseText3 : String := "構成会社等"
def replacementPhraseText3 : String := "共同支配会社等"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead787ca5e228
