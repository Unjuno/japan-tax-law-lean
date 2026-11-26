import JapanTaxLaw.TaxFinance

/-
# LocalTax57TwoPrefecturesResidentsTax — pinned clause 「（二以上の道府県において事務所又は事業所を有する法人の道府県民税の申告納付）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 57.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|c33aed21809089961919681561d7b6f5f336d92ba115de0dcef799bb5cbed752.
原文逐語: 「（二以上の道府県において事務所又は事業所を有する法人の道府県民税の申告納付）」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 二以上 (inclusive floor). -/
def threshold : Nat := 2

/-- 「（二以上の道府県において事務所又は事業所を有する法人の道府県民税の申告納付）」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax57TwoPrefecturesResidentsTax
