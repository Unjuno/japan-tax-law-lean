import JapanTaxLaw.KanjiOrdinals
import JapanTaxLaw.KanjiOrdinalsSpec

/-!
# KanjiOrdinalsTests — 全76 variantの序数解析をカーネル検証
-/
namespace JapanTaxLaw.KanjiOrdinalsTests

open JapanTaxLaw.KanjiOrdinals

theorem parse_spec (s : String) :
    parseKanji s = JapanTaxLaw.KanjiOrdinalsSpec.ordinalSpec s := by
  rfl

theorem connector_spec (x : Nat) :
    connectorStructure x = JapanTaxLaw.KanjiOrdinalsSpec.connectorSpec x := by rfl

example : parseKanji "一" = some 1 := by decide
example : parseKanji "二" = some 2 := by decide
example : parseKanji "三" = some 3 := by decide
example : parseKanji "四" = some 4 := by decide
example : parseKanji "五" = some 5 := by decide
example : parseKanji "六" = some 6 := by decide
example : parseKanji "七" = some 7 := by decide
example : parseKanji "八" = some 8 := by decide
example : parseKanji "九" = some 9 := by decide
example : parseKanji "十" = some 10 := by decide
example : parseKanji "十一" = some 11 := by decide
example : parseKanji "十二" = some 12 := by decide
example : parseKanji "十三" = some 13 := by decide
example : parseKanji "十四" = some 14 := by decide
example : parseKanji "十五" = some 15 := by decide
example : parseKanji "十六" = some 16 := by decide
example : parseKanji "十七" = some 17 := by decide
example : parseKanji "十八" = some 18 := by decide
example : parseKanji "十九" = some 19 := by decide
example : parseKanji "二十" = some 20 := by decide
example : parseKanji "二十一" = some 21 := by decide
example : parseKanji "二十二" = some 22 := by decide
example : parseKanji "二十三" = some 23 := by decide
example : parseKanji "二十四" = some 24 := by decide
example : parseKanji "二十五" = some 25 := by decide
example : parseKanji "二十六" = some 26 := by decide
example : parseKanji "二十七" = some 27 := by decide
example : parseKanji "二十八" = some 28 := by decide
example : parseKanji "二十九" = some 29 := by decide
example : parseKanji "三十" = some 30 := by decide
example : parseKanji "三十一" = some 31 := by decide
example : parseKanji "三十二" = some 32 := by decide
example : parseKanji "三十三" = some 33 := by decide
example : parseKanji "三十四" = some 34 := by decide
example : parseKanji "三十五" = some 35 := by decide
example : parseKanji "三十六" = some 36 := by decide
example : parseKanji "三十七" = some 37 := by decide
example : parseKanji "三十八" = some 38 := by decide
example : parseKanji "三十九" = some 39 := by decide
example : parseKanji "四十" = some 40 := by decide
example : parseKanji "四十一" = some 41 := by decide
example : parseKanji "四十二" = some 42 := by decide
example : parseKanji "四十三" = some 43 := by decide
example : parseKanji "四十四" = some 44 := by decide
example : parseKanji "四十五" = some 45 := by decide
example : parseKanji "四十六" = some 46 := by decide
example : parseKanji "四十七" = some 47 := by decide
example : parseKanji "四十八" = some 48 := by decide
example : parseKanji "四十九" = some 49 := by decide
example : parseKanji "五十" = some 50 := by decide
example : parseKanji "五十一" = some 51 := by decide
example : parseKanji "五十二" = some 52 := by decide
example : parseKanji "五十三" = some 53 := by decide
example : parseKanji "五十四" = some 54 := by decide
example : parseKanji "五十五" = some 55 := by decide
example : parseKanji "五十六" = some 56 := by decide
example : parseKanji "五十七" = some 57 := by decide
example : parseKanji "五十八" = some 58 := by decide
example : parseKanji "五十九" = some 59 := by decide
example : parseKanji "六十" = some 60 := by decide
example : parseKanji "六十一" = some 61 := by decide
example : parseKanji "六十二" = some 62 := by decide
example : parseKanji "六十三" = some 63 := by decide
example : parseKanji "六十四" = some 64 := by decide
example : parseKanji "六十五" = some 65 := by decide
example : parseKanji "六十六" = some 66 := by decide
example : parseKanji "六十七" = some 67 := by decide
example : parseKanji "六十八" = some 68 := by decide
example : parseKanji "六十九" = some 69 := by decide
example : parseKanji "七十" = some 70 := by decide
example : parseKanji "七十一" = some 71 := by decide
example : parseKanji "七十二" = some 72 := by decide
example : parseKanji "七十三" = some 73 := by decide
example : parseKanji "七十四" = some 74 := by decide
example : parseKanji "七十五" = some 75 := by decide
example : parseKanji "七十六" = some 76 := by decide

example : delegationHeadingDeclared = true := rfl
example : connectorStructure 5 = 5 := by decide

end JapanTaxLaw.KanjiOrdinalsTests
