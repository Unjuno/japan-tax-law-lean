import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf571c91360

def sourcePhraseText0 : String := "非課税口座開設届出書"
def replacementPhraseText0 : String := "未成年者口座開設届出書"
def sourcePhraseText1 : String := "非課税口座異動届出書"
def replacementPhraseText1 : String := "未成年者口座異動届出書"
def sourcePhraseText2 : String := "非課税口座移管依頼書"
def replacementPhraseText2 : String := "未成年者口座移管依頼書"
def sourcePhraseText3 : String := "非課税口座開設者死亡届出書"
def replacementPhraseText3 : String := "未成年者口座開設者死亡届出書"
def sourcePhraseText4 : String := "非課税口座年間取引報告書"
def replacementPhraseText4 : String := "未成年者口座年間取引報告書"

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

end JapanTaxLaw.BatchMultiReadf571c91360
