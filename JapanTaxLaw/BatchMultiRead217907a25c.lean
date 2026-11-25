import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead217907a25c

def sourcePhraseText0 : String := "同項の保険会社等"
def replacementPhraseText0 : String := "判定対象内国法人等（同項第一号ロに規定する判定対象内国法人等をいう。以下この項及び次項において同じ。）"
def sourcePhraseText1 : String := "内国法人"
def replacementPhraseText1 : String := "外国関係会社"
def sourcePhraseText2 : String := "当該保険会社等"
def replacementPhraseText2 : String := "当該判定対象内国法人等"
def sourcePhraseText3 : String := "内国法人の法人税法"
def replacementPhraseText3 : String := "外国関係会社の法人税法"
def sourcePhraseText4 : String := "他の内国法人"
def replacementPhraseText4 : String := "外国法人"
def sourcePhraseText5 : String := "株主内国法人"
def replacementPhraseText5 : String := "株主外国法人"
def sourcePhraseText6 : String := "全部"
def replacementPhraseText6 : String := "百分の五十を超える数又は金額の株式等"
def sourcePhraseText7 : String := "保険会社等"
def replacementPhraseText7 : String := "判定対象内国法人等"
def sourcePhraseText8 : String := "当該内国法人"
def replacementPhraseText8 : String := "当該外国関係会社"
def sourcePhraseText9 : String := "内国法人に係る"
def replacementPhraseText9 : String := "外国関係会社に係る"
def sourcePhraseText10 : String := "株主内国法人"
def replacementPhraseText10 : String := "株主外国法人"
def sourcePhraseText11 : String := "保険会社等"
def replacementPhraseText11 : String := "判定対象内国法人等"
def sourcePhraseText12 : String := "の内国法人"
def replacementPhraseText12 : String := "の外国法人"
def sourcePhraseText13 : String := "出資関連内国法人"
def replacementPhraseText13 : String := "出資関連外国法人"
def sourcePhraseText14 : String := "全部"
def replacementPhraseText14 : String := "百分の五十を超える数又は金額の株式等"
def sourcePhraseText15 : String := "当該内国法人"
def replacementPhraseText15 : String := "当該外国関係会社"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead217907a25c
