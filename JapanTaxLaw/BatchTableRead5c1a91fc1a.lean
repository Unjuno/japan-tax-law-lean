import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead5c1a91fc1a

def sourcePhraseText0 : String := "道府県知事"
def replacementPhraseText0 : String := "市町村長"
def sourcePhraseText1 : String := "第五十五条第一項当該道府県民税"
def replacementPhraseText1 : String := "第三百二十一条の十一第一項当該市町村民税"
def sourcePhraseText2 : String := "第五十五条第二項"
def replacementPhraseText2 : String := "第三百二十一条の十一第二項"
def sourcePhraseText3 : String := "道府県内"
def replacementPhraseText3 : String := "市町村内"
def sourcePhraseText4 : String := "第五十三条第一項"
def replacementPhraseText4 : String := "第三百二十一条の八第一項"
def sourcePhraseText5 : String := "道府県民税に"
def replacementPhraseText5 : String := "市町村民税に"
def sourcePhraseText6 : String := "道府県民税額"
def replacementPhraseText6 : String := "市町村民税額"
def sourcePhraseText7 : String := "道府県知事"
def replacementPhraseText7 : String := "市町村長"
def sourcePhraseText8 : String := "道府県知事"
def replacementPhraseText8 : String := "市町村長"
def sourcePhraseText9 : String := "道府県知事"
def replacementPhraseText9 : String := "市町村長"
def sourcePhraseText10 : String := "第五十六条第二項又は第六十四条"
def replacementPhraseText10 : String := "第三百二十一条の十二第二項又は第三百二十六条"
def sourcePhraseText11 : String := "第五十三条第一項"
def replacementPhraseText11 : String := "第三百二十一条の八第一項"
def sourcePhraseText12 : String := "道府県民税額"
def replacementPhraseText12 : String := "市町村民税額"
def sourcePhraseText13 : String := "道府県民税額第五十三条第三十四項"
def replacementPhraseText13 : String := "市町村民税額第三百二十一条の八第三十四項"
def sourcePhraseText14 : String := "第五十六条"
def replacementPhraseText14 : String := "第三百二十一条の十二"
def sourcePhraseText15 : String := "道府県知事"
def replacementPhraseText15 : String := "市町村長"
def sourcePhraseText16 : String := "第五十三条第一項又は"
def replacementPhraseText16 : String := "第三百二十一条の八第一項又は"
def sourcePhraseText17 : String := "道府県民税の法第五十三条第一項の規定による申告書の提出期限後"
def replacementPhraseText17 : String := "市町村民税の法第三百二十一条の八第一項の規定による申告書の提出期限後"
def sourcePhraseText18 : String := "第五十五条第二項道府県民税の法第五十三条第一項"
def replacementPhraseText18 : String := "第三百二十一条の十一第二項市町村民税の法第三百二十一条の八第一項"
def sourcePhraseText19 : String := "道府県民税の法第五十三条第一項"
def replacementPhraseText19 : String := "市町村民税の法第三百二十一条の八第一項"
def sourcePhraseText20 : String := "第五十五条第二項"
def replacementPhraseText20 : String := "第三百二十一条の十一第二項"
def sourcePhraseText21 : String := "道府県知事"
def replacementPhraseText21 : String := "市町村長"
def sourcePhraseText22 : String := "道府県民税で"
def replacementPhraseText22 : String := "市町村民税で"
def sourcePhraseText23 : String := "道府県民税額"
def replacementPhraseText23 : String := "市町村民税額"
def sourcePhraseText24 : String := "道府県知事"
def replacementPhraseText24 : String := "市町村長"

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
  | original21 | replacement21
  | original22 | replacement22
  | original23 | replacement23
  | original24 | replacement24
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
  | Phrase.original21 => Phrase.replacement21
  | Phrase.original22 => Phrase.replacement22
  | Phrase.original23 => Phrase.replacement23
  | Phrase.original24 => Phrase.replacement24
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead5c1a91fc1a
