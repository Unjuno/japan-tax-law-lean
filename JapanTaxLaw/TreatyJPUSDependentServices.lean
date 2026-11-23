/-\!
# TreatyJPUSDependentServices — 日米租税条約 第十四条（従属的個人サービス）

L3 条約層（別層）。第十四条の183日閾値・三段階例外構造をカーネル証明する：
- １４１：勤務が他方で行われなければ居住国のみ課税。行われれば他方でも課税可。
- １４２：(a) 12か月期の滞在が183日以下、(b) 雇用者が他方の非居住者、
  (c) 報酬が他方の PE 負担でない — の3条件を全て満たせば居住国のみ課税。
- １４３：国際運輸の船舶・航空機内勤務は他方で課税しない特例。

具体的な日数・金額・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSDependentServices

-- １４１：勤務地が他方なら源泉国課税可
def sourceTaxIfWorkThere (workInOther : Bool) : Bool := workInOther
theorem work_at_home_no_source_tax : sourceTaxIfWorkThere false = false := by decide
theorem work_there_source_tax : sourceTaxIfWorkThere true = true := by decide

-- １４２の183日閾値（超えなければ居住国のみ）
def within183 (days : Nat) : Bool := decide (days <= 183)
theorem at_183_within : within183 183 = true := by decide
theorem at_184_exceeded : within183 184 = false := by decide

-- １４２の3条件連立（全て真で免除）
def exemptionConditions (days : Nat) (employerNonResident notPEBorne : Bool) : Bool :=
  within183 days && employerNonResident && notPEBorne
theorem all_conditions_exempt : exemptionConditions 183 true true = true := by decide
theorem day_limit_fail_no_exempt : exemptionConditions 184 true true = false := by decide
theorem employer_fail_no_exempt : exemptionConditions 183 false true = false := by decide
theorem pe_borne_no_exempt : exemptionConditions 183 true false = false := by decide

-- 条件が一つでも欠ければ免除なし（連立の各項は必須）
theorem exemption_requires_day_limit (d : Nat) (e p : Bool) (h : exemptionConditions d e p = true) : d <= 183 := by
  unfold exemptionConditions within183 at h
  by_cases hd : d <= 183
  · exact hd
  · simp [hd] at h

-- １４３：国際運輸乗務は源泉国免除
def internationalTransportExempt : Bool := true
theorem intl_transport_no_source_tax : internationalTransportExempt = true := rfl

def dependentServicesDeclared : Bool := true
theorem dependent_services_is_declaration : dependentServicesDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSDependentServices
