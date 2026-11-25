import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead2ce259c16c

def sourcePhraseText0 : String := "その満たさない"
def replacementPhraseText0 : String := "当該各号に掲げる場合に該当する"
def sourcePhraseText1 : String := "同項"
def replacementPhraseText1 : String := "第一項"
def sourcePhraseText2 : String := "第五項"
def replacementPhraseText2 : String := "第九項"
def sourcePhraseText3 : String := "特例適用申告書が同項"
def replacementPhraseText3 : String := "同項各号に定める申告書が第五項"
def sourcePhraseText4 : String := "当該特例適用申告書"
def replacementPhraseText4 : String := "当該各号に定める申告書"
def sourcePhraseText5 : String := "特例適用申告書を"
def replacementPhraseText5 : String := "次項各号に定める申告書を"
def sourcePhraseText6 : String := "当該特例適用申告書"
def replacementPhraseText6 : String := "当該各号に定める申告書"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead2ce259c16c
