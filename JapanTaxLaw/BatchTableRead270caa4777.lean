import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead270caa4777

def sourcePhraseText0 : String := "市町村に"
def replacementPhraseText0 : String := "都道府県に"
def sourcePhraseText1 : String := "関係市町村"
def replacementPhraseText1 : String := "関係都道府県"
def sourcePhraseText2 : String := "市町村"
def replacementPhraseText2 : String := "都"
def sourcePhraseText3 : String := "市町村に関係市町村"
def replacementPhraseText3 : String := "都道府県に関係都道府県"
def sourcePhraseText4 : String := "市町村"
def replacementPhraseText4 : String := "都"
def sourcePhraseText5 : String := "法人の市町村民税の確定申告書"
def replacementPhraseText5 : String := "法人の都民税の確定申告書"
def sourcePhraseText6 : String := "市町村民税の中間納付額市町村長"
def replacementPhraseText6 : String := "都民税の中間納付額都知事"
def sourcePhraseText7 : String := "当該市町村民税"
def replacementPhraseText7 : String := "当該都民税"
def sourcePhraseText8 : String := "市町村内"
def replacementPhraseText8 : String := "都内"
def sourcePhraseText9 : String := "市町村民税に"
def replacementPhraseText9 : String := "都民税に"
def sourcePhraseText10 : String := "市町村民税額"
def replacementPhraseText10 : String := "都民税額"
def sourcePhraseText11 : String := "市町村民税の法"
def replacementPhraseText11 : String := "都民税の法"
def sourcePhraseText12 : String := "市町村民税で"
def replacementPhraseText12 : String := "都民税で"
def sourcePhraseText13 : String := "、道府県民税の控除限度額及び市町村民税の控除限度額"
def replacementPhraseText13 : String := "及び都民税の控除限度額"
def sourcePhraseText14 : String := "並びに法第五十三条第三十八項及び"
def replacementPhraseText14 : String := "並びに法"
def sourcePhraseText15 : String := "百分の六課する市町村"
def replacementPhraseText15 : String := "百分の七課する都の特別区の存する区域のみ"
def sourcePhraseText16 : String := "（当該法人が二以上の市町村において事務所又は事業所を有する場合には、法人税の控除限度額を当該法人の関係市町村ごとの法第三百二十一条の十三第二項に規定する従業者の数に按分して計算した額に当該関係市町村が課する法人税割の税率に相当する割合として総務省令で定める割合を乗じて計算した額の合計額）とすることができる"
def replacementPhraseText16 : String := "とすることができるものとし、特別区の存する区域及び市町村において事務所又は事業所を有する法人で当該事業年度の道府県民税の控除限度額又は市町村民税の控除限度額の計算について第九条の七第四項ただし書又は第四十八条の十三第五項ただし書の規定によるものにあつては、当該事業年度の道府県民税の控除限度額と市町村民税の控除限度額との合計額とする"
def sourcePhraseText17 : String := "、道府県民税の控除限度額及び市町村民税の控除限度額"
def replacementPhraseText17 : String := "及び都民税の控除限度額"
def sourcePhraseText18 : String := "の市町村民税の控除限度額"
def replacementPhraseText18 : String := "の都民税の控除限度額"
def sourcePhraseText19 : String := "、道府県民税の控除余裕額又は市町村民税の控除余裕額"
def replacementPhraseText19 : String := "又は都民税の控除余裕額（外国の法人税等のうち同条第三十八項の規定により控除することができた額が都民税の控除限度額に満たない場合における当該都民税の控除限度額から当該控除することができた額を控除した残額をいう。以下この項において同じ。）"
def sourcePhraseText20 : String := "、道府県民税の控除余裕額及び市町村民税の控除余裕額"
def replacementPhraseText20 : String := "及び都民税の控除余裕額"
def sourcePhraseText21 : String := "市町村民税の控除余裕額の合計額"
def replacementPhraseText21 : String := "都民税の控除余裕額の合計額"
def sourcePhraseText22 : String := "市町村民税の控除余裕額"
def replacementPhraseText22 : String := "都民税の控除余裕額"

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
  | p => p

def applyWhen (trigger : Bool) (p : Phrase) : Phrase :=
  if trigger then applyReading p else p

theorem leaves_other : applyReading Phrase.other = Phrase.other := by rfl
theorem untriggered_identity (p : Phrase) : applyWhen false p = p := by
  cases p <;> rfl
theorem triggered_matches (p : Phrase) : applyWhen true p = applyReading p := by
  rfl

end JapanTaxLaw.BatchTableRead270caa4777
