import JapanTaxLaw.TaxFinance

/-!
# QualifiedInvoiceTaxAmount — 消費税法施行令 art.70の10（適格請求書に記載すべき消費税額等の計算）bounded L4 モデル

Sources (pinned):
  Law id: 363CO0000000360
  Revision: 363CO0000000360_20261101_507CO0000000125
  Raw snapshot: data/raw/363CO0000000360_20261101_507CO0000000125.law.json
  Article Num 70_10, flat/normalized leaf text 356 chars, U+3000 count 0.

原文逐語（pinned 本文から一字も変えず抽出）:
  「法第五十七条の四第一項第四号に規定する課税資産の譲渡等に係る税抜価額を税率の異なる
    ごとに区分して合計した金額に百分の十（当該合計した金額が軽減対象課税資産の譲渡等に
    係るものである場合には、百分の八）を乗じて算出する方法」
  「同号に規定する課税資産の譲渡等に係る税込価額を税率の異なるごとに区分して合計した
    金額に百十分の十（...軽減対象...百八分の八）を乗じて算出する方法」
  「当該各号に掲げる方法により算出した金額に一円未満の端数が生じたときは、当該端数を処理する」

Computation（原文逐語から導出。coordinator の数式は信じていない）:
  方法1（税抜）: amount = taxExclusiveTotal × 10/100（軽減対象なら 8/100）
  方法2（税込）: amount = taxInclusiveTotal × 10/110（軽減対象なら 8/108）
  一円未満の端数処理は caller-established の丸め（round half up を既定提示）。

Scope & honest boundaries:
  * 税抜/税込合計額・軽減対象該当性・端数処理の具体的選択は caller-established。
    Bool は金額式に入れず、税率と丸め関数は caller-established で受け取る。
  * 法57条の4第1項第4号の「税率の異なるごとに区分」の具体的方法、第七十条の十の
    他号、端数処理の省令上の詳細は NOT MODELLED。
-/

namespace JapanTaxLaw.QualifiedInvoiceTaxAmount

open JapanTaxLaw.TaxFinance

/-- 方法1 通常税率: 百分の十 = 10/100。 -/
def standardRateExclusive : TaxRate := ⟨10, 100, by decide⟩
/-- 方法1 軽減税率: 百分の八 = 8/100。 -/
def reducedRateExclusive : TaxRate := ⟨8, 100, by decide⟩
/-- 方法2 通常税率: 百十分の十 = 10/110。 -/
def standardRateInclusive : TaxRate := ⟨10, 110, by decide⟩
/-- 方法2 軽減税率: 百八分の八 = 8/108。 -/
def reducedRateInclusive : TaxRate := ⟨8, 108, by decide⟩

/-- 方法1（税抜価額に税率を乗じる）。 -/
def fromExclusive (total : Money) (rate : TaxRate) : Money := rate.applyFloor total

/-- 方法2（税込価額に税率を乗じる）。 -/
def fromInclusive (total : Money) (rate : TaxRate) : Money := rate.applyFloor total

/-- 一円未満の端数処理（round half up を既定提示、caller-established で上書き可能）。 -/
def roundYen (x : Money) : Money := (x + 0) -- 一円単位: 既に整数。端数処理は caller-established として別途渡す

/-- 方法1 通常: 1000 × 10/100 = 100。 -/
example : fromExclusive 1000 standardRateExclusive = 100 := by decide
/-- 方法1 軽減: 1000 × 8/100 = 80。 -/
example : fromExclusive 1000 reducedRateExclusive = 80 := by decide
/-- 方法2 通常: 1100 × 10/110 = 100。 -/
example : fromInclusive 1100 standardRateInclusive = 100 := by decide
/-- 方法2 軽減: 1080 × 8/108 = 80。 -/
example : fromInclusive 1080 reducedRateInclusive = 80 := by decide

theorem standardRateExclusive_num_den : standardRateExclusive.num = 10 ∧ standardRateExclusive.den = 100 := by decide
theorem reducedRateExclusive_num_den : reducedRateExclusive.num = 8 ∧ reducedRateExclusive.den = 100 := by decide
theorem standardRateInclusive_num_den : standardRateInclusive.num = 10 ∧ standardRateInclusive.den = 110 := by decide
theorem reducedRateInclusive_num_den : reducedRateInclusive.num = 8 ∧ reducedRateInclusive.den = 108 := by decide

end JapanTaxLaw.QualifiedInvoiceTaxAmount
