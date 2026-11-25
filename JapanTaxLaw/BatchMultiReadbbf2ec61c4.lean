import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadbbf2ec61c4

def sourcePhraseText0 : String := "氏名又は名称及び国外にある住所若しくは居所又は本店若しくは主たる事務所"
def replacementPhraseText0 : String := "名称及び本店又は主たる事務所"
def sourcePhraseText1 : String := "非居住者又は外国法人"
def replacementPhraseText1 : String := "非居住者若しくは外国法人又は次項に規定する国内金融機関等"
def sourcePhraseText2 : String := "内国法人"
def replacementPhraseText2 : String := "内国法人（次項に規定する国内金融機関等を除く。）"
def sourcePhraseText3 : String := "外国法人"
def replacementPhraseText3 : String := "外国法人並びに同項に規定する国内金融機関等"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiReadbbf2ec61c4
