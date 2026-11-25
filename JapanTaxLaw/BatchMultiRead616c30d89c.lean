import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead616c30d89c

def sourcePhraseText0 : String := "当該市が新たに指定都市等となつた日"
def replacementPhraseText0 : String := "指定都市等でない市町村の区域の全部又は一部が新たに指定都市等の区域に属することとなつた日"
def sourcePhraseText1 : String := "その所在する市が新たに指定都市等となつた日"
def replacementPhraseText1 : String := "その所在する指定都市等でない市町村の区域の全部又は一部が新たに指定都市等の区域に属することとなつた日"

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

end JapanTaxLaw.BatchMultiRead616c30d89c
