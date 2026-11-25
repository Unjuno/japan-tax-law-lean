import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead6ac011f14a

def sourcePhraseText0 : String := "第三十四条第七項第一号イ"
def replacementPhraseText0 : String := "第三百十四条の二第七項第一号イ"
def sourcePhraseText1 : String := "第三十四条第七項第一号ハ"
def replacementPhraseText1 : String := "第三百十四条の二第七項第一号ハ"
def sourcePhraseText2 : String := "第三十四条第七項第二号ニ"
def replacementPhraseText2 : String := "第三百十四条の二第七項第二号ニ"
def sourcePhraseText3 : String := "同条第七項第一号"
def replacementPhraseText3 : String := "法第三百十四条の二第七項第一号"
def sourcePhraseText4 : String := "同条第七項第三号"
def replacementPhraseText4 : String := "法第三百十四条の二第七項第三号"
def sourcePhraseText5 : String := "同条第七項第四号"
def replacementPhraseText5 : String := "法第三百十四条の二第七項第四号"
def sourcePhraseText6 : String := "第三十四条第一項第五号ロ"
def replacementPhraseText6 : String := "第三百十四条の二第一項第五号ロ"
def sourcePhraseText7 : String := "第三十四条第七項第三号"
def replacementPhraseText7 : String := "第三百十四条の二第七項第三号"
def sourcePhraseText8 : String := "第三十四条第七項第一号イ"
def replacementPhraseText8 : String := "第三百十四条の二第七項第一号イ"
def sourcePhraseText9 : String := "第三十四条第七項第一号ハ"
def replacementPhraseText9 : String := "第三百十四条の二第七項第一号ハ"
def sourcePhraseText10 : String := "第三十四条第一項第五号の三"
def replacementPhraseText10 : String := "第三百十四条の二第一項第五号の三"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead6ac011f14a
