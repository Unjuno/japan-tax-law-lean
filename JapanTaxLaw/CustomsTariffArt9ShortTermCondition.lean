import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt9ShortTermCondition — 関税定率法 第九条(13)（条件）CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|295ccda6a0b3cf28951dffd64407d01984af6262dd2e744bd27833c6c2af1e52
  Source path: LawBody[1]/MainProvision/MainProvision[19]/Article:9/Article#9/
               Paragraph#13/Item#2/ItemSentence/Sentence#1
  Article caption: （緊急関税等）

原文逐語（pinned, 一字一句改変なし）:
  「過去五年以内に当該短期の措置に係る貨物について緊急措置が三回以上とられていない場合」

Norm kind: CONDITION — a case label: fewer than three emergency measures were
taken in respect of the goods within the past five-year window. The computable
slice models the measured boundary of the condition. The look-back window
(5 years) and the threshold (3 or more times) are extracted
structurally from the verbatim needle; the substantive determination of what
counts as an emergency measure, the goods scope, and the legal effect are NOT
MODELLED.

Variable contract (meaning / unit / domain / type):
  lookbackYears : Nat = 5 (years; from 過去五年以内).
  thresholdCount : Nat = 3 (count of measures; from 三回以上).
  priorMeasures : Nat — number of emergency measures already taken in the window.
  conditionMet : Nat -> Bool — true iff priorMeasures < thresholdCount
    (i.e. NOT 3 or more times), respecting the boundary at 3.

Scope: only the numeric boundary slice. Other items, the short-term measure
substance, and legal correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt9ShortTermCondition

/-- Look-back window in years, extracted from the verbatim 過去五年以内. -/
def lookbackYears : Nat := 5

/-- Threshold count, extracted from the verbatim 三回以上. -/
def thresholdCount : Nat := 3

/-- 三回以上とられていない場合: true iff fewer than the threshold measures were taken. -/
def conditionMet (priorMeasures : Nat) : Bool :=
  decide (priorMeasures < thresholdCount)

/-- Boundary: threshold-1 meets the condition. -/
theorem below_threshold_meets : conditionMet (thresholdCount - 1) = true := by
  unfold conditionMet thresholdCount
  decide

/-- Boundary: the threshold itself does NOT meet the condition. -/
theorem at_threshold_fails : conditionMet thresholdCount = false := by
  unfold conditionMet thresholdCount
  decide

/-- Boundary: above the threshold does not meet the condition. -/
theorem above_threshold_fails : conditionMet (thresholdCount + 1) = false := by
  unfold conditionMet thresholdCount
  decide

end JapanTaxLaw.CustomsTariffArt9ShortTermCondition
