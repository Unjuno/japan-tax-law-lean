import JapanTaxLaw.TaxFinance

/-
# LocalTax349_5TwoLargeAssetsMerger — pinned clause 「この場合において、一の納税義務者が一の市町村の区域内において第一適用年度を同じくする二以上の新設大規模償却資産を所有するときは、これらの新設大規模償却資産を合わせて一の新設大規模償却資産とみなす。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 349_5, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|0d8980dbdfe9978576e18a7ef8a66da0448cc905b0bbbe89b55373b5fa9601a1.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:349_5/Article#349_5/Paragraph#1/ParagraphSentence/Sentence#2.
原文逐語: 「この場合において、一の納税義務者が一の市町村の区域内において第一適用年度を同じくする二以上の新設大規模償却資産を所有するときは、これらの新設大規模償却資産を合わせて一の新設大規模償却資産とみなす。」
Scope: ONLY the 二以上の新設大規模償却資産 (assets ≥ 2) lower bound. 一の納税義務者・一の市町村の区域内・第一適用年度を同じくするとの事実認定, 合算後の価格算定, 他の項, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (2), INCLUSIVE lower bound. -/
def threshold : Nat := 2

/-- 「この場合において、一の納税義務者が一の市町村の区域内において第一適用年度を同じくする二以上の新設大規模償却資産を所有するときは、これらの新設大規模償却資産を合わせて一の新設大規模償却資産とみなす。」. -/
def inScope (assets : Nat) : Prop := threshold ≤ assets

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (assets : Nat) : Bool := decide (2 ≤ assets)

end JapanTaxLaw.LocalTax349_5TwoLargeAssetsMerger
