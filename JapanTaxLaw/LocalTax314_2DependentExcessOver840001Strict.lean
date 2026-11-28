import JapanTaxLaw.TaxFinance

/-
# LocalTax314_2DependentExcessOver840001Strict — pinned clause 「六十三万円から当該特定親族の前年の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額（当該乗じた金額が十万円の整数倍の金額から八万円を控除した金額でないときは、十万円の整数倍の金額から八万円を控除した金額で当該乗じた金額に満たないもののうち最も多い金額とする。）を控除した金額」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 314_2, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|3a21ded59fc74d83829f2435d77387a9f9fd417f57b683650fb488f15aa3fa5c.
原文逐語: 「六十三万円から当該特定親族の前年の合計所得金額のうち八十四万一円を超える部分の金額に二を乗じた金額（当該乗じた金額が十万円の整数倍の金額から八万円を控除した金額でないときは、十万円の整数倍の金額から八万円を控除した金額で当該乗じた金額に満たないもののうち最も多い金額とする。）を控除した金額」
Scope: ONLY the 八十四万一円を超える (yen > 840001) STRICT excess over the 特定親族 income base in 地方税法 art. 314_2(1). The 六十三万円 base, the 二を乗じた金額 formula, the 十万円 rounding and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict

open JapanTaxLaw.TaxFinance

/-- 「八十四万一円を超える」 — statutory threshold literal 840_001; STRICT boundary. -/
def inScope (yen : Nat) : Prop := 840_001 < yen

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (840_001 < yen)

end JapanTaxLaw.LocalTax314_2DependentExcessOver840001Strict
