import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadde7951c103

def sourcePhraseText0 : String := "当該公益目的事業の用"
def replacementPhraseText0 : String := "当該公益目的事業の用（政令で定める事業の用に限る。）"
def sourcePhraseText1 : String := "とし、第二号の書類を提出した公益法人等は、同号の特定買換資産を、同号の方法により管理しなければならないものとする"
def replacementPhraseText1 : String := "とする"

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

end JapanTaxLaw.BatchMultiReadde7951c103
