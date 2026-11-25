import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead5775cf7499

def sourcePhraseText0 : String := "平成六年度平成五年度に"
def replacementPhraseText0 : String := "市街化区域設定年度（都市計画法及び建築基準法の一部を改正する法律（平成十二年法律第七十三号）第一条の規定による改正前の都市計画法第七条第一項に規定する市街化区域及び市街化調整区域に関する都市計画又は都市計画法第七条第一項に規定する区域区分に関する都市計画が当該市町村の区域について定められたことその他の政令で定める事由の生じた日の属する年の翌年の一月一日（当該政令で定める事由の生じた日が一月一日である場合には、同日）を賦課期日とする年度をいう。以下本条において同じ。）市街化区域設定年度に"
def sourcePhraseText1 : String := "平成六年度平成七年度平成八年度平成九年度"
def replacementPhraseText1 : String := "市街化区域設定年度市街化区域設定年度の翌年度市街化区域設定年度の翌々年度市街化区域設定年度から起算して三年度を経過した年度"
def sourcePhraseText2 : String := "平成六年度平成五年度前項"
def replacementPhraseText2 : String := "市街化区域設定年度市街化区域設定年度次項において準用する前項"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead5775cf7499
