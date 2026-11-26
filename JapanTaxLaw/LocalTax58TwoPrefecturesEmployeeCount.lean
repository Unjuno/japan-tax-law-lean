import JapanTaxLaw.TaxFinance

/-
# LocalTax58TwoPrefecturesEmployeeCount — pinned clause 「（二以上の道府県において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 58.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|94068b8d4435bc2cb64a3d6b7fe3f1bf1ae1c76f8d7a8362a2a519e474bfd1aa.
原文逐語: 「（二以上の道府県において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax58TwoPrefecturesEmployeeCount

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 二以上 (inclusive floor). -/
def threshold : Nat := 2

/-- 「（二以上の道府県において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax58TwoPrefecturesEmployeeCount
