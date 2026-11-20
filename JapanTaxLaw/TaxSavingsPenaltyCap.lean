import JapanTaxLaw.TaxFinance

/-!
# TaxSavingsPenaltyCap — 納税貯蓄組合法 第十四条（過料）bounded L4 モデル

Pinned source:
  Law id: 326AC1000000145
  Revision: 326AC1000000145_20211122_503AC0000000046
  Raw snapshot: data/raw/326AC1000000145_20211122_503AC0000000046.law.json
  sha256: fc6c4ca152291c10c1218a62303a879195bfbbe95a056d0e264ee0315bbc4e2b
  Statutory article: 第十四条 (art. 14), attr.Num="14"

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する者は、十万円以下の過料に処する。」

Scope — ONLY the explicit statutory cap is modelled: 十万円 = 100,000 yen,
「以下」 = inclusive <=. The enumerated offender categories (一〜三), the
第三条 / 第四条 / 第七条 / 第十二条 violations and the 不正の方法 / 補助金 /
検査 facts are all OUT OF SCOPE and are NOT parameters. This model is not a
legal review; actual imposition is for the courts.
-/

namespace JapanTaxLaw.TaxSavingsPenaltyCap

open JapanTaxLaw.TaxFinance

/-- 過料の上限 = 十万円 = 100,000 円（「以下」は上限を含む）。 -/
def penaltyCap : Money := 100_000

/-- 過料額が原文の上限内か（十万円以下 = inclusive <=）。 -/
def withinPenaltyCap (amount : Money) : Bool := amount <= penaltyCap

/-- The pinned cap is exactly 100,000 yen. -/
theorem penaltyCap_eq : penaltyCap = 100_000 := by decide

/-- Any amount at or below 十万円 is within the cap. -/
theorem withinPenaltyCap_of_le {amount : Money} (h : amount <= penaltyCap) :
    withinPenaltyCap amount = true := by
  simp [withinPenaltyCap, h]

/-- The inclusive boundary: 十万円 itself is within the cap. -/
theorem withinPenaltyCap_at_cap : withinPenaltyCap penaltyCap = true :=
  withinPenaltyCap_of_le (Nat.le_refl penaltyCap)

/-- Zero is within the cap. -/
theorem withinPenaltyCap_zero : withinPenaltyCap 0 = true :=
  withinPenaltyCap_of_le (Nat.zero_le penaltyCap)

/-- Anything strictly above 十万円 exceeds the cap. -/
theorem not_withinPenaltyCap_of_gt {amount : Money} (h : penaltyCap < amount) :
    withinPenaltyCap amount = false := by
  simp [withinPenaltyCap, Nat.not_le_of_gt h]

/-- The first amount above the cap, 十万円 + 1, is outside. -/
theorem cap_succ_outside : withinPenaltyCap (penaltyCap + 1) = false :=
  not_withinPenaltyCap_of_gt (Nat.lt_succ_self penaltyCap)

end JapanTaxLaw.TaxSavingsPenaltyCap
