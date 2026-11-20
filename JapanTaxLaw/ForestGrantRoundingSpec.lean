import JapanTaxLaw.ForestGrantRounding

/-!
# ForestGrantRounding spec — 森林環境譲与税法 art.31 の独立整数定式
Sources (pinned): law 431AC0000000003, revision 431AC0000000003_20260401_508AC0000000002.
Independent restatement: 千円未満の端数を控除 = 1000 の倍数への切捨て。
実装とは独立に剰余算で書き下す。
-/

namespace JapanTaxLaw.ForestGrantRounding

def specGrain : Nat := 1_000

def specRound (amount : Nat) : Nat :=
  amount - amount % 1000

example : specGrain = 1_000 := by decide
example : specRound 0 = 0 := by decide
example : specRound 999 = 0 := by decide
example : specRound 1_000 = 1_000 := by decide
example : specRound 12_345 = 12_000 := by decide

def agreeForestGrantRounding : Bool :=
  [0, 1, 999, 1_000, 1_499, 1_500, 12_345, 100_000].all fun a =>
    roundDownThousand a == specRound a

example : agreeForestGrantRounding = true := by decide

end JapanTaxLaw.ForestGrantRounding
