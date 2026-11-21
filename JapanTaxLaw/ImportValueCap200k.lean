import JapanTaxLaw.TaxFinance

/-
# ImportValueCap200k — 関税定率法施行令 第十三条の六（輸入物品の額の総額 二十万円）

Pinned source:
  Law id: 329CO0000000155
  Official title: 関税定率法施行令
  Law number: 昭和二十九年政令第百五十五号
  Law type: CabinetOrder (政令)
  Revision: 329CO0000000155_20260401_508CO0000000085
  Enforcement: 2026-04-01
  Raw snapshot: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
  sha256: 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01
  Statutory article: 第十三条の六 (art. 13_6; raw JSON Article attr.Num = "13_6").
  Source path: law_full_text → Article[Num=13_6] → Paragraph[Num=1] →
  TableStruct → Table → TableRow[3] → TableColumn[2] → Sentence (table cell).
  Verified by independent re-extraction: 1 structural hit; needle verbatim once.

原文逐語（pinned, 一字一句改変なし; 表の下欄の当該セル）:
  「輸入する者ごとに財務省令で定めるところにより計算した輸入する物品の額の総額が二十万円を超えない範囲内において財務省令で定める額以下である場合における当該輸入する物品以外のもの」

Variable contract:
  `amount : Nat` = 輸入する物品の額の総額 (total value of the imported goods),
  unit 円 (whole yen).
  `valueCap : Nat := 200_000` = 二十万円 = 200,000 円.
  `withinCap amount := decide (amount <= valueCap)`; 「超えない」 = NOT exceeding =
  INCLUSIVE <=, so exactly ¥200,000 is within the cap and ¥200,001 is outside it.

Scope: ONLY the explicit direct numeric cap is modelled — 二十万円 = 200,000 円 and
「超えない」 = inclusive <=. The additional 「財務省令で定める額以下」 (a separate,
delegated, non-numeric condition), the calculation method 「財務省令で定めるところに
より計算した」, the goods classification, the actor and every other article are
NOT MODELLED.

No `sorry`, `admit`, `axiom`, `Classical.choice`, `Monotone`, or struct literals.
-/

namespace JapanTaxLaw.ImportValueCap200k

/-- 二十万円 = 200,000 円. Unit 円; domain Nat. -/
def valueCap : Nat := 200_000

/-- 「輸入する物品の額の総額が二十万円を超えない」: amount <= ¥200,000
    (超えない = inclusive <=). -/
def withinCap (amount : Nat) : Bool :=
  decide (amount <= valueCap)

/-- ¥199,999 < 二十万円: the amount just below the cap is within it. -/
theorem below_cap_true : withinCap 199_999 = true := by
  unfold withinCap valueCap
  decide

/-- Exactly ¥200,000 (二十万円) is within the cap: 超えない is inclusive. -/
theorem at_cap_true : withinCap 200_000 = true := by
  unfold withinCap valueCap
  decide

/-- ¥200,001 > 二十万円: the first amount above the cap is outside. -/
theorem above_cap_false : withinCap 200_001 = false := by
  unfold withinCap valueCap
  decide

/-- Zero yen is within the cap. -/
theorem zero_true : withinCap 0 = true := by
  unfold withinCap valueCap
  decide

/-- Direct-inequality monotonicity (no `Monotone`): if a larger amount is within
    the cap, any smaller amount is within it too. -/
theorem withinCap_of_le {amount amount' : Nat}
    (h : withinCap amount = true) (hle : amount' <= amount) :
    withinCap amount' = true := by
  unfold withinCap valueCap at h ⊢
  apply decide_eq_true
  have ha : amount <= 200_000 := of_decide_eq_true h
  omega

end JapanTaxLaw.ImportValueCap200k
