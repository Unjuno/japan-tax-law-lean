import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableReade5f40fcb32

def sourcePhraseText0 : String := "内国法人が適格合併"
def replacementPhraseText0 : String := "第六十六条の九の二第二項第二号に規定する特殊関係内国法人（以下この項において「特殊関係内国法人」という。）に係る同条第一項に規定する特殊関係株主等（以下この項において「特殊関係株主等」という。）である内国法人が適格合併"
def sourcePhraseText1 : String := "により被合併法人"
def replacementPhraseText1 : String := "により当該特殊関係内国法人に係る特殊関係株主等である被合併法人"
def sourcePhraseText2 : String := "直接保有の株式等の数の"
def replacementPhraseText2 : String := "第十項第二号イに規定する間接保有の株式等の数（以下この項において「間接保有の株式等の数」という。）の"
def sourcePhraseText3 : String := "前項"
def replacementPhraseText3 : String := "第六十六条の九の四第九項"
def sourcePhraseText4 : String := "前十年以内の各事業年度の課税済金額"
def replacementPhraseText4 : String := "前二年以内の各事業年度（同項第一号に規定する前二年以内の各事業年度をいう。次項において同じ。）の間接配当等（同条第九項第一号に掲げる金額をいう。以下この項、次項及び第十二項において同じ。）又は間接課税済金額（同条第九項第二号ロに掲げる金額をいう。以下この項、次項及び第十二項において同じ。）"
def sourcePhraseText5 : String := "合併等前十年内事業年度前十年以内"
def replacementPhraseText5 : String := "合併等前二年内事業年度前二年以内"
def sourcePhraseText6 : String := "課税済金額"
def replacementPhraseText6 : String := "間接配当等又は間接課税済金額"
def sourcePhraseText7 : String := "分割等前十年内事業年度前十年以内"
def replacementPhraseText7 : String := "分割等前二年内事業年度前二年以内"
def sourcePhraseText8 : String := "課税済金額"
def replacementPhraseText8 : String := "間接配当等又は間接課税済金額"
def sourcePhraseText9 : String := "直接保有の株式等の数"
def replacementPhraseText9 : String := "間接保有の株式等の数"
def sourcePhraseText10 : String := "第六十六条の六第一項"
def replacementPhraseText10 : String := "第六十六条の九の二第一項"
def sourcePhraseText11 : String := "が前項"
def replacementPhraseText11 : String := "が第六十六条の九の四第十項において準用する前項"
def sourcePhraseText12 : String := "第四項"
def replacementPhraseText12 : String := "同条第九項"
def sourcePhraseText13 : String := "分割等前十年内事業年度の課税済金額"
def replacementPhraseText13 : String := "分割等前二年内事業年度の間接配当等又は間接課税済金額"
def sourcePhraseText14 : String := "、前項"
def replacementPhraseText14 : String := "、同条第十項において準用する前項"
def sourcePhraseText15 : String := "前十年以内の各事業年度の課税済金額"
def replacementPhraseText15 : String := "前二年以内の各事業年度の間接配当等又は間接課税済金額"
def sourcePhraseText16 : String := "第一項から第三項まで及び第七項から第九項まで"
def replacementPhraseText16 : String := "第六十六条の九の四第六項から第八項まで"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableReade5f40fcb32
