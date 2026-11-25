import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadbc46dd56ad

def sourcePhraseText0 : String := "同条第六項本文（同条第七項の規定により適用する場合を含む。）"
def replacementPhraseText0 : String := "同条第八項（同条第九項において準用する場合を含む。）"
def sourcePhraseText1 : String := "同項各号に掲げる場合に該当することとなつた日"
def replacementPhraseText1 : String := "同条第八項又は第九項に規定する譲渡若しくは決済又は限定相続等による移転の日"

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

end JapanTaxLaw.BatchMultiReadbc46dd56ad
