import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf9fb9246b8

def sourcePhraseText0 : String := "五分の四"
def replacementPhraseText0 : String := "五分の三"
def sourcePhraseText1 : String := "五分の三"
def replacementPhraseText1 : String := "五分の二"
def sourcePhraseText2 : String := "五分の四"
def replacementPhraseText2 : String := "五分の二"
def sourcePhraseText3 : String := "五分の三"
def replacementPhraseText3 : String := "五分の一"
def sourcePhraseText4 : String := "五分の四"
def replacementPhraseText4 : String := "五分の一"
def sourcePhraseText5 : String := "収入額と同年の三月において収納すべき石油ガス税の収入額の見込額の五分の三に相当する額との合算額"
def replacementPhraseText5 : String := "収入額"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadf9fb9246b8
