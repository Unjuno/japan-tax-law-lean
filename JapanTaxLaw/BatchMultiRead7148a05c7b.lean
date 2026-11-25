import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead7148a05c7b

def sourcePhraseText0 : String := "前項の場合"
def replacementPhraseText0 : String := "第十五項又は第十六項において準用する前項の場合"
def sourcePhraseText1 : String := "同項の移管元の"
def replacementPhraseText1 : String := "第十七項に規定する移管元の営業所の長又は同項に規定する移管元の"
def sourcePhraseText2 : String := "、前項の"
def replacementPhraseText2 : String := "、第十五項又は第十六項において準用する前項の"
def sourcePhraseText3 : String := "当該移管先の金融商品取引業者等の営業所の長"
def replacementPhraseText3 : String := "当該移管先の営業所の長又は移管先の金融商品取引業者等の営業所の長"
def sourcePhraseText4 : String := "ない場合"
def replacementPhraseText4 : String := "ない場合その他財務省令で定める場合"
def sourcePhraseText5 : String := "同項の特定口座内保管上場株式等"
def replacementPhraseText5 : String := "第十五項又は第十六項において準用する前項に規定する相続上場株式等（以下この項において「相続上場株式等"
def sourcePhraseText6 : String := "前項の"
def replacementPhraseText6 : String := "第十五項又は第十六項において準用する前項の"
def sourcePhraseText7 : String := "特定口座内保管上場株式等移管依頼書"
def replacementPhraseText7 : String := "相続上場株式等移管依頼書"
def sourcePhraseText8 : String := "特定口座内保管上場株式等"
def replacementPhraseText8 : String := "相続上場株式等"
def sourcePhraseText9 : String := "移管元の金融商品取引業者等の営業所の長"
def replacementPhraseText9 : String := "移管元の営業所の長又は移管元の金融商品取引業者等の営業所の長"
def sourcePhraseText10 : String := "直前に移管元の特定口座"
def replacementPhraseText10 : String := "直前に第十五項又は第十六項において準用する前項に規定する相続等口座（以下この項において「相続等口座"
def sourcePhraseText11 : String := "当該移管元の特定口座"
def replacementPhraseText11 : String := "当該相続等口座"
def sourcePhraseText12 : String := "移管が移管元の特定口座"
def replacementPhraseText12 : String := "移管が相続等口座"
def sourcePhraseText13 : String := "、当該移管が"
def replacementPhraseText13 : String := "、当該居住者又は恒久的施設を有する非居住者が取得した相続上場株式等のうち移管が"

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

end JapanTaxLaw.BatchMultiRead7148a05c7b
