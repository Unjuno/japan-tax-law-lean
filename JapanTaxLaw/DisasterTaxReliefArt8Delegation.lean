import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefArt8Delegation — DELEGATION

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_*.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|d351e6ace9606ec2a4061c0a13824f8b21e9bbee9be7c1457e7d7cafbf136433
  Source path: LawBody[1]/MainProvision/MainProvision[7]/Article:8/Article#8/Paragraph#2/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前項に定めるもののほか、同項の規定の適用に関し必要な事項は、政令で定める。」

Norm kind: DELEGATION — Paragraph 2 of Article 8 delegates to Cabinet Order (政令)
the residual matters necessary for applying the provisions of the preceding
paragraph, other than those already prescribed there. The computable slice
models: (a) the delegation target (Cabinet Order, not statute), and (b) the
residual scope predicate — a matter is delegated iff it is necessary for
application AND not already prescribed. All statutory facts derived from the
needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  DelegationTarget : Type — cabinetOrder (政令) or statute (法律).
  delegatedTarget : DelegationTarget = cabinetOrder.
  alreadyPrescribed : Bool — whether the matter is already set out in 前項.
  necessaryForApplication : Bool — whether it is necessary for applying 同項.
  isDelegatedMatter : Bool -> Bool -> Bool — !alreadyPrescribed && necessaryForApplication.
  No numeric amount/unit applies (structural DELEGATION, not a formula).

Scope: only the delegation target and the residual-scope predicate. The content
of the delegated Cabinet Order, the preceding paragraph's substance, and legal
correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt8Delegation

/-- The delegate named by the provision: 政令 (Cabinet Order) or 法律 (statute). -/
inductive DelegationTarget : Type
  | cabinetOrder : DelegationTarget
  | statute : DelegationTarget

/-- The provision delegates to Cabinet Order (政令で定める). -/
def delegatedTarget : DelegationTarget := DelegationTarget.cabinetOrder

/-- Residual scope: necessary for application, and not already prescribed in 前項. -/
def isDelegatedMatter (alreadyPrescribed necessaryForApplication : Bool) : Bool :=
  !alreadyPrescribed && necessaryForApplication

/-- The delegation target is Cabinet Order. -/
theorem target_is_cabinet_order : delegatedTarget = DelegationTarget.cabinetOrder := rfl

/-- A necessary matter not already prescribed falls within the delegation. -/
theorem necessary_residual_is_delegated : isDelegatedMatter false true = true := rfl

/-- A matter already prescribed in 前項 does not fall within the delegation. -/
theorem prescribed_not_delegated : isDelegatedMatter true true = false := rfl

/-- A matter not necessary for application does not fall within the delegation. -/
theorem unnecessary_not_delegated : isDelegatedMatter false false = false := rfl

end JapanTaxLaw.DisasterTaxReliefArt8Delegation
