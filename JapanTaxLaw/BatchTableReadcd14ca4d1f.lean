import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableReadcd14ca4d1f

def sourcePhraseText0 : String := "第一項から第三項まで"
def replacementPhraseText0 : String := "第十五条の六の二第一項又は第二項"
def sourcePhraseText1 : String := "第一項から第三項まで前条第一項、第二項又は第四項"
def replacementPhraseText1 : String := "第十五条の六の二第一項又は第二項第十五条の六第一項又は同条第三項において準用する前条第四項"
def sourcePhraseText2 : String := "第十五条の三第一項第一号"
def replacementPhraseText2 : String := "第十五条の六の三第二項において準用する第十五条の三第一項第一号"
def sourcePhraseText3 : String := "次項の規定による"
def replacementPhraseText3 : String := "国税徴収法第百四十一条の規定の例により行う徴税吏員の"
def sourcePhraseText4 : String := "同項の規定による検査"
def replacementPhraseText4 : String := "同条の規定の例により行う徴税吏員の検査"
def sourcePhraseText5 : String := "又は同項の規定による"
def replacementPhraseText5 : String := "又は同条の規定の例により行う徴税吏員の"
def sourcePhraseText6 : String := "含む。同項において同じ"
def replacementPhraseText6 : String := "含む"
def sourcePhraseText7 : String := "前条第一項から第三項まで"
def replacementPhraseText7 : String := "第十五条の六の二第一項又は第二項"

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

end JapanTaxLaw.BatchTableReadcd14ca4d1f
