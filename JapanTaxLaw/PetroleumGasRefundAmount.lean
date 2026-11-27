import JapanTaxLaw.TaxFinance

/-
# PetroleumGasRefundAmount — 石油ガス税法施行規則 art.12(3)(1)（販売代金領収不能の承認金額）

Pinned: law 341CO0000000005, revision 341CO0000000005_20250401_507CO0000000006,
raw snapshot in data/raw/, Article 12 §3 item 1.

原文逐語: 「販売代金の領収をすることができなくなつた課税石油ガスの重量（石油ガス税を免除されるものの重量を除く。次号において同じ。）につき、当該課税石油ガスを石油ガスの充てん場から移出した日において適用された石油ガス税の税率により計算した金額（当該金額のうち、他の法律の規定により控除又は還付を受ける石油ガス税額に相当する金額を除く。）」

Computation (unit 円; weight kg, rate 円/kg, credit 円 as caller-provided):
  refundAmount weight rate credit = weight * rate - credit   (Nat saturating)

Scope: ONLY the multiply-then-deduct arithmetic. The approval procedure,
exempt-weight determination, tax-rate selection and the credit's legal basis
are NOT MODELLED. No `sorry`, `admit`, `axiom`, no `Classical.choice`.
-/
namespace JapanTaxLaw.PetroleumGasRefundAmount

def refundAmount (weight rate credit : Nat) : Nat :=
  weight * rate - credit

theorem neverExceedsGross (weight rate credit : Nat) :
    refundAmount weight rate credit <= weight * rate := by
  unfold refundAmount
  omega

theorem zeroWhenCreditCoversAll (weight rate credit : Nat) :
    weight * rate <= credit → refundAmount weight rate credit = 0 := by
  unfold refundAmount
  intro h
  omega

theorem monotoneInWeight (weight weight' rate credit : Nat) :
    weight <= weight' → refundAmount weight rate credit <= refundAmount weight' rate credit := by
  unfold refundAmount
  intro h
  exact Nat.sub_le_sub_right (Nat.mul_le_mul_right rate h) credit

end JapanTaxLaw.PetroleumGasRefundAmount
