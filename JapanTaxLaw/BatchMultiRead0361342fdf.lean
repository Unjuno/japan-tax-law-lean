import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead0361342fdf

def sourcePhraseText0 : String := "同項"
def replacementPhraseText0 : String := "第一項"
def sourcePhraseText1 : String := "貸付期限から"
def replacementPhraseText1 : String := "耕作の放棄があつた日から"
def sourcePhraseText2 : String := "貸付期限が到来した"
def replacementPhraseText2 : String := "耕作の放棄があつた"
def sourcePhraseText3 : String := "部分については、"
def replacementPhraseText3 : String := "部分又は当該猶予適用者の農業の用に供した部分については、耕作の放棄及び"
def sourcePhraseText4 : String := "貸付期限"
def replacementPhraseText4 : String := "耕作の放棄があつた日"
def sourcePhraseText5 : String := "については"
def replacementPhraseText5 : String := "については、当該耕作の放棄はなかつたものとみなし"
def sourcePhraseText6 : String := "貸付期限"
def replacementPhraseText6 : String := "耕作の放棄があつた日"
def sourcePhraseText7 : String := "貸付期限（"
def replacementPhraseText7 : String := "耕作の放棄があつた日（"
def sourcePhraseText8 : String := "賃借権等の設定"
def replacementPhraseText8 : String := "耕作の放棄"
def sourcePhraseText9 : String := "貸付期限から"
def replacementPhraseText9 : String := "耕作の放棄があつた日から"
def sourcePhraseText10 : String := "貸付期限が到来した"
def replacementPhraseText10 : String := "耕作の放棄があつた"
def sourcePhraseText11 : String := "貸付期限"
def replacementPhraseText11 : String := "耕作の放棄があつた日"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead0361342fdf
