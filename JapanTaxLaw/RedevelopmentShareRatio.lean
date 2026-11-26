import JapanTaxLaw.TaxFinance

/-!
# RedevelopmentShareRatio — 租税特別措置法施行令 第四十二条の三(2)一

Sources (pinned):

  Law id: 332CO0000000043
  Revision: 332CO0000000043_20261101_507CO0000000127
  Raw snapshot: data/raw/332CO0000000043_20261101_507CO0000000127.law.json

担当範囲原文（pinned JSON の正規化テキストから転記）:

  当該土地に関する権利の持分の割合から当該旧権利の持分の割合を控除した割合を
  当該土地に関する権利の持分の割合で除して計算した割合（当該旧権利がその者が
  単独で有する所有権若しくは借地権である場合又は当該控除した割合が零を下回る
  場合には、零）

Pinned needle（doc-comment のみ）: 上記原文全体。

Modelled（明示された算術のみ）:

  * 通常: ratio = (土地持分 − 旧権利持分) / 土地持分
    Nat の saturating 減算により「控除した割合が零を下回る場合」は 0。
    Nat 除算は分母 0 のとき 0（防御的）。
  * 旧権利が単独所有権 / 単独借地権である場合は 0（旗は caller-established）。

Scope & boundaries:

  * 持分割合の実数表現・丸め・価額・案件該当性・マンション再生事業の認定は
    NOT MODELLED / caller-established。
  * fidelity-only; 法的正しさを保証しない。No sorry / admit / axiom.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- 土地持分、旧権利持分、旧権利が単独所有権/借地権かどうかの旗から割合を計算する。
    戻り値は自然数（割合の整数表現）。 -/
def redevelopmentShareRatio (landShare oldShare : Money) (soloOldRight : Bool) : Money :=
  if soloOldRight then 0 else (landShare - oldShare) / landShare

theorem solo_right_is_zero (landShare oldShare : Money) :
    redevelopmentShareRatio landShare oldShare true = 0 := by rfl

theorem zero_land_share (oldShare : Money) :
    redevelopmentShareRatio 0 oldShare false = 0 := by
  simp [redevelopmentShareRatio]

theorem old_not_greater_than_land (landShare oldShare : Money) (h : oldShare ≤ landShare) :
    redevelopmentShareRatio landShare oldShare false = (landShare - oldShare) / landShare := rfl

theorem old_exceeding_land_is_zero (landShare oldShare : Money) (h : oldShare > landShare) :
    redevelopmentShareRatio landShare oldShare false = 0 := by
  simp [redevelopmentShareRatio, Nat.sub_eq_zero_of_le (Nat.le_of_lt h)]

theorem ratio_at_half : redevelopmentShareRatio 100 50 false = 0 := by decide
theorem ratio_full : redevelopmentShareRatio 100 0 false = 1 := by decide

end JapanTaxLaw
