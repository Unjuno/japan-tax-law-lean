import JapanTaxLaw.TaxFinance

/-
# LocalTax312Capital10MEmployeesUpTo50Inclusive — pinned clause 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもののうち、市町村内に有する事務所、事業所又は寮等の従業者（政令で定める役員を含む。）の数の合計数（次号から第九号まで及び第五項において「従業者数の合計数」という。）が五十人以下のもの」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 312, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|a293a9321c21dd49dcd342ec4aa2e6e2cf2e853b34f4443eb3ffd890c78d93b3.
原文逐語: 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもののうち、市町村内に有する事務所、事業所又は寮等の従業者（政令で定める役員を含む。）の数の合計数（次号から第九号まで及び第五項において「従業者数の合計数」という。）が五十人以下のもの」
Scope: ONLY the 千万円以下 (capital <= 10000000) INCLUSIVE capital ceiling for a 法人 with 五十人以下の従業者数 in ホ of the 均等割 table in 地方税法 art. 312(1). The 五十人以下 employee condition, the 五万円 rate, the other capital/employee brackets and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive

open JapanTaxLaw.TaxFinance

/-- 「千万円以下」 — statutory threshold literal 10_000_000; INCLUSIVE boundary. -/
def inScope (capital : Nat) : Prop := capital <= 10_000_000

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (capital : Nat) : Bool := decide (capital <= 10_000_000)

end JapanTaxLaw.LocalTax312Capital10MEmployeesUpTo50Inclusive
