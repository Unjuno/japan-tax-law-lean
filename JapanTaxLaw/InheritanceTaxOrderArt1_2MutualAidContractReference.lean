import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxOrderArt1_2MutualAidContractReference — REFERENCE

Pinned source:
  Law id: 325CO0000000071
  Official title: 相続税法施行令
  Law number: 昭和二十五年政令第七十一号
  Law type: CabinetOrder (政令)
  Raw snapshot: data/raw/325CO0000000071_*.law.json
  sha256: d1addeab8ae8cbd7f038ac7efe6a27ea75c83d9e0fced138c3f3407442a29f04
  Normative unit id: NORM|11f7f4673dcaa2422142b0f75a5bb0310325bee78dc770b7857dd592bb56d975
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/
               Paragraph#1/Item#3/Subitem1#6/Subitem1Sentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「法第十二条第一項第五号に規定する共済制度に係る契約」

Norm kind: REFERENCE — a definition-by-reference: the relevant contracts are those
relating to the mutual aid system prescribed in 法第十二条第一項第五号 (Act art.12
para.1 item.5). The computable slice models the cross-law reference
coordinates and the act-prescribed discrimination. The content of the referenced
system and the contracts is NOT MODELLED. Structural facts extracted from the needle.

Variable contract (meaning / domain / type):
  MutualAidSystem : Type — actPrescribed (法第12条第1項第5号に規定する)
     or other.
  isActPrescribed : MutualAidSystem -> Bool — true iff act-prescribed.
  refArticle/Paragraph/Item : Nat — 12, 1, 5.
  No numeric amount/unit applies (structural cross-reference).

Scope: only the reference coordinates and act-prescribed discrimination. The
referenced system's content, contract terms, and legal correctness are NOT MODELLED.
Human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference

/-- The mutual aid system kind by reference. -/
inductive MutualAidSystem : Type
  | actPrescribed : MutualAidSystem
  | other : MutualAidSystem

deriving instance DecidableEq for MutualAidSystem

/-- The referenced coordinates in the Act. -/
def refArticle : Nat := 12
def refParagraph : Nat := 1
def refItem : Nat := 5

/-- Whether the system is the act-prescribed one. -/
def isActPrescribed (s : MutualAidSystem) : Bool :=
  match s with
  | MutualAidSystem.actPrescribed => true
  | MutualAidSystem.other => false

/-- The reference coordinates are 12/1/5. -/
theorem reference_coordinates :
    refArticle = 12 ∧ refParagraph = 1 ∧ refItem = 5 :=
  And.intro rfl (And.intro rfl rfl)

/-- The act-prescribed system is recognized. -/
theorem act_prescribed_true : isActPrescribed MutualAidSystem.actPrescribed = true := rfl

/-- Other systems are not the referenced one. -/
theorem other_false : isActPrescribed MutualAidSystem.other = false := rfl

end JapanTaxLaw.InheritanceTaxOrderArt1_2MutualAidContractReference
