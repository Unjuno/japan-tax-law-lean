import JapanTaxLaw.TaxFinance

/-
# LocalTax321_13TwoMunicipalities — pinned clause 「（二以上の市町村において事務所又は事業所を有する法人の市町村民税の申告納付）」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 321_13.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0e932ec0fb941e86071a8901c857ebbebb1b85e67158a821fb23df425736697a.
原文逐語: 「（二以上の市町村において事務所又は事業所を有する法人の市町村民税の申告納付）」
Scope: ONLY the threshold of this clause. Other amounts, classifications,
procedures and articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax321_13TwoMunicipalities

open JapanTaxLaw.TaxFinance

/-- Statutory threshold — 以上 (inclusive). -/
def threshold : Nat := 2

/-- 「（二以上の市町村において事務所又は事業所を有する法人の市町村民税の申告納付）」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax321_13TwoMunicipalities
