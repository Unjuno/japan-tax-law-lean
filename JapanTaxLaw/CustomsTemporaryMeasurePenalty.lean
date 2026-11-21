import JapanTaxLaw.TaxFinance

/-!
# CustomsTemporaryMeasurePenalty — 関税暫定措置法 第十六条(1)（罰則: 拘禁刑/罰金）

Pinned source:
  Law id: 335AC0000000036
  Official title: 関税暫定措置法
  Law number: 昭和三十五年法律第三十六号
  Law type: Act (法律)
  Revision: 335AC0000000036_20260401_508AC0000000005
  Raw snapshot: data/raw/335AC0000000036_20260401_508AC0000000005.law.json
  sha256: 5528f6f312c8afd280b926f766916a70b1683f071046ad88677370641291e938
  Normative unit id: NORM|73d5c75ef83e6b9a1c99a74d31835bff840a92e8813407f099b58a630c21ad9e
  Source path: LawBody[1]/MainProvision/MainProvision[32]/Article:16/Article#16/
               Paragraph#1/ParagraphSentence/Sentence#1
  Article caption: （罰則）
  Penalty ceilings: imprisonment at most 一 (1 years = 12 months),
  fine at most 二百万. Both ceilings derived programmatically from the
  verbatim needle. 「又は」 = alternative (not cumulative).

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する者は、一年以下の拘禁刑又は二百万円以下の罰金に処する。」

Variable contract:
  maxImprisonmentMonths : Nat := 12 (一以下)
  maxFineYen : Money := 2_000_000 (二百万以下)
  both 以下 = ≤ (inclusive). Penalty is an alternative: imprisonment OR fine.

Scope: only numeric ceilings + alternative relationship. The violation conditions
(各号), actual sentencing, other paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTemporaryMeasurePenalty

open JapanTaxLaw.TaxFinance

/-- 拘禁刑上限 = 一 = 12 月. -/
def maxImprisonmentMonths : Nat := 12

/-- 罰金上限 = 二百万. -/
def maxFineYen : Money := 2_000_000

/-- 「又は」に対応する代替刑. -/
inductive Penalty where
  | imprisonment : Nat -> Penalty
  | fine : Money -> Penalty

/-- 刑が上限内か（境界値は上限内）. -/
def withinLimits : Penalty -> Bool
  | Penalty.imprisonment m => m <= maxImprisonmentMonths
  | Penalty.fine y => y <= maxFineYen

end JapanTaxLaw.CustomsTemporaryMeasurePenalty
