import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt67LocalSurchargeProhibition — EFFECT

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|0b8a19d9bdded2a705b40e195fe00f80c0287dd8fbb3abfb0f1c51511ecde0ec
  Source path: LawBody[3]/MainProvision/MainProvision[6]/Article:67/Article#67/Paragraph#1/ParagraphSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「地方公共団体は、相続税又は贈与税の付加税を課することができない。」

Norm kind: EFFECT — a prohibition: 地方公共団体 (local public entities) cannot
impose a 付加税 (surcharge) on 相続税 or 贈与税. The computable slice
models the prohibition discriminator: a surcharge on inheritance or gift tax by a
local public entity is prohibited. All statutory terms below are reproduced
programmatically from the verbatim needle; the canonical quote is byte-verbatim.

Variable contract (meaning / domain / type):
  TaxKind : Type — inheritance (相続税), gift (贈与税), other.
  isLocal : Bool — whether the imposing body is a local public entity (caller-established).
  isProhibited : Bool -> TaxKind -> Bool — true for local entities on the two named taxes.
  No numeric amount/unit applies (structural prohibition).

Scope: only the prohibition discriminator. Penalties, enforcement, and legal
correctness are NOT MODELLED. Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition

/-- The taxes named in the prohibition. -/
inductive TaxKind : Type
  | inheritance : TaxKind
  | gift : TaxKind
  | other : TaxKind

/-- 地方公共団体は、相続税又は贈与税の付加税を課することができない。 -/
def isProhibited (isLocal : Bool) (t : TaxKind) : Bool :=
  isLocal && match t with
  | TaxKind.inheritance => true
  | TaxKind.gift => true
  | TaxKind.other => false

/-- Local entity surcharge on inheritance tax is prohibited. -/
theorem local_inheritance_prohibited : isProhibited true TaxKind.inheritance = true := rfl

/-- Local entity surcharge on gift tax is prohibited. -/
theorem local_gift_prohibited : isProhibited true TaxKind.gift = true := rfl

/-- Non-local imposition is not prohibited by this provision. -/
theorem non_local_not_prohibited : isProhibited false TaxKind.inheritance = false := rfl

/-- A surcharge on another tax is not prohibited by this provision. -/
theorem other_tax_not_prohibited : isProhibited true TaxKind.other = false := rfl

end JapanTaxLaw.InheritanceTaxArt67LocalSurchargeProhibition
