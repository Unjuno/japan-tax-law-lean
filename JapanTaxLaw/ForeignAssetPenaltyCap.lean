import JapanTaxLaw.TaxFinance

/-
# ForeignAssetPenaltyCap — 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律 第十条（国外財産調書の提出に関する罰則）

Pinned source:
  Law id: 409AC0000000110
  Official title: 内国税の適正な課税の確保を図るための国外送金等に係る調書の提出等に関する法律
  Law number: 平成九年法律第百十号
  Law type: Act (法律)
  Revision: 409AC0000000110_20260812_508AC0000000064
  Raw snapshot: data/raw/409AC0000000110_20260812_508AC0000000064.law.json
  sha256: b4440b62d96b6d2f0962a72c815ce075705da13530f625f1204d534313fc24ab
  Statutory article: 第十条 (art. 10; raw JSON Article attr.Num = "10").
  Source path: law_full_text → Article[Num=10] (verified by independent
  re-extraction: 1 structural hit, needle occurs verbatim once in the scoped
  article).

原文逐語（pinned, 一字一句改変なし）:
  「正当な理由がなくて国外財産調書をその提出期限までに税務署長に提出しなかったときは、その違反行為をした者は、一年以下の拘禁刑又は五十万円以下の罰金に処する。」

Variable contract:
  `years : Nat` = 拘禁刑の期間 (term of imprisonment), unit 年.
  `manYen : Nat` = 罰金の額 (amount of the criminal fine), unit 万円
  (1 万円 = 10,000 円; thus 50 万円 = 500,000 円).
  `imprisonmentCapYears : Nat := 1` = 一年 (one year).
  `fineCapManYen : Nat := 50` = 五十万円 (50 units of 万円 = 500,000 円).
  「一年以下」 = years <= 1 INCLUSIVE; 「五十万円以下」 = manYen <= 50 INCLUSIVE.
  `penaltyWithinCaps years manYen := withinImprisonmentCap years && withinFineCap manYen`
  conjoins the TWO independent numeric caps (a DUAL cap).

Scope: ONLY the two explicit numeric penalty caps are modelled — 一年以下の拘禁刑
and 五十万円以下の罰金, both with INCLUSIVE <=. This is a DUAL cap, distinct from
single-threshold models. The full offense (提出期限・正当な理由・提出義務), the
「又は」 alternative between imprisonment and fine, trial, sentencing and
procedure are NOT MODELLED.

All proofs are kernel reductions only: `rfl`, `by decide` and `&&`.
-/

namespace JapanTaxLaw.ForeignAssetPenaltyCap

/-- 一年 = 1 年 (unit 年, Nat). -/
def imprisonmentCapYears : Nat := 1

/-- 五十万円 = 50 万円 (unit 万円, 1 万円 = 10,000 円; Nat). -/
def fineCapManYen : Nat := 50

/-- 「一年以下の拘禁刑」: years is at most 1 年 (以下 = inclusive <=). -/
def withinImprisonmentCap (years : Nat) : Bool :=
  decide (years <= imprisonmentCapYears)

/-- 「五十万円以下の罰金」: manYen is at most 50 万円 (以下 = inclusive <=). -/
def withinFineCap (manYen : Nat) : Bool :=
  decide (manYen <= fineCapManYen)

/-- Both statutory caps hold simultaneously (DUAL cap): imprisonment axis && fine axis. -/
def penaltyWithinCaps (years : Nat) (manYen : Nat) : Bool :=
  withinImprisonmentCap years && withinFineCap manYen

theorem cap_years_eq_one : imprisonmentCapYears = 1 := by
  rfl

theorem cap_fine_eq_fifty : fineCapManYen = 50 := by
  rfl

theorem imp_zero_true : withinImprisonmentCap 0 = true := by
  decide

theorem imp_one_true : withinImprisonmentCap 1 = true := by
  decide

theorem imp_two_false : withinImprisonmentCap 2 = false := by
  decide

theorem fine_fortynine_true : withinFineCap 49 = true := by
  decide

theorem fine_fifty_true : withinFineCap 50 = true := by
  decide

theorem fine_fiftyone_false : withinFineCap 51 = false := by
  decide

theorem penalty_at_both_caps : penaltyWithinCaps 1 50 = true := by
  decide

theorem penalty_years_over : penaltyWithinCaps 2 50 = false := by
  decide

theorem penalty_fine_over : penaltyWithinCaps 1 51 = false := by
  decide

end JapanTaxLaw.ForeignAssetPenaltyCap
