import JapanTaxLaw.TaxFinance

/-
# LocalTax37ElderSpouseIncomeUpTo9500000Inclusive — pinned clause 「（ｉｉ）　当該控除対象配偶者が老人控除対象配偶者である場合　十万円（当該納税義務者の前年の合計所得金額が九百万円を超え九百五十万円以下である場合には六万円、当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合には三万円）」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 37, paragraph 1.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|025a90513e240acd0592bbbc157f613885384ffe85942baec68dc76520fed7c9.
原文逐語: 「（ｉｉ）　当該控除対象配偶者が老人控除対象配偶者である場合　十万円（当該納税義務者の前年の合計所得金額が九百万円を超え九百五十万円以下である場合には六万円、当該納税義務者の前年の合計所得金額が九百五十万円を超え千万円以下である場合には三万円）」
Scope: ONLY the 九百五十万円以下 (income <= 9500000) INCLUSIVE ceiling of the reduced 調整控除 branch for 老人控除対象配偶者 in 地方税法 art. 37(1) item (6)(ii). The 九百万円を超える lower bound, the 九百五十万円を超え千万円以下 next bracket, the 十万円/六万円/三万円 deduction amounts and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive

open JapanTaxLaw.TaxFinance

/-- 「九百五十万円以下」 — statutory threshold literal 9_500_000; INCLUSIVE boundary. -/
def inScope (income : Nat) : Prop := income <= 9_500_000

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (income : Nat) : Bool := decide (income <= 9_500_000)

end JapanTaxLaw.LocalTax37ElderSpouseIncomeUpTo9500000Inclusive
