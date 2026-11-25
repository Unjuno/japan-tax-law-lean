import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReade0d98bb8a2

def sourcePhraseText0 : String := "規制"
def replacementPhraseText0 : String := "規制又は会員たる連合会がその会員のする規制について行う調整事業"
def sourcePhraseText1 : String := "会員たる酒類業組合"
def replacementPhraseText1 : String := "会員たる酒類業組合又は会員たる連合会の構成員たる酒類業組合"
def sourcePhraseText2 : String := "会員たる酒類業組合又はその組合員"
def replacementPhraseText2 : String := "会員たる酒類業組合、会員たる連合会、当該連合会の構成員たる酒類業組合又はこれらの酒類業組合の組合員"
def sourcePhraseText3 : String := "会員たる酒類業組合に"
def replacementPhraseText3 : String := "会員たる酒類業組合又は会員たる連合会に"
def sourcePhraseText4 : String := "会員たる酒類業組合"
def replacementPhraseText4 : String := "会員たる酒類業組合又は会員たる連合会の構成員たる酒類業組合"

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

end JapanTaxLaw.BatchMultiReade0d98bb8a2
