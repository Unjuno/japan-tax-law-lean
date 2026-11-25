import JapanTaxLaw.TaxFinance

/-!
# FractionRates110 — 百十分の百 (= 10/11) の金額定式

An independent adversarial audit found that unit `1639d595…` was tokenized
as 十分の百 but the pinned 消費税法施行令 第25条の5 text reads 百十分の百
(100/110), with a separate 百八分の百 (100/108) case. The leading 百 had been
dropped by tokenization, making a 100/10 model ~11× too large.

This module computes the exact fraction 100/110 with floor. The 百八分の百
special case and the surrounding allocation rules are NOT MODELLED.
Not legal advice.
-/

namespace JapanTaxLaw.FractionRates110

def rate100Over110 (a : Nat) : Nat := a * 100 / 110

example : rate100Over110 110 = 100 := by decide
example : rate100Over110 1_000 = 909 := by decide

end JapanTaxLaw.FractionRates110
