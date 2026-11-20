import JapanTaxLaw.TaxFinance

/-!
# TransitionalTariffRate — 関税定率法等の一部改正法 附則 art.2（特定の期間の税率等）bounded L4 モデル

Sources (pinned):
  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  Article (附則 特定の期間...税率等), flat/normalized leaf text 216 chars, U+3000 count 0.

原文逐語:
  「昭和五十三年四月一日から附則第一条第一号に掲げる日の前日までの間においては、
    改正後の関税定率法...別表の付表第一号の第二欄の（２）のＢに掲げる物品に
    係る税率は一リットルにつき一、四〇〇円と、同号の第二欄の（４）のＤに掲げる
    物品に係る税率は一リットルにつき一三九円として、新定率法第三条の二の規定を適用する。」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  rateB = 1,400 円/リットル、rateD = 139 円/リットル
  tariff = liters × rate（适用期間・物品区分は caller-established）

Scope: 適用期間・物品区分・リットル数は caller-established。
第三条の二の具体的算定・付表の他欄は NOT MODELLED。
-/

namespace JapanTaxLaw.TransitionalTariffRate

open JapanTaxLaw.TaxFinance

/-- （２）のＢの物品の税率 = 一リットルにつき一、四〇〇円。 -/
def rateB : Money := 1_400
/-- （４）のＤの物品の税率 = 一リットルにつき一三九円。 -/
def rateD : Money := 139

/-- 関税額 = リットル数 × 税率。 -/
def tariff (liters : Money) (rate : Money) : Money := liters * rate

example : rateB = 1_400 := by decide
example : rateD = 139 := by decide
example : tariff 1 rateB = 1_400 := by decide
example : tariff 1 rateD = 139 := by decide
example : tariff 10 rateB = 14_000 := by decide
example : tariff 0 rateB = 0 := by decide

end JapanTaxLaw.TransitionalTariffRate
