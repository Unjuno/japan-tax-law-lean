import JapanTaxLaw.TaxFinance

/-
# MonthCountExclusiveBand — 法人特別税法 第七条（指定期間内事業年度の月数範囲外除外）

Pinned source:
  Law id: 404AC0000000015
  Revision: 404AC0000000015_20010401_413AC0000000006
  Raw snapshot: data/raw/404AC0000000015_20010401_413AC0000000006.law.json
  sha256: 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8
  Statutory article: 第七条 (art. 7; raw JSON Article attr.Num = "7").
  Law title: 法人特別税法 (Act, 平成四年法律第十五号); revision enforced 2001-04-01.

原文逐語（pinned, 一字一句改変なし）:
  「事業年度の変更その他の事由により、指定期間内に終了する事業年度の月数の合計が二十四月に満たない法人及び当該月数の合計が二十四月を超える法人（次号から第五号までに掲げる法人を除く。）」

Variable contract:
  `months : Nat` = 指定期間内に終了する事業年度の月数の合計 (単位 月, whole months).
  二十四月 = 24 months (the statutory band value).
  excluded when months < 24 OR 24 < months (両側の範囲外); qualifies iff months == 24.

Scope: ONLY the explicit exclusive-band / exact-match logic of 第七条 is modelled:
  a corporation is EXCLUDED when its total month count is BELOW 二十四月 (24)
  OR ABOVE 二十四月 (24); therefore exactly 24 months qualifies. This is a
  two-sided exclusive band, NOT a one-sided threshold. The 第一号〜第五号
  enumerations, 適用期間, 課税標準 and all other provisions are OUT OF SCOPE.
  No order typeclass, by_cases, omega or Classical.choice is used.

No `sorry`, `admit`, `axiom`. All predicates are direct Bool expressions;
proofs are by `rfl` or `by decide` on concrete decidable propositions.
-/

namespace JapanTaxLaw.MonthCountExclusiveBand

/-- 二十四月 = 24 — the statutory band value. -/
def bandValue : Nat := 24

/-- 除外判定: months < 24 OR 24 < months (両側の範囲外). -/
def excludedByMonthCount (months : Nat) : Bool :=
  decide (months < bandValue || bandValue < months)

/-- 該当判定: 範囲外でないこと、すなわち months == 24. -/
def qualifiesByMonthCount (months : Nat) : Bool :=
  !excludedByMonthCount months

/-- 二十四月 = 24. -/
theorem bandValue_is_24 : bandValue = 24 := by
  decide

/-- 23 月 (< 24) は範囲外 → 除外. -/
theorem excluded23 : excludedByMonthCount 23 = true := by
  decide

/-- 24 月 (== 24) は範囲内 → 除外しない. -/
theorem excluded24 : excludedByMonthCount 24 = false := by
  decide

/-- 25 月 (> 24) は範囲外 → 除外. -/
theorem excluded25 : excludedByMonthCount 25 = true := by
  decide

/-- 24 月は該当. -/
theorem qualifies24 : qualifiesByMonthCount 24 = true := by
  decide

/-- 23 月は非該当. -/
theorem qualifies23 : qualifiesByMonthCount 23 = false := by
  decide

/-- 25 月は非該当. -/
theorem qualifies25 : qualifiesByMonthCount 25 = false := by
  decide

end JapanTaxLaw.MonthCountExclusiveBand
