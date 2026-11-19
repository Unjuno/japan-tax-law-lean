import JapanTaxLaw.TaxFinance

/-!
# TonnageTax — とん税法 art.3（課税標準及び税率）bounded L4 モデル

Sources (pinned):
  Law id: 332AC0000000037
  Revision: 332AC0000000037_20250601_504AC0000000068
  Raw snapshot: data/raw/332AC0000000037_20250601_504AC0000000068.law.json
  Article Num 3, flat/normalized leaf text (本則部分), U+3000 count 0.

原文逐語:
  「とん税は、外国貿易船の純トン数を課税標準とし、次の各号に掲げる場合について
    当該各号に掲げる税率により課する。
    一 開港への入港ごとに納付する場合 純トン数一トンまでごとに十六円
    二 開港ごとに一年分を一時に納付する場合 純トン数一トンまでごとに四十八円」

Computation（原文逐語から導出）:
  「一トンまでごとに」= トン数は一トン未満も一トンとして扱う（切り上げ）。
  入港ごと: tax = ceil(netTons) × 16
  一年分一時: tax = ceil(netTons) × 48

Scope: 純トン数（整数トン + 一トン未満の端数）は caller-established。
附則の経過措置・罰則は NOT MODELLED。
-/

namespace JapanTaxLaw.TonnageTax

open JapanTaxLaw.TaxFinance

/-- 入港ごとの税率: 一トンまでごとに十六円。 -/
def entryRate : Money := 16
/-- 一年分一時納付の税率: 一トンまでごとに四十八円。 -/
def annualRate : Money := 48

/-- 「一トンまでごとに」を実現する切り上げ: whole トン + 端数（1..99）→ whole+1。
    端数 0 は whole のまま。 -/
def tonCeil (whole : Money) (fraction : Money) : Money :=
  if fraction = 0 then whole else whole + 1

/-- 入港ごとのとん税。 -/
def entryTax (whole fraction : Money) : Money := tonCeil whole fraction * entryRate

/-- 一年分一時納付のとん税。 -/
def annualTax (whole fraction : Money) : Money := tonCeil whole fraction * annualRate

example : entryRate = 16 := by decide
example : annualRate = 48 := by decide
example : tonCeil 10 0 = 10 := by decide
example : tonCeil 10 1 = 11 := by decide
example : entryTax 10 0 = 160 := by decide
example : entryTax 10 1 = 176 := by decide
example : annualTax 10 0 = 480 := by decide
example : annualTax 10 1 = 528 := by decide
example : entryTax 0 0 = 0 := by decide

end JapanTaxLaw.TonnageTax
