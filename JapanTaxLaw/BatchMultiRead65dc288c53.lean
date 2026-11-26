import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead65dc288c53

def sourcePhraseText0 : String := "次に"
def replacementPhraseText0 : String := "イからニまで及びヘからタまでに"
def sourcePhraseText1 : String := "準用する規定"
def replacementPhraseText1 : String := "準用する規定（売上金額、収入金額その他の収益の額に関する規定に限る。）"
def sourcePhraseText2 : String := "同項第二号及び"
def replacementPhraseText2 : String := "「掲げる金額の"
def sourcePhraseText3 : String := "同項第二号中"
def replacementPhraseText3 : String := "「掲げる金額の"

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

end JapanTaxLaw.BatchMultiRead65dc288c53
