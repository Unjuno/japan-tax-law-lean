import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresArt70_3PresumptiveHeirCondition — PRESUMPTION

Pinned source:
  Law id: 332AC0000000026
  Official title: 租税特別措置法
  Law number: 昭和三十二年法律第二十六号
  Law type: Act (法律)
  Raw snapshot: data/raw/332AC0000000026_*.law.json
  sha256: e6e6013bbc0608c6b48dea01d50ac847c3e5d094f0420223171ffe1b5cf8d5ee
  Normative unit id: NORM|d775175c5fdefe03cb113c17eb692261fc30ceac82464eae2afd408b64095615
  Source path: LawBody[3]/MainProvision/MainProvision[3]/Article:70_3/Article#70_3/
               Paragraph#3/Item#1/Subitem1#2/Subitem1Sentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「住宅取得等資金の贈与をした者の直系卑属である推定相続人（孫を含む。）であること。」

Norm kind: PRESUMPTION — a qualifying condition: the person must be a presumptive
heir (推定相続人) who is a lineal descendant (直系卑属) of the donor, with a grandchild
(孫) expressly included. The computable slice models the presumptive-heir status
and the grandchild-inclusion flag. The substantive tax consequences and the surrounding
conditions are NOT MODELLED.
Structural facts extracted from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  HeirStatus : Type — presumptiveLinealDescendant (直系卑属である推定相続人) or other.
  includesGrandchild : Bool — true (孫を含む).
  isQualifiedHeir : HeirStatus -> Bool — true for the presumptive lineal descendant.
  No numeric amount/unit applies (structural PRESUMPTION, not a formula).

Scope: only the heir-status discrimination and grandchild-inclusion flag. Substantive
tax consequences, donor details and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition

/-- The presumptive-heir status named in the condition. -/
inductive HeirStatus : Type
  | presumptiveLinealDescendant : HeirStatus
  | other : HeirStatus

/-- A grandchild is expressly included (孫を含む). -/
def includesGrandchild : Bool := true

/-- The qualified heir is the presumptive lineal descendant. -/
def isQualifiedHeir (h : HeirStatus) : Bool :=
  match h with
  | HeirStatus.presumptiveLinealDescendant => true
  | HeirStatus.other => false

/-- Grandchild inclusion holds. -/
theorem grandchild_included : includesGrandchild = true := rfl

/-- The presumptive lineal descendant qualifies. -/
theorem presumptive_qualifies :
    isQualifiedHeir HeirStatus.presumptiveLinealDescendant = true := rfl

/-- Other statuses do not qualify. -/
theorem other_not_qualifies : isQualifiedHeir HeirStatus.other = false := rfl

end JapanTaxLaw.SpecialMeasuresArt70_3PresumptiveHeirCondition
