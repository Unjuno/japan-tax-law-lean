import JapanTaxLaw.NumericFragments
import JapanTaxLaw.NumericFragmentsSpec

/-!
# NumericFragmentsTests — 金額·割合·小数の序数解析
-/
namespace JapanTaxLaw.NumericFragmentsTests

open JapanTaxLaw.NumericFragments

example : parseAmount "〇円" = some 0 := by decide
example : parseAmount "一〇〇円" = some 100 := by decide
example : parseAmount "一万一千八百円" = some 11800 := by decide
example : parseAmount "一万一千円" = some 11000 := by decide
example : parseAmount "一万七千九百円" = some 17900 := by decide
example : parseAmount "一万七千五百円" = some 17500 := by decide
example : parseAmount "一万七千六百円" = some 17600 := by decide
example : parseAmount "一万七千四百円" = some 17400 := by decide
example : parseAmount "一万三千二百円" = some 13200 := by decide
example : parseAmount "一万三千五百円" = some 13500 := by decide
example : parseAmount "一万三千八百円" = some 13800 := by decide
example : parseAmount "一万三千円" = some 13000 := by decide
example : parseAmount "一万三千四百円" = some 13400 := by decide
example : parseAmount "一万三千百円" = some 1300000 := by decide
example : parseAmount "一万九千九百円" = some 19900 := by decide
example : parseAmount "一万九千円" = some 19000 := by decide
example : parseAmount "一万九百円" = some 10900 := by decide
example : parseAmount "一万二千三百円" = some 12300 := by decide
example : parseAmount "一万二千九百円" = some 12900 := by decide
example : parseAmount "一万二千二百円" = some 12200 := by decide
example : parseAmount "一万二千五百円" = some 12500 := by decide
example : parseAmount "一万二千六百円" = some 12600 := by decide
example : parseAmount "一万二千円" = some 12000 := by decide
example : parseAmount "一万二百円" = some 10200 := by decide
example : parseAmount "一万五千七百円" = some 15700 := by decide
example : parseAmount "一万五千八百円" = some 15800 := by decide
example : parseAmount "一万五千円" = some 15000 := by decide
example : parseAmount "一万五千四百円" = some 15400 := by decide
example : parseAmount "一万五千百円" = some 1500000 := by decide
example : parseAmount "一万五百円" = some 10500 := by decide
example : parseAmount "一万八千九百円" = some 18900 := by decide
example : parseAmount "一万八千五百円" = some 18500 := by decide
example : parseAmount "一万八千円" = some 18000 := by decide
example : parseAmount "一万八百円" = some 10800 := by decide
example : parseAmount "一万六千七百円" = some 16700 := by decide
example : parseAmount "一万六千五百円" = some 16500 := by decide
example : parseAmount "一万六千六百円" = some 16600 := by decide
example : parseAmount "一万六千円" = some 16000 := by decide
example : parseAmount "一万円" = some 10000 := by decide
example : parseAmount "一万千二百円" = some 10000200 := by decide
example : parseAmount "一万千五百円" = some 10000500 := by decide
example : parseAmount "一万千円" = some 10000000 := by decide
example : parseAmount "一万千四百円" = some 10000400 := by decide
example : parseAmount "一万四千二百円" = some 14200 := by decide
example : parseAmount "一万四千五百円" = some 14500 := by decide
example : parseAmount "七万七千五百円" = some 77500 := by decide
example : parseAmount "七万二千円" = some 72000 := by decide
example : parseAmount "七万五千五百円" = some 75500 := by decide
example : parseAmount "七万五千円" = some 75000 := by decide
example : parseAmount "七万六千五百円" = some 76500 := by decide
example : parseAmount "七万六千四百円" = some 76400 := by decide
example : parseAmount "七万円" = some 70000 := by decide
example : parseAmount "七万千七百円" = some 70000700 := by decide
example : parseAmount "七万四千円" = some 74000 := by decide
example : parseAmount "七万四百円" = some 70400 := by decide
example : parseAmount "七十円" = some 70 := by decide
example : parseAmount "七千二百円" = some 7200 := by decide
example : parseAmount "七千五百円" = some 7500 := by decide
example : parseAmount "七千八百円" = some 7800 := by decide
example : parseAmount "七千円" = some 7000 := by decide
example : parseAmount "七千百円" = some 700000 := by decide
example : parseAmount "七百万円" = some 7000000 := by decide
example : parseAmount "七百十円" = some 7000 := by decide
example : parseAmount "三七五円" = some 375 := by decide
example : parseAmount "三万七千五百円" = some 37500 := by decide
example : parseAmount "三万三千九百円" = some 33900 := by decide
example : parseAmount "三万三千円" = some 33000 := by decide
example : parseAmount "三万三百円" = some 30300 := by decide
example : parseAmount "三万九千五百円" = some 39500 := by decide
example : parseAmount "三万九千六百円" = some 39600 := by decide
example : parseAmount "三万二千円" = some 32000 := by decide
example : parseAmount "三万二千四百円" = some 32400 := by decide
example : parseAmount "三万五千二百円" = some 35200 := by decide
example : parseAmount "三万五千円" = some 35000 := by decide
example : parseAmount "三万五百円" = some 30500 := by decide
example : parseAmount "三万八千五百円" = some 38500 := by decide
example : parseAmount "三万八千円" = some 38000 := by decide
example : parseAmount "三万六千三百円" = some 36300 := by decide
example : parseAmount "三万六千八百円" = some 36800 := by decide
example : parseAmount "三万六千円" = some 36000 := by decide
example : parseAmount "三万円" = some 30000 := by decide
example : parseAmount "三万千二百円" = some 30000200 := by decide
example : parseAmount "三万四千五百円" = some 34500 := by decide
example : parseAmount "三十七万五千円" = some 75030 := by decide
example : parseAmount "三十七万円" = some 70030 := by decide
example : parseAmount "三十万円" = some 300000 := by decide
example : parseAmount "三十三万三千三百円" = some 33330 := by decide
example : parseAmount "三十三万円" = some 30030 := by decide
example : parseAmount "三十九万円" = some 90030 := by decide
example : parseAmount "三十二万八千円" = some 28030 := by decide
example : parseAmount "三十二万円" = some 20030 := by decide
example : parseAmount "三十五万円" = some 50030 := by decide
example : parseAmount "三十八万円" = some 80030 := by decide
example : parseAmount "三十六万五千円" = some 65030 := by decide
example : parseAmount "三十四万八千円" = some 48030 := by decide
example : parseAmount "三十四万円" = some 40030 := by decide
example : parseAmount "三千七百円" = some 3700 := by decide
example : parseAmount "三千万円" = some 30000000 := by decide
example : parseAmount "三千三百円" = some 3300 := by decide
example : parseAmount "三千九百円" = some 3900 := by decide
example : parseAmount "三千二百円" = some 3200 := by decide
example : parseAmount "三千五百万円" = some 35000000 := by decide
example : parseAmount "三千五百円" = some 3500 := by decide
example : parseAmount "三千八百円" = some 3800 := by decide
example : parseAmount "三千円" = some 3000 := by decide
example : parseAmount "三千四百円" = some 3400 := by decide
example : parseAmount "三千百円" = some 300000 := by decide
example : parseAmount "三百万円" = some 3000000 := by decide
example : parseAmount "九万七千五百円" = some 97500 := by decide
example : parseAmount "九万五千円" = some 95000 := by decide
example : parseAmount "九万円" = some 90000 := by decide
example : parseAmount "九万千三百円" = some 90000300 := by decide
example : parseAmount "九千七百円" = some 9700 := by decide
example : parseAmount "九千九百円" = some 9900 := by decide
example : parseAmount "九千五百円" = some 9500 := by decide
example : parseAmount "九千円" = some 9000 := by decide
example : parseAmount "九百四十五円" = some 945 := by decide
example : parseAmount "二万七千二百円" = some 27200 := by decide
example : parseAmount "二万七千五百円" = some 27500 := by decide
example : parseAmount "二万七千百円" = some 2700000 := by decide
example : parseAmount "二万三千五百円" = some 23500 := by decide
example : parseAmount "二万三千六百円" = some 23600 := by decide
example : parseAmount "二万三百円" = some 20300 := by decide
example : parseAmount "二万九千五百円" = some 29500 := by decide
example : parseAmount "二万九千円" = some 29000 := by decide
example : parseAmount "二万九千百円" = some 2900000 := by decide
example : parseAmount "二万二千五百円" = some 22500 := by decide
example : parseAmount "二万二千六百円" = some 22600 := by decide
example : parseAmount "二万二千円" = some 22000 := by decide
example : parseAmount "二万五千五百円" = some 25500 := by decide
example : parseAmount "二万五千円" = some 25000 := by decide
example : parseAmount "二万五百円" = some 20500 := by decide
example : parseAmount "二万八千円" = some 28000 := by decide
example : parseAmount "二万六千五百円" = some 26500 := by decide
example : parseAmount "二万六百円" = some 20600 := by decide
example : parseAmount "二万円" = some 20000 := by decide
example : parseAmount "二万千三百円" = some 20000300 := by decide
example : parseAmount "二万千円" = some 20000000 := by decide
example : parseAmount "二万四千二百円" = some 24200 := by decide
example : parseAmount "二十一万円" = some 10020 := by decide
example : parseAmount "二十七万五千円" = some 75020 := by decide
example : parseAmount "二十万七千五百円" = some 207500 := by decide
example : parseAmount "二十万円" = some 200000 := by decide
example : parseAmount "二十三万二千五百円" = some 32520 := by decide
example : parseAmount "二十九万円" = some 90020 := by decide
example : parseAmount "二十二万七千五百円" = some 27520 := by decide
example : parseAmount "二十二万円" = some 20020 := by decide
example : parseAmount "二十五万七千五百円" = some 57520 := by decide
example : parseAmount "二十八万八千円" = some 88020 := by decide
example : parseAmount "二十八万円" = some 80020 := by decide
example : parseAmount "二十六万六千六百円" = some 66620 := by decide
example : parseAmount "二十六万円" = some 60020 := by decide
example : parseAmount "二十四万円" = some 40020 := by decide
example : parseAmount "二千七百円" = some 2700 := by decide
example : parseAmount "二千万円" = some 20000000 := by decide
example : parseAmount "二千三百円" = some 2300 := by decide
example : parseAmount "二千五百円" = some 2500 := by decide
example : parseAmount "二千八百円" = some 2800 := by decide
example : parseAmount "二千六百円" = some 2600 := by decide
example : parseAmount "二千円" = some 2000 := by decide
example : parseAmount "二百万円" = some 2000000 := by decide
example : parseAmount "二百円" = some 200 := by decide
example : parseAmount "二百十三万円" = some 32000 := by decide
example : parseAmount "五万七千五百円" = some 57500 := by decide
example : parseAmount "五万七千円" = some 57000 := by decide
example : parseAmount "五万三千九百円" = some 53900 := by decide
example : parseAmount "五万五千五百円" = some 55500 := by decide
example : parseAmount "五万五千六百円" = some 55600 := by decide
example : parseAmount "五万五百円" = some 50500 := by decide
example : parseAmount "五万八千六百円" = some 58600 := by decide
example : parseAmount "五万八千円" = some 58000 := by decide
example : parseAmount "五万円" = some 50000 := by decide
example : parseAmount "五万千七百円" = some 50000700 := by decide
example : parseAmount "五万千八百円" = some 50000800 := by decide
example : parseAmount "五万千円" = some 50000000 := by decide
example : parseAmount "五十万円" = some 500000 := by decide
example : parseAmount "五十五万円" = some 50050 := by decide
example : parseAmount "五十八万円" = some 80050 := by decide
example : parseAmount "五千七百円" = some 5700 := by decide
example : parseAmount "五千万円" = some 50000000 := by decide
example : parseAmount "五千三百円" = some 5300 := by decide
example : parseAmount "五千二百円" = some 5200 := by decide
example : parseAmount "五千五百円" = some 5500 := by decide
example : parseAmount "五千六百円" = some 5600 := by decide
example : parseAmount "五千円" = some 5000 := by decide
example : parseAmount "五千四百円" = some 5400 := by decide
example : parseAmount "五千百円" = some 500000 := by decide
example : parseAmount "五百万円" = some 5000000 := by decide
example : parseAmount "五百円" = some 500 := by decide
example : parseAmount "八万七千九百円" = some 87900 := by decide
example : parseAmount "八万七千五百円" = some 87500 := by decide
example : parseAmount "八万七千円" = some 87000 := by decide
example : parseAmount "八万七千百円" = some 8700000 := by decide
example : parseAmount "八万三千円" = some 83000 := by decide
example : parseAmount "八万八千円" = some 88000 := by decide
example : parseAmount "八万円" = some 80000 := by decide
example : parseAmount "八万千四百円" = some 80000400 := by decide
example : parseAmount "八十七万円" = some 70080 := by decide
example : parseAmount "八十万円" = some 800000 := by decide
example : parseAmount "八十八万円" = some 80080 := by decide
example : parseAmount "八十六万円" = some 60080 := by decide
example : parseAmount "八千二百円" = some 8200 := by decide
example : parseAmount "八千五百円" = some 8500 := by decide
example : parseAmount "八千八百円" = some 8800 := by decide
example : parseAmount "八千六百円" = some 8600 := by decide
example : parseAmount "八千円" = some 8000 := by decide
example : parseAmount "八千四百円" = some 8400 := by decide
example : parseAmount "八百七十円" = some 870 := by decide
example : parseAmount "六万七千五百円" = some 67500 := by decide
example : parseAmount "六万三千三百円" = some 63300 := by decide
example : parseAmount "六万二千七百円" = some 62700 := by decide
example : parseAmount "六万五千五百円" = some 65500 := by decide
example : parseAmount "六万六千七百円" = some 66700 := by decide
example : parseAmount "六万六千五百円" = some 66500 := by decide
example : parseAmount "六万円" = some 60000 := by decide
example : parseAmount "六万四千円" = some 64000 := by decide
example : parseAmount "六万四千百円" = some 6400000 := by decide
example : parseAmount "六十七万円" = some 70060 := by decide
example : parseAmount "六十万円" = some 600000 := by decide
example : parseAmount "六十三万円" = some 30060 := by decide
example : parseAmount "六十五万円" = some 50060 := by decide
example : parseAmount "六十八万円" = some 80060 := by decide
example : parseAmount "六十円" = some 60 := by decide
example : parseAmount "六千三百円" = some 6300 := by decide
example : parseAmount "六千九百円" = some 6900 := by decide
example : parseAmount "六千五百円" = some 6500 := by decide
example : parseAmount "六千六百円" = some 6600 := by decide
example : parseAmount "六千円" = some 6000 := by decide
example : parseAmount "六百万円" = some 6000000 := by decide
example : parseAmount "十一万七千五百円" = some 17510 := by decide
example : parseAmount "十一万二千五百円" = some 12510 := by decide
example : parseAmount "十一万五千円" = some 15010 := by decide
example : parseAmount "十一万円" = some 10010 := by decide
example : parseAmount "十一万千円" = some 10010000 := by decide
example : parseAmount "十七万七千五百円" = some 77510 := by decide
example : parseAmount "十七万二千五百円" = some 72510 := by decide
example : parseAmount "十七万円" = some 70010 := by decide
example : parseAmount "十万七千五百円" = some 107500 := by decide
example : parseAmount "十万八千円" = some 108000 := by decide
example : parseAmount "十万円" = some 100000 := by decide
example : parseAmount "十万千二百円" = some 100000200 := by decide
example : parseAmount "十三万七千五百円" = some 37510 := by decide
example : parseAmount "十三万五千円" = some 35010 := by decide
example : parseAmount "十三万円" = some 30010 := by decide
example : parseAmount "十三万四千二百五十円" = some 34260 := by decide
example : parseAmount "十九万二千五百円" = some 92510 := by decide
example : parseAmount "十九万五千円" = some 95010 := by decide
example : parseAmount "十九万円" = some 90010 := by decide
example : parseAmount "十二万七千五百円" = some 27510 := by decide
example : parseAmount "十二万七千六百円" = some 27610 := by decide
example : parseAmount "十二万五千円" = some 25010 := by decide
example : parseAmount "十二万円" = some 20010 := by decide
example : parseAmount "十五万七千五百円" = some 57510 := by decide
example : parseAmount "十五万二千五百円" = some 52510 := by decide
example : parseAmount "十五万五千円" = some 55010 := by decide
example : parseAmount "十五万円" = some 50010 := by decide
example : parseAmount "十八万二千五百円" = some 82510 := by decide
example : parseAmount "十八万円" = some 80010 := by decide
example : parseAmount "十六万七千五百円" = some 67510 := by decide
example : parseAmount "十六万七千百二十五円" = some 6701025 := by decide
example : parseAmount "十六万五千円" = some 65010 := by decide
example : parseAmount "十六万円" = some 60010 := by decide
example : parseAmount "十四万七千五百円" = some 47510 := by decide
example : parseAmount "十四万二千五百円" = some 42510 := by decide
example : parseAmount "十四万五千円" = some 45010 := by decide
example : parseAmount "十四万円" = some 40010 := by decide
example : parseAmount "千七百円" = some 1700 := by decide
example : parseAmount "千万円" = some 10000000 := by decide
example : parseAmount "千三百円" = some 1300 := by decide
example : parseAmount "千九百円" = some 1900 := by decide
example : parseAmount "千二百五十円" = some 1250 := by decide
example : parseAmount "千二百円" = some 1200 := by decide
example : parseAmount "千五百万円" = some 15000000 := by decide
example : parseAmount "千五百円" = some 1500 := by decide
example : parseAmount "千八十円" = some 1080 := by decide
example : parseAmount "千八百円" = some 1800 := by decide
example : parseAmount "千六百円" = some 1600 := by decide
example : parseAmount "千百三十円" = some 100030 := by decide
example : parseAmount "四万七千五百円" = some 47500 := by decide
example : parseAmount "四万七千百円" = some 4700000 := by decide
example : parseAmount "四万七百円" = some 40700 := by decide
example : parseAmount "四万三千三百円" = some 43300 := by decide
example : parseAmount "四万三千五百円" = some 43500 := by decide
example : parseAmount "四万三千百円" = some 4300000 := by decide
example : parseAmount "四万九千円" = some 49000 := by decide
example : parseAmount "四万五千六百円" = some 45600 := by decide
example : parseAmount "四万五千円" = some 45000 := by decide
example : parseAmount "四万五千四百円" = some 45400 := by decide
example : parseAmount "四万五千百円" = some 4500000 := by decide
example : parseAmount "四万五百円" = some 40500 := by decide
example : parseAmount "四万八千五百円" = some 48500 := by decide
example : parseAmount "四万八千四百円" = some 48400 := by decide
example : parseAmount "四万六千八百円" = some 46800 := by decide
example : parseAmount "四万円" = some 40000 := by decide
example : parseAmount "四万千三百円" = some 40000300 := by decide
example : parseAmount "四万千八百円" = some 40000800 := by decide
example : parseAmount "四万千円" = some 40000000 := by decide
example : parseAmount "四万四千五百円" = some 44500 := by decide
example : parseAmount "四万四千円" = some 44000 := by decide
example : parseAmount "四十一万円" = some 10040 := by decide
example : parseAmount "四十万円" = some 400000 := by decide
example : parseAmount "四十三万円" = some 30040 := by decide
example : parseAmount "四十五万円" = some 50040 := by decide
example : parseAmount "四十八万円" = some 80040 := by decide
example : parseAmount "四十円" = some 40 := by decide
example : parseAmount "四千七百円" = some 4700 := by decide
example : parseAmount "四千万円" = some 40000000 := by decide
example : parseAmount "四千九百円" = some 4900 := by decide
example : parseAmount "四千五百万円" = some 45000000 := by decide
example : parseAmount "四千五百円" = some 4500 := by decide
example : parseAmount "四千六百円" = some 4600 := by decide
example : parseAmount "四千円" = some 4000 := by decide
example : parseAmount "四千四百円" = some 4400 := by decide
example : parseAmount "四千百円" = some 400000 := by decide
example : parseAmount "百七十五万円" = some 50170 := by decide
example : parseAmount "百三十円" = some 130 := by decide
example : parseAmount "百九十五万円" = some 50190 := by decide
example : parseAmount "百九十五円" = some 195 := by decide
example : parseAmount "百二十五万円" = some 50120 := by decide
example : parseAmount "百五円" = some 105 := by decide
example : parseAmount "百五十万円" = some 1500000 := by decide
example : parseAmount "百五十五万五千円" = some 55150 := by decide
example : parseAmount "百六十五円" = some 165 := by decide
example : parseAmount "百十円" = some 1000 := by decide
example : parsePercent "百分の七" = some 7 := by decide
example : parsePercent "百分の七十" = some 70 := by decide
example : parsePercent "百分の七十一" = some 71 := by decide
example : parsePercent "百分の七十九" = some 79 := by decide
example : parsePercent "百分の七十二" = some 72 := by decide
example : parsePercent "百分の七十五" = some 75 := by decide
example : parsePercent "百分の七十八" = some 78 := by decide
example : parsePercent "百分の七十四" = some 74 := by decide
example : parsePercent "百分の三" = some 3 := by decide
example : parsePercent "百分の三十" = some 30 := by decide
example : parsePercent "百分の三十三" = some 33 := by decide
example : parsePercent "百分の三十二" = some 32 := by decide
example : parsePercent "百分の三十五" = some 35 := by decide
example : parsePercent "百分の三十八" = some 38 := by decide
example : parsePercent "百分の三百六十" = some 360 := by decide
example : parsePercent "百分の九" = some 9 := by decide
example : parsePercent "百分の九十" = some 90 := by decide
example : parsePercent "百分の九十五" = some 95 := by decide
example : parsePercent "百分の二" = some 2 := by decide
example : parsePercent "百分の二十" = some 20 := by decide
example : parsePercent "百分の二十三" = some 23 := by decide
example : parsePercent "百分の二十五" = some 25 := by decide
example : parsePercent "百分の二十八" = some 28 := by decide
example : parsePercent "百分の二十四" = some 24 := by decide
example : parsePercent "百分の二百七十" = some 270 := by decide
example : parsePercent "百分の五" = some 5 := by decide
example : parsePercent "百分の五十" = some 50 := by decide
example : parsePercent "百分の五十七" = some 57 := by decide
example : parsePercent "百分の五十五" = some 55 := by decide
example : parsePercent "百分の五十六" = some 56 := by decide
example : parsePercent "百分の五百四十" = some 540 := by decide
example : parsePercent "百分の八" = some 8 := by decide
example : parsePercent "百分の八十" = some 80 := by decide
example : parsePercent "百分の八十一" = some 81 := by decide
example : parsePercent "百分の八十七" = some 87 := by decide
example : parsePercent "百分の八十二" = some 82 := by decide
example : parsePercent "百分の八十五" = some 85 := by decide
example : parsePercent "百分の八十四" = some 84 := by decide
example : parsePercent "百分の六" = some 6 := by decide
example : parsePercent "百分の六十" = some 60 := by decide
example : parsePercent "百分の六十七" = some 67 := by decide
example : parsePercent "百分の六十三" = some 63 := by decide
example : parsePercent "百分の六十九" = some 69 := by decide
example : parsePercent "百分の六十二" = some 62 := by decide
example : parsePercent "百分の六十五" = some 65 := by decide
example : parsePercent "百分の六十八" = some 68 := by decide
example : parsePercent "百分の六十六" = some 66 := by decide
example : parsePercent "百分の十" = some 10 := by decide
example : parsePercent "百分の十一" = some 11 := by decide
example : parsePercent "百分の十七" = some 17 := by decide
example : parsePercent "百分の十九" = some 19 := by decide
example : parsePercent "百分の十二" = some 12 := by decide
example : parsePercent "百分の十五" = some 15 := by decide
example : parsePercent "百分の十八" = some 18 := by decide
example : parsePercent "百分の十六" = some 16 := by decide
example : parsePercent "百分の十四" = some 14 := by decide
example : parsePercent "百分の四" = some 4 := by decide
example : parsePercent "百分の四十" = some 40 := by decide
example : parsePercent "百分の四十一" = some 41 := by decide
example : parsePercent "百分の四十七" = some 47 := by decide
example : parsePercent "百分の四十二" = some 42 := by decide
example : parsePercent "百分の四十五" = some 45 := by decide
example : parsePercent "百分の四十八" = some 48 := by decide
example : parsePercent "百分の四十六" = some 46 := by decide
example : parsePercent "百分の四十四" = some 44 := by decide
example : parsePercent "百分の四百五十" = some 450 := by decide
example : parsePercent "百分の百" = some 100 := by decide
example : parsePercent "百分の百三十三" = some 133 := by decide
example : parsePercent "百分の百三十九" = some 139 := by decide
example : parsePercent "百分の百三十二" = some 132 := by decide
example : parsePercent "百分の百五十" = some 150 := by decide
example : parsePercent "百分の百八十" = some 180 := by decide
example : parsePercent "百分の百六十五" = some 165 := by decide
example : parsePercent "百分の百十八" = some 1008 := by decide
example : parsePercent "百分の百四十一" = some 141 := by decide
example : parsePercent "百分の百四十三" = some 143 := by decide
example : parsePercent "百分の百四十五" = some 145 := by decide
example : parsePercent "百分の百四十六" = some 146 := by decide
example : parseDecimal "〇・〇一〇" = some (0, 10) := by decide
example : parseDecimal "〇・〇一五" = some (0, 15) := by decide
example : parseDecimal "〇・〇二〇" = some (0, 20) := by decide
example : parseDecimal "〇・一" = some (0, 1) := by decide
example : parseDecimal "〇・一〇" = some (0, 10) := by decide
example : parseDecimal "〇・一〇〇" = some (0, 100) := by decide
example : parseDecimal "〇・一五" = some (0, 15) := by decide
example : parseDecimal "〇・七" = some (0, 7) := by decide
example : parseDecimal "〇・七〇" = some (0, 70) := by decide
example : parseDecimal "〇・七〇〇" = some (0, 700) := by decide
example : parseDecimal "〇・七一" = some (0, 71) := by decide
example : parseDecimal "〇・七五" = some (0, 75) := by decide
example : parseDecimal "〇・三" = some (0, 3) := by decide
example : parseDecimal "〇・三〇" = some (0, 30) := by decide
example : parseDecimal "〇・三〇〇" = some (0, 300) := by decide
example : parseDecimal "〇・九" = some (0, 9) := by decide
example : parseDecimal "〇・九九七五" = some (0, 9975) := by decide
example : parseDecimal "〇・九五〇" = some (0, 950) := by decide
example : parseDecimal "〇・二" = some (0, 2) := by decide
example : parseDecimal "〇・二五" = some (0, 25) := by decide
example : parseDecimal "〇・二八五" = some (0, 285) := by decide
example : parseDecimal "〇・五" = some (0, 5) := by decide
example : parseDecimal "〇・五〇" = some (0, 50) := by decide
example : parseDecimal "〇・五〇〇" = some (0, 500) := by decide
example : parseDecimal "〇・五七〇" = some (0, 570) := by decide
example : parseDecimal "〇・五五" = some (0, 55) := by decide
example : parseDecimal "〇・五五〇" = some (0, 550) := by decide
example : parseDecimal "〇・八" = some (0, 8) := by decide
example : parseDecimal "〇・八〇〇" = some (0, 800) := by decide
example : parseDecimal "〇・八九" = some (0, 89) := by decide
example : parseDecimal "〇・六" = some (0, 6) := by decide
example : parseDecimal "〇・六〇" = some (0, 60) := by decide
example : parseDecimal "〇・六〇〇" = some (0, 600) := by decide
example : parseDecimal "〇・四" = some (0, 4) := by decide
example : parseDecimal "〇・四〇" = some (0, 40) := by decide
example : parseDecimal "〇・四〇〇" = some (0, 400) := by decide
example : parseDecimal "〇・四〇一" = some (0, 401) := by decide
example : parseDecimal "〇・四七五" = some (0, 475) := by decide
example : parseDecimal "一〇・八" = some (10, 8) := by decide
example : parseDecimal "一・〇" = some (1, 0) := by decide
example : parseDecimal "一・〇〇" = some (1, 0) := by decide
example : parseDecimal "一・〇七五" = some (1, 75) := by decide
example : parseDecimal "一・〇九" = some (1, 9) := by decide
example : parseDecimal "一・〇二五" = some (1, 25) := by decide
example : parseDecimal "一・〇五" = some (1, 5) := by decide
example : parseDecimal "一・一" = some (1, 1) := by decide
example : parseDecimal "一・一〇" = some (1, 10) := by decide
example : parseDecimal "一・一七" = some (1, 17) := by decide
example : parseDecimal "一・一三" = some (1, 13) := by decide
example : parseDecimal "一・一九" = some (1, 19) := by decide
example : parseDecimal "一・一五" = some (1, 15) := by decide
example : parseDecimal "一・一四" = some (1, 14) := by decide
example : parseDecimal "一・七" = some (1, 7) := by decide
example : parseDecimal "一・七〇" = some (1, 70) := by decide
example : parseDecimal "一・三" = some (1, 3) := by decide
example : parseDecimal "一・三〇" = some (1, 30) := by decide
example : parseDecimal "一・三七" = some (1, 37) := by decide
example : parseDecimal "一・三三" = some (1, 33) := by decide
example : parseDecimal "一・三八" = some (1, 38) := by decide
example : parseDecimal "一・三四" = some (1, 34) := by decide
example : parseDecimal "一・九三" = some (1, 93) := by decide
example : parseDecimal "一・二" = some (1, 2) := by decide
example : parseDecimal "一・二一" = some (1, 21) := by decide
example : parseDecimal "一・二五" = some (1, 25) := by decide
example : parseDecimal "一・二八" = some (1, 28) := by decide
example : parseDecimal "一・二六" = some (1, 26) := by decide
example : parseDecimal "一・二四" = some (1, 24) := by decide
example : parseDecimal "一・五" = some (1, 5) := by decide
example : parseDecimal "一・八" = some (1, 8) := by decide
example : parseDecimal "一・八四" = some (1, 84) := by decide
example : parseDecimal "一・六" = some (1, 6) := by decide
example : parseDecimal "一・六三" = some (1, 63) := by decide
example : parseDecimal "一・四" = some (1, 4) := by decide
example : parseDecimal "一・四七" = some (1, 47) := by decide
example : parseDecimal "一・四二" = some (1, 42) := by decide
example : parseDecimal "七・〇" = some (7, 0) := by decide
example : parseDecimal "三・〇" = some (3, 0) := by decide
example : parseDecimal "三・〇八" = some (3, 8) := by decide
example : parseDecimal "三・一" = some (3, 1) := by decide
example : parseDecimal "三・七三" = some (3, 73) := by decide
example : parseDecimal "三・七八" = some (3, 78) := by decide
example : parseDecimal "三・三" = some (3, 3) := by decide
example : parseDecimal "三・三一" = some (3, 31) := by decide
example : parseDecimal "三・三二" = some (3, 32) := by decide
example : parseDecimal "三・二" = some (3, 2) := by decide
example : parseDecimal "三・五五" = some (3, 55) := by decide
example : parseDecimal "三・八" = some (3, 8) := by decide
example : parseDecimal "三・六" = some (3, 6) := by decide
example : parseDecimal "三・四" = some (3, 4) := by decide
example : parseDecimal "九・十" = some (9, 10) := by decide
example : parseDecimal "二・〇" = some (2, 0) := by decide
example : parseDecimal "二・〇五" = some (2, 5) := by decide
example : parseDecimal "二・一" = some (2, 1) := by decide
example : parseDecimal "二・一六" = some (2, 16) := by decide
example : parseDecimal "二・七" = some (2, 7) := by decide
example : parseDecimal "二・三" = some (2, 3) := by decide
example : parseDecimal "二・三九" = some (2, 39) := by decide
example : parseDecimal "二・九" = some (2, 9) := by decide
example : parseDecimal "二・二" = some (2, 2) := by decide
example : parseDecimal "二・二六" = some (2, 26) := by decide
example : parseDecimal "二・五" = some (2, 5) := by decide
example : parseDecimal "二・八九" = some (2, 89) := by decide
example : parseDecimal "二・八五" = some (2, 85) := by decide
example : parseDecimal "二・六" = some (2, 6) := by decide
example : parseDecimal "二・六二" = some (2, 62) := by decide
example : parseDecimal "二・四" = some (2, 4) := by decide
example : parseDecimal "二・四七" = some (2, 47) := by decide
example : parseDecimal "二十四・九一" = some (24, 91) := by decide
example : parseDecimal "五・〇" = some (5, 0) := by decide
example : parseDecimal "五・九" = some (5, 9) := by decide
example : parseDecimal "五・二" = some (5, 2) := by decide
example : parseDecimal "五・八二" = some (5, 82) := by decide
example : parseDecimal "五・六" = some (5, 6) := by decide
example : parseDecimal "五・四" = some (5, 4) := by decide
example : parseDecimal "五・四〇" = some (5, 40) := by decide
example : parseDecimal "六・一" = some (6, 1) := by decide
example : parseDecimal "六・三" = some (6, 3) := by decide
example : parseDecimal "六・二四" = some (6, 24) := by decide
example : parseDecimal "六・八" = some (6, 8) := by decide
example : parseDecimal "六・六" = some (6, 6) := by decide
example : parseDecimal "六・六六" = some (6, 66) := by decide
example : parseDecimal "四・〇" = some (4, 0) := by decide
example : parseDecimal "四・〇一" = some (4, 1) := by decide
example : parseDecimal "四・一" = some (4, 1) := by decide
example : parseDecimal "四・一四" = some (4, 14) := by decide
example : parseDecimal "四・七" = some (4, 7) := by decide
example : parseDecimal "四・三" = some (4, 3) := by decide
example : parseDecimal "四・九八" = some (4, 98) := by decide
example : parseDecimal "四・五" = some (4, 5) := by decide
example : parseDecimal "四・五六" = some (4, 56) := by decide
example : parseDecimal "四二・〇" = some (42, 0) := by decide

end JapanTaxLaw.NumericFragmentsTests
