import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead41cf73e750

def sourcePhraseText0 : String := "内国法人が適格合併"
def replacementPhraseText0 : String := "第六十六条の九の二第二項第二号に規定する特殊関係内国法人（以下この項において「特殊関係内国法人」という。）に係る同条第一項に規定する特殊関係株主等（以下この項において「特殊関係株主等」という。）である内国法人が適格合併"
def sourcePhraseText1 : String := "により被合併法人"
def replacementPhraseText1 : String := "により当該特殊関係内国法人に係る特殊関係株主等である被合併法人"
def sourcePhraseText2 : String := "前項"
def replacementPhraseText2 : String := "第六十六条の九の四第四項"
def sourcePhraseText3 : String := "課税済金額とみなす"
def replacementPhraseText3 : String := "課税済金額（同項第二号に掲げる金額をいう。以下この項、次項及び第十二項において同じ。）とみなす"
def sourcePhraseText4 : String := "第六十六条の六第一項"
def replacementPhraseText4 : String := "第六十六条の九の二第一項"
def sourcePhraseText5 : String := "が前項"
def replacementPhraseText5 : String := "が第六十六条の九の四第五項において準用する前項"
def sourcePhraseText6 : String := "第四項"
def replacementPhraseText6 : String := "同条第四項"
def sourcePhraseText7 : String := "、前項"
def replacementPhraseText7 : String := "、同条第五項において準用する前項"
def sourcePhraseText8 : String := "第一項から第三項まで及び第七項から第九項まで"
def replacementPhraseText8 : String := "第六十六条の九の四第一項から第三項まで"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead41cf73e750
