import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead3d29273557

def sourcePhraseText0 : String := "第二項第一号イ"
def replacementPhraseText0 : String := "第四項第一号イ"
def sourcePhraseText1 : String := "構成会社等の所在地国における"
def replacementPhraseText1 : String := "共同支配会社等及び当該共同支配会社等に係る当該所在地国を所在地国とする他の共同支配会社等の"
def sourcePhraseText2 : String := "係る当該特定多国籍企業グループ等の"
def replacementPhraseText2 : String := "係る"
def sourcePhraseText3 : String := "第六項から第九項までの規定"
def replacementPhraseText3 : String := "第六項から第八項までの規定"
def sourcePhraseText4 : String := "ついて第六項から第九項まで"
def replacementPhraseText4 : String := "ついて第十四項において準用する第六項から第八項まで"
def sourcePhraseText5 : String := "第二項第一号"
def replacementPhraseText5 : String := "第四項第一号"
def sourcePhraseText6 : String := "第二項第三号若しくは"
def replacementPhraseText6 : String := "第四項第三号若しくは"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | Phrase.original6 => Phrase.replacement6
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead3d29273557
