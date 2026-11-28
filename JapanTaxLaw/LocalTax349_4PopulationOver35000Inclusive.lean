import JapanTaxLaw.TaxFinance

/-
# LocalTax349_4PopulationOver35000Inclusive — pinned clause 「人口三万五千人未満の場合には十二億八千万円、人口三万五千人以上の場合には十二億八千万円に人口三万人から計算して人口五千人を増すごとに八千万円を加算した額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 349_4, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|2adf43017931262e963d1579247b8ddd6a3420f27e553c2c3df2dd85dd35cd7c.
原文逐語: 「人口三万五千人未満の場合には十二億八千万円、人口三万五千人以上の場合には十二億八千万円に人口三万人から計算して人口五千人を増すごとに八千万円を加算した額」
Scope: ONLY the 三万五千人以上 (population >= 35000) INCLUSIVE lower bound in the 人口三万人以上二十万人未満の市町村 amount-calculation branch of the 大規模の償却資産 table in 地方税法 art. 349_4(1). The 三万五千人未満 upper branch, the 十二億八千万円 base, the 人口五千人を増すごとに八千万円 formula, the other municipality brackets and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive

open JapanTaxLaw.TaxFinance

/-- 「三万五千人以上」 — statutory threshold literal 35_000; INCLUSIVE boundary. -/
def inScope (population : Nat) : Prop := 35_000 <= population

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (population : Nat) : Bool := decide (35_000 <= population)

end JapanTaxLaw.LocalTax349_4PopulationOver35000Inclusive
