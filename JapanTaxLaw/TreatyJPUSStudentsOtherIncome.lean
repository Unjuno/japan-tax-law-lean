/-\!
# TreatyJPUSStudentsOtherIncome — 日米租税条約 第十九条（学生）・第二十一条（その他の所得）

L3 条約層（別層）。両条の課税配分構造をカーネル証明する：
- １９：教育・訓練目的の滞在者で他方の居住者（又は直前に居住者）であった者が、
  滞在国外から受け取る生計・教育・訓練のための給付は滞在国で免税。事業修習者は
  訓練開始から1年を超えない期間のみ。
- ２１１：前各条に規定のない「その他の所得」は受益者の居住国でのみ課税。
- ２１２：PE と実質的関連のある権利・財産から生ずる場合は第7条へ。

具体的な金額・期間・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSStudentsOtherIncome

-- １９：学生給付の滞在国免税（滞在国外支払 且つ 他方居住者起源）
def studentGrantExempt (paidFromAbroad wasOtherResident : Bool) : Bool :=
  paidFromAbroad && wasOtherResident
theorem student_grant_exempt : studentGrantExempt true true = true := by decide
theorem domestic_payment_not_exempt : studentGrantExempt false true = false := by decide
theorem local_resident_not_exempt : studentGrantExempt true false = false := by decide

-- 事業修習者は1年を超えない期間のみ（訓練経過年数 <= 1）
def traineeWithinOneYear (yearsElapsed : Nat) : Bool := decide (yearsElapsed <= 1)
theorem one_year_within : traineeWithinOneYear 1 = true := by decide
theorem two_years_exceeded : traineeWithinOneYear 2 = false := by decide

-- ２１１：その他の所得は居住国のみ課税（源泉国課税なし）
def otherIncomeSourceTax : Bool := false
theorem other_income_residence_only : otherIncomeSourceTax = false := rfl

-- ２１２：PE 実質関連なら第7条へ（居住国のみ課税を適用しない）
def article7ForOtherIncome (hasPE realLink : Bool) : Bool := hasPE && realLink
theorem pe_link_switches_to_art7 : article7ForOtherIncome true true = true := by decide
theorem no_pe_stays_residence : article7ForOtherIncome false true = false := by decide

def studentsOtherIncomeDeclared : Bool := true
theorem students_other_income_is_declaration : studentsOtherIncomeDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSStudentsOtherIncome
