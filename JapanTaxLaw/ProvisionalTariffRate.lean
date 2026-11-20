import JapanTaxLaw.TaxFinance

/-!
# ProvisionalTariffRate — 関税暫定措置法 附則 art.2-2（特定の期間の税率等）bounded L4 モデル

Sources (pinned):
  Law id: 335AC0000000036
  Revision: 335AC0000000036_20260401_508AC0000000005
  Raw snapshot: data/raw/335AC0000000036_20260401_508AC0000000005.law.json
  附則 特定の期間...税率等, flat/normalized leaf text 288 chars, U+3000 count 0.

原文逐語:
  「別表第五の第二欄の（１）のＤに掲げる物品に係る税率は一リットルにつき一、六〇〇円と、
    同表の第二欄の（２）のＢに掲げる物品に係る税率は一リットルにつき一、三〇〇円と、
    同表の第二欄の（３）のＧに掲げる物品に係る税率は一リットルにつき一、六〇〇円と、
    同表の第二欄の（４）のＤに掲げる物品に係る税率は一リットルにつき一三七円として、
    新暫定法第八条の五の規定を適用する。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  rate1D = 1,600 円/L、rate2B = 1,300 円/L、rate3G = 1,600 円/L、rate4D = 137 円/L
  関税額 = リットル × 税率

Scope: 適用期間・物品区分・リットル数は caller-established。
第八条の五の具体的算定・付表の他欄は NOT MODELLED。
-/

namespace JapanTaxLaw.ProvisionalTariffRate

open JapanTaxLaw.TaxFinance

/-- （１）のＤ: 一リットルにつき一、六〇〇円。 -/
def rate1D : Money := 1_600
/-- （２）のＢ: 一リットルにつき一、三〇〇円。 -/
def rate2B : Money := 1_300
/-- （３）のＧ: 一リットルにつき一、六〇〇円。 -/
def rate3G : Money := 1_600
/-- （４）のＤ: 一リットルにつき一三七円。 -/
def rate4D : Money := 137

/-- 関税額 = リットル × 税率。 -/
def tariff (liters : Money) (rate : Money) : Money := liters * rate

example : rate1D = 1_600 := by decide
example : rate2B = 1_300 := by decide
example : rate3G = 1_600 := by decide
example : rate4D = 137 := by decide
example : tariff 1 rate1D = 1_600 := by decide
example : tariff 1 rate4D = 137 := by decide
example : tariff 10 rate2B = 13_000 := by decide
example : tariff 0 rate1D = 0 := by decide

end JapanTaxLaw.ProvisionalTariffRate
