import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReada984aa3b2c

def sourcePhraseText0 : String := "譲渡資産の価額に"
def replacementPhraseText0 : String := "買換資産の取得価額に"
def sourcePhraseText1 : String := "金額）"
def replacementPhraseText1 : String := "金額）を控除した金額が当該収入金額のうちに占める割合を、当該譲渡資産の価額に乗じて計算した金額"
def sourcePhraseText2 : String := "百分の四十"
def replacementPhraseText2 : String := "百分の六十"
def sourcePhraseText3 : String := "百分の十"
def replacementPhraseText3 : String := "百分の九十"
def sourcePhraseText4 : String := "百分の二十五"
def replacementPhraseText4 : String := "百分の七十五"
def sourcePhraseText5 : String := "百分の三十"
def replacementPhraseText5 : String := "百分の七十"
def sourcePhraseText6 : String := "百分の四十"
def replacementPhraseText6 : String := "百分の六十"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReada984aa3b2c
