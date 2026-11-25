import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableReadef998a3c20

def sourcePhraseText0 : String := "前二条基準年度に係る賦課期日における価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格"
def replacementPhraseText0 : String := "附則第十七条の二第一項又は第二項同条第一項に規定する修正価格（以下「修正価格」という。）又は同条第二項に規定する修正された価格（以下「修正された価格」という。）"
def sourcePhraseText1 : String := "前二条"
def replacementPhraseText1 : String := "附則第十七条の二第一項又は第二項"
def sourcePhraseText2 : String := "第三百四十九条"
def replacementPhraseText2 : String := "附則第十七条の二第一項又は第二項"
def sourcePhraseText3 : String := "土地及び家屋にあつては基準年度の価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格（以下「比準価格」と総称する。）"
def replacementPhraseText3 : String := "土地にあつては修正価格又は修正された価格"
def sourcePhraseText4 : String := "基準年度の価格又は比準価格"
def replacementPhraseText4 : String := "修正価格又は修正された価格"
def sourcePhraseText5 : String := "固定資産評価基準"
def replacementPhraseText5 : String := "固定資産評価基準及び附則第十七条の二第一項に規定する修正基準"
def sourcePhraseText6 : String := "第二年度又は第三年度において基準年度の土地又は家屋"
def replacementPhraseText6 : String := "令和八年度において附則第十七条の二第一項に規定する令和六年度の土地又は令和七年度の土地"
def sourcePhraseText7 : String := "基準年度の価格による"
def replacementPhraseText7 : String := "令和七年度分の固定資産税の課税標準の基礎となつた価格による"
def sourcePhraseText8 : String := "土地課税台帳等又は家屋課税台帳等に登録されている基準年度の価格"
def replacementPhraseText8 : String := "土地課税台帳等に登録されている令和七年度分の固定資産税の課税標準の基礎となつた価格"
def sourcePhraseText9 : String := "第二年度又は第三年度において土地課税台帳等又は家屋課税台帳等"
def replacementPhraseText9 : String := "令和八年度において土地課税台帳等"
def sourcePhraseText10 : String := "みなし、第三年度において基準年度の土地若しくは家屋又は第二年度の土地若しくは家屋に対して課する固定資産税の課税標準について比準価格による場合にあつては、土地課税台帳等又は家屋課税台帳等に登録されている当該比準価格をもつて第三年度において土地課税台帳等又は家屋課税台帳等に登録された比準価格とみなす"
def replacementPhraseText10 : String := "みなす"
def sourcePhraseText11 : String := "固定資産評価基準"
def replacementPhraseText11 : String := "固定資産評価基準及び附則第十七条の二第一項に規定する修正基準"
def sourcePhraseText12 : String := "土地及び家屋の基準年度の価格又は比準価格"
def replacementPhraseText12 : String := "土地の修正価格又は修正された価格"
def sourcePhraseText13 : String := "その基準年度の価格又は比準価格"
def replacementPhraseText13 : String := "その修正価格又は修正された価格"
def sourcePhraseText14 : String := "当該土地又は家屋について第三百四十九条第二項第一号に掲げる事情があるため同条同項ただし書、第三項ただし書又は第五項ただし書の規定の適用を受けるべきものであること"
def replacementPhraseText14 : String := "当該土地が附則第十七条の二第二項に規定する令和七年度適用土地（以下「令和七年度適用土地」という。）であつて当該令和七年度適用土地について令和八年度に係る賦課期日において第三百四十九条第二項第一号に掲げる事情があるため附則第十七条の二第二項の規定により当該令和七年度適用土地の類似土地（附則第十七条第七号に規定する類似土地をいう。以下同じ。）に係る令和七年度分の固定資産税の課税標準の基礎となつた価格に比準する価格によるべきものであること、若しくは当該土地が同項に規定する令和七年度類似適用土地（以下「令和七年度類似適用土地」という。）であつて当該令和七年度類似適用土地について令和八年度に係る賦課期日において第三百四十九条第二項第一号に掲げる事情があるため附則第十七条の二第二項の規定により当該令和七年度類似適用土地の類似土地に係る令和七年度分の固定資産税の課税標準の基礎となつた価格に比準する価格によるべきものであること、又は令和八年度分の固定資産税について当該土地が同条第一項の規定の適用を受けるべきものであること"
def sourcePhraseText15 : String := "は、第三百四十九条"
def replacementPhraseText15 : String := "は、附則第十七条の二第一項若しくは第二項"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableReadef998a3c20
