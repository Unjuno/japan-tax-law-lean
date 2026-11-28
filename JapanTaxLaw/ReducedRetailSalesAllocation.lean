/-!
# ReducedRetailSalesAllocation — law 363AC0000000108 art.38 (EXCEPTION)

Sources (pinned): law `363AC0000000108`; revision and raw snapshot pinned via the
transcription pin and coordinator packet.

原文（抜粋・逐語 pin は全文）:
「…課税売上高が五千万円以下である課税期間…税込価額の合計額に小売等軽減仕入割合…を乗じて
計算した金額…に百八分の百を乗じて計算した金額を…対価の額の合計額とし、当該税込価額の
合計額から軽減対象小売等税込売上額を控除した残額に百十分の百を乗じて計算した金額を…」

Computation: 課税売上高 5,000 万円以下（inclusive）の適用対象期間について、
軽減対象分は `税込売上 × 割合 × 100/108`、残額は `(税込売上 − 軽減対象分) × 100/110`。
Scope: 「困難な事情」の認定・期間判定・割合の算出は NOT MODELLED（入力として受け取る）。
法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReducedRetailSalesAllocation

/-- 五千万円以下: inclusive cap. -/
def salesCap : Nat := 50_000_000

def withinCap (taxableSales : Nat) : Bool := taxableSales <= salesCap

/-- 軽減対象小売等税込売上額（割合適用、分母 0 のときは 0）。 -/
def reducedAmount (total : Nat) (num : Nat) (den : Nat) : Nat :=
  if den = 0 then 0 else total * num / den

/-- 軽減対象分の対価の額: 100/108 を乗じる。 -/
def reducedBase (total : Nat) (num : Nat) (den : Nat) : Nat :=
  reducedAmount total num den * 100 / 108

/-- 軽減対象外分の対価の額: 残額に 100/110 を乗じる。 -/
def otherBase (total : Nat) (num : Nat) (den : Nat) : Nat :=
  (total - reducedAmount total num den) * 100 / 110

example : withinCap 50_000_000 = true := by decide
example : withinCap 50_000_001 = false := by decide
example : reducedBase 1_080_000 1 1 = 1_000_000 := by decide
example : otherBase 1_100_000 0 1 = 1_000_000 := by decide

end JapanTaxLaw.ReducedRetailSalesAllocation
