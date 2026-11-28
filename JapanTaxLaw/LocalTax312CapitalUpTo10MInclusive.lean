import JapanTaxLaw.TaxFinance

/-
# LocalTax312CapitalUpTo10MInclusive — pinned clause 「二　資本金等の額を有する法人で資本金等の額が千万円以下であるもののうち、従業者数の合計数が五十人を超えるもの」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 312, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|82b5d452e759278a730ae118ce1e565cab72d260e596b3731c5f137900f63550.
原文逐語: 「二　資本金等の額を有する法人で資本金等の額が千万円以下であるもののうち、従業者数の合計数が五十人を超えるもの」
Scope: ONLY the 千万円以下 (capital <= 10000000) INCLUSIVE ceiling for a 法人 with 資本金等の額 in the 均等割 table of 地方税法 art. 312(1). The 従業者数が五十人を超える condition, the other capital brackets and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive

open JapanTaxLaw.TaxFinance

/-- 「千万円以下」 — statutory threshold literal 10_000_000; INCLUSIVE boundary. -/
def inScope (capital : Nat) : Prop := capital <= 10_000_000

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (capital : Nat) : Bool := decide (capital <= 10_000_000)

end JapanTaxLaw.LocalTax312CapitalUpTo10MInclusive
