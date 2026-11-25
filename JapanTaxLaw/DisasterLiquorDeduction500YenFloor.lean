import JapanTaxLaw.TaxFinance

/-!
# DisasterLiquorDeduction500YenFloor — 災害被害者租税減免法 art.7(3)（500円未満控除しない）bounded L4 モデル

Sources (pinned):
  Law id: 322AC0000000175
  Revision: 322AC0000000175_20220101_503AC0000000011
  Raw snapshot: data/raw/322AC0000000175_20220101_503AC0000000011.law.json
  SHA-256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Norm unit NORM|a24e7c114feecd511f243f096776d864ebb4c7d152c9db84b632aeb039991536
  Source path: LawBody[1]/MainProvision/MainProvision[6]/Article:7/Article#7/Paragraph#3/ParagraphSentence/Sentence#1

原文逐語:
  「…税目の異なるごとの金額（…合算額）が五百円未満である場合における当該金額については、同項の控除を行わない。」

Computation（原文逐語から導出、金額下限スライスのみ、単位: 円）:
  amount : Money — 第一項の規定により計算した控除額（caller-established）
  floor : Money := 500（五百円）
  deductionApplied amount := !(amount < 500)（五百円未満でない場合のみ控除）
  effectiveDeduction amount := if amount < 500 then 0 else amount

Scope / NOT MODELLED:
  - 被災酒類等の所持・税額計算・税目の合算・第一項の控除自体は NOT MODELLED。
  - 人間による法的レビューは未了（LEGAL_REVIEW_PENDING）。

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterLiquorDeduction500YenFloor

open JapanTaxLaw.TaxFinance

/-- 五百円（控除を行わない下限）。 -/
def deductionFloor : Money := 500

/-- 五百円未満でなければ控除を行う。 -/
def deductionApplied (amount : Money) : Bool := ! (amount < deductionFloor)

/-- 五百円未満の控除額は 0（控除しない）として扱う。 -/
def effectiveDeduction (amount : Money) : Money :=
  if amount < deductionFloor then 0 else amount

example : deductionFloor = 500 := by decide
example : deductionApplied 0 = false := by decide
example : deductionApplied 499 = false := by decide
example : deductionApplied 500 = true := by decide
example : deductionApplied 501 = true := by decide
example : effectiveDeduction 499 = 0 := by decide
example : effectiveDeduction 500 = 500 := by decide
example : effectiveDeduction 1200 = 1200 := by decide

end JapanTaxLaw.DisasterLiquorDeduction500YenFloor
