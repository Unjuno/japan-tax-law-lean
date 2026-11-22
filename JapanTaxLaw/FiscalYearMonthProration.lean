import JapanTaxLaw.TaxFinance

/-
# FiscalYearMonthProration — 法人特別税法 第九条（課税事業年度が一年に満たない場合の按分）

Pinned source:
  Law id: 404AC0000000015
  Revision: 404AC0000000015_20010401_413AC0000000006
  Raw snapshot: data/raw/404AC0000000015_20010401_413AC0000000006.law.json
  sha256: 603e33a8712eb9db5652935ae8d8fd793bcee4a2b5ed6fe513d2686435ffa5b8
  Statutory article: 第九条 (raw JSON Article attr.Num = "9")

原文逐語（pinned, 一字一句改変なし）:
  「課税事業年度が一年に満たない法人に対する前項の規定の適用については、同項中「年四百万円」とあるのは、「四百万円を十二で除し、これに当該課税事業年度の月数を乗じて計算した金額」とする。」

Variable contract:
  months : Nat = 当該課税事業年度の月数 (単位 月).
  annualAmount = 年四百万円 = 4,000,000 円.
  monthsPerYear = 十二 = 12 月.
  divide-then-multiply order: 四百万円を十二で除し、これに月数を乗じて計算.
  result : Nat = 按分後の金額 (単位 円, whole yen, Nat floor division).

Computation (原文の明示的な算術のみを厳密表現):
  proratedFor months = (annualAmount / monthsPerYear) * months

Scope / BY-DESIGN:
  - 条文は「十二で除し、これに…乗じて」と除算を先に行うので、Nat の除算を
    先に適用し、その商に月数を乗じる（原文の逐語順序を厳守）。
  - 4,000,000 / 12 = 333,333（Nat の切り捨て除算）。したがって十二か月でも
    3,999,996 円となる。この端数は整数演算の帰結であり、法が別途の丸め規則を
    定めたという主張ではない — BY-DESIGN / CONFIRMED。
  - 前項（第二項）の税率そのもの、第三項以降、第四項の特例、附則・経過措置は
    NOT MODELLED。本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.FiscalYearMonthProration

/-- 年四百万円 — the annual statutory amount = 4,000,000 円. -/
def annualAmount : Nat := 4_000_000

/-- 十二 — the divisor (months per year) = 12 月. -/
def monthsPerYear : Nat := 12

/-- 按分額 = (annualAmount / monthsPerYear) * months; divide first, then multiply (Nat floor division). -/
def proratedFor (months : Nat) : Nat :=
  (annualAmount / monthsPerYear) * months

/-- 十二か月 → 3,999,996 円 (literal divide-then-multiply, floor at the division). -/
example : proratedFor 12 = 3_999_996 := by decide

/-- 六か月 → 1,999,998 円. -/
example : proratedFor 6 = 1_999_998 := by decide

/-- 零か月 → 0 円. -/
example : proratedFor 0 = 0 := by decide

/-- 定数値. -/
example : annualAmount = 4_000_000 := by rfl
example : monthsPerYear = 12 := by rfl

end JapanTaxLaw.FiscalYearMonthProration
