import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead636f21407d

def sourcePhraseText0 : String := "被災共用土地に係る被災区分所有家屋"
def replacementPhraseText0 : String := "特定仮換地等に対応する従前の土地である被災共用土地に係る被災区分所有家屋"
def sourcePhraseText1 : String := "被災共用土地納税義務者"
def replacementPhraseText1 : String := "特定仮換地等納税義務者"
def sourcePhraseText2 : String := "被災共用土地に係る持分の割合"
def replacementPhraseText2 : String := "特定仮換地等に対応する従前の土地である被災共用土地に係る持分の割合"
def sourcePhraseText3 : String := "第一項（前項において準用する場合を含む。）"
def replacementPhraseText3 : String := "第六項（第七項において準用する場合を含む。）の規定により読み替えて適用される第一項"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead636f21407d
