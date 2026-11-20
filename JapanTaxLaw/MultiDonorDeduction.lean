import JapanTaxLaw.TaxFinance

/-!
# MultiDonorDeduction — 相続税法施行令 art.5の2（特定贈与者2人以上の控除額）bounded L4 モデル

Sources (pinned):
  Law id: 325CO0000000071
  Revision: 325CO0000000071_20260401_506CO0000000143
  Raw snapshot: data/raw/325CO0000000071_20260401_506CO0000000143.law.json
  Article Num 5_2, flat/normalized leaf text 256 chars, U+3000 count 0.

原文逐語:
  「法第二十一条の十一の二第一項の規定により控除する金額は、特定贈与者の異なるごとに、
   六十万円に、特定贈与者ごとの贈与税の課税価格が当該課税価格の合計額のうちに占める
   割合を乗じて計算するものとする。」

Computation（原文逐語から導出）:
  baseDeductionYen = 600,000（六十万円）
  donorDeductionYen(total, price) = 600,000 × price / total
    特定贈与者ごとの割合 price/total に 600,000 円を乗じた額。

Scope / NOT MODELLED（条文スライスに記載がなく独立記録が必要な境界）:
  - 端数処理の具体的な方法（切捨て/四捨五入等）は本条文に明示なし → 未形式化、
    人間レビュー保留。実装は自然数除算（切捨て）を仮定するが法的確定ではない。
  - 特定贈与者・相続時精算課税適用者の認定、法21の11の2第1項の他の要件は NOT MODELLED。
  - total = 0（贈与価格合計ゼロ）は本条の適用外（2人以上の特定贈与者が前提）。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.MultiDonorDeduction

open JapanTaxLaw.TaxFinance

/-- 控除額の基準額 = 六十万円。 -/
def baseDeductionYen : Money := 600_000

/-- 特定贈与者ごとの控除額 = 600,000 × (当該者の課税価格 ÷ 課税価格の合計額)。 -/
def donorDeductionYen (total : Money) (price : Money) : Money :=
  baseDeductionYen * price / total

example : baseDeductionYen = 600_000 := by decide
example : donorDeductionYen 2 1 = 300_000 := by decide
example : donorDeductionYen 4 1 = 150_000 := by decide
example : donorDeductionYen 3 1 = 200_000 := by decide
example : donorDeductionYen 3 2 = 400_000 := by decide
example : donorDeductionYen 1 1 = 600_000 := by decide

end JapanTaxLaw.MultiDonorDeduction
