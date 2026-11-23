/-\!
# InheritanceTaxDebtForgiveness — 相続税法 第八条（債務免除等の贈与みなし）

L0 条項単位の実質的形式化。pinned 原文:
  data/raw/325AC0000000073_20260401_506AC0000000008.law.json
  LawBody[3]/MainProvision/.../Article:8

原文の規範構造：
- 主則：対価なし又は著しく低い対価で債務の免除・引受け・第三者のための弁済に
  よる利益を受けたとき、その利得を受けた者は、債務金額に相当する金額
  （対価を支払った場合はその価額を控除）を、免除等をした者からの贈与
  （遺言による場合は遺贈）により取得したものとみなす。
- ただし書：免除等が次の各号に該当する場合は、みなされた金額のうち
  「債務を弁済することが困難である部分」についてはこの限りでない（＝当該部分
  はみなさない）。
  - 一：債務者が資力を喪失して弁済困難な場合に、債務の全部又は一部の免除を受けたとき。
  - 二：債務者が資力を喪失して弁済困難な場合に、扶養義務者によって債務の全部
    又は一部の引受け又は弁済がなされたとき。

変数の意味・単位・定義域：
  debt : Nat — 債務金額（円）、非負
  consideration : Nat — 支払対価（円）、非負（0 なら「対価を支払わないで」）
  insolvent : Bool — 資力喪失且つ弁済困難
  item : 免除(1) 又は 扶養義務者の引受・弁済(2)

次元整合性：deemedGift[円] = debt[円] − consideration[円]（saturating）。

全ての条件分岐・境界（対価 0、対価 ≥ 債務額、例外発動）をカーネルで検証。
具体的な「困難である部分」の金額算定は原文が別途の評価を要するため NOT MODELLED。
-/
namespace JapanTaxLaw.InheritanceTaxDebtForgiveness

-- 主則のみなし金額：債務額 − 対価（saturating）
def deemedGiftAmount (debt consideration : Nat) : Nat := debt - consideration

theorem gift_without_consideration (debt : Nat) : deemedGiftAmount debt 0 = debt := by simp [deemedGiftAmount]
theorem gift_with_consideration (debt consideration : Nat) (h : consideration <= debt) :
    deemedGiftAmount debt consideration + consideration = debt := by
  exact Nat.sub_add_cancel h
theorem gift_zero_when_consideration_ge (debt consideration : Nat) (h : debt <= consideration) :
    deemedGiftAmount debt consideration = 0 := by
  simp [deemedGiftAmount, Nat.sub_eq_zero_of_le h]

-- ただし書の発動：資力喪失・弁済困難 且つ (号1 免除 又は 号2 扶養義務者の引受/弁済)
def provisoApplies (insolvent exemption1 exemption2 : Bool) : Bool :=
  insolvent && (exemption1 || exemption2)

theorem proviso_item1 (insolvent : Bool) : provisoApplies insolvent true false = insolvent := by
  simp [provisoApplies]
theorem proviso_item2 (insolvent : Bool) : provisoApplies insolvent false true = insolvent := by
  simp [provisoApplies]
theorem proviso_needs_insolvency (e1 e2 : Bool) : provisoApplies false e1 e2 = false := by
  simp [provisoApplies]
theorem proviso_no_item_no_apply (insolvent : Bool) : provisoApplies insolvent false false = false := by
  simp [provisoApplies]

-- みなし結果：ただし書が発動すれば当該部分はみなさない（金額 0）
def effectiveDeemedGift (debt consideration : Nat) (proviso : Bool) : Nat :=
  if proviso then 0 else deemedGiftAmount debt consideration

theorem exception_zeroes_deemed_gift (debt consideration : Nat) :
    effectiveDeemedGift debt consideration true = 0 := by simp [effectiveDeemedGift]
theorem no_exception_keeps_deemed_gift (debt consideration : Nat) :
    effectiveDeemedGift debt consideration false = deemedGiftAmount debt consideration := by
  simp [effectiveDeemedGift]
theorem effective_le_deemed (debt consideration : Nat) (p : Bool) :
    effectiveDeemedGift debt consideration p <= deemedGiftAmount debt consideration := by
  unfold effectiveDeemedGift
  by_cases h : p <;> simp [h]

def inheritanceTaxDebtForgivenessDeclared : Bool := true
theorem inheritance_tax_debt_forgiveness_is_declaration :
    inheritanceTaxDebtForgivenessDeclared = true := rfl

end JapanTaxLaw.InheritanceTaxDebtForgiveness
