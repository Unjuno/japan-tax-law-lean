import JapanTaxLaw.TaxFinance

/-
# LocalTax292SpouseIncomeUpTo10M — pinned clause 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である市町村民税の納税義務者の配偶者をいう。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 292, paragraph 1, item 8.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f584d6cc9b9067eaccf6847632e27f079a502c11047f7f90f1e8a1ff2686b9ec.
Source path: LawBody[2]/MainProvision/MainProvision[2]/Article:292/Article#292/Paragraph#1/Item#8/ItemSentence/Column#2/Sentence#1.
原文逐語: 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である市町村民税の納税義務者の配偶者をいう。」
Scope: ONLY the 前年の合計所得金額が千万円以下 (yen ≤ 10000000) ceiling. 同一生計の判定自体, 市町村民税の納税義務者の範囲, 他の号, 他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (10000000), INCLUSIVE ceiling. -/
def threshold : Nat := 10000000

/-- 「同一生計配偶者のうち、前年の合計所得金額が千万円以下である市町村民税の納税義務者の配偶者をいう。」. -/
def inScope (yen : Nat) : Prop := yen ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (yen : Nat) : Bool := decide (yen ≤ 10000000)

end JapanTaxLaw.LocalTax292SpouseIncomeUpTo10M
