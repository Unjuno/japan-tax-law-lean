import JapanTaxLaw.TaxFinance

/-!
# PaymentCeiling — 資金支払命令の上限（国税収納金整理資金に関する法律 art.11 §3）bounded L4 モデル

Sources (pinned):
  Law id: 329AC0000000036
  Revision: 329AC0000000036_20240101_431AC0000000003
  Raw snapshot: data/raw/329AC0000000036_20240101_431AC0000000003.law.json
  Article Num 11 §3, flat/normalized leaf text 351 chars, U+3000 count 0.

原文逐語（第3項）:
  「国税資金支払命令官は、第一項の規定により示達された資金の支払計画に定める金額をこえて支払命令をしてはならない。」

Computation（原文逐語から導出、上限規範のみ）:
  paymentPlanAmount = 支払計画に定める金額
  paymentOrderAmount = 支払命令の金額
  orderWithinPlan(amount, plan) = amount <= plan  （こえてはならない = 以下）

Scope / NOT MODELLED:
  - 第1項の支払計画の示達手続・第2項の委任・第4項の準用は NOT MODELLED。
  - 支払命令官の設置・金額の実際の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.PaymentCeiling

open JapanTaxLaw.TaxFinance

/-- 支払命令が支払計画の金額を超えないこと（以下）。 -/
def orderWithinPlan (amount : Money) (plan : Money) : Bool := amount <= plan

example : orderWithinPlan 0 100 = true := by decide
example : orderWithinPlan 100 100 = true := by decide  -- ちょうどは許容
example : orderWithinPlan 101 100 = false := by decide -- 超過は禁止
example : orderWithinPlan 50 100 = true := by decide

end JapanTaxLaw.PaymentCeiling
