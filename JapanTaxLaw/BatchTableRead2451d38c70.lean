import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead2451d38c70

def sourcePhraseText0 : String := "租税特別措置法第四十一条の八第五項第一号"
def replacementPhraseText0 : String := "租税特別措置法の一部を改正する法律（平成七年法律第五十五号）附則第十九条の規定によりなお効力を有することとされる同法による改正前の租税特別措置法第四十一条の六第五項第一号"
def sourcePhraseText1 : String := "租税特別措置法第四十一条の八第七項"
def replacementPhraseText1 : String := "租税特別措置法の一部を改正する法律（平成七年法律第五十五号）附則第十九条の規定によりなお効力を有することとされる同法による改正前の租税特別措置法第四十一条の六第七項"
def sourcePhraseText2 : String := "第四十一条の八第七項地方税法「法」係る法又は法"
def replacementPhraseText2 : String := "第四十一条の六第七項地方税法の一部を改正する法律（平成七年法律第四十号）附則第十五条の規定によりなお効力を有することとされる同法による改正前の地方税法「改正前の地方税法」係る地方税法又は改正前の地方税法"
def sourcePhraseText3 : String := "第四十一条の八第八項法"
def replacementPhraseText3 : String := "第四十一条の六第八項改正前の地方税法"
def sourcePhraseText4 : String := "第四十一条の八第九項法附則第三十五条の三第一項法第十六条第三項法第十五条の三第二項"
def replacementPhraseText4 : String := "第四十一条の六第九項改正前の地方税法附則第三十五条の三第一項地方税法第十六条第三項同法第十五条の三第二項"
def sourcePhraseText5 : String := "第四十一条の八第十項法附則第三十五条の三第一項法第十一条の四第一項"
def replacementPhraseText5 : String := "第四十一条の六第十項改正前の地方税法附則第三十五条の三第一項地方税法第十一条の四第一項"
def sourcePhraseText6 : String := "租税特別措置法施行令同令第四十一条の八第一項地方税法（昭和二十五年法律第二百二十六号）第四十一条の八第五項地方税法附則第三十五条の三第一項地方税法附則第三十五条の三第二項地方税法附則第三十五条の三及び地方税法施行令"
def replacementPhraseText6 : String := "租税特別措置法施行令の一部を改正する政令（平成七年政令第百五十八号）附則第十四条の規定によりなお効力を有することとされる同令による改正前の租税特別措置法施行令租税特別措置法施行令の一部を改正する政令附則第十四条の規定により読み替えられた同令による改正前の租税特別措置法施行令第四十一条の六第一項地方税法の一部を改正する法律（平成七年法律第四十号）附則第十五条の規定によりなお効力を有することとされる同法による改正前の地方税法（昭和二十五年法律第二百二十六号。以下この条において「改正前の地方税法」という。）第四十一条の六第五項改正前の地方税法附則第三十五条の三第一項改正前の地方税法附則第三十五条の三第二項改正前の地方税法附則第三十五条の三及び地方税法施行令の一部を改正する政令（平成七年政令第百四十二号）附則第八条の規定によりなお効力を有することとされる同令による改正前の地方税法施行令"

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

end JapanTaxLaw.BatchTableRead2451d38c70
