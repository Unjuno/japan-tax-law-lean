import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadcc12a86638

def sourcePhraseText0 : String := "前条第一項各号"
def replacementPhraseText0 : String := "前条第一項第一号及び第三号"
def sourcePhraseText1 : String := "特定要件に従つて当該電磁的記録の備付け及び"
def replacementPhraseText1 : String := "特定要件（同項第二号ハからホまでに掲げるものに限る。）に従つて"
def sourcePhraseText2 : String := "及び次に"
def replacementPhraseText2 : String := "並びに次に"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadcc12a86638
