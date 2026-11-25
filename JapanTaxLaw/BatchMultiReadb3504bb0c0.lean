import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadb3504bb0c0

def sourcePhraseText0 : String := "同月において収納すべき航空機燃料税の収入額の見込額"
def replacementPhraseText0 : String := "同月において収納すべき航空機燃料税の収入額の見込額の五分の四に相当する額"
def sourcePhraseText1 : String := "五分の四"
def replacementPhraseText1 : String := "五分の三"
def sourcePhraseText2 : String := "同月において収納すべき航空機燃料税の収入額の見込額"
def replacementPhraseText2 : String := "同月において収納すべき航空機燃料税の収入額の見込額の五分の三に相当する額"
def sourcePhraseText3 : String := "五分の四"
def replacementPhraseText3 : String := "五分の二"
def sourcePhraseText4 : String := "同月において収納すべき航空機燃料税の収入額の見込額"
def replacementPhraseText4 : String := "同月において収納すべき航空機燃料税の収入額の見込額の五分の二に相当する額"
def sourcePhraseText5 : String := "五分の四"
def replacementPhraseText5 : String := "五分の一"
def sourcePhraseText6 : String := "同月において収納すべき航空機燃料税の収入額の見込額"
def replacementPhraseText6 : String := "同月において収納すべき航空機燃料税の収入額の見込額の五分の一に相当する額"
def sourcePhraseText7 : String := "収入額と同年の三月において収納すべき航空機燃料税の収入額の見込額の五分の四に相当する額との合算額"
def replacementPhraseText7 : String := "収入額"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | Phrase.original6 => Phrase.replacement6
  | Phrase.original7 => Phrase.replacement7
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadb3504bb0c0
