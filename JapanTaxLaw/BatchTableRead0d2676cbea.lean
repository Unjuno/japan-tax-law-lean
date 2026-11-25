import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead0d2676cbea

def sourcePhraseText0 : String := "第三十五条"
def replacementPhraseText0 : String := "第三十七条第一項において準用する法第三十五条"
def sourcePhraseText1 : String := "第三十五条"
def replacementPhraseText1 : String := "第三十七条第一項において準用する法第三十五条"
def sourcePhraseText2 : String := "法人税に係る延滞税は、租税特別措置法第六十六条の四第一項"
def replacementPhraseText2 : String := "所得税に係る延滞税又は法人税に係る延滞税は、租税特別措置法第四十条の三の三第一項若しくは第六十六条の四の三第一項又は第四十一条の十九の五第一項若しくは第六十七条の十八第一項"
def sourcePhraseText3 : String := "納付すべき法人税の"
def replacementPhraseText3 : String := "納付すべき所得税の額又は法人税の"
def sourcePhraseText4 : String := "から同項"
def replacementPhraseText4 : String := "からこれら"
def sourcePhraseText5 : String := "、同項"
def replacementPhraseText5 : String := "、租税特別措置法第六十六条の四の三第一項又は第六十七条の十八第一項"
def sourcePhraseText6 : String := "第三十六条第一項に規定する法人税の額及び"
def replacementPhraseText6 : String := "第三十七条第一項において準用する法第三十六条第一項に規定する所得税の額又は法人税の額及び"
def sourcePhraseText7 : String := "当該法人税"
def replacementPhraseText7 : String := "当該所得税の額又は法人税"
def sourcePhraseText8 : String := "第三十六条第一項"
def replacementPhraseText8 : String := "第三十七条第一項において準用する法第三十六条第一項"
def sourcePhraseText9 : String := "第六十六条の四第一項"
def replacementPhraseText9 : String := "第四十条の三の三第一項若しくは第六十六条の四の三第一項又は第四十一条の十九の五第一項若しくは第六十七条の十八第一項"
def sourcePhraseText10 : String := "同条第二十七項第一号"
def replacementPhraseText10 : String := "同法第四十条の三の三第二十二項第一号若しくは同法第六十六条の四の三第十四項において準用する同法第六十六条の四第二十七項第一号又は同法第四十一条の十九の五第十三項において準用する同法第四十条の三の三第二十二項第一号若しくは同法第六十七条の十八第十三項において準用する同法第六十六条の四第二十七項第一号"
def sourcePhraseText11 : String := "法人税の額（"
def replacementPhraseText11 : String := "所得税の額又は法人税の額（"
def sourcePhraseText12 : String := "更正決定に係る法人税の額"
def replacementPhraseText12 : String := "更正決定に係る所得税の額又は法人税の額"
def sourcePhraseText13 : String := "法人税の額に"
def replacementPhraseText13 : String := "所得税の額又は法人税の額に"
def sourcePhraseText14 : String := "猶予対象以外の法人税の額"
def replacementPhraseText14 : String := "猶予対象以外の所得税の額又は法人税の額"
def sourcePhraseText15 : String := "更正決定に係る法人税の額"
def replacementPhraseText15 : String := "更正決定に係る所得税の額又は法人税の額"
def sourcePhraseText16 : String := "猶予対象以外の法人税の額"
def replacementPhraseText16 : String := "猶予対象以外の所得税の額又は法人税の額"
def sourcePhraseText17 : String := "第三十六条第一項"
def replacementPhraseText17 : String := "第三十七条第一項において準用する法第三十六条第一項"
def sourcePhraseText18 : String := "第六十六条の四第一項"
def replacementPhraseText18 : String := "第六十六条の四の三第一項又は第六十七条の十八第一項"
def sourcePhraseText19 : String := "同条第二十七項第三号"
def replacementPhraseText19 : String := "同法第六十六条の四の三第十四項において準用する同法第六十六条の四第二十七項第三号又は同法第六十七条の十八第十三項において準用する同法第六十六条の四第二十七項第三号"
def sourcePhraseText20 : String := "第三十六条第一項に規定する確認"
def replacementPhraseText20 : String := "第三十七条第一項において準用する法第三十六条第一項に規定する確認"
def sourcePhraseText21 : String := "法人税"
def replacementPhraseText21 : String := "所得税又は法人税"
def sourcePhraseText22 : String := "第三十六条第一項"
def replacementPhraseText22 : String := "第三十七条第一項において準用する法第三十六条第一項"
def sourcePhraseText23 : String := "法人税の額及び"
def replacementPhraseText23 : String := "所得税の額又は法人税の額及び"

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
  | original16 | replacement16
  | original17 | replacement17
  | original18 | replacement18
  | original19 | replacement19
  | original20 | replacement20
  | original21 | replacement21
  | original22 | replacement22
  | original23 | replacement23
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
  | Phrase.original16 => Phrase.replacement16
  | Phrase.original17 => Phrase.replacement17
  | Phrase.original18 => Phrase.replacement18
  | Phrase.original19 => Phrase.replacement19
  | Phrase.original20 => Phrase.replacement20
  | Phrase.original21 => Phrase.replacement21
  | Phrase.original22 => Phrase.replacement22
  | Phrase.original23 => Phrase.replacement23
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead0d2676cbea
