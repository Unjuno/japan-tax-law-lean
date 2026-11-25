import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead64eeea5ca8

def sourcePhraseText0 : String := "読み替えられる字句"
def replacementPhraseText0 : String := "読み替える字句"
def sourcePhraseText1 : String := "当該申立てに係る貨物についての認定手続が終了するまでの間当該貨物が輸入されないことにより"
def replacementPhraseText1 : String := "当該見本に係る疑義貨物が第六十九条の十一第一項第九号に掲げる貨物又は同項第九号の二若しくは第十号に掲げる貨物に該当する貨物と認定されなかつた場合に"
def sourcePhraseText2 : String := "申立てをした者（以下この条において「申立人"
def replacementPhraseText2 : String := "承認の申請をした者（以下この条において「申請者"
def sourcePhraseText3 : String := "申立人"
def replacementPhraseText3 : String := "申請者"
def sourcePhraseText4 : String := "認定手続を取りやめる"
def replacementPhraseText4 : String := "次条第二項の承認をしない"

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

end JapanTaxLaw.BatchTableRead64eeea5ca8
