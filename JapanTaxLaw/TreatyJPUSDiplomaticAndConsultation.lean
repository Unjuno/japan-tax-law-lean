/-\!
# TreatyJPUSDiplomaticAndConsultation — 日米租税条約 第二十八条・第二十九条

L3 条約層（別層）：
- ２８：この条約はいかなる場合も、国際法一般原則又は特別協定に基づく外交使節団・
  領事機関構成員の租税上の特権に影響を及ぼさない（特権は条約に優先して存続）。
- ２９：関連法令の実質改正で特典の均衡が崩れる場合、書面で協議を要請でき、
  要請を受けた側は三箇月以内に協議を行う。

具体的な特権・改正内容・法的効力は NOT MODELLED。legal_review PENDING。
-/
namespace JapanTaxLaw.TreatyJPUSDiplomaticAndConsultation

-- ２８：条約は外交特権に影響しない（特権は常に保持）
def diplomaticPrivilegesPreserved : Bool := true
theorem treaty_does_not_affect_privileges : diplomaticPrivilegesPreserved = true := rfl

-- ２９：実質改正があれば協議要請可
def consultationRequested (materialChange : Bool) : Bool := materialChange
theorem change_enables_request : consultationRequested true = true := by decide
theorem no_change_no_request : consultationRequested false = false := by decide

-- ２９：要請後三箇月以内に協議（経過月数 <= 3）
def withinThreeMonths (monthsElapsed : Nat) : Bool := decide (monthsElapsed <= 3)
theorem three_months_ok : withinThreeMonths 3 = true := by decide
theorem four_months_late : withinThreeMonths 4 = false := by decide

def diplomaticAndConsultationDeclared : Bool := true
theorem diplomatic_and_consultation_is_declaration : diplomaticAndConsultationDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSDiplomaticAndConsultation
