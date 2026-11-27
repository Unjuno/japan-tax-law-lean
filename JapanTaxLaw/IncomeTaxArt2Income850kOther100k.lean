import JapanTaxLaw.TaxFinance

/-!
# IncomeTaxArt2Income850kOther100k — 所得税法 art.2(1) 合計所得85万円以下・給与所得等以外10万円以下 bounded L4 モデル

Sources (pinned):
  Law id: 340AC0000000033
  Revision: 340AC0000000033_20261001_507AC0000000070
  Raw snapshot: data/raw/340AC0000000033_20261001_507AC0000000070.law.json
  SHA-256: 94c4a7ad83726cde60787967ed4e959585ad0af9279d25db9aa02264b3fe606b
  Norm unit NORM|0b6873a5d1dbef66616422b40bf9cbd4e6f4b664f842f658ea00322e6f8b81cc
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:2/Article#2/Paragraph#1/Item#32/ItemSentence/Column#2/Sentence#1

原文逐語:
  「…合計所得金額が八十五万円以下であり、かつ、合計所得金額のうち給与所得等以外の所得に係る部分の金額が十万円以下であるものをいう。」

Computation（原文逐語から導出、金額条件スライスのみ、単位: 円）:
  totalIncome : Money, otherIncome : Money（caller-established）
  totalIncome <= 850000 && otherIncome <= 100000

Scope / NOT MODELLED:
  - 「自己の勤労に基づいて得た…所得」の事実認定、所得金額の計算、控除・税額は
    NOT MODELLED。本モデルは二つの金額上限の判定のみ。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.IncomeTaxArt2Income850kOther100k

open JapanTaxLaw.TaxFinance

/-- 合計所得の上限（八十五万円）。 -/
def totalCeiling : Money := 850000

/-- 給与所得等以外の所得部分の上限（十万円）。 -/
def otherCeiling : Money := 100000

/-- 二つの上限をともに満たすか。 -/
def withinBoth (totalIncome otherIncome : Money) : Bool :=
  totalIncome <= totalCeiling && otherIncome <= otherCeiling

example : totalCeiling = 850000 := by decide
example : otherCeiling = 100000 := by decide
example : withinBoth 0 0 = true := by decide
example : withinBoth 849999 99999 = true := by decide
example : withinBoth 850000 100000 = true := by decide
example : withinBoth 850001 100000 = false := by decide
example : withinBoth 850000 100001 = false := by decide

end JapanTaxLaw.IncomeTaxArt2Income850kOther100k
