import JapanTaxLaw.TaxFinance

/-!
# InheritanceTaxArt13ResidualAssetDebtException — EXCEPTION

Pinned source:
  Law id: 325AC0000000073
  Official title: 相続税法
  Law number: 昭和二十五年法律第七十三号
  Law type: Act (法律)
  Raw snapshot: data/raw/325AC0000000073_*.law.json
  sha256: c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7
  Normative unit id: NORM|e1208a4e5009376f0be8af0a4faaca058248f8ac09395b028762e51f640c3ddd
  Source path: LawBody[3]/MainProvision/MainProvision[1]/Article:13/Article#13/Paragraph#2/Item#3/ItemSentence/Sentence#1

原文逐語（pinned, 一字一句改変なし）:
  「前二号に掲げる債務を除くほか、その財産の取得、維持又は管理のために生じた債務」

Norm kind: EXCEPTION — a residual debt category: 前二号に掲げる債務を除くほか (excluding the
debts in the preceding two items), debts arising from the 取得、維持又は管理のため (acquisition,
maintenance or management) of the property. The computable slice models the
debt-category discriminator selecting this residual category. All statutory terms
below are reproduced programmatically from the verbatim needle; the canonical
quote is byte-verbatim.

Variable contract (meaning / domain / type):
  DebtCategory : Type — item1Debt, item2Debt, residualAssetDebt, other.
  isResidualAssetDebt : DebtCategory -> Bool — true only for the residual category.
  No numeric amount/unit applies (structural category discriminator); the actual
  debt amount is caller-established.

Scope: only the debt-category discriminator. Substantive debt valuation, the
preceding two items' content, and legal correctness are NOT MODELLED.
Human legal review pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException

/-- The debt categories relevant to the valuation rule. -/
inductive DebtCategory : Type
  | item1Debt : DebtCategory
  | item2Debt : DebtCategory
  | residualAssetDebt : DebtCategory
  | other : DebtCategory

/-- The residual asset debt category (see the verbatim quote above). -/
def isResidualAssetDebt (d : DebtCategory) : Bool :=
  match d with
  | DebtCategory.residualAssetDebt => true
  | DebtCategory.item1Debt => false
  | DebtCategory.item2Debt => false
  | DebtCategory.other => false

/-- The residual asset debt selects this category. -/
theorem residual_selected : isResidualAssetDebt DebtCategory.residualAssetDebt = true := rfl

/-- Item 1 debt is excluded. -/
theorem item1_excluded : isResidualAssetDebt DebtCategory.item1Debt = false := rfl

/-- Item 2 debt is excluded. -/
theorem item2_excluded : isResidualAssetDebt DebtCategory.item2Debt = false := rfl

/-- Other debt is not the residual category. -/
theorem other_not_selected : isResidualAssetDebt DebtCategory.other = false := rfl

end JapanTaxLaw.InheritanceTaxArt13ResidualAssetDebtException
