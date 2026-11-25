import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableReadff3bc3c9ab

def sourcePhraseText0 : String := "前二条基準年度に係る賦課期日における価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格"
def replacementPhraseText0 : String := "附則第十七条の二第一項同条第一項に規定する修正価格（以下「修正価格」という。）"
def sourcePhraseText1 : String := "前二条"
def replacementPhraseText1 : String := "附則第十七条の二第一項"
def sourcePhraseText2 : String := "第三百四十九条"
def replacementPhraseText2 : String := "附則第十七条の二第一項"
def sourcePhraseText3 : String := "土地及び家屋にあつては基準年度の価格又は第三百四十九条第二項ただし書、第三項ただし書、第四項、第五項ただし書若しくは第六項の規定により当該価格に比準するものとされる価格（以下「比準価格」と総称する。）"
def replacementPhraseText3 : String := "土地にあつては修正価格"
def sourcePhraseText4 : String := "基準年度の価格又は比準価格"
def replacementPhraseText4 : String := "修正価格"
def sourcePhraseText5 : String := "固定資産評価基準"
def replacementPhraseText5 : String := "固定資産評価基準及び附則第十七条の二第一項に規定する修正基準"
def sourcePhraseText6 : String := "土地及び家屋の基準年度の価格又は比準価格その基準年度の価格又は比準価格"
def replacementPhraseText6 : String := "土地の修正価格その修正価格"
def sourcePhraseText7 : String := "は、第三百四十九条"
def replacementPhraseText7 : String := "は、附則第十七条の二第一項"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | original5 | replacement5
  | original6 | replacement6
  | original7 | replacement7
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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableReadff3bc3c9ab
