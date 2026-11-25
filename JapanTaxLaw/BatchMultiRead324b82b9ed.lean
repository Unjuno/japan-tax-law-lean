import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead324b82b9ed

def sourcePhraseText0 : String := "欠損金額に係る事業年度"
def replacementPhraseText0 : String := "災害損失欠損金額（第十一項に規定する災害損失欠損金額をいう。以下第八項までにおいて同じ。）に係る事業年度又は中間期間"
def sourcePhraseText1 : String := "前一年"
def replacementPhraseText1 : String := "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）"
def sourcePhraseText2 : String := "欠損金額に係る事業年度"
def replacementPhraseText2 : String := "災害損失欠損金額に係る事業年度又は中間期間"
def sourcePhraseText3 : String := "前一年"
def replacementPhraseText3 : String := "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）"
def sourcePhraseText4 : String := "当該確定申告書"
def replacementPhraseText4 : String := "当該各事業年度に係る確定申告書又は当該中間期間に係る仮決算の中間申告書"
def sourcePhraseText5 : String := "欠損金額に係る事業年度"
def replacementPhraseText5 : String := "災害損失欠損金額に係る事業年度又は中間期間"
def sourcePhraseText6 : String := "前一年"
def replacementPhraseText6 : String := "前一年（当該欠損事業年度に係る確定申告書又は仮決算の中間申告書が青色申告書である場合には、前二年）"
def sourcePhraseText7 : String := "連続して青色申告書である"
def replacementPhraseText7 : String := "連続して"
def sourcePhraseText8 : String := "連続して青色申告書である"
def replacementPhraseText8 : String := "連続して"

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

end JapanTaxLaw.BatchMultiRead324b82b9ed
