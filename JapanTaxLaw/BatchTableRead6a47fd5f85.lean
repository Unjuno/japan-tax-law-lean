import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead6a47fd5f85

def sourcePhraseText0 : String := "の各課税事業年度（以下第十二項までにおいて「対象課税事業年度」という。）において、過去適用課税事業年度（当該対象課税事業年度"
def replacementPhraseText0 : String := "が合併により解散した場合又は通算法人の残余財産が確定した場合において、その合併の日以後又はその残余財産の確定の日の翌日以後に、過去適用課税事業年度（最終課税事業年度（その合併の日の前日又はその残余財産の確定の日の属する課税事業年度をいう。以下この項及び次項において同じ。）"
def sourcePhraseText1 : String := "税額控除額（当該対象課税事業年度"
def replacementPhraseText1 : String := "税額控除額（当該最終課税事業年度"
def sourcePhraseText2 : String := "超える場合には"
def replacementPhraseText2 : String := "超えるときは"
def sourcePhraseText3 : String := "を当該対象課税事業年度"
def replacementPhraseText3 : String := "を当該最終課税事業年度"
def sourcePhraseText4 : String := "の対象課税事業年度において"
def replacementPhraseText4 : String := "が合併により解散した場合又は通算法人の残余財産が確定した場合において、その合併の日以後又はその残余財産の確定の日の翌日以後に"
def sourcePhraseText5 : String := "場合には、当該対象課税事業年度"
def replacementPhraseText5 : String := "ときは、最終課税事業年度"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead6a47fd5f85
