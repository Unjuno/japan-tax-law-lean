import JapanTaxLaw.TaxFinance

/-
# LocalTax349_4PopulationOver10000Inclusive — pinned clause 「人口一万人以上三万人未満の市町村」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 349_4, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ac8394db50c60dfad20bd6bef83505da75ec3e0438648cc6035032a6abe83a07.
原文逐語: 「人口一万人以上三万人未満の市町村」
Scope: ONLY the 一万人以上 (population >= 10000) INCLUSIVE lower bound of the 基準財政収入 municipality bracket in 地方税法 art. 349_4(1). The 三万人未満 upper bound, the 基準財政需要額 calculations, other brackets and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax349_4PopulationOver10000Inclusive

open JapanTaxLaw.TaxFinance

/-- 「一万人以上」 — statutory threshold literal 10_000; INCLUSIVE boundary. -/
def inScope (population : Nat) : Prop := 10_000 <= population

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (population : Nat) : Bool := decide (10_000 <= population)

end JapanTaxLaw.LocalTax349_4PopulationOver10000Inclusive
