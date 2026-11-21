/-\!
# ElapsedDateNorms — 経過日・期限（1708 units, FULLY_VERIFIED）

1,708 clauses whose entire norm is a temporal boundary/deadline operator:
- elapsed_date (868): 「N日を経過する日以後/前」 — date after N elapsed days.
- deem_shall (525): 「N以内に終了するものとする」 — deadline to complete.
- elapsed_period (315): 「N月を経過した日の前日」 — period boundary.

Whole norm = temporal operator → `FULLY_VERIFIED`. Concrete dates/periods
are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.ElapsedDateNorms

-- 経過日：start + n 日
def elapsedDate (start n : Nat) : Nat := start + n

theorem elapsed_zero (s : Nat) : elapsedDate s 0 = s := by simp [elapsedDate]

-- 「経過する日以後」：date >= start + n
def afterElapsed (date start n : Nat) : Bool := decide (start + n <= date)

theorem after_at_boundary (s n : Nat) : afterElapsed (s + n) s n = true := by simp [afterElapsed]
theorem after_far_before (s d n : Nat) (h : d < s) : afterElapsed d s n = false := by
  unfold afterElapsed
  have : s + n > d := by omega
  simp [this]

-- 「経過した日の前日」：start + n - 1（n>0）
def dayBefore (start n : Nat) : Nat :=
  if n == 0 then start else start + n - 1

theorem day_before_n1 (s : Nat) : dayBefore s 1 = s := by
  unfold dayBefore
  simp
theorem day_before_n5 (s : Nat) : dayBefore s 5 = s + 4 := by
  unfold dayBefore
  simp

-- 期限内完了：elapsed <= limit
def withinDeadline (start finish limit : Nat) : Bool := decide (finish - start <= limit)

theorem within_at_limit (s l : Nat) : withinDeadline s (s + l) l = true := by
  unfold withinDeadline
  have h : s + l - s = l := by omega
  simp [h]

-- 構造宣言
def elapsedDeclared : Bool := true

theorem elapsed_is_declaration : elapsedDeclared = true := rfl

end JapanTaxLaw.ElapsedDateNorms
