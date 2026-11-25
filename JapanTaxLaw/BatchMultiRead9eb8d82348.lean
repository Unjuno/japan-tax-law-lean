import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead9eb8d82348

def sourcePhraseText0 : String := "特定株式の払込みによる取得の後当該取得の日の属する年十二月三十一日まで"
def replacementPhraseText0 : String := "第十二項に規定する適用年の翌年一月一日から同項の特例適用控除対象特定株式の同項に規定する譲渡をした日まで"
def sourcePhraseText1 : String := "取得後期間"
def replacementPhraseText1 : String := "譲渡前期間"
def sourcePhraseText2 : String := "当該特定株式"
def replacementPhraseText2 : String := "当該特例適用控除対象特定株式"
def sourcePhraseText3 : String := "第三項各号に掲げる数及び前項に規定する取得をした特定株式の数"
def replacementPhraseText3 : String := "第十二項第二号イ及びロに定める金額"
def sourcePhraseText4 : String := "当該分割又は併合の前にされたこれらの規定に規定する取得並びに譲渡及び贈与に係る株式の数"
def replacementPhraseText4 : String := "同号イ及びロに規定する控除対象特定株式数"
def sourcePhraseText5 : String := "当該取得並びに譲渡及び贈与がされた株式の数"
def replacementPhraseText5 : String := "当該控除対象特定株式数"
def sourcePhraseText6 : String := "当該取得又は譲渡若しくは贈与がされた後の"
def replacementPhraseText6 : String := "当該譲渡前期間内における"
def sourcePhraseText7 : String := "特定株式の払込みによる取得後期間内に、当該特定株式"
def replacementPhraseText7 : String := "譲渡前期間内に、第十二項の特例適用控除対象特定株式"
def sourcePhraseText8 : String := "当該特定株式と"
def replacementPhraseText8 : String := "当該特例適用控除対象特定株式と"
def sourcePhraseText9 : String := "第三項各号に掲げる数及び第四項に規定する取得をした特定株式の数"
def replacementPhraseText9 : String := "第十二項第二号イ及びロに定める金額"
def sourcePhraseText10 : String := "当該株式無償割当ての前にされたこれらの規定に規定する取得並びに譲渡及び贈与に係る株式の数"
def replacementPhraseText10 : String := "同号イ及びロに規定する控除対象特定株式数"
def sourcePhraseText11 : String := "当該取得並びに譲渡及び贈与がされた株式の数"
def replacementPhraseText11 : String := "当該控除対象特定株式数"
def sourcePhraseText12 : String := "（取得後期間"
def replacementPhraseText12 : String := "（譲渡前期間"
def sourcePhraseText13 : String := "当該取得又は譲渡若しくは贈与がされた後の"
def replacementPhraseText13 : String := "当該譲渡前期間内における"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead9eb8d82348
