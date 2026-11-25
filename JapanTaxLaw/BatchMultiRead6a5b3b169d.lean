import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead6a5b3b169d

def sourcePhraseText0 : String := "その取得の日の"
def replacementPhraseText0 : String := "次項各号に掲げる場合に該当することとなつた日の"
def sourcePhraseText1 : String := "取得の日から"
def replacementPhraseText1 : String := "該当することとなつた日から"
def sourcePhraseText2 : String := "日（当該"
def replacementPhraseText2 : String := "日（"
def sourcePhraseText3 : String := "当該届出書等を提出した者に対し第四項"
def replacementPhraseText3 : String := "第二項第一号の特定取引を行つた者に対し第三項"
def sourcePhraseText4 : String := "異動届出書の提出の"
def replacementPhraseText4 : String := "届出書の提出及び書類の提示の"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead6a5b3b169d
