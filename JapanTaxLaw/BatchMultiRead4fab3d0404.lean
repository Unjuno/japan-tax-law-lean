import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead4fab3d0404

def sourcePhraseText0 : String := "前項の他方の法人"
def replacementPhraseText0 : String := "他の内国法人"
def sourcePhraseText1 : String := "である法人"
def replacementPhraseText1 : String := "である内国法人"
def sourcePhraseText2 : String := "百分の五十以上の"
def replacementPhraseText2 : String := "百分の五十を超える"
def sourcePhraseText3 : String := "同項の一方の法人"
def replacementPhraseText3 : String := "一の内国法人"
def sourcePhraseText4 : String := "当該他方の法人"
def replacementPhraseText4 : String := "当該他の内国法人"
def sourcePhraseText5 : String := "前項の他方の法人"
def replacementPhraseText5 : String := "他の内国法人"
def sourcePhraseText6 : String := "である法人"
def replacementPhraseText6 : String := "である内国法人"
def sourcePhraseText7 : String := "同項の一方の法人"
def replacementPhraseText7 : String := "一の内国法人"
def sourcePhraseText8 : String := "以上の法人"
def replacementPhraseText8 : String := "以上の内国法人"
def sourcePhraseText9 : String := "百分の五十以上の"
def replacementPhraseText9 : String := "百分の五十を超える"
def sourcePhraseText10 : String := "当該一方の法人"
def replacementPhraseText10 : String := "当該一の内国法人"
def sourcePhraseText11 : String := "当該他方の法人"
def replacementPhraseText11 : String := "当該他の内国法人"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
  | original8 | replacement8
  | original9 | replacement9
  | original10 | replacement10
  | original11 | replacement11
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | Phrase.original6 => Phrase.replacement6
  | Phrase.original7 => Phrase.replacement7
  | Phrase.original8 => Phrase.replacement8
  | Phrase.original9 => Phrase.replacement9
  | Phrase.original10 => Phrase.replacement10
  | Phrase.original11 => Phrase.replacement11
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead4fab3d0404
