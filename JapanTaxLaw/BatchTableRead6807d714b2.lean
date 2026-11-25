import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead6807d714b2

def sourcePhraseText0 : String := "施行日から平成二十九年三月三十一日まで"
def replacementPhraseText0 : String := "平成三十年四月一日から平成三十一年三月三十一日まで"
def sourcePhraseText1 : String := "平成二十八年度分調整後付加価値額"
def replacementPhraseText1 : String := "平成三十年度分調整後付加価値額"
def sourcePhraseText2 : String := "平成二十八年度分基準法人事業税額"
def replacementPhraseText2 : String := "平成三十年度分基準法人事業税額"
def sourcePhraseText3 : String := "四分の三"
def replacementPhraseText3 : String := "四分の一"
def sourcePhraseText4 : String := "平成二十八年度分法人事業税額"
def replacementPhraseText4 : String := "平成三十年度分法人事業税額"
def sourcePhraseText5 : String := "平成二十八年度分調整後付加価値額"
def replacementPhraseText5 : String := "平成三十年度分調整後付加価値額"
def sourcePhraseText6 : String := "平成二十八年度分基準法人事業税額"
def replacementPhraseText6 : String := "平成三十年度分基準法人事業税額"
def sourcePhraseText7 : String := "額の三倍に相当する額"
def replacementPhraseText7 : String := "額"
def sourcePhraseText8 : String := "平成二十八年度分法人事業税額"
def replacementPhraseText8 : String := "平成三十年度分法人事業税額"
def sourcePhraseText9 : String := "平成二十八年度分調整後付加価値額"
def replacementPhraseText9 : String := "平成三十年度分調整後付加価値額"
def sourcePhraseText10 : String := "施行日から平成二十九年三月三十一日まで"
def replacementPhraseText10 : String := "平成三十年四月一日から平成三十一年三月三十一日まで"
def sourcePhraseText11 : String := "平成二十八年度分基準法人事業税額"
def replacementPhraseText11 : String := "平成三十年度分基準法人事業税額"
def sourcePhraseText12 : String := "四分の三"
def replacementPhraseText12 : String := "四分の一"
def sourcePhraseText13 : String := "平成二十八年度分法人事業税額"
def replacementPhraseText13 : String := "平成三十年度分法人事業税額"
def sourcePhraseText14 : String := "平成二十八年度分調整後付加価値額"
def replacementPhraseText14 : String := "平成三十年度分調整後付加価値額"
def sourcePhraseText15 : String := "平成二十八年度分基準法人事業税額"
def replacementPhraseText15 : String := "平成三十年度分基準法人事業税額"
def sourcePhraseText16 : String := "額の三倍に相当する額"
def replacementPhraseText16 : String := "額"
def sourcePhraseText17 : String := "平成二十八年度分法人事業税額"
def replacementPhraseText17 : String := "平成三十年度分法人事業税額"

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
  | original10 | replacement10
  | original11 | replacement11
  | original12 | replacement12
  | original13 | replacement13
  | original14 | replacement14
  | original15 | replacement15
  | original16 | replacement16
  | original17 | replacement17
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
  | Phrase.original10 => Phrase.replacement10
  | Phrase.original11 => Phrase.replacement11
  | Phrase.original12 => Phrase.replacement12
  | Phrase.original13 => Phrase.replacement13
  | Phrase.original14 => Phrase.replacement14
  | Phrase.original15 => Phrase.replacement15
  | Phrase.original16 => Phrase.replacement16
  | Phrase.original17 => Phrase.replacement17
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead6807d714b2
