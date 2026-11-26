import JapanTaxLaw.TaxFinance

/-
# LocalTax321_14TwoMunicipalitiesEmployeeCount — pinned clause 「（二以上の市町村において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 321_14.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|3a9c0ba8856d5d1683d8da5e761646945ab14c255426a5f102c4a6fcc639bd4c.
原文逐語: 「（二以上の市町村において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 二以上 (inclusive floor). -/
def threshold : Nat := 2

/-- 「（二以上の市町村において事務所又は事業所を有する法人の法人税額の分割の基準となる従業者数の修正又は決定）」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax321_14TwoMunicipalitiesEmployeeCount
