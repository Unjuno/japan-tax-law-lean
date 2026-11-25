import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead603bc17f8b

def sourcePhraseText0 : String := "平成三年三月三十一日同表の各号）の譲渡当該各号の下欄に掲げる資産の取得を当該各号"
def replacementPhraseText0 : String := "平成三年三月三十一日（次の表の第十五号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十五号）の譲渡（租税特別措置法の一部を改正する法律（平成三年法律第十六号。以下「平成三年改正法」という。）附則第十五条第八項各号に掲げるものに該当する譲渡に限る。）同表の第十五号の下欄に掲げる資産の取得（平成三年改正法附則第十五条第八項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十五号"
def sourcePhraseText1 : String := "表の各号の譲渡当該各号の下欄に掲げる資産の取得を当該各号"
def replacementPhraseText1 : String := "表の第十五号の譲渡（平成三年改正法附則第十五条第八項各号に掲げる譲渡に該当するものに限る。）同表の第十五号の下欄に掲げる資産の取得（平成三年改正法附則第十五条第八項各号に掲げる譲渡に応じ当該各号に定める取得に限る。）を同表の第十五号"
def sourcePhraseText2 : String := "各号"
def replacementPhraseText2 : String := "第十五号"
def sourcePhraseText3 : String := "第五十二条の三第一項"
def replacementPhraseText3 : String := "第五十二条の三第一項（平成三年改正法による改正後のこれらの規定を含む。）並びに租税特別措置法の一部を改正する法律（平成五年法律第十号）による改正後の租税特別措置法第四十六条の三及び第四十六条の四並びにこれらの規定に係る同法第五十二条の三第一項並びに同法第四十二条の四第四項"
def sourcePhraseText4 : String := "第六十四条第一項第一号第六十四条第二項"
def replacementPhraseText4 : String := "平成三年改正法による改正後の租税特別措置法第六十四条第一項第一号同法第六十四条第二項"
def sourcePhraseText5 : String := "平成三年三月三十一日で同表の各号）の譲渡当該各号に掲げる資産の取得をすること係る同表の各号"
def replacementPhraseText5 : String := "平成三年三月三十一日（前条第一項の表の第十五号の上欄に掲げる資産にあつては、当該資産の譲渡の日）で同表の第十五号）の譲渡（平成三年改正法附則第十五条第八項第二号又は第三号に掲げる譲渡に該当するものに限る。）同表の第十五号に掲げる資産の取得（平成三年改正法附則第十五条第八項第二号又は第三号に掲げる譲渡に応じこれらの規定に定める取得に限る。以下この条において同じ。）をすること同号"
def sourcePhraseText6 : String := "表の各号当該各号"
def replacementPhraseText6 : String := "表の第十五号同号"
def sourcePhraseText7 : String := "表の各号"
def replacementPhraseText7 : String := "表の第十五号"
def sourcePhraseText8 : String := "平成三年三月三十一日同表の各号当該各号した場合（当該含む。）又は交換譲渡資産と交換取得資産以外の資産との交換をし、かつ、交換差金を取得した場合（以下この条において「他資産との交換の場合」という。）当該交換譲渡資産（他資産との交換の場合にあつては、交換差金に対応するものとして政令で定める部分に限る。）"
def replacementPhraseText8 : String := "平成三年三月三十一日（第六十五条の七第一項の表の第十五号の上欄に掲げる資産にあつては、当該資産の譲渡の日）同表の第十五号同号した場合（当該交換による譲渡が平成三年改正法附則第十五条第八項第二号又は第三号に掲げる譲渡に該当し、かつ、当該交換による取得が当該譲渡に応じこれらの規定に定める取得に該当する場合に限るものとし、当該含む。）当該交換譲渡資産"

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

end JapanTaxLaw.BatchTableRead603bc17f8b
