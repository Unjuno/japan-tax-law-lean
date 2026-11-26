import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchListReadfee862f05d

def sourcePhraseText0 : String := "道府県"
def replacementPhraseText0 : String := "都"
def sourcePhraseText1 : String := "道府県民税"
def replacementPhraseText1 : String := "都民税"
def sourcePhraseText2 : String := "道府県たばこ税"
def replacementPhraseText2 : String := "都たばこ税"
def sourcePhraseText3 : String := "道府県知事"
def replacementPhraseText3 : String := "都知事"
def sourcePhraseText4 : String := "市町村"
def replacementPhraseText4 : String := "特別区"
def sourcePhraseText5 : String := "市町村民税"
def replacementPhraseText5 : String := "特別区民税"
def sourcePhraseText6 : String := "市町村たばこ税"
def replacementPhraseText6 : String := "特別区たばこ税"
def sourcePhraseText7 : String := "市町村長"
def replacementPhraseText7 : String := "特別区長"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchListReadfee862f05d
