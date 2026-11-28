import JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent

/-!
# LocalTaxArt71_28DividendTaxRate5Percent spec — 5/100 の独立定式

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002.
Independent restatement: 「百分の五」を分子5・分母100の比として明示し、
別定式 `base / specDenominator * specNumerator` で再計算する。
実装の `base * numerator / denominator` と識別子を共有しない。
有限領域の kernel-decided 検査であり普遍的な定理ではない。
-/

namespace JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent

def specNumerator : Nat := 5
def specDenominator : Nat := 100

/-- 独立に約分した除数（100 / 5 = 20）。 -/
def specDivisor : Nat := specDenominator / specNumerator

/-- 約分後の除数で割る（実装の分子乗り・分母割りと別定式だが同値）。 -/
def specTax (base : Nat) : Nat := base / specDivisor

example : specTax 100 = 5 := by decide
example : specTax 101 = 5 := by decide

def agreeLocalTaxArt71_28DividendTaxRate5Percent : Bool :=
  [0, 1, 99, 100, 101, 1000, 12345].all (fun b =>
    dividendTax b == specTax b)

example : agreeLocalTaxArt71_28DividendTaxRate5Percent = true := by decide

end JapanTaxLaw.LocalTaxArt71_28DividendTaxRate5Percent
