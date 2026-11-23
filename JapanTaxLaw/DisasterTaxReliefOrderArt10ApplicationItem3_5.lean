import JapanTaxLaw.TaxFinance

/-!
# DisasterTaxReliefOrderArt10ApplicationItem3_5 — EFFECT

Pinned source:
  Law id: 322CO0000000268
  Official title: 昭和二十二年政令第二百六十八号（災害被害者に対する租税の減免、徴収猶予等に関する法律の施行に関する政令）
  Law number: 昭和二十二年政令第二百六十八号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/322CO0000000268_*.law.json
  sha256: f6fe1c9380cd7659d682d0b6d294c920f364045905a23f624f372c419a66a21c
  Normative unit id: NORM|89782d86b1c41898c6684fa9644bde155cf5722491c2e2a5a743f27654b89cc5
  Source path: LawBody[1]/MainProvision/MainProvision[10]/Article:10/Article#10/
               Paragraph#1/Item#2/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「法第三条第五項の規定の適用を受けようとする旨」

Norm kind: EFFECT — this is one listed item of an application: the applicant must
state the purport of seeking application of 法第3条第5項 (Act art.3
para.5). The computable slice models the required-item discrimination and the
referenced coordinates. The application procedure and other items are NOT MODELLED.
Structural facts extracted from the needle; no hand-typed CJK.

Variable contract (meaning / domain / type):
  ApplicationItem : Type — actArt3Para5Intent (the stated purport) or other.
  isRequiredItem : ApplicationItem -> Bool — true for the listed item.
  refArticle/Paragraph : Nat — 3, 5.
  No numeric amount/unit applies (structural cross-reference).

Scope: only the listed-item discrimination and reference coordinates. Application
procedure, other items and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5

/-- The application item: the stated purport of seeking art.3(5) application. -/
inductive ApplicationItem : Type
  | actArt3Para5Intent : ApplicationItem
  | other : ApplicationItem

deriving instance DecidableEq for ApplicationItem

/-- Referenced coordinates in the Act. -/
def refArticle : Nat := 3
def refParagraph : Nat := 5

/-- The listed item is required. -/
def isRequiredItem (i : ApplicationItem) : Bool :=
  match i with
  | ApplicationItem.actArt3Para5Intent => true
  | ApplicationItem.other => false

/-- The reference coordinates are 3/5. -/
theorem reference_coordinates : refArticle = 3 ∧ refParagraph = 5 := ⟨rfl, rfl⟩

/-- The listed item is required. -/
theorem listed_item_required : isRequiredItem ApplicationItem.actArt3Para5Intent = true := rfl

/-- Other items are not this listed item. -/
theorem other_not_listed : isRequiredItem ApplicationItem.other = false := rfl

end JapanTaxLaw.DisasterTaxReliefOrderArt10ApplicationItem3_5
