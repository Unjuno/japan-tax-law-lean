import JapanTaxLaw.TaxFinance

/-!
# CustomsTariffArt12MiningEmergencyCondition — 関税定率法 第十二条(1) CONDITION

Pinned source:
  Law id: 143AC0000000054
  Official title: 関税定率法
  Law number: 明治四十三年法律第五十四号
  Law type: Act (法律)
  Revision: 143AC0000000054_20260601_508AC0000000005
  Raw snapshot: data/raw/143AC0000000054_20260601_508AC0000000005.law.json
  sha256: 924a01d3014fd93ea50c6588d5a7ed414becef2ca806918081a18a6ef986ae9c
  Normative unit id: NORM|87b9f966c634326085c0f7d1a57c6e1e84993c717043f092084c05da4d7e4fe8
  Source path: LawBody[1]/MainProvision/MainProvision[23]/Article:12/Article#12/
               Paragraph#1/Item#2/ItemSentence/Sentence#1
  Article caption: （生活関連物資の減税又は免税）

原文逐語（pinned, 一字一句改変なし）:
  「凶作の場合又は天災、事変その他の緊急の場合において必要があるとき。」

Norm kind: CONDITION — a case label enumerating when the provision applies:
mining (鉱作) or a natural disaster / incident / other emergency requiring it.
The computable slice models the discriminated case set: the enumerated
emergency cases vs. the ordinary case. The exact statutory string — including
the source's own characters — is injected verbatim from the queue, never
hand-typed or "corrected". Substantive customs treatment and legal
correctness are NOT MODELLED.

Variable contract (meaning / unit / domain / type):
  Case : Type — enumerated (mining or emergency) | ordinary.
  appliesTo : Case -> Bool — true for the enumerated case, false otherwise.
  No numeric amount/unit applies (case condition, not a formula).

Scope: only the case discrimination. Substantive treatment and legal
correctness NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition

/-- Case class: enumerated (mining/emergency) or ordinary. -/
inductive Case : Type
  | enumerated : Case
  | ordinary : Case

deriving instance DecidableEq for Case

/-- 必要があるとき: the provision applies to the enumerated case. -/
def appliesTo (c : Case) : Bool :=
  match c with
  | Case.enumerated => true
  | Case.ordinary => false

/-- The enumerated case triggers application. -/
theorem enumerated_applies : appliesTo Case.enumerated = true := rfl

/-- The ordinary case does not. -/
theorem ordinary_not_applies : appliesTo Case.ordinary = false := rfl

/-- The two cases are distinct. -/
theorem cases_distinct : Case.enumerated ≠ Case.ordinary := by decide

end JapanTaxLaw.CustomsTariffArt12MiningEmergencyCondition
