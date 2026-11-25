import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead4e06b77900

def sourcePhraseText0 : String := "当該開始の時"
def replacementPhraseText0 : String := "次項に規定する適格組織再編成の時"
def sourcePhraseText1 : String := "当該最初に開始する事業年度の前事業年度までの"
def replacementPhraseText1 : String := "当該適格組織再編成に係る同条第三項に規定する被合併法人等の"

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

end JapanTaxLaw.BatchMultiRead4e06b77900
