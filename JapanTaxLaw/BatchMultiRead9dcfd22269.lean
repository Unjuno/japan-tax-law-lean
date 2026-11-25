import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead9dcfd22269

def sourcePhraseText0 : String := "同項の事業者"
def replacementPhraseText0 : String := "第六項の事業者"
def sourcePhraseText1 : String := "前項の規定"
def replacementPhraseText1 : String := "第六項の規定"
def sourcePhraseText2 : String := "一月中間申告対象期間に係る確定日"
def replacementPhraseText2 : String := "六月中間申告対象期間の末日"
def sourcePhraseText3 : String := "三月"
def replacementPhraseText3 : String := "六月"
def sourcePhraseText4 : String := "割合"
def replacementPhraseText4 : String := "割合に六を乗じた数"
def sourcePhraseText5 : String := "一月中間申告対象期間"
def replacementPhraseText5 : String := "六月中間申告対象期間"
def sourcePhraseText6 : String := "除して"
def replacementPhraseText6 : String := "除し、これにその合併の日から当該六月中間申告対象期間の末日までの期間の月数を乗じて"
def sourcePhraseText7 : String := "同項の事業者"
def replacementPhraseText7 : String := "第六項の事業者"
def sourcePhraseText8 : String := "除して"
def replacementPhraseText8 : String := "除し、これに六を乗じて"

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

end JapanTaxLaw.BatchMultiRead9dcfd22269
