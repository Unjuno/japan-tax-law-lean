/-\!
# TreatyJPUSEntryTermination — 日米租税条約 第三十条・第三十一条（発効・終了）

L3 条約層（別層）。第三十条・第三十一条の時間的適用構造をカーネル証明する：
- ３０１：批准書交換の日に効力を生ずる。
- ３０２：適用開始日は発効日が3月31日以前なら当年7月1日以後、4月1日以後なら
  翌年1月1日以後（源泉徴収租税）。
- ３０３/４：旧条約の特典は一定の者について継続（ grandfather）。
- ３１：発効日から5年経過後、6箇月前の通告で終了可能。

具体的な日付・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSEntryTermination

-- ３０２：源泉徴収租税の適用開始月（発効が3月31日以前 → 当年7月、4月1日以後 → 翌年1月）
def withholdingStartMonth (effectiveBeforeApril1 : Bool) : Nat :=
  if effectiveBeforeApril1 then 7 else 1
theorem early_effect_july : withholdingStartMonth true = 7 := by simp [withholdingStartMonth]
theorem late_effect_january : withholdingStartMonth false = 1 := by simp [withholdingStartMonth]

-- ３１：5年経過後のみ終了可能
def terminationAllowed (yearsSinceEntry : Nat) : Bool := decide (5 <= yearsSinceEntry)
theorem at_5_years_allowed : terminationAllowed 5 = true := by decide
theorem before_5_years_barred : terminationAllowed 4 = false := by decide

-- ６箇月前の通告（通告から終了までの月数 >= 6）
def validNotice (monthsNotice : Nat) : Bool := decide (6 <= monthsNotice)
theorem six_month_notice_ok : validNotice 6 = true := by decide
theorem short_notice_invalid : validNotice 5 = false := by decide

-- 終了は5年経過 且つ 6箇月通告（両方必要）
def canTerminate (yearsElapsed monthsNotice : Bool) : Bool := yearsElapsed && monthsNotice
theorem terminate_both_ok : canTerminate true true = true := by decide
theorem terminate_missing_years : canTerminate false true = false := by decide

def entryTerminationDeclared : Bool := true
theorem entry_termination_is_declaration : entryTerminationDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSEntryTermination
