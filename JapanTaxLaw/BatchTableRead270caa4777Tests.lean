import JapanTaxLaw.BatchTableRead270caa4777Spec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableRead270caa4777

example : sourcePhraseText0 = "市町村に" := by rfl
example : replacementPhraseText0 = "都道府県に" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "関係市町村" := by rfl
example : replacementPhraseText1 = "関係都道府県" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "市町村" := by rfl
example : replacementPhraseText2 = "都" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "市町村に関係市町村" := by rfl
example : replacementPhraseText3 = "都道府県に関係都道府県" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "市町村" := by rfl
example : replacementPhraseText4 = "都" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "法人の市町村民税の確定申告書" := by rfl
example : replacementPhraseText5 = "法人の都民税の確定申告書" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "市町村民税の中間納付額市町村長" := by rfl
example : replacementPhraseText6 = "都民税の中間納付額都知事" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "当該市町村民税" := by rfl
example : replacementPhraseText7 = "当該都民税" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "市町村内" := by rfl
example : replacementPhraseText8 = "都内" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "市町村民税に" := by rfl
example : replacementPhraseText9 = "都民税に" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "市町村民税額" := by rfl
example : replacementPhraseText10 = "都民税額" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "市町村民税の法" := by rfl
example : replacementPhraseText11 = "都民税の法" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "市町村民税で" := by rfl
example : replacementPhraseText12 = "都民税で" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "、道府県民税の控除限度額及び市町村民税の控除限度額" := by rfl
example : replacementPhraseText13 = "及び都民税の控除限度額" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "並びに法第五十三条第三十八項及び" := by rfl
example : replacementPhraseText14 = "並びに法" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "百分の六課する市町村" := by rfl
example : replacementPhraseText15 = "百分の七課する都の特別区の存する区域のみ" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "（当該法人が二以上の市町村において事務所又は事業所を有する場合には、法人税の控除限度額を当該法人の関係市町村ごとの法第三百二十一条の十三第二項に規定する従業者の数に按分して計算した額に当該関係市町村が課する法人税割の税率に相当する割合として総務省令で定める割合を乗じて計算した額の合計額）とすることができる" := by rfl
example : replacementPhraseText16 = "とすることができるものとし、特別区の存する区域及び市町村において事務所又は事業所を有する法人で当該事業年度の道府県民税の控除限度額又は市町村民税の控除限度額の計算について第九条の七第四項ただし書又は第四十八条の十三第五項ただし書の規定によるものにあつては、当該事業年度の道府県民税の控除限度額と市町村民税の控除限度額との合計額とする" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "、道府県民税の控除限度額及び市町村民税の控除限度額" := by rfl
example : replacementPhraseText17 = "及び都民税の控除限度額" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "の市町村民税の控除限度額" := by rfl
example : replacementPhraseText18 = "の都民税の控除限度額" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : sourcePhraseText19 = "、道府県民税の控除余裕額又は市町村民税の控除余裕額" := by rfl
example : replacementPhraseText19 = "又は都民税の控除余裕額（外国の法人税等のうち同条第三十八項の規定により控除することができた額が都民税の控除限度額に満たない場合における当該都民税の控除限度額から当該控除することができた額を控除した残額をいう。以下この項において同じ。）" := by rfl
example : applyReading Phrase.original19 = Phrase.replacement19 := by rfl
example : specReading Phrase.original19 = applyReading Phrase.original19 := agree_spec_impl Phrase.original19
example : sourcePhraseText20 = "、道府県民税の控除余裕額及び市町村民税の控除余裕額" := by rfl
example : replacementPhraseText20 = "及び都民税の控除余裕額" := by rfl
example : applyReading Phrase.original20 = Phrase.replacement20 := by rfl
example : specReading Phrase.original20 = applyReading Phrase.original20 := agree_spec_impl Phrase.original20
example : sourcePhraseText21 = "市町村民税の控除余裕額の合計額" := by rfl
example : replacementPhraseText21 = "都民税の控除余裕額の合計額" := by rfl
example : applyReading Phrase.original21 = Phrase.replacement21 := by rfl
example : specReading Phrase.original21 = applyReading Phrase.original21 := agree_spec_impl Phrase.original21
example : sourcePhraseText22 = "市町村民税の控除余裕額" := by rfl
example : replacementPhraseText22 = "都民税の控除余裕額" := by rfl
example : applyReading Phrase.original22 = Phrase.replacement22 := by rfl
example : specReading Phrase.original22 = applyReading Phrase.original22 := agree_spec_impl Phrase.original22
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableRead270caa4777
