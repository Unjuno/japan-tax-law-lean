import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead1d0f9f4b9e

def sourcePhraseText0 : String := "百分の九・八"
def replacementPhraseText0 : String := "百分の七・八"
def sourcePhraseText1 : String := "百分の九・六"
def replacementPhraseText1 : String := "百分の七・六"
def sourcePhraseText2 : String := "百分の九・四"
def replacementPhraseText2 : String := "百分の七・四"
def sourcePhraseText3 : String := "百分の九・二"
def replacementPhraseText3 : String := "百分の七・二"
def sourcePhraseText4 : String := "百分の八・二"
def replacementPhraseText4 : String := "百分の六・六"
def sourcePhraseText5 : String := "百分の七・四"
def replacementPhraseText5 : String := "百分の六・二"
def sourcePhraseText6 : String := "百分の六・六"
def replacementPhraseText6 : String := "百分の五・八"
def sourcePhraseText7 : String := "百分の五・八"
def replacementPhraseText7 : String := "百分の五・四"

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

end JapanTaxLaw.BatchMultiRead1d0f9f4b9e
