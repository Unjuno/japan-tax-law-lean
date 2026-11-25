import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadb9a201bd42

def sourcePhraseText0 : String := "貸付期限（"
def replacementPhraseText0 : String := "耕作の放棄（"
def sourcePhraseText1 : String := "「貸付期限"
def replacementPhraseText1 : String := "「耕作の放棄"
def sourcePhraseText2 : String := "）が到来した"
def replacementPhraseText2 : String := "）があつた"
def sourcePhraseText3 : String := "賃借権等の消滅があつた"
def replacementPhraseText3 : String := "耕作の放棄があつた"
def sourcePhraseText4 : String := "貸付期限が到来した特定貸付農地等"
def replacementPhraseText4 : String := "耕作の放棄があつた特定貸付農地等"
def sourcePhraseText5 : String := "貸付期限が到来した"
def replacementPhraseText5 : String := "耕作の放棄があつた"

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

end JapanTaxLaw.BatchMultiReadb9a201bd42
