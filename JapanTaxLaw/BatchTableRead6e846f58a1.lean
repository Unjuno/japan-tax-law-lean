import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead6e846f58a1

def sourcePhraseText0 : String := "旧令"
def replacementPhraseText0 : String := "旧令第四十二条の十第三項において準用する旧令"
def sourcePhraseText1 : String := "算定額"
def replacementPhraseText1 : String := "第十項に規定する指定市算定額（次項及び第九項において「指定市算定額」という。）"
def sourcePhraseText2 : String := "第五項本文"
def replacementPhraseText2 : String := "第十項本文"
def sourcePhraseText3 : String := "都道府県が各市町村に交付すべき額を計算する場合又は第六項第一号の規定を適用して各市町村が都道府県に返還すべき額"
def replacementPhraseText3 : String := "指定市算定額"
def sourcePhraseText4 : String := "第五項本文"
def replacementPhraseText4 : String := "次項本文"
def sourcePhraseText5 : String := "各市町村に交付すべき額"
def replacementPhraseText5 : String := "同項に規定する指定市（以下この項において「指定市」という。）に指定市算定額"
def sourcePhraseText6 : String := "第六項第一号"
def replacementPhraseText6 : String := "第十一項第一号"
def sourcePhraseText7 : String := "各市町村に返還すべき額"
def replacementPhraseText7 : String := "指定市に次項ただし書に規定する指定市超過交付額"
def sourcePhraseText8 : String := "算定額"
def replacementPhraseText8 : String := "指定市算定額"

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

end JapanTaxLaw.BatchTableRead6e846f58a1
