import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefArt102OtherMeasuresDelegation — DELEGATION

Pinned source:
  Law id: 322AC0000000175
  Official title: 昭和二十二年法律第百七十五号（災害被害者に対する租税の減免、徴収猶予等に関する法律）
  Law number: 昭和二十二年法律第百七十五号
  Law type: Act (法律)
  Raw snapshot: data/raw/322AC0000000175_*.law.json
  sha256: c3bb5b0bdffbdefd2ee5f358d90ad9e0922d4c887ecb2b133aa7d613f5f4e7ef
  Normative unit id: NORM|89b4b1f43640feafeb68f7098c9111ddb551caee41003744a6c9fb344e7336b5
  Source path: LawBody[43]/SupplProvision/SupplProvision[3]/Article:102/Article#102/ArticleCaption

原文逐語（pinned, 一字一句改変なし）:
  「（その他の経過措置の政令への委任）」

Norm kind: DELEGATION — the ArticleCaption labels delegation of the other
transitional measures (the source terms are reproduced in the verbatim quote
above) to Cabinet Order. The computable slice models the delegation-target
selection: Cabinet Order, not statute. All statutory terms in the quote are
byte-verbatim from the pinned source; English prose here is descriptive only.

Variable contract (meaning / domain / type):
  DelegationTarget : Type — cabinetOrder, statute, other.
  delegationTarget : DelegationTarget — the selected target of the delegation.
  No numeric amount/unit applies (structural delegation target).

Scope: only the delegation-target selection. The content of the delegated
Cabinet Order and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefArt102OtherMeasuresDelegation

/-- The possible targets of the delegation. -/
inductive DelegationTarget : Type
  | cabinetOrder : DelegationTarget
  | statute : DelegationTarget
  | other : DelegationTarget

/-- The caption delegates to Cabinet Order. -/
def delegationTarget : DelegationTarget := DelegationTarget.cabinetOrder

/-- The selected target is Cabinet Order. -/
theorem target_is_cabinet_order : delegationTarget = DelegationTarget.cabinetOrder := rfl

/-- Statute is not the selected target. -/
theorem statute_not_selected : delegationTarget ≠ DelegationTarget.statute := by
  unfold delegationTarget
  intro h
  cases h

end JapanTaxLaw.DisasterTaxReliefArt102OtherMeasuresDelegation
