import JapanTaxLaw.TaxFinance

/-!
# UsForcesDutyFreePenalty — 在日米軍特例法 art.11(3)（罰則）bounded L4 モデル

Sources (pinned):
  Law id: 327AC0000000111
  Revision: 327AC0000000111_20250601_504AC0000000068
  Raw snapshot: data/raw/327AC0000000111_20250601_504AC0000000068.law.json
  Provision: MainProvision / Article Num 11 / Paragraph 3

原文逐語 (para 3):
  「第一項の規定に違反した者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

原文から導出した数値上限:
  maxImprisonmentMonths = 12 (一年以下)
  maxFineYen            = 500,000 (五十万円以下)
  「又は」→ 拘禁刑と罰金は代替 (alternative)、併科ではない。

Scope: 本スライスは罰則の数値上限と代替関係のみを扱う。
  第一項の違反要件（免税物品の用途外譲渡・政令承認）、第二項の徴収、
  第四項の法人重課、附則第十一条（経過措置）は NOT MODELLED。
  実際の科刑は司法判断であり、本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.UsForcesDutyFreePenalty

open JapanTaxLaw.TaxFinance

/-- 拘禁刑の上限 = 一年 = 12 月以下。 -/
def maxImprisonmentMonths : Nat := 12

/-- 罰金の上限 = 五十万円以下。 -/
def maxFineYen : Money := 500_000

/-- 原文の「又は」に対応する代替刑。併科は表さない。 -/
inductive Penalty where
  | imprisonment : Nat -> Penalty
  | fine : Money -> Penalty

/-- 刑が原文の上限内か（境界値 12 月 / 500,000 円は上限内）。 -/
def withinLimits : Penalty -> Bool
  | Penalty.imprisonment m => m <= maxImprisonmentMonths
  | Penalty.fine y => y <= maxFineYen

example : maxImprisonmentMonths = 12 := by decide
example : maxFineYen = 500_000 := by decide
example : withinLimits (Penalty.imprisonment 12) = true := by decide
example : withinLimits (Penalty.imprisonment 13) = false := by decide
example : withinLimits (Penalty.fine 500_000) = true := by decide
example : withinLimits (Penalty.fine 500_001) = false := by decide

end JapanTaxLaw.UsForcesDutyFreePenalty
