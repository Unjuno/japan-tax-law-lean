/-!
# PreparedRiceCerealMaterial — law 407M50000200018 art.1 (CONDITION)

Sources (pinned): law `407M50000200018`; revision and raw snapshot pinned via the
transcription pin and coordinator packet.

原文:
「特定朝食シリアルの製造に使用する原材料として粒状の米であらかじめ加熱による調理その他の調製をしたもの（米を加熱による調理及び調味をし、乾燥後圧ぺんしたものに限る。以下「米の調理調整品」という。）を輸入しようとする場合」

Computation: 五つの要素（粒状・加熱調理済・調味済・乾燥後圧ぺん・特定朝食シリアル用）
をすべて満たすとき定義に該当する。
Scope: 「特定朝食シリアル」の範囲は NOT MODELLED（入力として受け取る）。法的レビューを提供しない。
-/

namespace JapanTaxLaw.PreparedRiceCerealMaterial

/-- 米の調理調整品の五要素。 -/
def qualifies (granular : Bool) (heatCooked : Bool) (seasoned : Bool)
              (driedFlaked : Bool) (forCereal : Bool) : Bool :=
  granular && heatCooked && seasoned && driedFlaked && forCereal

def satisfiedCount (granular : Bool) (heatCooked : Bool) (seasoned : Bool)
                   (driedFlaked : Bool) (forCereal : Bool) : Nat :=
  (if granular then 1 else 0) + (if heatCooked then 1 else 0) +
  (if seasoned then 1 else 0) + (if driedFlaked then 1 else 0) +
  (if forCereal then 1 else 0)

def requiredCount : Nat := 5

/-- 五要素を 5-bit マスクで表した成立要素数（数値境界テスト用）。 -/
def satisfiedMask (mask : Nat) : Nat :=
  (mask / 1) % 2 + (mask / 2) % 2 + (mask / 4) % 2 + (mask / 8) % 2 + (mask / 16) % 2

example : satisfiedMask 0 = 0 := by decide
example : satisfiedMask 31 = 5 := by decide
example : qualifies true true true true true = true := by decide
example : qualifies false true true true true = false := by decide

end JapanTaxLaw.PreparedRiceCerealMaterial
