/-\!
# TreatyJPUSMutualAgreement — 日米租税条約 第二十五条（相互協定手続）

L3 条約層（別層）。第二十五条の手続構造をカーネル証明する：
- ２５１：条約に適合しない課税の申立ては、措置の最初の通知から3年以内にしなければならない。
- ２５２：正当と認めるが満足すべき解決ができない場合、権限当局は相互協定で解決に努め、
  成立した合意は国内の期間制限等にかかわらず実施する。
- ２５３：解釈・適用の困難・疑義も合意で解決するよう努める。

具体的な日数・手続詳細・法的効力は NOT MODELLED。legal_review PENDING（独立的軸）。
-/
namespace JapanTaxLaw.TreatyJPUSMutualAgreement

-- ２５１：3年以内の申立て（経過年数 <= 3）
def withinThreeYears (yearsElapsed : Nat) : Bool := decide (yearsElapsed <= 3)
theorem three_years_within : withinThreeYears 3 = true := by decide
theorem four_years_late : withinThreeYears 4 = false := by decide

-- ２５２：合意成立 → 国内期間制限を超えて実施
def agreementImplemented (agreementReached domesticTimeBar : Bool) : Bool :=
  agreementReached
theorem agreement_overrides_timebar : agreementImplemented true true = true := by decide
theorem no_agreement_no_implementation : agreementImplemented false false = false := by decide
-- 合意がなければ国内時間制限にかかわらず実施されない
theorem implementation_requires_agreement (a tb : Bool) (h : agreementImplemented a tb = true) : a = true := by
  cases a <;> cases tb <;> simp [agreementImplemented] at h ⊢

def mutualAgreementDeclared : Bool := true
theorem mutual_agreement_is_declaration : mutualAgreementDeclared = true := rfl

end JapanTaxLaw.TreatyJPUSMutualAgreement
