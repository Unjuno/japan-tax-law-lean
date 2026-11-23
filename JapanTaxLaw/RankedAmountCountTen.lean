import JapanTaxLaw.TaxFinance

/-
# RankedAmountCountTen — 高額適用額 第六条（順位十件目までの算定）

Pinned source:
  Law id: 422M60000040022
  Revision: 422M60000040022_20260731_508M60000040041
  Raw snapshot: data/raw/422M60000040022_20260731_508M60000040041.law.json
  sha256: 950d67e96e5219efae8f4540695ec98dc7caf97c460fa0812ffe118d90cb4472
  Statutory article: 第六条 (art. 6; raw JSON Article attr.Num = "6").

原文逐語（pinned, 一字一句改変なし）:
  「この場合において、同号に規定する高額適用額は、その順位を付した適用額が十以上となるまでの適用額に順位を付した場合の第一順位から当該十以上となる順位までに該当する各適用額（第一順位の適用額が十以上となるときは、当該第一順位の適用額）とする。」

Variable contract:
  `n : Nat` = 順位を付した適用額の数 (単位 件, count of ranked applicable amounts).
  十以上 = n >= 10, INCLUSIVE at 10 (十 = 10); the cutoff count is 10.
  When the first-ranked amount itself already counts as 十以上, that single
  amount is used (第一順位の適用額が十以上となるときは、当該第一順位の適用額).
  This module models ONLY the explicit numeric COUNT-CUTOFF: ranking continues
  until the ranked applicable amount reaches 十以上, and the set of ranked
  amounts is those from rank 1 up to the rank at which the count reaches 10.
  The ranking procedure, amount computation, 同号 definition and all other
  provisions are OUT OF SCOPE. No order typeclass, by_cases, omega,
  Classical.choice or struct literals are used.

No `sorry`, `admit`, `axiom`. All predicates are direct Bool expressions;
proofs are by `rfl` or `by decide` on concrete decidable propositions.
-/

namespace JapanTaxLaw.RankedAmountCountTen

/-- 十 = 10 — the statutory inclusive count cutoff. -/
def rankCutoff : Nat := 10

/-- 十以上判定: n >= 10, INCLUSIVE at 10. -/
def reachesCutoff (n : Nat) : Bool :=
  decide (rankCutoff <= n)

/-- 十 = 10. -/
theorem rankCutoff_is_10 : rankCutoff = 10 := by
  decide

/-- 0 件 (< 10) は未到達. -/
theorem reachesCutoff0 : reachesCutoff 0 = false := by
  decide

/-- 9 件 (< 10) は未到達. -/
theorem reachesCutoff9 : reachesCutoff 9 = false := by
  decide

/-- 10 件 (== 10, INCLUSIVE) は到達. -/
theorem reachesCutoff10 : reachesCutoff 10 = true := by
  decide

/-- 11 件 (> 10) は到達. -/
theorem reachesCutoff11 : reachesCutoff 11 = true := by
  decide

/-- 20 件 (> 10) は到達. -/
theorem reachesCutoff20 : reachesCutoff 20 = true := by
  decide

end JapanTaxLaw.RankedAmountCountTen
