import JapanTaxLaw.RemittanceReportLimit

/-!
# RemittanceReportLimit spec — 国外送金等調書 上限額の独立整数定式
Sources (pinned): law 409CO0000000363, revision 409CO0000000363_20250501_507CO0000000128.
Independent restatement: 上限 1000000 円以下（境界含む）。
-/

namespace JapanTaxLaw.RemittanceReportLimit

def specLimit : Nat := 1_000_000

def specBelow (amount : Nat) : Bool := amount <= 1000000

example : specLimit = 1_000_000 := by decide
example : specBelow 1_000_000 = true := by decide
example : specBelow 1_000_001 = false := by decide

def agreeRemittanceReportLimit : Bool :=
  [0, 1, 999_999, 1_000_000, 1_000_001, 5_000_000].all fun a =>
    isAtOrBelowLimit a == specBelow a

example : agreeRemittanceReportLimit = true := by decide

end JapanTaxLaw.RemittanceReportLimit
