import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead68d42bf527

def sourcePhraseText0 : String := "その支払の確定した前号"
def replacementPhraseText0 : String := "その年中に支払の確定した前号"
def sourcePhraseText1 : String := "、その"
def replacementPhraseText1 : String := "、その年中に"
def sourcePhraseText2 : String := "その支払の確定した"
def replacementPhraseText2 : String := "その年中に支払の確定した"
def sourcePhraseText3 : String := "、その"
def replacementPhraseText3 : String := "、その年中に"

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

end JapanTaxLaw.BatchMultiRead68d42bf527
