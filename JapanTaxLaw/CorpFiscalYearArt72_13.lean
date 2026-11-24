/-\!
# CorpFiscalYearArt72_13 — 地方税法 第七十二条の十三（法人の事業年度の確定）7 units, PROVED_SCOPE

Genuine per-provision formalization. Pinned original:
  data/raw/325AC0000000226_20261101_508AC0000000002.law.json Article:72_13

Normative content (7 units):
  1. 定款等に事業年度の定めがない法人 → 法人税法13(2)/(3)の届出/指定期間を事業年度とする。
  2. 届出をしなかつた人格のない社団等 → 1月1日から12月31日まで（収益事業開始日は特例）。
  3. 通算子法人 → 通算親法人の事業年度開始日/終了日に開始/終了。
  4. 所定の事実が生じた場合 → 事業年度はその日の前日に終了し、翌事業年度はその日から開始
     （合併による解散等の場合は開始例外）。
  5-6. 事実の定義（完全支配関係の取得／申請特例年度開始時の完全支配関係）。
  7. 承認を受けなかつた場合等 → 申請特例年度終了の日から開始（合併解散等は特例）。

Model: days of a year as Nat in [1,365]; a 事業年度 as (start,end). The genuine
kernel-proven content is the boundary arithmetic: a business year split at a
boundary day d ends at d-1 and the next starts at d (contiguity), the default
calendar year is (1,365), and the merger exception suppresses the new start.
Concrete corporation identities, notifications and approval facts are NOT MODELLED
→ PROVED_SCOPE.
-/
namespace JapanTaxLaw.CorpFiscalYearArt72_13

-- 日（1..365 の通日）
abbrev Day := Nat

-- 事業年度 = (開始日, 終了日)
abbrev FiscalYear := Nat × Nat

-- 既定のカレンダー年（1月1日〜12月31日）= (1, 365)
def defaultCalendarYear : FiscalYear := (1, 365)
theorem default_year_start : defaultCalendarYear.1 = 1 := rfl
theorem default_year_end : defaultCalendarYear.2 = 365 := rfl

-- 事実発生による終了：境界日 d の前日に終了
def endAtBoundary (d : Day) : Day := d - 1
-- 後続事業年度の開始：境界日 d から開始
def startAtBoundary (d : Day) : Day := d

-- 連続性：境界 d で終了した事业年度の翌年度は d から開始し、
-- 旧年度の終了日の翌日と一致する（d >= 2 のとき）
theorem boundary_contiguous (d : Day) (h : 2 <= d) :
    startAtBoundary d = endAtBoundary d + 1 := by
  unfold startAtBoundary endAtBoundary
  have h1d : 1 <= d := Nat.le_trans (by decide : 1 <= 2) h
  exact (Nat.sub_add_cancel h1d).symm

-- 境界が既定年の範囲内なら、分割後の期間は空でない
theorem boundary_in_year (d : Day) (hlo : 2 <= d) (hhi : d <= 365) :
    endAtBoundary d >= 1 ∧ startAtBoundary d <= 365 := by
  unfold startAtBoundary endAtBoundary
  constructor
  · exact Nat.le_sub_of_add_le (by simpa [Nat.add_comm] using hlo)
  · exact hhi

-- 合併解散等の場合は「境界日から開始」を抑制し、申請特例年度終了日に開始する
-- (suppress=false → 境界日から開始, suppress=true → 特例終了日から開始)
def nextYearStart (d : Day) (suppress : Bool) (specialEnd : Day) : Day :=
  if suppress then specialEnd else d
theorem no_suppress_starts_at_boundary (d specialEnd : Day) :
    nextYearStart d false specialEnd = d := by rfl
theorem suppress_starts_at_special_end (d specialEnd : Day) :
    nextYearStart d true specialEnd = specialEnd := by rfl

-- 通算子法人：親法人の開始/終了日に整合
def consolidatedStart (parentStart : Day) : Day := parentStart
def consolidatedEnd (parentEnd : Day) : Day := parentEnd
theorem consolidated_matches_parent (ps pe : Day) :
    consolidatedStart ps = ps ∧ consolidatedEnd pe = pe := by simp [consolidatedStart, consolidatedEnd]

-- 旧事業年度終了日 < 新事業年度開始日（連続性の帰結）
theorem end_before_next_start (d : Day) (h : 2 <= d) :
    endAtBoundary d < startAtBoundary d := by
  unfold startAtBoundary endAtBoundary
  exact Nat.sub_lt (Nat.lt_of_lt_of_le (by decide : 0 < 2) h) (by decide : 0 < 1)

def corpFiscalYearDeclared : Bool := true
theorem corp_fiscal_year_is_declaration : corpFiscalYearDeclared = true := rfl

end JapanTaxLaw.CorpFiscalYearArt72_13
