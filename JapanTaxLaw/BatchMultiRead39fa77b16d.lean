import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead39fa77b16d

def sourcePhraseText0 : String := "第一項又は第四項"
def replacementPhraseText0 : String := "第十二項"
def sourcePhraseText1 : String := "非課税適用申告書又は組合等届出書及び組合契約書等の写しが第一項"
def replacementPhraseText1 : String := "同項各号に定める申告書又は届出書及び組合契約書等の写しが第一項"
def sourcePhraseText2 : String := "非課税適用申告書を提出する者"
def replacementPhraseText2 : String := "次項第一号又は第三号に定める申告書を提出する者"
def sourcePhraseText3 : String := "当該非課税適用申告書"
def replacementPhraseText3 : String := "これらの号に定める申告書"
def sourcePhraseText4 : String := "氏名又は"
def replacementPhraseText4 : String := "氏名若しくは"
def sourcePhraseText5 : String := "住所（同項"
def replacementPhraseText5 : String := "住所又は変更後の氏名若しくは名称及び住所（第二項"
def sourcePhraseText6 : String := "住所並びに"
def replacementPhraseText6 : String := "住所又は変更後の氏名若しくは名称及び住所並びに"
def sourcePhraseText7 : String := "の名称"
def replacementPhraseText7 : String := "の名称又は変更後の名称"

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

end JapanTaxLaw.BatchMultiRead39fa77b16d
