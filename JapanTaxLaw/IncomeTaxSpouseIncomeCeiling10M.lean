import JapanTaxLaw.TaxFinance

/-!
# IncomeTaxSpouseIncomeCeiling10M — 所得税法 art.2(1) 同一生計配偶者の合計所得千万円以下 bounded L4 モデル

Sources (pinned):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  SHA-256: 94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b
  Norm unit NORM|169785a03dc31781cd767d4106c8601bea5c38c46af96c1f4d0ad2b4dde863b3
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:2/Article#2/Paragraph#1/Item#33_2/ItemSentence/Column#2/Sentence#1

原文逐語:
  「同一生計配偶者のうち、合計所得金額が千万円以下である居住者の配偶者をいう。」

Computation（原文逐語から導出、金額条件スライスのみ、単位: 円）:
  totalIncome : Money — 配偶者の合計所得金額（caller-established）
  ceiling : Money := 10000000（千万円）
  spouseQualifies totalIncome := totalIncome <= 10000000（以下は上限を含む）

Scope / NOT MODELLED:
  - 居住者・同一生計の事実認定、控除の適用・税額計算は NOT MODELLED。
  - 本モデルは computable slice のみ。条文全体の意味検証を主張しない。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M

open JapanTaxLaw.TaxFinance

/-- 合計所得金額の上限（千万円）。 -/
def incomeCeiling : Money := 10000000

/-- 千万円以下であれば同一生計配偶者の金額要件を満たす。 -/
def spouseQualifies (totalIncome : Money) : Bool :=
  totalIncome <= incomeCeiling

example : incomeCeiling = 10000000 := by decide
example : spouseQualifies 0 = true := by decide
example : spouseQualifies 9999999 = true := by decide
example : spouseQualifies 10000000 = true := by decide
example : spouseQualifies 10000001 = false := by decide

end JapanTaxLaw.IncomeTaxSpouseIncomeCeiling10M
