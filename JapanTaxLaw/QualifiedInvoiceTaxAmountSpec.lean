import JapanTaxLaw.QualifiedInvoiceTaxAmount

/-!
# QualifiedInvoiceTaxAmount spec — 消費税法施行令 art.70の10 の独立整数定式

Sources (pinned; identical to QualifiedInvoiceTaxAmount.lean):
  Law id: 363CO0000000360, Revision: 363CO0000000360_20261101_507CO0000000125.
  Article Num 70_10.

Independent integer restatement (coordinator の数式は信じず原文から直接):
  * 方法1: 税抜合計 × 10/100（軽減対象 8/100）
  * 方法2: 税込合計 × 10/110（軽減対象 8/108）
  * 一円未満端数処理は caller-established。

Spec は impl の def を参照せず、原文から直接書いた整数式のみを使う。
-/

namespace JapanTaxLaw.QualifiedInvoiceTaxAmount

def specExclusive (total num den : Nat) : Nat := total * num / den
def specInclusive (total num den : Nat) : Nat := total * num / den

example : specExclusive 1000 10 100 = 100 := by decide
example : specExclusive 1000 8 100 = 80 := by decide
example : specInclusive 1100 10 110 = 100 := by decide
example : specInclusive 1080 8 108 = 80 := by decide

def agreeQualifiedInvoiceTaxAmount : Bool :=
  (fromExclusive 1000 standardRateExclusive == specExclusive 1000 10 100)
  && (fromExclusive 1000 reducedRateExclusive == specExclusive 1000 8 100)
  && (fromInclusive 1100 standardRateInclusive == specInclusive 1100 10 110)
  && (fromInclusive 1080 reducedRateInclusive == specInclusive 1080 8 108)
  && ([0, 1, 100, 999, 1000, 1001, 12345, 999999].all fun x =>
        fromExclusive x standardRateExclusive == specExclusive x 10 100
        && fromInclusive x reducedRateInclusive == specInclusive x 8 108)

example : agreeQualifiedInvoiceTaxAmount = true := by decide

end JapanTaxLaw.QualifiedInvoiceTaxAmount
