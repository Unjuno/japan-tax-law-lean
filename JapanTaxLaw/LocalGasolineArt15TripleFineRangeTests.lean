import JapanTaxLaw.LocalGasolineArt15TripleFineRangeSpec

/-!
# LocalGasolineArt15TripleFineRange tests — kernel-decided boundary checks

Pinned to law 330AC0000000104 / revision 330AC0000000104_20260401_508AC0000000012.
三倍 vs 五十万円（500,000）の境界: 166,666 / 166,667; 上限の
499,999 / 500,000 / 500,001; 倍率の 2 / 3 / 4。
-/

namespace JapanTaxLaw.LocalGasolineArt15TripleFineRange

example : triple 0 = 0 := by decide
example : triple 2 = 6 := by decide
example : triple 3 = 9 := by decide
example : triple 4 = 12 := by decide
example : triple 499999 = 1499997 := by decide
example : triple 500000 = 1500000 := by decide
example : triple 500001 = 1500003 := by decide
example : specialApplies 166666 = false := by decide
example : specialApplies 166667 = true := by decide
example : withinFineRange 200000 500000 = false := by decide
example : withinFineRange 200000 600000 = true := by decide
example : specInRange 200000 600000 = true := by decide

end JapanTaxLaw.LocalGasolineArt15TripleFineRange
