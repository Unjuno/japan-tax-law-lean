import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead8c093ed52d

def sourcePhraseText0 : String := "輸出申告若しくは輸入申告に係る"
def replacementPhraseText0 : String := "輸入の許可を受けた"
def sourcePhraseText1 : String := "若しくは売渡人"
def replacementPhraseText1 : String := "又は売渡人"
def sourcePhraseText2 : String := "が輸出申告若しくは輸入申告の内容を確認するために必要な書類又は"
def replacementPhraseText2 : String := "に対して当該貨物に係る輸入の許可に関する申告の内容を明らかにすることができる書類及び"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead8c093ed52d
