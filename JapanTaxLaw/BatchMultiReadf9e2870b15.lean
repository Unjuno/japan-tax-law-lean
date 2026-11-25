import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf9e2870b15

def sourcePhraseText0 : String := "発行済株式等に"
def replacementPhraseText0 : String := "議決権（第二項第二号に規定する剰余金の配当等に関する決議に係るものに限る。以下この項において同じ。）の総数に"
def sourcePhraseText1 : String := "株式等の数又は金額と"
def replacementPhraseText1 : String := "議決権の数と"
def sourcePhraseText2 : String := "発行済株式等の全部"
def replacementPhraseText2 : String := "議決権の全部"
def sourcePhraseText3 : String := "持株割合"
def replacementPhraseText3 : String := "議決権割合"
def sourcePhraseText4 : String := "株式等の数又は金額が当該株式等の発行法人の発行済株式等"
def replacementPhraseText4 : String := "議決権の数がその総数"
def sourcePhraseText5 : String := "発行法人と"
def replacementPhraseText5 : String := "議決権に係る法人と"
def sourcePhraseText6 : String := "発行済株式等"
def replacementPhraseText6 : String := "議決権"
def sourcePhraseText7 : String := "が株式等"
def replacementPhraseText7 : String := "が議決権"
def sourcePhraseText8 : String := "持株割合"
def replacementPhraseText8 : String := "議決権割合"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadf9e2870b15
