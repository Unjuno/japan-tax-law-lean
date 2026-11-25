import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadbc352f5e0b

def sourcePhraseText0 : String := "合計輸入数量"
def replacementPhraseText0 : String := "合計輸入数量及び英国協定適用牛肉の輸入数量の合計数量"
def sourcePhraseText1 : String := "合計輸入数量"
def replacementPhraseText1 : String := "欧州連合協定適用牛肉の輸入数量"
def sourcePhraseText2 : String := "合計輸入数量"
def replacementPhraseText2 : String := "アメリカ合衆国協定第一輸入数量及びアメリカ合衆国協定第二輸入数量"
def sourcePhraseText3 : String := "合計輸入数量"
def replacementPhraseText3 : String := "欧州連合協定適用牛肉の輸入数量、英国協定適用牛肉の輸入数量及び環太平洋包括的及び先進的協定適用牛肉（英国を原産地とするものに限る。）の輸入数量の合計数量"

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

end JapanTaxLaw.BatchMultiReadbc352f5e0b
