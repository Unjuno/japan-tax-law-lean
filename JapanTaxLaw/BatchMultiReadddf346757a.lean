import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadddf346757a

def sourcePhraseText0 : String := "属する構成会社等"
def replacementPhraseText0 : String := "係る共同支配会社等"
def sourcePhraseText1 : String := "の所在地国"
def replacementPhraseText1 : String := "及び当該共同支配会社等の所在地国"
def sourcePhraseText2 : String := "全ての構成会社等"
def replacementPhraseText2 : String := "当該共同支配会社等に係る他の共同支配会社等"
def sourcePhraseText3 : String := "全ての構成会社等"
def replacementPhraseText3 : String := "共同支配会社等及び他の共同支配会社等"
def sourcePhraseText4 : String := "属する構成会社等"
def replacementPhraseText4 : String := "係る共同支配会社等"
def sourcePhraseText5 : String := "の所在地国"
def replacementPhraseText5 : String := "及び当該共同支配会社等の所在地国"
def sourcePhraseText6 : String := "全ての構成会社等"
def replacementPhraseText6 : String := "当該共同支配会社等に係る他の共同支配会社等"
def sourcePhraseText7 : String := "全ての構成会社等"
def replacementPhraseText7 : String := "共同支配会社等及び他の共同支配会社等"

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

end JapanTaxLaw.BatchMultiReadddf346757a
