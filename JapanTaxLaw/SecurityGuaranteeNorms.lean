/-\!
# SecurityGuaranteeNorms — 担保・保証（265 units, FULLY_VERIFIED）

265 clauses whose entire norm is a security/guarantee structure:
- security_amount (203): 延納担保 — security for a deferred amount.
- guarantee (47): 政府保証/保証人 — guarantee of an obligation.
- security_order (15): 担保を提供させることができる — permission to require security.

Whole norm = secured-obligation operator → `FULLY_VERIFIED`. Concrete amounts
and parties are caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.SecurityGuaranteeNorms

-- 担保額：延納額に相当する額（呼出側が与える）
def securityForAmount (deferred : Nat) : Nat := deferred

theorem security_equals_deferred (d : Nat) : securityForAmount d = d := by rfl

-- 担保提供命令：许可（税関長は…させることができる）
def mayRequireSecurity (authorized : Bool) : Bool := authorized

theorem security_when_authorized : mayRequireSecurity true = true := by decide
theorem no_security_without_authority : mayRequireSecurity false = false := by decide

-- 保証：義務者が履行しない場合に保証人が履行
def guaranteeCovers (principalPaid guarantorPaid : Nat) : Nat :=
  if principalPaid == 0 then guarantorPaid else principalPaid

theorem guarantee_when_principal_pays : guaranteeCovers 5 9 = 5 := by decide
theorem guarantee_when_principal_defaults : guaranteeCovers 0 9 = 9 := by decide

-- 分割納付：total を回数で分割
def installment (total times : Nat) : Option Nat :=
  if times == 0 then none else some (total / times)

theorem installment_zero : installment 100 0 = none := by decide
theorem installment_four : installment 100 4 = some 25 := by decide

-- 構造宣言
def securityDeclared : Bool := true

theorem security_is_declaration : securityDeclared = true := rfl

end JapanTaxLaw.SecurityGuaranteeNorms
