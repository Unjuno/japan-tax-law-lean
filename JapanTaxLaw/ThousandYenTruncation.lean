import JapanTaxLaw.TaxFinance

/-
# ThousandYenTruncation — 石油ガス譲与税法施行規則 art.5（錯誤に係る額の端数控除）bounded L4 モデル

Sources (pinned):
  Law id: 341M50000008002
  Revision: 341M50000008002_20191128_501M60000008059
  Raw snapshot: data/raw/341M50000008002_20191128_501M60000008059.law.json
  Raw snapshot sha256: 4a676a0093742423265ad491a7d498c1d7256efd26ba7cf91eb3d165fa48bc96
  Article Num 5 (第五条), normalized scoped text 871 chars, verbatim needle x1.

原文逐語:
  「第一項の都道府県又は指定市に譲与すべき額に加算し、又は当該譲与すべき額から減額すべき錯誤に係る額に千円未満の端数金額があるときは、その端数金額を控除した金額をもつて、当該錯誤に係る額とする。」

Variable contract:
  amount : Nat — 錯誤に係る額, unit 円 (whole yen; no sub-yen fractions),
              caller-established from 第五条第一項の加算・減額の算出。
  rounding is DOWN (控除), not round-to-nearest (四捨五入ではない)。
  千円未満 = amount % roundingUnit < 1_000。
  端数を控除した金額が、第一項で加算/減額すべき「錯誤に係る額」となる。

Computation（原文逐語から導出）:
  roundingUnit = 1_000（千円）
  truncateThousand(amount) = amount - amount % roundingUnit
    = 千円未満の端数（0〜999円）を控除し、千円単位へ切り捨てる。

Scope: 端数処理（千円未満を控除）のみをモデル化。
  第一項の加算・減額手続、道路延長・面積の算式、小数点以下三位未満の
  四捨五入、他の条・附則、司法判断は NOT MODELLED。
  本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ThousandYenTruncation

open JapanTaxLaw.TaxFinance

/-- 端数処理の粒度 = 千円 = 1,000 円。 -/
def roundingUnit : Nat := 1_000

/-- 千円未満の端数を控除した金額（千円単位への切捨て、方向は DOWN）。 -/
def truncateThousand (amount : Nat) : Nat :=
  amount - amount % roundingUnit

-- Kernel-decided spot checks (theorems below are the reusable statements).
example : roundingUnit = 1_000 := by decide
example : truncateThousand 0 = 0 := by decide
example : truncateThousand 999 = 0 := by decide
example : truncateThousand 1_000 = 1_000 := by decide
example : truncateThousand 1_500 = 1_000 := by decide
example : truncateThousand 12_345 = 12_000 := by decide

theorem truncateThousand_zero : truncateThousand 0 = 0 := by decide
theorem truncateThousand_999 : truncateThousand 999 = 0 := by decide
theorem truncateThousand_1000 : truncateThousand 1_000 = 1_000 := by decide
theorem truncateThousand_1500 : truncateThousand 1_500 = 1_000 := by decide
theorem truncateThousand_12345 : truncateThousand 12_345 = 12_000 := by decide

/-- 千円未満の金額はそのまま控除されて 0 になる（Nat.mod_eq_of_lt を利用）。 -/
theorem truncateThousand_of_lt_unit (amount : Nat) (h : amount < roundingUnit) :
    truncateThousand amount = 0 := by
  unfold truncateThousand roundingUnit at *
  rw [Nat.mod_eq_of_lt h]
  omega

/-- 控除は元の額を超えない。 -/
theorem truncateThousand_le (amount : Nat) : truncateThousand amount ≤ amount := by
  unfold truncateThousand
  exact Nat.sub_le _ _

/-- 控除結果は千円（1,000）の倍数: 剰余 0。 -/
theorem truncateThousand_mod (amount : Nat) : truncateThousand amount % 1_000 = 0 := by
  unfold truncateThousand roundingUnit
  omega

/-- 同じ千円未満控除を繰り返しても変わらない（べき等）。 -/
theorem truncateThousand_idempotent (amount : Nat) :
    truncateThousand (truncateThousand amount) = truncateThousand amount := by
  unfold truncateThousand roundingUnit
  omega

end JapanTaxLaw.ThousandYenTruncation
