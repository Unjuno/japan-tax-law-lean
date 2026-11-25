import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead1e7b4805b8

def sourcePhraseText0 : String := "代表者の氏名"
def replacementPhraseText0 : String := "代表者の氏名及び法第百四十一条各号（課税標準）に定める国内源泉所得に係る事業又は資産の経営又は管理の責任者の氏名"
def sourcePhraseText1 : String := "その資産"
def replacementPhraseText1 : String := "法第百四十一条各号（課税標準）に定める国内源泉所得に係る所得（以下この章において「国内源泉所得に係る所得」という。）に関連する資産"
def sourcePhraseText2 : String := "取引"
def replacementPhraseText2 : String := "取引（恒久的施設を有する外国法人にあつては、法第百三十八条第一項第一号（国内源泉所得）に規定する内部取引に該当するものを含む。以下この章において同じ。）"
def sourcePhraseText3 : String := "全ての取引"
def replacementPhraseText3 : String := "国内源泉所得に係る所得に影響を及ぼす全ての取引"
def sourcePhraseText4 : String := "貸借対照表及び損益計算書"
def replacementPhraseText4 : String := "法第百四十一条各号（課税標準）に定める国内源泉所得に係る貸借対照表及び損益計算書（国内及び国外にわたつて船舶又は航空機による運送の事業を行う青色申告法人にあつては、当該貸借対照表及び損益計算書のほか、当該事業の全体に係る貸借対照表及び損益計算書とする。）"
def sourcePhraseText5 : String := "書類にあつては、当該納税地又は同号の取引に係る国内の事務所、事業所その他これらに準ずるものの所在地）に保存しなければならない"
def replacementPhraseText5 : String := "書類のうち同号の取引に係る事務所、事業所その他これらに準ずるもの（以下この項において「事務所等」という。）の所在地に保存することがその青色申告法人が行う事業の内容及び実態等に照らして合理的と認められるものについては、当該取引に係る事務所等の所在地）に保存しなければならない。この場合において、第一号又は第二号に掲げる帳簿書類のうち納税地に保存することを困難とする相当の理由があると認められるものについては、当該帳簿書類の写しを納税地に保存していることをもつて当該帳簿書類を納税地に保存しているものとみなす"
def sourcePhraseText6 : String := "資産"
def replacementPhraseText6 : String := "国内源泉所得に係る所得に関連する資産"
def sourcePhraseText7 : String := "貸借対照表及び損益計算書"
def replacementPhraseText7 : String := "法第百四十一条各号（課税標準）に定める国内源泉所得に係る貸借対照表及び損益計算書（国内及び国外にわたつて船舶又は航空機による運送の事業を行う青色申告法人にあつては、当該貸借対照表及び損益計算書のほか、当該事業の全体に係る貸借対照表及び損益計算書とする。）"
def sourcePhraseText8 : String := "書類"
def replacementPhraseText8 : String := "書類で国内源泉所得に係る所得に影響を及ぼす一切のもの"
def sourcePhraseText9 : String := "取引"
def replacementPhraseText9 : String := "国内源泉所得に係る所得に影響を及ぼす一切の取引"
def sourcePhraseText10 : String := "ものはその写し"
def replacementPhraseText10 : String := "ものはその写し並びに第六十二条の三第一号（内部取引に関する書類）に掲げる書類又はその写し"
def sourcePhraseText11 : String := "第七十四条第一項"
def replacementPhraseText11 : String := "第百四十四条の六第一項又は第二項"
def sourcePhraseText12 : String := "第七十五条の二第一項"
def replacementPhraseText12 : String := "第百四十四条の八（確定申告書の提出期限の延長の特例）において準用する法第七十五条の二第一項"
def sourcePhraseText13 : String := "代表者の氏名"
def replacementPhraseText13 : String := "代表者の氏名及び法第百四十一条各号（課税標準）に定める国内源泉所得に係る事業又は資産の経営又は管理の責任者の氏名"

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

end JapanTaxLaw.BatchTableRead1e7b4805b8
