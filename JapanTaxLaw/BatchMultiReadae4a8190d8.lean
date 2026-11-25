import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadae4a8190d8

def sourcePhraseText0 : String := "税務署の当該職員"
def replacementPhraseText0 : String := "税務署の当該職員（税関職員が最初に発見したときは、当該発見地又は犯則物件の輸入地若しくは納税地を所轄する税関の税関職員）"
def sourcePhraseText1 : String := "国税局の当該職員"
def replacementPhraseText1 : String := "国税局の当該職員（税関職員が最初に発見したときは、当該発見地又は犯則物件の輸入地若しくは納税地を所轄する税関の税関職員）"

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

end JapanTaxLaw.BatchMultiReadae4a8190d8
