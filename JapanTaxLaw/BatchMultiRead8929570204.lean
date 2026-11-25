import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead8929570204

def sourcePhraseText0 : String := "同項の事業者"
def replacementPhraseText0 : String := "第四項の事業者"
def sourcePhraseText1 : String := "前項の規定"
def replacementPhraseText1 : String := "第四項の規定"
def sourcePhraseText2 : String := "一月中間申告対象期間に係る確定日"
def replacementPhraseText2 : String := "三月中間申告対象期間の末日"
def sourcePhraseText3 : String := "割合"
def replacementPhraseText3 : String := "割合に三を乗じた数"
def sourcePhraseText4 : String := "一月中間申告対象期間"
def replacementPhraseText4 : String := "三月中間申告対象期間"
def sourcePhraseText5 : String := "除して"
def replacementPhraseText5 : String := "除し、これにその合併の日から当該三月中間申告対象期間の末日までの期間の月数（当該月数が三を超えるときは、三）を乗じて"
def sourcePhraseText6 : String := "同項の事業者"
def replacementPhraseText6 : String := "第四項の事業者"
def sourcePhraseText7 : String := "除して"
def replacementPhraseText7 : String := "除し、これに三を乗じて"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead8929570204
