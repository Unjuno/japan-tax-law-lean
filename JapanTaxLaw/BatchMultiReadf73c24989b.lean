import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadf73c24989b

def sourcePhraseText0 : String := "当該酒類の移出の時"
def replacementPhraseText0 : String := "当該酒類の移出の時（当該包装を当該酒類と別個に移出する場合には、当該包装の移出の時）"
def sourcePhraseText1 : String := "方法（当該酒類（財務大臣が定める見本用のものを除く。）の品目については、財務省令で定めるところにより財務大臣に届け出た方法。次項において同じ。）で表示"
def replacementPhraseText1 : String := "方法で表示"
def sourcePhraseText2 : String := "内容量"
def replacementPhraseText2 : String := "当該包装に係る酒類の内容量"
def sourcePhraseText3 : String := "当該酒類の引取り又は搬出の時"
def replacementPhraseText3 : String := "当該酒類の引取り又は搬出の時（当該包装を当該酒類と別個に引き取り、又は搬出する場合には、当該包装の引取り又は搬出の時）"
def sourcePhraseText4 : String := "並びに前項各号"
def replacementPhraseText4 : String := "、当該包装に係る酒類の内容量（粉末酒にあつては、当該粉末酒の重量）並びに前項第二号から第五号まで"

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

end JapanTaxLaw.BatchMultiReadf73c24989b
