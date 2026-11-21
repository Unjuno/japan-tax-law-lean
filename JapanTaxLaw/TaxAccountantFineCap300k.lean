import JapanTaxLaw.TaxFinance

/-
# TaxAccountantFineCap300k — 税理士法 第六十二条（罰金: 三十万円以下）

Pinned source:
  Law id: 326AC1000000237
  Official title: 税理士法
  Law number: 昭和二十六年法律第二百三十七号
  Law type: Act (法律)
  Revision: 326AC1000000237_20251001_505AC0000000053
  Raw snapshot: data/raw/326AC1000000237_20251001_505AC0000000053.law.json
  sha256: 46d956e2c48954577ec3479c5e8c83a2a2ff913860a2ba6b2eea327f3107916f
  Statutory article: 第六十二条 (art. 62; raw JSON Article attr.Num = "62").
  Source path: law_full_text → Article[Num=62] → first sentence (verified by
  independent re-extraction: 1 structural hit, needle occurs verbatim once).

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する場合には、その違反行為をした者は、三十万円以下の罰金に処する。」

Variable contract:
  `amount : Nat` = 罰金の額 (amount of the criminal fine), unit 円, whole yen.
  `fineCap : Nat := 300_000` = 三十万円 (300,000 yen).
  `withinFineCap amount := decide (amount <= fineCap)`; 「以下」 is INCLUSIVE (<=),
  so exactly ¥300,000 is within the cap and ¥300,001 is outside it.

Scope: ONLY the explicit numeric cap is modelled — 三十万円 = 300,000 yen and
「以下」 = inclusive <=. The enumerated violation cases (各号), the referenced
articles, imprisonment (none in this clause), other paragraphs and other
articles are NOT MODELLED. Actual sentencing is judicial.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.TaxAccountantFineCap300k

/-- 三十万円 = 300,000 円. Unit 円; domain Nat. -/
def fineCap : Nat := 300_000

/-- 「三十万円以下の罰金」: amount is at most ¥300,000 (以下 = inclusive <=). -/
def withinFineCap (amount : Nat) : Bool :=
  decide (amount <= fineCap)

/-- 299,999 < 300,000: the amount just below the cap is within it. -/
theorem below_cap_true : withinFineCap 299_999 = true := by
  unfold withinFineCap fineCap
  decide

/-- Exactly 300,000 (三十万円) is within the cap: 以下 is inclusive. -/
theorem at_cap_true : withinFineCap 300_000 = true := by
  unfold withinFineCap fineCap
  decide

/-- 300,001 > 300,000: the first amount above the cap is outside. -/
theorem above_cap_false : withinFineCap 300_001 = false := by
  unfold withinFineCap fineCap
  decide

/-- Zero yen is within the cap. -/
theorem zero_true : withinFineCap 0 = true := by
  unfold withinFineCap fineCap
  decide

/-- Monotonicity as a direct inequality (no `Monotone`): if a larger amount
    is within the cap, any smaller amount is within it too. -/
theorem withinFineCap_of_le {amount amount' : Nat}
    (h : withinFineCap amount = true) (hle : amount' <= amount) :
    withinFineCap amount' = true := by
  unfold withinFineCap fineCap at h ⊢
  apply decide_eq_true
  have ha : amount <= 300_000 := of_decide_eq_true h
  omega

end JapanTaxLaw.TaxAccountantFineCap300k
