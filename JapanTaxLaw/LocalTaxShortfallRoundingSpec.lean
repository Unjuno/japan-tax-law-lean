import JapanTaxLaw.LocalTaxShortfallRounding

/-!
# LocalTaxShortfallRounding spec — 地方税等減収補てん臨時交付金 art.5 の独立整数定式
Sources (pinned): law 420M60000008116, revision 420M60000008116_20081022_000000000000000.
Independent restatement: 千円未満端数 r<500 → 切捨て、r>=500 → 繰上。
-/

namespace JapanTaxLaw.LocalTaxShortfallRounding

def specRound (amount : Nat) : Nat :=
  let r := amount % 1000
  if r < 500 then amount - r else amount - r + 1000

example : specRound 499 = 0 := by decide
example : specRound 500 = 1000 := by decide

def agreeLocalTaxShortfallRounding : Bool :=
  [0, 1, 499, 500, 999, 1000, 1499, 1500, 12_345].all fun a =>
    roundToThousand a == specRound a

example : agreeLocalTaxShortfallRounding = true := by decide

end JapanTaxLaw.LocalTaxShortfallRounding
