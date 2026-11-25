import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReade21ce95202

def sourcePhraseText0 : String := "外国関係会社（同条第二項第一号に規定する外国関係会社をいう。以下この項において同じ。）"
def replacementPhraseText0 : String := "外国法人"
def sourcePhraseText1 : String := "外国関係会社"
def replacementPhraseText1 : String := "外国法人"
def sourcePhraseText2 : String := "居住者等"
def replacementPhraseText2 : String := "一の居住者"
def sourcePhraseText3 : String := "いい、当該発行法人と居住者又は内国法人との間に実質支配関係がある場合には、零とする"
def replacementPhraseText3 : String := "いう"
def sourcePhraseText4 : String := "外国関係会社"
def replacementPhraseText4 : String := "外国法人"
def sourcePhraseText5 : String := "居住者等"
def replacementPhraseText5 : String := "一の居住者"

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

end JapanTaxLaw.BatchMultiReade21ce95202
