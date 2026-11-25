import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead7cf895ef5e

def sourcePhraseText0 : String := "前項"
def replacementPhraseText0 : String := "第四十一条の十三の三第一項"
def sourcePhraseText1 : String := "第一項の"
def replacementPhraseText1 : String := "第四十一条の十三の三第一項の"
def sourcePhraseText2 : String := "同条第一項中"
def replacementPhraseText2 : String := "同法第十三条第一項中"
def sourcePhraseText3 : String := "第五条の二第三項"
def replacementPhraseText3 : String := "第四十一条の十三の三第十二項（振替割引債の差益金額等の課税の特例）において準用する同法第五条の二第三項"
def sourcePhraseText4 : String := "同項に規定する振替国債又は振替地方債の利子"
def replacementPhraseText4 : String := "同法第四十一条の十三の三第一項に規定する特定振替割引債の償還金"
def sourcePhraseText5 : String := "第一項の"
def replacementPhraseText5 : String := "第四十一条の十三の三第一項の"
def sourcePhraseText6 : String := "前項第四号"
def replacementPhraseText6 : String := "第四十一条の十三の三第七項第四号"
def sourcePhraseText7 : String := "第十五項"
def replacementPhraseText7 : String := "第四十一条の十三の三第十項若しくは第十一項"
def sourcePhraseText8 : String := "第七項第四号"
def replacementPhraseText8 : String := "第四十一条の十三の三第七項第四号"
def sourcePhraseText9 : String := "第一項又は"
def replacementPhraseText9 : String := "第四十一条の十三の三第一項又は"
def sourcePhraseText10 : String := "第一項に"
def replacementPhraseText10 : String := "同条第一項に"
def sourcePhraseText11 : String := "第一項"
def replacementPhraseText11 : String := "第四十一条の十三の三第一項"
def sourcePhraseText12 : String := "第一項又は第一項」とあるのは"
def replacementPhraseText12 : String := "第四十一条の十三の三第一項又は同条第一項」とあるのは"
def sourcePhraseText13 : String := "第一項」と、"
def replacementPhraseText13 : String := "第四十一条の十三の三第一項」と、"
def sourcePhraseText14 : String := "第一項の、第一項"
def replacementPhraseText14 : String := "第四十一条の十三の三第一項の、同条第一項"
def sourcePhraseText15 : String := "第一項の同項、"
def replacementPhraseText15 : String := "第四十一条の十三の三第一項の同項、同条第六項及び第十一項並びに"
def sourcePhraseText16 : String := "ついては"
def replacementPhraseText16 : String := "ついては、同条第六項中「同項に規定する特定振替機関等」とあるのは「同条第十二項において準用する同法第五条の二第十九項（振替国債等の利子の課税の特例）の規定により読み替えられた同法第四十一条の十三の三第一項に規定する特定受託者」と、同条第十一項中「適格口座管理機関又は適格外国仲介業者」とあるのは「第一項に規定する特定受託者又は適格外国仲介業者」と、「当該適格口座管理機関」とあるのは「特定振替機関」とするほか"
def sourcePhraseText17 : String := "第一項当該特定振替機関等"
def replacementPhraseText17 : String := "第四十一条の十三の三第一項当該特定振替機関等（"
def sourcePhraseText18 : String := "第十九項"
def replacementPhraseText18 : String := "第五条の二第十九項"
def sourcePhraseText19 : String := "受託者をいう。以下この条において同じ。）"
def replacementPhraseText19 : String := "受託者をいい、"
def sourcePhraseText20 : String := "の特定受託者"
def replacementPhraseText20 : String := "の特定受託者（同項に規定する特定受託者をいう。以下この条において同じ。）"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead7cf895ef5e
