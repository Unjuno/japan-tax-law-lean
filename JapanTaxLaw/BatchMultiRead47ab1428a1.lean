import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead47ab1428a1

def sourcePhraseText0 : String := "当該不当廉売関税の課税の回避に係る調査により判明した事実及びこれにより得られた結論"
def replacementPhraseText0 : String := "当該不当廉売関税の課税の回避に係る調査を取りやめるまでに判明した事実及び当該不当廉売関税の課税の回避に係る調査を取りやめる理由"

inductive Phrase where
  | original0 | replacement0
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead47ab1428a1
