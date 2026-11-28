import JapanTaxLaw.TaxFinance

/-
# LocalTax343LongerThanHundredYearsSurfaceRight — pinned clause 「固定資産税は、固定資産の所有者（質権又は百年より永い存続期間の定めのある地上権の目的である土地については、その質権者又は地上権者とする。以下固定資産税について同様とする。）に課する。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 343, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|38c6308f1da74431fc901ff760588d1b6224bbbc394f516a5795b4f34200a43a.
原文逐語: 「固定資産税は、固定資産の所有者（質権又は百年より永い存続期間の定めのある地上権の目的である土地については、その質権者又は地上権者とする。以下固定資産税について同様とする。）に課する。」
Scope: ONLY the 百年より永い存続期間の地上権の目的である土地の質権者・地上権者を所有者とする STRICT 下限（years > 100）. 質権の他の要件・固定資産税の課税標準・他号他項他条項は NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight

open JapanTaxLaw.TaxFinance

/-- Statutory threshold literal (100) with the inclusive/strict boundary fixed by the clause. -/
def inScope (years : Nat) : Prop := years > 100

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (years : Nat) : Bool := decide (years > 100)

end JapanTaxLaw.LocalTax343LongerThanHundredYearsSurfaceRight
