import JapanTaxLaw.ConditionalApprovalFee

/-
# ConditionalApprovalFee spec — 第十七条（コンテナーの承認手数料）の独立整数定式

Pinned: law 346CO0000000257, revision 346CO0000000257_20171008_428CO0000000240.
独立再抽出: 標準 120,700 円 / 電子申請 111,800 円、一件ごと。
impl の識別子は spec* 定義では一切使わない（数値・構造を独立に書き下す）。
数値リテラル 120700 / 111800 は pinned 原文の「十二万七百円」「十一万千八百円」に照合。
橋渡しは三つの定理で、いずれも unfold 後の純粋 rfl（算術タクティックを使用しない）。
BY-DESIGN: Bool は電子申請の有無のみを表し、しきい値・比率モデルではない。
-/

namespace JapanTaxLaw.ConditionalApprovalFee

/-- 独立定式: 標準手数料 = 十二万七百円。 -/
def specStandard : Nat := 120_700

/-- 独立定式: 電子申請手数料 = 十一万千八百円。 -/
def specElectronic : Nat := 111_800

/-- 独立定式: 電子申請なら 111_800、それ以外は 120_700。 -/
def specFee (electronic : Bool) : Nat :=
  if electronic then specElectronic else specStandard

example : specStandard = 120_700 := by decide
example : specElectronic = 111_800 := by decide
example : specFee true = 111_800 := by decide
example : specFee false = 120_700 := by decide

theorem agreeStandard : standardFee = specStandard := by unfold standardFee specStandard; rfl

theorem agreeElectronic : electronicFee = specElectronic := by unfold electronicFee specElectronic; rfl

theorem agreeFee (electronic : Bool) : feeFor electronic = specFee electronic := by
  unfold feeFor specFee standardFee specStandard electronicFee specElectronic
  rfl

end JapanTaxLaw.ConditionalApprovalFee
