import JapanTaxLaw.TaxFinance

/-
# LocalTax28TwoAdjustmentParts — pinned clause 「二以上の調整部分を有する宅地等で非調整部分を有しないもの」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002, article 第二十八条 (Num 28), paragraph 2, item 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|ef827c289e7b4b88b1011a0e07988bf544407dfd154373fd2f33f5ade4abd2aa.
原文逐語: 「二以上の調整部分を有する宅地等で非調整部分を有しないもの」
Scope: ONLY the inclusive 二以上 threshold of this clause. The adjustment-part
classification, the non-adjusted-part exclusion, and all other items / articles
are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax28TwoAdjustmentParts

open JapanTaxLaw.TaxFinance

/-- 二 — 以上（inclusive） threshold. -/
def threshold : Nat := 2

/-- 「二以上の調整部分を有する宅地等で非調整部分を有しないもの」. -/
def inScope (amount : Nat) : Prop := amount ≥ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Nat) : Bool := decide (amount ≥ 2)

end JapanTaxLaw.LocalTax28TwoAdjustmentParts
