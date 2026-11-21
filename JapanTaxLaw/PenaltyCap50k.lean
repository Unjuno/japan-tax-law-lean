import JapanTaxLaw.TaxFinance

/-
# PenaltyCap50k — ＴＩＲ条約実施に伴う関税法等の特例に関する法律 第十八条（罰金: 五万円以下）

Pinned source:
  Law id: 346AC0000000065
  Official title: コンテナーに関する通関条約及び国際道路運送手帳による担保の下で行なう貨物の国際運送に関する通関条約（ＴＩＲ条約）の実施に伴う関税法等の特例に関する法律
  Law number: 昭和四十六年法律第六十五号
  Law type: Act (法律)
  Revision: 346AC0000000065_20120401_424AC0000000019
  Raw snapshot: data/raw/346AC0000000065_20120401_424AC0000000019.law.json
  sha256: 82bef1179656ff64b2d1b118e065b6373071425a93d8dfbfcf2a43e195b6daf7
  Statutory article: 第十八条 (art. 18; raw JSON Article attr.Num = "18").
  Source path: law_full_text → Article[Num=18] → first sentence (verified by
  independent re-extraction: 1 structural hit, needle occurs verbatim once).

原文逐語（pinned, 一字一句改変なし）:
  「次の各号のいずれかに該当する者は、五万円以下の罰金に処する。」

Variable contract:
  `amount : Nat` = 罰金の額 (amount of the criminal fine), unit 円, whole yen.
  `fineCap : Nat := 50_000` = 五万円 (50,000 yen).
  `withinFineCap amount := decide (amount <= fineCap)`; 「以下」 is INCLUSIVE (<=),
  so exactly ¥50,000 is within the cap and ¥50,001 is outside it.

Scope: ONLY the explicit numeric cap is modelled — 五万円 = 50,000 yen and
「以下」 = inclusive <=. The enumerated violation cases (各号), the referenced
treaties (ＴＩＲ条約 etc.), other articles and actual sentencing are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.PenaltyCap50k

/-- 五万円 = 50,000 円. Unit 円; domain Nat. -/
def fineCap : Nat := 50_000

/-- 「五万円以下の罰金」: amount is at most ¥50,000 (以下 = inclusive <=). -/
def withinFineCap (amount : Nat) : Bool :=
  decide (amount <= fineCap)

/-- 49,999 < 50,000: the amount just below the cap is within it. -/
theorem below_cap_true : withinFineCap 49_999 = true := by
  unfold withinFineCap fineCap
  decide

/-- Exactly 50,000 (五万円) is within the cap: 以下 is inclusive. -/
theorem at_cap_true : withinFineCap 50_000 = true := by
  unfold withinFineCap fineCap
  decide

/-- 50,001 > 50,000: the first amount above the cap is outside. -/
theorem above_cap_false : withinFineCap 50_001 = false := by
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
  have ha : amount <= 50_000 := of_decide_eq_true h
  omega

end JapanTaxLaw.PenaltyCap50k
