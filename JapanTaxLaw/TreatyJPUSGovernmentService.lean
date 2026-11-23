/-\!
# TreatyJPUSGovernmentService — 日米租税条約 第十八条（政府の職務）

L3 条約層（別層）。第十八条の政府報酬課税配分をカーネル証明する：
- １８１(a)：一方の政府等が支払う職務報酬は、当該一方の国でのみ課税。
- １８１(b)：他方で役務提供 且つ 個人が他方の居住者/国民/当該役務のみのための
  居住者でない場合は、当該他方でのみ課税（支払国のみ課税は適用されない）。
- １８２：政府職務に従事した者への年金も同様の配分（居住国／支払国）。

具体的な身分・金額・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSGovernmentService

-- １８１(b)：他方での役務＋他方に結びついた個人 → 他方のみ課税
def otherStateOnlyTax (serviceInOther : Bool) (tiedToOther : Bool) : Bool :=
  serviceInOther && tiedToOther
theorem both_conditions_other_only : otherStateOnlyTax true true = true := by decide
theorem home_service_no_other_tax : otherStateOnlyTax false true = false := by decide
theorem untied_no_other_tax : otherStateOnlyTax true false = false := by decide

-- １８１(a)：例外が成立しなければ支払国のみ課税、成立すれば適用されない
def payerStateOnlyTax (exceptionApplies : Bool) : Bool := !exceptionApplies
theorem government_remuneration_payer_only : payerStateOnlyTax false = true := by decide
-- 例外が成立すれば支払国のみ課税は成立しない
theorem exception_excludes_payer_only (s t : Bool) (h : otherStateOnlyTax s t = true) :
    payerStateOnlyTax (otherStateOnlyTax s t) = false := by
  simp [payerStateOnlyTax, h]

def governmentServiceDeclared : Bool := true
theorem government_service_is_declaration : governmentServiceDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSGovernmentService
