import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead00c191e735

def sourcePhraseText0 : String := "第二項第一号イ"
def replacementPhraseText0 : String := "第五項第一号イ"
def sourcePhraseText1 : String := "我が国における"
def replacementPhraseText1 : String := "当該共同支配会社等及び当該共同支配会社等に係る他の共同支配会社等（その所在地国が我が国であるものに限る。）の"
def sourcePhraseText2 : String := "係る当該特定多国籍企業グループ等の"
def replacementPhraseText2 : String := "係る"
def sourcePhraseText3 : String := "第八項及び第九項"
def replacementPhraseText3 : String := "第八項"
def sourcePhraseText4 : String := "これらの規定"
def replacementPhraseText4 : String := "同項"
def sourcePhraseText5 : String := "第一項第一号"
def replacementPhraseText5 : String := "第一項第二号"
def sourcePhraseText6 : String := "第八項又は第九項"
def replacementPhraseText6 : String := "第十五項において準用する第八項"
def sourcePhraseText7 : String := "第二項第一号"
def replacementPhraseText7 : String := "第五項第一号"
def sourcePhraseText8 : String := "第二項第三号"
def replacementPhraseText8 : String := "第五項第三号"
def sourcePhraseText9 : String := "第一項第一号"
def replacementPhraseText9 : String := "第一項第二号"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
  | original8 | replacement8
  | original9 | replacement9
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
  | Phrase.original7 => Phrase.replacement7
  | Phrase.original8 => Phrase.replacement8
  | Phrase.original9 => Phrase.replacement9
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead00c191e735
