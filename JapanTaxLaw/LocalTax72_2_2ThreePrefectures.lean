import JapanTaxLaw.TaxFinance

/-
# LocalTax72_2_2ThreePrefectures — pinned clause 「受託法人及び三以上の道府県において事務所又は事業所を設けて事業を行う固有法人で」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_2_2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|e4e15922c903fdf06a978817a3091a91ef98e41cfed4aea6b6b2d2e9acca29c7.
原文逐語: 「受託法人及び三以上の道府県において事務所又は事業所を設けて事業を行う固有法人で」
Scope: ONLY the threshold/tier interval of this clause. The trust-taxation
reading table, other tiers and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_2_2ThreePrefectures

open JapanTaxLaw.TaxFinance

/-- 三 — 以上（inclusive） threshold (three or more prefectures). -/
def threshold : Nat := 3

/-- 「三以上の道府県において事務所又は事業所を設けて事業を行う固有法人で」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 3)

end JapanTaxLaw.LocalTax72_2_2ThreePrefectures
