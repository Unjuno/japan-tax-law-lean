import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead778a455e0b

def sourcePhraseText0 : String := "付加価値額、資本金等の額、所得、付加価値割額、資本割額及び所得割額"
def replacementPhraseText0 : String := "所得及び所得割額"
def sourcePhraseText1 : String := "付加価値額、資本金等の額及び所得"
def replacementPhraseText1 : String := "所得"
def sourcePhraseText2 : String := "収入金額、所得、収入割額及び所得割額"
def replacementPhraseText2 : String := "所得及び所得割額"
def sourcePhraseText3 : String := "収入金額及び所得"
def replacementPhraseText3 : String := "所得"
def sourcePhraseText4 : String := "みなして、第二項又は第四項及び"
def replacementPhraseText4 : String := "みなして、"

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

end JapanTaxLaw.BatchMultiRead778a455e0b
