import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadc30b353dad

def sourcePhraseText0 : String := "同号の輸出者若しくは生産者又はこれらの者が所在する協定締約国"
def replacementPhraseText0 : String := "次条第一項の輸出者又は生産者"
def sourcePhraseText1 : String := "当該貨物が環太平洋包括的及び先進的協定の規定に基づき環太平洋包括的及び先進的協定の原産品とされるもの"
def replacementPhraseText1 : String := "関税法、関税定率法その他の関税に関する法律に違反する行為"

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

end JapanTaxLaw.BatchMultiReadc30b353dad
