import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderArt10Item5FieldCondition — CONDITION

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|776e380c19760249d8df0f9271e451ace26d44c8f044d76495f3caeb888f038d
  Source path: LawBody[1]/MainProvision/MainProvision[10]/Article:10/Article#10/Paragraph#1/Item#5/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「徴収猶予限度額又は徴収猶予期間及びこれらの計算の基礎」

Norm kind: CONDITION — Article 10(1) item 5 lists a required entry in the
application for a collection deferral: the deferral limit amount OR the deferral
period, AND the basis for calculating them. The computable slice models that
field-completeness condition (the 又は disjunction and 及び conjunction).
All statutory facts derived from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  DeferralField : Type — limitAmount (徴収猶予限度額), deferralPeriod (徴収猶予期間),
                   calculationBasis (これらの計算の基礎).
  provided : DeferralField -> Bool — whether the applicant entered the field (caller-established).
  satisfiesItem5 := (provided limitAmount || provided deferralPeriod) && provided calculationBasis.
  No numeric amount/unit applies (structural field-completeness condition).

Scope: only the item-5 field-completeness condition. The entire application form,
substantive deferral eligibility and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition

/-- The fields named by item 5. -/
inductive DeferralField : Type
  | limitAmount : DeferralField
  | deferralPeriod : DeferralField
  | calculationBasis : DeferralField

/-- 徴収猶予限度額又は徴収猶予期間及びこれらの計算の基礎: item-5 completeness. -/
def satisfiesItem5 (provided : DeferralField -> Bool) : Bool :=
  (provided DeferralField.limitAmount || provided DeferralField.deferralPeriod) &&
    provided DeferralField.calculationBasis

/-- A provider entering the limit amount and the calculation basis. -/
def amountAndBasis : DeferralField -> Bool
  | DeferralField.limitAmount => true
  | DeferralField.deferralPeriod => false
  | DeferralField.calculationBasis => true

/-- A provider entering the deferral period and the calculation basis. -/
def periodAndBasis : DeferralField -> Bool
  | DeferralField.limitAmount => false
  | DeferralField.deferralPeriod => true
  | DeferralField.calculationBasis => true

/-- A provider entering only the limit amount (no basis). -/
def amountOnly : DeferralField -> Bool
  | DeferralField.limitAmount => true
  | DeferralField.deferralPeriod => false
  | DeferralField.calculationBasis => false

/-- A provider entering only the calculation basis (no alternative). -/
def basisOnly : DeferralField -> Bool
  | DeferralField.limitAmount => false
  | DeferralField.deferralPeriod => false
  | DeferralField.calculationBasis => true

/-- Limit amount + calculation basis satisfies item 5. -/
theorem amount_path_satisfies : satisfiesItem5 amountAndBasis = true := rfl

/-- Deferral period + calculation basis satisfies item 5. -/
theorem period_path_satisfies : satisfiesItem5 periodAndBasis = true := rfl

/-- Limit amount without the calculation basis does not satisfy item 5. -/
theorem missing_basis_fails : satisfiesItem5 amountOnly = false := rfl

/-- Neither alternative without the basis does not satisfy item 5. -/
theorem missing_alternative_fails : satisfiesItem5 basisOnly = false := rfl

end JapanTaxLaw.DisasterTaxReliefOrderArt10Item5FieldCondition
