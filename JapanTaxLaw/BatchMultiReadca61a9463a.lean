import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadca61a9463a

def sourcePhraseText0 : String := "農業の用に供する"
def replacementPhraseText0 : String := "農業の用に供し、又は当該特例農地等について次条第一項の規定により同項に規定する特定貸付けを行う"
def sourcePhraseText1 : String := "地上権等の設定"
def replacementPhraseText1 : String := "次条第一項に規定する特定貸付けに係る同項に規定する賃借権等の消滅及び地上権等の設定"
def sourcePhraseText2 : String := "場合"
def replacementPhraseText2 : String := "場合又は次条第一項の規定により同項に規定する特定貸付けを行つていない場合"
def sourcePhraseText3 : String := "供していない部分"
def replacementPhraseText3 : String := "供している部分及び当該特定貸付けを行つている部分以外の部分"

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

end JapanTaxLaw.BatchMultiReadca61a9463a
