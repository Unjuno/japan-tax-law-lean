import JapanTaxLaw.AviationFuelThousandRoundDown

/-
# AviationFuelThousandRoundDown spec — 航空機燃料譲与税法 第四条の独立整数定式

Sources (pinned): law 347AC0000000013, revision 347AC0000000013_20240401_506AC0000000004.
Independent restatement: 千円未満の端数金額を控除 = 1,000 円の倍数への切捨て。
実装とは独立に除算・乗算で書き下す（spec* 定義は実装識別子を含まない）。

Variable contract: yen = 計算した譲与税の額 (Nat, 円);
  specUnit = 千円 (1,000 円); 端数 = yen % 1000;
  specRound = yen / 1000 * 1000 = yen - (yen % 1000).
-/

namespace JapanTaxLaw.AviationFuelThousandRoundDown

/-- 独立に置いた端数処理単位 = 千円。 -/
def specUnit : Nat := 1000

/-- 独立定式: 千円未満端数を控除した額。 -/
def specRound (yen : Nat) : Nat :=
  yen / specUnit * specUnit

example : specUnit = 1000 := by decide

example : specRound 0 = 0 := by decide

example : specRound 999 = 0 := by decide

example : specRound 1000 = 1000 := by decide

example : specRound 1001 = 1000 := by decide

example : specRound 1999 = 1000 := by decide

example : specRound 2000 = 2000 := by decide

example : specRound 5001 = 5000 := by decide

theorem agreeUnit : roundingUnitYen = specUnit := by unfold roundingUnitYen specUnit; rfl

theorem agreeRound (yen : Nat) : roundDownThousand yen = specRound yen := by
  unfold roundDownThousand specRound roundingUnitYen specUnit
  rfl

example : roundingUnitYen = specUnit := agreeUnit

example : roundDownThousand 1001 = specRound 1001 := agreeRound 1001

example : roundDownThousand 5001 = specRound 5001 := agreeRound 5001

end JapanTaxLaw.AviationFuelThousandRoundDown
