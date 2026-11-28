import JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

/-!
# CustomsTariffSupplArt1Showa59EnforcementDateSpec — 施行日の独立仕様
Sources (pinned): law 143AC0000000054, revision 143AC0000000054_20260601_508AC0000000005.
独立仕様は実装の inForce / dateKey / enforcementKey を参照せず、
原文の元号年（昭和59年）による辞書頁順の日付比較を直接定義する。
-/

namespace JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate

def specDate : Nat × Nat × Nat := (59, 4, 1)

def specInForce : Nat × Nat × Nat → Bool
  | (y, m, d) => decide (y > 59) || (y == 59 && decide (m > 4)) ||
                 (y == 59 && m == 4 && decide (d >= 1))

example : specInForce (59, 4, 1) = true := by decide
example : specInForce (59, 3, 31) = false := by decide

def agreeCustomsTariffSupplArt1Showa59EnforcementDate : Bool :=
  [(44,1,1),(58,12,31),(59,3,31),(59,4,1),(59,4,2),(60,1,1)].all fun x =>
    match x with
    | (y, m, d) => inForce (showaToSeireki y, m, d) == specInForce (y, m, d)

example : agreeCustomsTariffSupplArt1Showa59EnforcementDate = true := by decide

end JapanTaxLaw.CustomsTariffSupplArt1Showa59EnforcementDate
