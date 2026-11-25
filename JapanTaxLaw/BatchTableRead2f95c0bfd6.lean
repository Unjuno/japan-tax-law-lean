import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead2f95c0bfd6

def sourcePhraseText0 : String := "読み替えられる字句"
def replacementPhraseText0 : String := "読み替える字句"
def sourcePhraseText1 : String := "税務署長等（国税庁長官、国税局長若しくは税務署長又は税関長をいう。以下第七十四条の十一（調査の終了の際の手続）までにおいて同じ。）"
def replacementPhraseText1 : String := "税関長"
def sourcePhraseText2 : String := "国税庁等又は税関"
def replacementPhraseText2 : String := "税関"
def sourcePhraseText3 : String := "（以下同条"
def replacementPhraseText3 : String := "（以下第七十四条の十一"
def sourcePhraseText4 : String := "納税義務者に対し"
def replacementPhraseText4 : String := "輸入者に対し"
def sourcePhraseText5 : String := "調査（税関の当該職員が行う調査にあつては、消費税等の課税物件の保税地域からの引取り後に行うもの又は国際観光旅客税について行うものに限る。以下同条までにおいて同じ。）"
def replacementPhraseText5 : String := "調査"
def sourcePhraseText6 : String := "第七十四条の二から第七十四条の六まで（当該職員の質問検査権）"
def replacementPhraseText6 : String := "関税法第百五条第一項第六号（税関職員の権限）"
def sourcePhraseText7 : String := "納税義務者（当該納税義務者について税務代理人がある場合には、当該税務代理人を含む。）"
def replacementPhraseText7 : String := "輸入者"
def sourcePhraseText8 : String := "税務署長等納税義務者"
def replacementPhraseText8 : String := "税関長輸入者"
def sourcePhraseText9 : String := "税務署長等"
def replacementPhraseText9 : String := "税関長"
def sourcePhraseText10 : String := "同条第三項第一号に掲げる納税義務者"
def replacementPhraseText10 : String := "輸入者"
def sourcePhraseText11 : String := "国税庁等若しくは税関"
def replacementPhraseText11 : String := "税関"
def sourcePhraseText12 : String := "国税に"
def replacementPhraseText12 : String := "関税に"
def sourcePhraseText13 : String := "税務署長等国税"
def replacementPhraseText13 : String := "税関長関税"
def sourcePhraseText14 : String := "更正決定等（第三十六条第一項（第二号に係る部分に限る。）（納税の告知）の規定による納税の告知を含む。以下この条において同じ。）"
def replacementPhraseText14 : String := "更正、決定又は賦課決定（以下この条において「更正決定等」という。）"
def sourcePhraseText15 : String := "納税義務者（第七十四条の九第三項第一号（納税義務者に対する調査の事前通知等）に掲げる納税義務者をいう。以下この条において同じ。）"
def replacementPhraseText15 : String := "輸入者"
def sourcePhraseText16 : String := "国税納税義務者"
def replacementPhraseText16 : String := "関税輸入者"
def sourcePhraseText17 : String := "納税義務者期限後申告"
def replacementPhraseText17 : String := "輸入者関税法第七条の四第一項（期限後特例申告）の規定による期限後特例申告"
def sourcePhraseText18 : String := "納税申告書"
def replacementPhraseText18 : String := "これらの申告に係る申告書"
def sourcePhraseText19 : String := "納税義務者期限後申告書の提出若しくは源泉徴収等による国税の納付"
def replacementPhraseText19 : String := "輸入者関税法第七条の四第二項に規定する期限後特例申告書の提出"
def sourcePhraseText20 : String := "第七十四条の二から第七十四条の六まで（当該職員の質問検査権）"
def replacementPhraseText20 : String := "関税法第百五条第一項第六号（税関職員の権限）"

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
  | original18 | replacement18
  | original19 | replacement19
  | original20 | replacement20
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
  | Phrase.original18 => Phrase.replacement18
  | Phrase.original19 => Phrase.replacement19
  | Phrase.original20 => Phrase.replacement20
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead2f95c0bfd6
