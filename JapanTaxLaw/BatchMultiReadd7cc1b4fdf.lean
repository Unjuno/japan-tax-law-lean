import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiReadd7cc1b4fdf

def sourcePhraseText0 : String := "主たる事務所の所在地"
def replacementPhraseText0 : String := "本店又は主たる事務所の所在地（当該引継法人等が個人である場合には、当該引継法人等の納税地）"
def sourcePhraseText1 : String := "主たる事務所の所在地"
def replacementPhraseText1 : String := "本店又は主たる事務所の所在地（当該受贈公益法人等が個人である場合には、当該受贈公益法人等の納税地）"
def sourcePhraseText2 : String := "主たる事務所の所在地"
def replacementPhraseText2 : String := "本店又は主たる事務所の所在地（当該引継受託者が個人である場合には、当該引継受託者の納税地）"

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

end JapanTaxLaw.BatchMultiReadd7cc1b4fdf
