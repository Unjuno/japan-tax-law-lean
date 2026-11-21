import JapanTaxLaw.TaxFinance

/-
# TaxAccountantPenaltyCap — 税理士法 第六十四条（過料: 百万円以下）

Pinned source:
  Law id: 326AC1000000237
  Official title: 税理士法
  Law number: 昭和二十六年法律第二百三十七号
  Law type: Act (法律)
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  sha256: 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f
  Statutory article: 第六十四条 (art. 64; raw JSON Article attr.Num = "64")

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する者は、百万円以下の過料に処する。」

Variable contract:
  `amount : Nat` = 過料の額 (amount of the administrative fine), unit 円,
  whole yen (non-negative integer). `penaltyCap : Nat := 1_000_000` = 百万円.
  `withinPenaltyCap amount := decide (amount <= penaltyCap)`; 「以下」 is
  INCLUSIVE (<=), so exactly 百万円 is within the cap.

Scope: ONLY the explicit numeric cap is modelled — 百万円 = 1,000,000 yen and
「以下」 = inclusive <=. The enumerated offender categories (各号), the
第五十三条 / 第五十九条 violations, 報告/検査 facts, imprisonment, other
paragraphs and other articles are NOT MODELLED. Actual imposition is judicial.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TaxAccountantPenaltyCap

/-- 百万円 = 1,000,000 円. Unit 円; domain Nat. -/
def penaltyCap : Nat := 1_000_000

/-- 「百万円以下の過料」: amount is at most ¥1,000,000 (以下 = inclusive <=). -/
def withinPenaltyCap (amount : Nat) : Bool :=
  decide (amount <= penaltyCap)

/-- 999,999 < 1,000,000: the amount just below the cap is within it. -/
theorem below_cap_true : withinPenaltyCap 999_999 = true := by
  unfold withinPenaltyCap penaltyCap
  decide

/-- Exactly 1,000,000 (百万円) is within the cap: 以下 is inclusive. -/
theorem at_cap_true : withinPenaltyCap 1_000_000 = true := by
  unfold withinPenaltyCap penaltyCap
  decide

/-- 1,000,001 > 1,000,000: the first amount above the cap is outside. -/
theorem above_cap_false : withinPenaltyCap 1_000_001 = false := by
  unfold withinPenaltyCap penaltyCap
  decide

/-- Zero yen is within the cap. -/
theorem zero_true : withinPenaltyCap 0 = true := by
  unfold withinPenaltyCap penaltyCap
  decide

/-- Monotonicity as a direct inequality (no `Monotone`): if a larger amount
    is within the cap, any smaller amount is within it too. -/
theorem withinPenaltyCap_of_le {amount amount' : Nat}
    (h : withinPenaltyCap amount = true) (hle : amount' <= amount) :
    withinPenaltyCap amount' = true := by
  unfold withinPenaltyCap penaltyCap at h ⊢
  apply decide_eq_true
  have ha : amount <= 1_000_000 := of_decide_eq_true h
  omega

end JapanTaxLaw.TaxAccountantPenaltyCap
