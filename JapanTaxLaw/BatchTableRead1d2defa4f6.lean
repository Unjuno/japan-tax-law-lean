import JapanTaxLaw.TaxFinance

/-! Generated batch template for a multi-pair 読替え norm.
    Every quoted pair is a whole-phrase rewrite over an explicit
    finite domain; the trigger is caller-established, NOT resolved. -/
namespace JapanTaxLaw.BatchTableRead1d2defa4f6

def sourcePhraseText0 : String := "道府県道府県民税道府県知事市町村市町村長"
def replacementPhraseText0 : String := "都都民税都知事特別区特別区長"
def sourcePhraseText1 : String := "市町村市町村民税市町村長"
def replacementPhraseText1 : String := "都都民税都知事"
def sourcePhraseText2 : String := "五万円"
def replacementPhraseText2 : String := "五万円（事務所、事業所又は寮等が特別区の区域以外の都の区域内にも所在する場合（以下「事務所等が特別区の区域外にも所在する場合」という。）以外の場合には、七万円）"
def sourcePhraseText3 : String := "十二万円"
def replacementPhraseText3 : String := "十二万円（事務所等が特別区の区域外にも所在する場合以外の場合には、十四万円）"
def sourcePhraseText4 : String := "十三万円"
def replacementPhraseText4 : String := "十三万円（事務所等が特別区の区域外にも所在する場合以外の場合には、十八万円）"
def sourcePhraseText5 : String := "十五万円"
def replacementPhraseText5 : String := "十五万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二十万円）"
def sourcePhraseText6 : String := "十六万円"
def replacementPhraseText6 : String := "十六万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二十九万円）"
def sourcePhraseText7 : String := "四十万円"
def replacementPhraseText7 : String := "四十万円（事務所等が特別区の区域外にも所在する場合以外の場合には、五十三万円）"
def sourcePhraseText8 : String := "四十一万円"
def replacementPhraseText8 : String := "四十一万円（事務所等が特別区の区域外にも所在する場合以外の場合には、第五十二条第一項の表の第四号に該当するものについては九十五万円、同表の第五号に該当するものについては百二十一万円）"
def sourcePhraseText9 : String := "百七十五万円"
def replacementPhraseText9 : String := "百七十五万円（事務所等が特別区の区域外にも所在する場合以外の場合には、二百二十九万円）"
def sourcePhraseText10 : String := "三百万円"
def replacementPhraseText10 : String := "三百万円（事務所等が特別区の区域外にも所在する場合以外の場合には、三百八十万円）"
def sourcePhraseText11 : String := "同項の表の各号の税率に、それぞれ一・二を乗じて得た率"
def replacementPhraseText11 : String := "同項の表の各号の税率に、それぞれ一・二を乗じて得た率（事務所等が特別区の区域外にも所在する場合以外の場合には、同項の表の各号に掲げる法人について、事務所等が特別区の区域外にも所在する場合における当該各号の税率に一・二を乗じて得た率に、当該法人に係る第五十二条第一項の表の各号に掲げる区分に応じ当該各号の税率に相当する率を、それぞれ加算して得た率）"
def sourcePhraseText12 : String := "百分の六百分の八・四"
def replacementPhraseText12 : String := "百分の七百分の十・四"
def sourcePhraseText13 : String := "並びに第五十三条第三十六項に規定する法人税割額の合計額"
def replacementPhraseText13 : String := "の合計額"
def sourcePhraseText14 : String := "並びに第五十三条第三十七項に規定する法人税割額の合計額"
def replacementPhraseText14 : String := "の合計額"
def sourcePhraseText15 : String := "並びに第五十三条第三十八項の控除の限度額で政令で定めるものの合計額"
def replacementPhraseText15 : String := "の合計額"
def sourcePhraseText16 : String := "道府県"
def replacementPhraseText16 : String := "都"
def sourcePhraseText17 : String := "道府県民税"
def replacementPhraseText17 : String := "都民税"
def sourcePhraseText18 : String := "道府県知事"
def replacementPhraseText18 : String := "都知事"
def sourcePhraseText19 : String := "市町村"
def replacementPhraseText19 : String := "特別区"
def sourcePhraseText20 : String := "市町村長"
def replacementPhraseText20 : String := "特別区長"

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

end JapanTaxLaw.BatchTableRead1d2defa4f6
