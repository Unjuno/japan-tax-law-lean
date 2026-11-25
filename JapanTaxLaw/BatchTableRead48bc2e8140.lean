import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead48bc2e8140

def sourcePhraseText0 : String := "第一項の規定にかかわらず、その"
def replacementPhraseText0 : String := "その"
def sourcePhraseText1 : String := "第一項の規定にかかわらず、当該"
def replacementPhraseText1 : String := "当該"
def sourcePhraseText2 : String := "次の"
def replacementPhraseText2 : String := "第十五条の五第一項の規定に該当しないこととなつた場合又は次の"
def sourcePhraseText3 : String := "第十五条第三項"
def replacementPhraseText3 : String := "第十五条の五第二項において読み替えて準用する第十五条第三項"

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

end JapanTaxLaw.BatchTableRead48bc2e8140
