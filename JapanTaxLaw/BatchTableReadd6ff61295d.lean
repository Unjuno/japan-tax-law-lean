import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableReadd6ff61295d

def sourcePhraseText0 : String := "第六十六条の八第五項の"
def replacementPhraseText0 : String := "第六十六条の八第十一項の規定により読み替えられた同条第五項の"
def sourcePhraseText1 : String := "同条第四項の"
def replacementPhraseText1 : String := "同条第十項の"
def sourcePhraseText2 : String := "同条第五項各号に定める課税済金額（同条第四項第二号に掲げる金額をいう。以下この条において同じ。）"
def replacementPhraseText2 : String := "同条第十一項の規定により読み替えられた同条第五項各号に定める間接配当等（同条第十項第一号に掲げる金額をいう。以下この項及び第六項において同じ。）又は間接課税済金額（同条第十項第二号ロに掲げる金額をいう。以下この項及び第六項において同じ。）"
def sourcePhraseText3 : String := "の課税済金額"
def replacementPhraseText3 : String := "の間接配当等又は間接課税済金額"
def sourcePhraseText4 : String := "同項第一号"
def replacementPhraseText4 : String := "同条第十一項の規定により読み替えられた同条第五項第一号"
def sourcePhraseText5 : String := "合併等前十年内事業年度"
def replacementPhraseText5 : String := "合併等前二年内事業年度"
def sourcePhraseText6 : String := "合併等前十年内事業年度"
def replacementPhraseText6 : String := "合併等前二年内事業年度"
def sourcePhraseText7 : String := "同号"
def replacementPhraseText7 : String := "同条第十一項の規定により読み替えられた同条第五項第二号"
def sourcePhraseText8 : String := "分割等前十年内事業年度"
def replacementPhraseText8 : String := "分割等前二年内事業年度"
def sourcePhraseText9 : String := "分割等前十年内事業年度"
def replacementPhraseText9 : String := "分割等前二年内事業年度"
def sourcePhraseText10 : String := "前十年以内"
def replacementPhraseText10 : String := "前二年以内"
def sourcePhraseText11 : String := "内国法人十年前事業年度開始日"
def replacementPhraseText11 : String := "内国法人二年前事業年度開始日"
def sourcePhraseText12 : String := "合併等前十年内事業年度又は分割等前十年内事業年度"
def replacementPhraseText12 : String := "合併等前二年内事業年度又は分割等前二年内事業年度"
def sourcePhraseText13 : String := "被合併法人等前十年内事業年度"
def replacementPhraseText13 : String := "被合併法人等前二年内事業年度"
def sourcePhraseText14 : String := "被合併法人等十年前事業年度開始日"
def replacementPhraseText14 : String := "被合併法人等二年前事業年度開始日"
def sourcePhraseText15 : String := "前項"
def replacementPhraseText15 : String := "第十三項の規定により読み替えられた前項"
def sourcePhraseText16 : String := "第六十六条の八第五項第二号"
def replacementPhraseText16 : String := "第六十六条の八第十一項の規定により読み替えられた同条第五項第二号"
def sourcePhraseText17 : String := "分割等前十年内事業年度の課税済金額"
def replacementPhraseText17 : String := "分割等前二年内事業年度の間接配当等又は間接課税済金額"
def sourcePhraseText18 : String := "請求権勘案直接保有株式等（内国法人が有する外国法人の株式等の数又は金額（当該外国法人が請求権の内容が異なる株式等を発行している場合には、当該外国法人の発行済株式等に、当該内国法人が当該請求権の内容が異なる株式等に係る請求権に基づき受けることができる剰余金の配当等の額がその総額のうちに占める割合を乗じて計算した数又は金額）をいう。以下この項及び第八項において同じ。）"
def replacementPhraseText18 : String := "間接保有の株式等の数（法第六十六条の八第十項第二号イに規定する間接保有の株式等の数をいう。以下この項において同じ。）"
def sourcePhraseText19 : String := "請求権勘案直接保有株式等の"
def replacementPhraseText19 : String := "間接保有の株式等の数の"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableReadd6ff61295d
