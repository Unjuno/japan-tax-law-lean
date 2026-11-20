import JapanTaxLaw.TaxFinance

/-!
# SavingsDepositInterest — 納税貯蓄組合法 art.8（所得税の非課税）bounded L4 モデル

Sources (pinned):
  Law id: 326AC1000000145
  Revision: 326AC1000000145_20211122_503AC0000000046
  Raw snapshot: data/raw/data/raw/326AC1000000145_20211122_503AC0000000046.law.json
  Article Num 8, flat/normalized leaf text 158 chars, U+3000 count 0.

原文逐語:
  「納税貯蓄組合預金の利子については、所得税を課さない。但し、…引き出された部分の
   金額が政令で定める期間内において十万円をこえる場合における…利子については、
   この限りでない。」

Computation（原文逐語から導出、数値スライスのみ）:
  thresholdYen = 100,000（十万円）
  isOverThreshold(amount) = amount > 100,000（「こえる」= 厳密に大さい）

Scope / NOT MODELLED:
  - 「指定金融機関に委託して租税の納付に充てる場合」の例外、政令で定める期間、
    引出し日の属する期間の対応、預金・利子の認定は NOT MODELLED。
  - 本スライスは非課税の例外発動に関わる金額閾値のみを扱う。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.SavingsDepositInterest

open JapanTaxLaw.TaxFinance

/-- 閾値 = 十万円。 -/
def thresholdYen : Money := 100_000

/-- 「十万円をこえる」= 厳密に 100,000 円超。 -/
def isOverThreshold (amount : Money) : Bool :=
  amount > thresholdYen

example : thresholdYen = 100_000 := by decide
example : isOverThreshold 0 = false := by decide
example : isOverThreshold 100_000 = false := by decide
example : isOverThreshold 100_001 = true := by decide
example : isOverThreshold 200_000 = true := by decide

end JapanTaxLaw.SavingsDepositInterest
