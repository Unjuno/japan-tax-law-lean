import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead9f7d1f37df

def sourcePhraseText0 : String := "道府県知事"
def replacementPhraseText0 : String := "都知事"
def sourcePhraseText1 : String := "道府県民税"
def replacementPhraseText1 : String := "都民税"
def sourcePhraseText2 : String := "道府県知事"
def replacementPhraseText2 : String := "都知事"
def sourcePhraseText3 : String := "道府県民税"
def replacementPhraseText3 : String := "都民税"
def sourcePhraseText4 : String := "市町村民税"
def replacementPhraseText4 : String := "特別区民税"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead9f7d1f37df
