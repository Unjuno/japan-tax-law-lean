import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead0b6f6ef275

def sourcePhraseText0 : String := "採掘所得金額は"
def replacementPhraseText0 : String := "第十一項に規定する残額（以下第七項までにおいて「海外採掘所得金額"
def sourcePhraseText1 : String := "前項の"
def replacementPhraseText1 : String := "第十一項の"
def sourcePhraseText2 : String := "当該採掘所得金額"
def replacementPhraseText2 : String := "当該海外採掘所得金額"
def sourcePhraseText3 : String := "前項"
def replacementPhraseText3 : String := "第十一項"
def sourcePhraseText4 : String := "採掘所得金額"
def replacementPhraseText4 : String := "海外採掘所得金額"
def sourcePhraseText5 : String := "採掘所得金額"
def replacementPhraseText5 : String := "海外採掘所得金額"
def sourcePhraseText6 : String := "前二項"
def replacementPhraseText6 : String := "前項及び第十一項"
def sourcePhraseText7 : String := "採掘所得金額"
def replacementPhraseText7 : String := "海外採掘所得金額"

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

end JapanTaxLaw.BatchMultiRead0b6f6ef275
