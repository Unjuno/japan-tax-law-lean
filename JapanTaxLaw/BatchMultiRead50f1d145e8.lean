import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchMultiRead50f1d145e8

def sourcePhraseText0 : String := "前年度の四月一日"
def replacementPhraseText0 : String := "前々年度の四月一日"
def sourcePhraseText1 : String := "当該実人員の合計数が、前々年度"
def replacementPhraseText1 : String := "前年度の密度の算定において前々々年度"
def sourcePhraseText2 : String := "得た数に満たないときは、当該〇・九を乗じて得た数とする。この場合において表示単位未満の端数があるときは、その端数を四捨五入する。"
def replacementPhraseText2 : String := "得た数を前々年度の四月一日から三月三十一日までの間における生活扶助者数として用いた場合にあつては、当該用いた数とする。"
def sourcePhraseText3 : String := "別表第二の二"
def replacementPhraseText3 : String := "別表第二の四"
def sourcePhraseText4 : String := "前年度中"
def replacementPhraseText4 : String := "前々年度中"

inductive Phrase where
  | original0 | replacement0
  | original1 | replacement1
  | original2 | replacement2
  | original3 | replacement3
  | original4 | replacement4
  | other
  deriving DecidableEq, Repr

def applyReading : Phrase → Phrase
  | Phrase.original0 => Phrase.replacement0
  | Phrase.original1 => Phrase.replacement1
  | Phrase.original2 => Phrase.replacement2
  | Phrase.original3 => Phrase.replacement3
  | Phrase.original4 => Phrase.replacement4
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchMultiRead50f1d145e8
