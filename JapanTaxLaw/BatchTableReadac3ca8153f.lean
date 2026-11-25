import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableReadac3ca8153f

def sourcePhraseText0 : String := "同項第一号ハ"
def replacementPhraseText0 : String := "法第三百十四条の二第七項第一号ハ"
def sourcePhraseText1 : String := "第三十四条第七項第一号イ"
def replacementPhraseText1 : String := "第三百十四条の二第七項第一号イ"
def sourcePhraseText2 : String := "第三十四条第七項第一号ロ"
def replacementPhraseText2 : String := "第三百十四条の二第七項第一号ロ"
def sourcePhraseText3 : String := "第三十四条第七項第一号ハ第三十四条第一項第五号ハ"
def replacementPhraseText3 : String := "第三百十四条の二第七項第一号ハ第三百十四条の二第一項第五号ハ"
def sourcePhraseText4 : String := "同項第四号イ"
def replacementPhraseText4 : String := "法第三百十四条の二第七項第四号イ"

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

end JapanTaxLaw.BatchTableReadac3ca8153f
