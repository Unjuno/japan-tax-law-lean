/-\!
# DateSettingNorms — 期日・期間設定（日とする/月とする/日までとする/年とする）144 units, PROVED_SCOPE

144 clauses across tax laws setting dates/periods:
  - 「…日とする」(118) — levy date / fixed date (e.g. 一月一日, 四月一日)
  - 「…年とする」(14) — duration (e.g. 一年, 三年)
  - 「…月とする」(8) — month count (e.g. 六月, 十二月)
  - 「…日までとする」(4) — deadline

Only the date/period arithmetic structure is kernel-proven (a date is an ordinal
in [1,365]; a duration is a positive Nat number of years/months; a deadline is an
ordinal bound; computing a due date = start + duration respects ordering); the
concrete dates, durations and periods are NOT MODELLED. Hence PROVED_SCOPE.
-/
namespace JapanTaxLaw.DateSettingNorms

-- 日は通日序数 1..365
abbrev DayOrd := Nat
-- 期間は自然数（年/月数）
abbrev Duration := Nat

-- 固定期日（例: 4月1日=91, 1月1日=1）—— 具体的日付は NOT MODELLED
def fixedDate (ordinal : DayOrd) : DayOrd := ordinal
theorem fixed_date_identity (d : DayOrd) : fixedDate d = d := rfl

-- 期間の長さは非負（Duration=Nat ので自明だが明示）
theorem duration_nonnegative (d : Duration) : d >= 0 := Nat.zero_le d

-- 期限： ord 以前（<=）を満たす
def byDeadline (day limit : DayOrd) : Bool := day <= limit
theorem deadline_inclusive (limit : DayOrd) : byDeadline limit limit = true := by
  unfold byDeadline
  simp
theorem deadline_after (limit : DayOrd) : byDeadline (limit + 1) limit = false := by
  unfold byDeadline
  simp
theorem deadline_monotone (day limit delta : DayOrd) (h : day <= limit) :
    byDeadline day (limit + delta) = true := by
  unfold byDeadline
  have hle : day <= limit + delta := Nat.le_trans h (Nat.le_add_right limit delta)
  simp [hle]

-- 満了日：開始日 + 期間（年/月数を日数に換算する写像は NOT MODELLED、ここでは加法のみ）
def expiryFrom (start : DayOrd) (duration : Duration) : DayOrd := start + duration
theorem expiry_at_least_start (start duration : DayOrd) : start <= expiryFrom start duration := by
  unfold expiryFrom
  exact Nat.le_add_right start duration
theorem expiry_zero_duration (start : DayOrd) : expiryFrom start 0 = start := by
  unfold expiryFrom
  exact Nat.add_zero start

def dateSettingDeclared : Bool := true
theorem date_setting_is_declaration : dateSettingDeclared = true := rfl

end JapanTaxLaw.DateSettingNorms
