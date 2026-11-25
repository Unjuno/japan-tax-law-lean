import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf771bd2032

def sourcePhraseText0 : String := "輸入申告書"
def replacementPhraseText0 : String := "特例申告書"
def sourcePhraseText1 : String := "同項第三号"
def replacementPhraseText1 : String := "次条第一項第十一号"
def sourcePhraseText2 : String := "第四号"
def replacementPhraseText2 : String := "第十二号"
def sourcePhraseText3 : String := "第一項第三号又は第四号"
def replacementPhraseText3 : String := "次条第一項第十一号又は第十二号"

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

end JapanTaxLaw.BatchMultiReadf771bd2032
