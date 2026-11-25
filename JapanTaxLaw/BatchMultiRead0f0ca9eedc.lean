import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead0f0ca9eedc

def sourcePhraseText0 : String := "前項"
def replacementPhraseText0 : String := "第八項"
def sourcePhraseText1 : String := "非課税適用申告書が同項"
def replacementPhraseText1 : String := "同項各号に定める申告書が前項"
def sourcePhraseText2 : String := "非課税適用申告書の"
def replacementPhraseText2 : String := "次項各号に定める申告書の"
def sourcePhraseText3 : String := "当該非課税適用申告書"
def replacementPhraseText3 : String := "当該各号に定める申告書"
def sourcePhraseText4 : String := "本店又は"
def replacementPhraseText4 : String := "本店若しくは"
def sourcePhraseText5 : String := "所在地"
def replacementPhraseText5 : String := "所在地又は変更後の名称及び本店若しくは主たる事務所の所在地"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | Phrase.original5 => Phrase.replacement5
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead0f0ca9eedc
