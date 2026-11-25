import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead37ba56a3de

def sourcePhraseText0 : String := "買換資産（政令で定めるところにより納税地の所轄税務署長にこの項の規定の適用を受ける旨の届出をした場合における当該買換資産に限る。）"
def replacementPhraseText0 : String := "買換資産"
def sourcePhraseText1 : String := "当該事業年度の確定した決算"
def replacementPhraseText1 : String := "当該買換資産の取得をした日を含む事業年度の確定した決算"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead37ba56a3de
