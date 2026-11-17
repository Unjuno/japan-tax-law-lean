import JapanTaxLaw.CustomsTransactionPrice

/-!
# CustomsTransactionPrice spec — 関税定率法 art. 4（課税価格の決定の原則）

Sources (pinned; identical to CustomsTransactionPrice.lean):

  Law id: 143AC0000000054
  Revision: 143AC0000000054_20260601_508AC0000000005
  Amendment enforcement date: 2026-06-01

Independent restatement of:
  * 取引価格 = 現実支払価格 + 加算項目10種の合計
  impl が `CustomsAdditions` 構造体と `additionsTotal` を使うのに対し、
  spec は10個の Nat 引数を直接足す独立定式で定式化。

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 加算合計（10引数の直接加算・独立定式）。 -/
def specAdditionsTotal (x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 : Money) : Money :=
  x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10

/-- Spec: 取引価格（独立定式）。 -/
def specTransactionPrice (paid x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 : Money) : Money :=
  paid + specAdditionsTotal x1 x2 x3 x4 x5 x6 x7 x8 x9 x10

-- ==== points (kernel-decided) ====

example : specAdditionsTotal 100_000 5_000 2_000 3_000 10_000 4_000 1_000 6_000 8_000 7_000 = 146_000 := by decide
example : specTransactionPrice 1_000_000 100_000 5_000 2_000 3_000 10_000 4_000 1_000 6_000 8_000 7_000 = 1_146_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCustomsTransactionPrice : Bool :=
  let a : CustomsAdditions := ⟨100_000, 5_000, 2_000, 3_000, 10_000, 4_000, 1_000, 6_000, 8_000, 7_000⟩
  let b : CustomsAdditions := ⟨0, 0, 0, 0, 0, 0, 0, 0, 0, 0⟩
  additionsTotal a == specAdditionsTotal 100_000 5_000 2_000 3_000 10_000 4_000 1_000 6_000 8_000 7_000
    && transactionPrice 1_000_000 a == specTransactionPrice 1_000_000 100_000 5_000 2_000 3_000 10_000 4_000 1_000 6_000 8_000 7_000
    && transactionPrice 500_000 b == specTransactionPrice 500_000 0 0 0 0 0 0 0 0 0 0

example : agreeCustomsTransactionPrice = true := by decide

end JapanTaxLaw
