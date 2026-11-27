import JapanTaxLaw.TaxFinance

/-
# LocalTax52CapitalUpTo10M — pinned clause 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもの」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 52, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|018f9cb69c1cc3f231a5e164da145f480f1456d005c3f5b095281308d5ffdd74.
原文逐語: 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもの」
Scope: ONLY the 資本金等の額が千万円以下 (amount <= 10000000) INCLUSIVE ceiling for the 法人格 classification. 別表第二の独立行政法人・ニに掲げる法人の除外・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax52CapitalUpTo10M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10000000), INCLUSIVE upper bound. -/
def threshold : Nat := 10000000

/-- 「ホ　資本金等の額を有する法人（法人税法別表第二に規定する独立行政法人で収益事業を行わないもの及びニに掲げる法人を除く。以下この表において同じ。）で資本金等の額が千万円以下であるもの」. -/
def inScope (amount : Nat) : Prop := amount <= threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount <= 10000000)

end JapanTaxLaw.LocalTax52CapitalUpTo10M
