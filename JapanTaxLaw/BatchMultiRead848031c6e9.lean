import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead848031c6e9

def sourcePhraseText0 : String := "当該輸出した"
def replacementPhraseText0 : String := "当該廃棄した"
def sourcePhraseText1 : String := "輸出"
def replacementPhraseText1 : String := "廃棄"
def sourcePhraseText2 : String := "前条第一項第一号に規定する書類に基づいて同号イからホまでに掲げる事項を記載した書類"
def replacementPhraseText2 : String := "当該製造たばこが税関長の承認を受けて廃棄された事実を証する書類"

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

end JapanTaxLaw.BatchMultiRead848031c6e9
