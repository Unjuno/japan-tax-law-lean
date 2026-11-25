import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead6c6c5c6482

def sourcePhraseText0 : String := "申告書に係る事業年度終了の日の翌日から四十五日以内"
def replacementPhraseText0 : String := "申告書の提出期限の到来する日の十五日前まで"
def sourcePhraseText1 : String := "申告書に係る事業年度終了の日の翌日から二月以内"
def replacementPhraseText1 : String := "申告書の提出期限まで"
def sourcePhraseText2 : String := "同項に"
def replacementPhraseText2 : String := "次条第八項において準用するこの項の規定による利子税のほか、第一項に"
def sourcePhraseText3 : String := "当該事業年度終了の日の翌日以後二月を経過した日から同項"
def replacementPhraseText3 : String := "同条第一項の規定により延長された当該申告書の提出期限の翌日から第一項"

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

end JapanTaxLaw.BatchMultiRead6c6c5c6482
