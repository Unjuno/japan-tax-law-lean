import JapanTaxLaw.TaxFinance

/-
# LocalTax349_4PopulationOver6000Inclusive — pinned clause 「人口六千人未満の場合には五億四千四百万円、人口六千人以上の場合には五億四千四百万円に人口五千人から計算して人口千人を増すごとに四千四百万円を加算した額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 349_4, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|33deb9b0beadda5cf0073daba40d497bbb4787eb919f359d92efd23201ad4ef3.
原文逐語: 「人口六千人未満の場合には五億四千四百万円、人口六千人以上の場合には五億四千四百万円に人口五千人から計算して人口千人を増すごとに四千四百万円を加算した額」
Scope: ONLY the 六千人以上 (population >= 6000) INCLUSIVE lower bound in the 人口五千人以上一万人未満の市町村 amount-calculation branch of the 大規模の償却資産 table in 地方税法 art. 349_4(1). The 六千人未満 upper branch, the 五億四千四百万円 base, the 人口千人を増すごとに四千四百万円 formula, the other municipality brackets and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax349_4PopulationOver6000Inclusive

open JapanTaxLaw.TaxFinance

/-- 「六千人以上」 — statutory threshold literal 6_000; INCLUSIVE boundary. -/
def inScope (population : Nat) : Prop := 6_000 <= population

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (population : Nat) : Bool := decide (6_000 <= population)

end JapanTaxLaw.LocalTax349_4PopulationOver6000Inclusive
