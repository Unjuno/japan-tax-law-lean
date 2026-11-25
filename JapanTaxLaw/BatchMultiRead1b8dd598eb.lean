import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead1b8dd598eb

def sourcePhraseText0 : String := "特定口座内保管上場株式等"
def replacementPhraseText0 : String := "第十五項又は第十六項において準用する第十項に規定する相続上場株式等"
def sourcePhraseText1 : String := "前項第二号イ"
def replacementPhraseText1 : String := "第十七項において準用する前項第二号イ"
def sourcePhraseText2 : String := "特定口座内保管上場株式等"
def replacementPhraseText2 : String := "第十五項又は第十六項において準用する第十項に規定する相続上場株式等"
def sourcePhraseText3 : String := "前項第二号ロ"
def replacementPhraseText3 : String := "第十七項において準用する前項第二号ロ"

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

end JapanTaxLaw.BatchMultiRead1b8dd598eb
