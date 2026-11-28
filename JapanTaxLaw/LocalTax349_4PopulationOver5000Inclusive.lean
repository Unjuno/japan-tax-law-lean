import JapanTaxLaw.TaxFinance

/-
# LocalTax349_4PopulationOver5000Inclusive — pinned clause 「人口五千人以上一万人未満の市町村」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 349_4, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|dfd8bb51ddff64572c4e3d1e87eaabcd4ce91dee97ab536716316cde06f5e7cf.
原文逐語: 「人口五千人以上一万人未満の市町村」
Scope: ONLY the 五千人以上 (population >= 5000) INCLUSIVE lower bound of the 基準財政収入 populous-municipality bracket in 地方税法 art. 349_4(1). The 一万人未満 upper bound, the 基準財政需要額 calculations, other brackets and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive

open JapanTaxLaw.TaxFinance

/-- 「五千人以上」 — statutory threshold literal 5_000; INCLUSIVE boundary. -/
def inScope (population : Nat) : Prop := 5_000 <= population

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (population : Nat) : Bool := decide (5_000 <= population)

end JapanTaxLaw.LocalTax349_4PopulationOver5000Inclusive
