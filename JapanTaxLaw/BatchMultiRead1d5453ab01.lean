import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead1d5453ab01

def sourcePhraseText0 : String := "当該譲渡の日の属する年の十二月三十一日までの間"
def replacementPhraseText0 : String := "次項に規定する取得期限まで"
def sourcePhraseText1 : String := "から当該譲渡の日の属する年の翌年十二月三十一日までの間"
def replacementPhraseText1 : String := "の属する年の翌年十二月三十一日まで"
def sourcePhraseText2 : String := "取得価額以下"
def replacementPhraseText2 : String := "取得価額とその取得価額の見積額との合計額以下"
def sourcePhraseText3 : String := "当該取得価額"
def replacementPhraseText3 : String := "当該合計額"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead1d5453ab01
