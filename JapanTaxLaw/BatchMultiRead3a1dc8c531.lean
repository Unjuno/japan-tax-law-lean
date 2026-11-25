import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead3a1dc8c531

def sourcePhraseText0 : String := "相続に係る被相続人"
def replacementPhraseText0 : String := "分割をした法人"
def sourcePhraseText1 : String := "相続人が領収した"
def replacementPhraseText1 : String := "分割により事業を承継した法人が領収した"
def sourcePhraseText2 : String := "その相続人"
def replacementPhraseText2 : String := "その分割により事業を承継した法人"
def sourcePhraseText3 : String := "当該相続に係る全ての相続人"
def replacementPhraseText3 : String := "当該分割により事業を承継した全ての法人"

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

end JapanTaxLaw.BatchMultiRead3a1dc8c531
