import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead7f87c99f13

def sourcePhraseText0 : String := "当該申請書"
def replacementPhraseText0 : String := "担保提供関係書類（第十八項の変更担保提供関係書類提出期限延長届出書に係るものに限る。）"
def sourcePhraseText1 : String := "前項の規定による通知を受けた日の翌日から起算して二十日以内にその変更に係る"
def replacementPhraseText1 : String := "第二十一項の規定により読み替えて適用する第二項の担保提供関係書類の提出期限までにその変更に係る当該"

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

end JapanTaxLaw.BatchMultiRead7f87c99f13
