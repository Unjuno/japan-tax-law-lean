import JapanTaxLaw.TaxFinance

/-
# SixMonthPeriodDeeming — 納税貯蓄組合法施行令 第三条（六月をこえる場合の区分・みなし）

Pinned source:
  Law id: 326CO0000000099
  Official title: 納税貯蓄組合法施行令
  Law number: 昭和二十六年政令第九十九号
  Law type: CabinetOrder (政令)
  Revision: 326CO0000000099_20191216_501CO0000000183
  Raw snapshot: data/raw/326CO0000000099_20191216_501CO0000000183.law.json
  sha256: 4bea6d03094f44349178f1f6be77f66c0f71ac107cd78b8a5edab5081fc9e84c
  Statutory article: 第三条 (art. 3; raw JSON Article attr.Num = "3").
  Source path: law_full_text → Article[Num=3] → 第二項 (verified by
  independent re-extraction: 1 structural hit, needle occurs verbatim once).

原文逐語（pinned, 一字一句改変なし）:
  「前項に規定する利子計算期間又は事業年度が六月をこえる場合においては、同項の規定の適用については、当該利子計算期間又は事業年度開始の日から六月ごとに区分した期間（最後に六月未満の期間を生じたときは、当該期間）を、それぞれ一利子計算期間又は一事業年度とみなす。」

Variable contract:
  `months : Nat` = 利子計算期間／事業年度の月数 (number of months), unit 月.
  六月 = 6 months. 六月をこえる = STRICT `> 6` (not 以上).
  Ceiling segmentation: `segmentCount months := if months == 0 then 0 else (months + 5) / 6`
  = ceil(months / 6). For months > 6 the period is split into successive
  6-month chunks; a final chunk shorter than 6 months (六月未満の期間) still
  counts as a segment (当該期間); each chunk is DEEMED one 利子計算期間／事業年度.
  For 1 <= months <= 6 there is a single segment; months = 0 gives 0 segments.

Scope: ONLY the explicit deeming rule (strict > 6 trigger, 6-month chunks,
final short chunk counted, one deemed period per chunk) is modelled. The
 preceding paragraph's definition of 利子計算期間／事業年度, the financial-
 institution rate special case (第三項), the calculation of interest itself,
 and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.SixMonthPeriodDeeming

/-- 六月ごとに区分した期間の数 = ceil(months / 6). months = 0 のとき 0. -/
def segmentCount (months : Nat) : Nat :=
  if months == 0 then 0 else (months + 5) / 6

/-- 「六月をこえる」: STRICT `> 6`, so exactly six months does not trigger. -/
def deemingApplies (months : Nat) : Bool :=
  decide (months > 6)

/-- The zero guard is redundant: (0 + 5) / 6 = 0, so segmentCount n = (n+5)/6
    for every n (including n = 0). Pure `cases` + `rfl`. -/
theorem segmentCount_eq_div (months : Nat) : segmentCount months = (months + 5) / 6 := by
  unfold segmentCount
  cases months <;> rfl

theorem segmentCount_zero : segmentCount 0 = 0 := by decide
theorem segmentCount_one : segmentCount 1 = 1 := by decide
theorem segmentCount_six : segmentCount 6 = 1 := by decide
theorem segmentCount_seven : segmentCount 7 = 2 := by decide
theorem segmentCount_twelve : segmentCount 12 = 2 := by decide
theorem segmentCount_thirteen : segmentCount 13 = 3 := by decide
theorem segmentCount_eighteen : segmentCount 18 = 3 := by decide

/-- The first partial chunk (months = 7) is counted as a second segment. -/
theorem final_partial_chunk_counts : segmentCount 7 = segmentCount 6 + 1 := by decide

theorem deeming_at_six : deemingApplies 6 = false := by decide
theorem deeming_at_seven : deemingApplies 7 = true := by decide

/-- At exactly six months the STRICT 六月をこえる test fails (pure Nat omega). -/
theorem at_six_no_split : ¬ (6 : Nat) > 6 := by omega

/-- Any positive period has at least one deemed segment. -/
theorem segmentCount_pos_of_pos {months : Nat} (hpos : months > 0) :
    1 <= segmentCount months := by
  rw [segmentCount_eq_div]
  exact Nat.div_pos (by omega) (by decide)

/-- Monotonicity as a direct inequality (no `Monotone`): a longer period is
    never split into fewer segments. -/
theorem segmentCount_mono {a b : Nat} (h : a <= b) : segmentCount a <= segmentCount b := by
  rw [segmentCount_eq_div a, segmentCount_eq_div b]
  exact Nat.div_le_div_right h

end JapanTaxLaw.SixMonthPeriodDeeming
