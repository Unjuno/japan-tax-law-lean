import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead49f58e7ae2

def sourcePhraseText0 : String := "平成三年十二月三十一日同表の各号ものの譲渡当該各号の下欄に掲げる資産の取得を当該各号第三十一条"
def replacementPhraseText0 : String := "平成三年十二月三十一日（次の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号ものの譲渡（租税特別措置法の一部を改正する法律（平成三年法律第十六号。以下「平成三年改正法」という。）附則第七条第十七項各号に掲げるものに該当する譲渡に限る。）同表の第十四号の下欄に掲げる資産の取得（平成三年改正法附則第七条第十七項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十四号平成三年改正法による改正後の租税特別措置法第三十一条"
def sourcePhraseText1 : String := "平成三年十二月三十一日同表の各号の譲渡当該各号の下欄に掲げる資産の取得を当該各号"
def replacementPhraseText1 : String := "平成三年十二月三十一日（第一項の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号の譲渡（平成三年改正法附則第七条第十七項各号に掲げる譲渡に該当するものに限る。）同表の第十四号の下欄に掲げる資産の取得（平成三年改正法附則第七条第十七項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十四号"
def sourcePhraseText2 : String := "平成三年十二月三十一日同表の各号の譲渡（前項に規定する政令で定めるやむを得ない事情があるため、当該翌年中に当該各号の下欄に掲げる資産の取得をすることが困難である場合において、政令で定めるところにより税務署長の承認を受けたときは、当該資産の取得をすることができるものとして、当該翌年の十二月三十一日後二年以内において当該税務署長が認定した日までの期間内。次条第二項第二号において同じ。）に当該各号の下欄に掲げる資産の取得を当該各号"
def replacementPhraseText2 : String := "平成三年十二月三十一日（第一項の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号の譲渡（平成三年改正法附則第七条第十七項第二号又は第三号に掲げる譲渡に該当するものに限る。）に同表の第十四号の下欄に掲げる資産の取得（平成三年改正法附則第七条第十七項第二号又は第三号に掲げる譲渡に応じこれらの規定に定める取得に限る。）を同表の第十四号"
def sourcePhraseText3 : String := "第三十一条第一項"
def replacementPhraseText3 : String := "平成三年改正法による改正後の租税特別措置法第三十一条第一項"
def sourcePhraseText4 : String := "表の各号"
def replacementPhraseText4 : String := "表の第十四号"
def sourcePhraseText5 : String := "並びに第十四条から第十六条まで"
def replacementPhraseText5 : String := "、第十四条から第十六条まで並びに租税特別措置法の一部を改正する法律（平成五年法律第十号）による改正後の租税特別措置法第十条第四項、第十二条の三及び第十三条の三"
def sourcePhraseText6 : String := "平成三年十二月三十一日同表の各号当該各号した場合（当該含む。）又は交換譲渡資産と交換取得資産以外の資産との交換をし、かつ、交換差金を取得した場合（以下この条において「他資産との交換の場合」という。）当該交換譲渡資産（他資産との交換の場合にあつては、交換差金に対応するものとして政令で定める部分に限る。）"
def replacementPhraseText6 : String := "平成三年十二月三十一日（第三十七条第一項の表の第十四号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十四号同号した場合（当該交換による譲渡が平成三年改正法附則第七条第十七項第二号又は第三号に掲げる譲渡に該当し、かつ、当該交換による取得が当該譲渡に応じこれらの規定に定める取得に該当する場合に限るものとし、当該含む。）当該交換譲渡資産"

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

end JapanTaxLaw.BatchTableRead49f58e7ae2
