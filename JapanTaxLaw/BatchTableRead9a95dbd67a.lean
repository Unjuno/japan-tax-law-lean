import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead9a95dbd67a

def sourcePhraseText0 : String := "前項に平成二十八年五月二日"
def replacementPhraseText0 : String := "第九項に平成二十九年五月一日"
def sourcePhraseText1 : String := "前項"
def replacementPhraseText1 : String := "第九項"
def sourcePhraseText2 : String := "第三項附則第二十条第四項附則第五十二条第二項"
def replacementPhraseText2 : String := "第九項附則第二十条第十項において準用する同条第四項附則第五十二条第九項において準用する同条第二項"
def sourcePhraseText3 : String := "平成二十八年九月三十日"
def replacementPhraseText3 : String := "平成二十九年十月二日"
def sourcePhraseText4 : String := "第三項同項"
def replacementPhraseText4 : String := "第九項同項及び第四項"
def sourcePhraseText5 : String := "附則第十二条第四項"
def replacementPhraseText5 : String := "附則第十二条第十項において準用する同条第四項"
def sourcePhraseText6 : String := "附則第十二条第四項平成二十八年五月二日"
def replacementPhraseText6 : String := "附則第十二条第十項において準用する同条第四項平成二十九年五月一日"
def sourcePhraseText7 : String := "附則第十二条第四項"
def replacementPhraseText7 : String := "附則第十二条第十項において準用する同条第四項"
def sourcePhraseText8 : String := "平成二十八年九月三十日"
def replacementPhraseText8 : String := "平成二十九年十月二日"
def sourcePhraseText9 : String := "附則第十二条第六項"
def replacementPhraseText9 : String := "附則第十二条第十項において準用する同条第六項"
def sourcePhraseText10 : String := "、第三項"
def replacementPhraseText10 : String := "、第九項"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead9a95dbd67a
