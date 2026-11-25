import JapanTaxLaw.BatchTableReadedd0f1017dSpec

/-! Kernel-decided boundary tests over the declared phrase domain. -/
namespace JapanTaxLaw.BatchTableReadedd0f1017d

example : sourcePhraseText0 = "又は第十九条の三附則第十九条の三の附則第十九条の三第一項本文" := by rfl
example : replacementPhraseText0 = "又は地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三の地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項本文" := by rfl
example : applyReading Phrase.original0 = Phrase.replacement0 := by rfl
example : specReading Phrase.original0 = applyReading Phrase.original0 := agree_spec_impl Phrase.original0
example : sourcePhraseText1 = "又は第二十七条附則第二十七条附則第十九条の三第一項本文" := by rfl
example : replacementPhraseText1 = "又は地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項本文" := by rfl
example : applyReading Phrase.original1 = Phrase.replacement1 := by rfl
example : specReading Phrase.original1 = applyReading Phrase.original1 := agree_spec_impl Phrase.original1
example : sourcePhraseText2 = "又は第十九条の三附則第十九条の三の附則第十九条の三第一項本文" := by rfl
example : replacementPhraseText2 = "又は地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三の地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項本文" := by rfl
example : applyReading Phrase.original2 = Phrase.replacement2 := by rfl
example : specReading Phrase.original2 = applyReading Phrase.original2 := agree_spec_impl Phrase.original2
example : sourcePhraseText3 = "又は第二十七条附則第二十七条附則第十九条の三第一項本文" := by rfl
example : replacementPhraseText3 = "又は地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項本文" := by rfl
example : applyReading Phrase.original3 = Phrase.replacement3 := by rfl
example : specReading Phrase.original3 = applyReading Phrase.original3 := agree_spec_impl Phrase.original3
example : sourcePhraseText4 = "前条前年度分の固定資産税の課税標準額" := by rfl
example : replacementPhraseText4 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三前年度分の固定資産税の課税標準額（当該市街化区域農地のうち、当該年度分の固定資産税額の算定について同条第一項ただし書（同条第三項において準用する場合を含む。）の規定の適用を受けるものにあつては、当該前年度分の固定資産税の課税標準額に当該年度に係る同条第一項の表の下欄に掲げる率を乗じて得た額）" := by rfl
example : applyReading Phrase.original4 = Phrase.replacement4 := by rfl
example : specReading Phrase.original4 = applyReading Phrase.original4 := agree_spec_impl Phrase.original4
example : sourcePhraseText5 = "「前項」とあり、及び「附則第十八条第一項」とあるのは「附則第十九条の四第一項」「市街化区域農地」市街化区域農地調整固定資産税額」" := by rfl
example : replacementPhraseText5 = "「前項の「前年度分」とあるのは「地方税法等の一部を改正する法律（平成五年法律第四号。以下本項において「平成五年改正法」という。）附則第九条第三項において読み替えて適用される附則第十九条の四第一項の「前年度分」「市街化区域農地」と、「前項の規定」とあるのは「平成五年改正法附則第九条第三項において読み替えて適用される附則第十九条の四第一項の規定」市街化区域農地調整固定資産税額」と、「地方税法の一部を改正する法律（平成七年法律第四十号）による改正前の地方税法（以下本号において「平成七年改正前の地方税法」という。）」とあるのは「地方税法の一部を改正する法律（平成七年法律第四十号。以下本号において「平成七年改正法」という。）による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成七年改正法による改正前の地方税法（以下本号において「平成七年改正前の地方税法」という。）」と、「平成七年改正前の地方税法附則第十八条第一項」とあるのは「平成七年改正法による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成七年改正前の地方税法附則第十九条の四第一項」と、「地方税法等の一部を改正する法律（平成八年法律第十二号）第一条の規定による改正前の地方税法（以下本号において「平成八年改正前の地方税法」という。）」とあるのは「地方税法等の一部を改正する法律（平成八年法律第十二号。以下本号において「平成八年改正法」という。）附則第二十条の規定による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成八年改正法第一条の規定による改正前の地方税法（以下本号において「平成八年改正前の地方税法」という。）」と、「平成八年改正前の地方税法附則第十八条第一項」とあるのは「平成八年改正法附則第二十条の規定による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成八年改正前の地方税法附則第十九条の四第一項」と、「、平成七年改正前の地方税法」とあるのは「、平成七年改正法による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成七年改正前の地方税法」と、「負担調整率に平成八年改正前の地方税法」とあるのは「負担調整率に平成八年改正法附則第二十条の規定による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成八年改正前の地方税法」" := by rfl
example : applyReading Phrase.original5 = Phrase.replacement5 := by rfl
example : specReading Phrase.original5 = applyReading Phrase.original5 := agree_spec_impl Phrase.original5
example : sourcePhraseText6 = "前条" := by rfl
example : replacementPhraseText6 = "地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三" := by rfl
example : applyReading Phrase.original6 = Phrase.replacement6 := by rfl
example : specReading Phrase.original6 = applyReading Phrase.original6 := agree_spec_impl Phrase.original6
example : sourcePhraseText7 = "附則第十九条の三" := by rfl
example : replacementPhraseText7 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三" := by rfl
example : applyReading Phrase.original7 = Phrase.replacement7 := by rfl
example : specReading Phrase.original7 = applyReading Phrase.original7 := agree_spec_impl Phrase.original7
example : sourcePhraseText8 = "前条附則第十九条の三前年度分の都市計画税の課税標準額" := by rfl
example : replacementPhraseText8 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条同項においてなお効力を有するものとして読み替えて適用される同法附則第十九条の三前年度分の都市計画税の課税標準額（当該市街化区域農地のうち、当該年度分の都市計画税額の算定について同条第一項ただし書（同条第三項において準用する場合を含む。）の規定の例によることとされるものにあつては、当該前年度分の都市計画税の課税標準額に当該年度に係る同条第一項の表の下欄に掲げる率を乗じて得た額）" := by rfl
example : applyReading Phrase.original8 = Phrase.replacement8 := by rfl
example : specReading Phrase.original8 = applyReading Phrase.original8 := agree_spec_impl Phrase.original8
example : sourcePhraseText9 = "「前項」とあり、及び「附則第十八条第一項」とあるのは「附則第二十七条の二第一項」と、「前年度分の固定資産税」とあるのは「前年度分の都市計画税」除く。）」「前条第四項」" := by rfl
example : replacementPhraseText9 = "「前項の「前年度分の固定資産税」とあるのは「地方税法等の一部を改正する法律（平成五年法律第四号。以下本項において「平成五年改正法」という。）附則第九条第三項において読み替えて適用される附則第二十七条の二第一項の「前年度分の都市計画税」除く。）」と、「前項の規定」とあるのは「平成五年改正法附則第九条第三項において読み替えて適用される附則第二十七条の二第一項の規定」「前条第四項」と、「地方税法の一部を改正する法律（平成七年法律第四十号）による改正前の地方税法（以下本号において「平成七年改正前の地方税法」という。）」とあるのは「地方税法の一部を改正する法律（平成七年法律第四十号。以下本号において「平成七年改正法」という。）による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成七年改正法による改正前の地方税法（以下本号において「平成七年改正前の地方税法」という。）」と、「平成七年改正前の地方税法附則第十八条第一項」とあるのは「平成七年改正法による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成七年改正前の地方税法附則第二十七条の二第一項」と、「地方税法等の一部を改正する法律（平成八年法律第十二号）第一条の規定による改正前の地方税法（以下本号において「平成八年改正前の地方税法」という。）」とあるのは「地方税法等の一部を改正する法律（平成八年法律第十二号。以下本号において「平成八年改正法」という。）附則第二十条の規定による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成八年改正法第一条の規定による改正前の地方税法（以下本号において「平成八年改正前の地方税法」という。）」と、「平成八年改正前の地方税法附則第十八条第一項」とあるのは「平成八年改正法附則第二十条の規定による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成八年改正前の地方税法附則第二十七条の二第一項」と、「、平成七年改正前の地方税法」とあるのは「、平成七年改正法による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成七年改正前の地方税法」と、「負担調整率に平成八年改正前の地方税法」とあるのは「負担調整率に平成八年改正法附則第二十条の規定による改正前の平成五年改正法附則第九条第三項において読み替えて適用される平成八年改正前の地方税法」" := by rfl
example : applyReading Phrase.original9 = Phrase.replacement9 := by rfl
example : specReading Phrase.original9 = applyReading Phrase.original9 := agree_spec_impl Phrase.original9
example : sourcePhraseText10 = "特定市街化区域農地に" := by rfl
example : replacementPhraseText10 = "地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三の規定の適用を受ける市街化区域農地（以下本条において「特定市街化区域農地」という。）に" := by rfl
example : applyReading Phrase.original10 = Phrase.replacement10 := by rfl
example : specReading Phrase.original10 = applyReading Phrase.original10 := agree_spec_impl Phrase.original10
example : sourcePhraseText11 = "附則第十九条の三" := by rfl
example : replacementPhraseText11 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三" := by rfl
example : applyReading Phrase.original11 = Phrase.replacement11 := by rfl
example : specReading Phrase.original11 = applyReading Phrase.original11 := agree_spec_impl Phrase.original11
example : sourcePhraseText12 = "附則第十九条の三第一項" := by rfl
example : replacementPhraseText12 = "地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項" := by rfl
example : applyReading Phrase.original12 = Phrase.replacement12 := by rfl
example : specReading Phrase.original12 = applyReading Phrase.original12 := agree_spec_impl Phrase.original12
example : sourcePhraseText13 = "附則第十九条の三及び第二十七条" := by rfl
example : replacementPhraseText13 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三及び地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条" := by rfl
example : applyReading Phrase.original13 = Phrase.replacement13 := by rfl
example : specReading Phrase.original13 = applyReading Phrase.original13 := agree_spec_impl Phrase.original13
example : sourcePhraseText14 = "附則第十九条の三の附則第十九条の三、第十九条の四、第二十七条又は第二十七条の二" := by rfl
example : replacementPhraseText14 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三の地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三、附則第十九条の四、地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条又は附則第二十七条の二" := by rfl
example : applyReading Phrase.original14 = Phrase.replacement14 := by rfl
example : specReading Phrase.original14 = applyReading Phrase.original14 := agree_spec_impl Phrase.original14
example : sourcePhraseText15 = "附則第十九条の三第一項ただし書附則第二十七条又は第二十七条の二" := by rfl
example : replacementPhraseText15 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項ただし書地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条又は附則第二十七条の二" := by rfl
example : applyReading Phrase.original15 = Phrase.replacement15 := by rfl
example : specReading Phrase.original15 = applyReading Phrase.original15 := agree_spec_impl Phrase.original15
example : sourcePhraseText16 = "附則第十九条の三第一項ただし書" := by rfl
example : replacementPhraseText16 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三第一項ただし書" := by rfl
example : applyReading Phrase.original16 = Phrase.replacement16 := by rfl
example : specReading Phrase.original16 = applyReading Phrase.original16 := agree_spec_impl Phrase.original16
example : sourcePhraseText17 = "附則第十九条の三、（附則第十九条の三附則第二十七条" := by rfl
example : replacementPhraseText17 = "地方税法等の一部を改正する法律（平成五年法律第四号）附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三、（地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条" := by rfl
example : applyReading Phrase.original17 = Phrase.replacement17 := by rfl
example : specReading Phrase.original17 = applyReading Phrase.original17 := agree_spec_impl Phrase.original17
example : sourcePhraseText18 = "附則第十九条の三、第十九条の四、第二十七条、第二十七条の二" := by rfl
example : replacementPhraseText18 = "地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第十九条の三、附則第十九条の四、地方税法等の一部を改正する法律附則第九条第二項においてなお効力を有するものとして読み替えて適用される同法による改正前の地方税法附則第二十七条、附則第二十七条の二" := by rfl
example : applyReading Phrase.original18 = Phrase.replacement18 := by rfl
example : specReading Phrase.original18 = applyReading Phrase.original18 := agree_spec_impl Phrase.original18
example : applyReading Phrase.other = Phrase.other := by rfl
example : specReading Phrase.other = applyReading Phrase.other := agree_spec_impl Phrase.other
example : applyWhen false Phrase.other = Phrase.other := by rfl
example : applyWhen true Phrase.other = applyReading Phrase.other := triggered_matches Phrase.other

end JapanTaxLaw.BatchTableReadedd0f1017d
