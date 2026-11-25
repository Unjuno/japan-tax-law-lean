import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReade03c6e720f

def sourcePhraseText0 : String := "又は公開等特定株式に係る雑所得の金額（"
def replacementPhraseText0 : String := "若しくは公開等特定株式に係る雑所得の金額（"
def sourcePhraseText1 : String := "又は公開等特定株式に係る譲渡所得の金額"
def replacementPhraseText1 : String := "若しくは公開等特定株式に係る譲渡所得の金額又は上場株式等に係る事業所得の金額若しくは上場株式等に係る譲渡所得の金額"
def sourcePhraseText2 : String := "及び公開等特定株式に係る譲渡所得の金額"
def replacementPhraseText2 : String := "及び公開等特定株式に係る譲渡所得の金額から控除し、なお控除しきれない損失の金額があるときは、上場株式等に係る事業所得の金額及び上場株式等に係る譲渡所得の金額"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReade03c6e720f
