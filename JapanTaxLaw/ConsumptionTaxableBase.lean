import JapanTaxLaw.TaxFinance

/-!
# ConsumptionTaxableBase — 消費税法 art. 28（課税標準）L4 モデル

Source (pinned):

  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82
  (data/raw/363AC0000000108_20261101_507AC0000000013.law.json,
   revision CurrentEnforced per data/INVENTORY.json;
   same pin as ConsumptionTaxRate.lean)

Models the computable parts of art. 28 — pinned bytes 逐語:

  1項: 「課税資産の譲渡等に係る消費税の課税標準は、課税資産の譲渡等の対価の額（対価として
       収受し、又は収受すべき一切の金銭又は金銭以外の物若しくは権利その他経済的な利益の額とし、
       課税資産の譲渡等につき課されるべき消費税額及び当該消費税額を課税標準として課されるべき
       地方消費税額に相当する額を含まないものとする。以下この項及び第三項において同じ。）とする。
       ただし、法人が資産を第四条第五項第二号に規定する役員に譲渡した場合において、その対価の額が
       当該譲渡の時における当該資産の価額に比し著しく低いときは、その価額に相当する金額を
       その対価の額とみなす。」
  2項: 「特定課税仕入れに係る消費税の課税標準は、特定課税仕入れに係る支払対価の額
       （対価として支払い、又は支払うべき一切の金銭又は金銭以外の物若しくは権利その他経済的な
       利益の額をいう。）とする。」
  3項: 「第四条第五項各号に掲げる行為に該当するものについては、次の各号に掲げる行為の区分に応じ
       当該各号に定める金額をその対価の額とみなす。
       一 ...消費又は使用　当該消費又は使用の時における当該消費し、又は使用した資産の価額に相当する金額
       二 ...贈与　当該贈与の時における当該贈与をした資産の価額に相当する金額」

Computation (Money = Nat, no coercion):

  taxableTransferBase f =
    if f.isOfficerTransfer && f.markedlyLow then f.assetValue else f.consideration
  specifiedPurchaseBase paid = paid
  deemedBase act assetValue = assetValue     -- art. 28(3) 一号・二号 とも同一

Scope & honest boundaries:

* 「対価の額」は税込／税抜の判定を含む法的評価 — `consideration` は
  caller-established な **消費税額・地方消費税額を含まない** Money とする（税込額からの
  算術的抽出はしない）。
* 「著しく低い」は法的判断 — caller-established Bool `markedlyLow`。
* 「役員」該当性（法人税法 art. 4(5)二号参照）— caller-established Bool。
* 時価（資産の価額）自体の算定は caller-established Money。
* 4項（保税地域から引き取られる課税貨物の課税標準 — 関税定率法 art. 4〜4の9 に準じた価格計算）
  は **NOT YET COVERED**（簡潔な計算式にならないため本スライスでは扱わない）。
* 5項（政令で定める細目）— NOT YET COVERED。
* art. 30（仕入税額控除）・地方消費税（地方税法 art. 34の2）— 射程外。

Pinned evidence in doc-comments only; all theorems claim model properties only.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- art. 28(1) — 課税資産の譲渡等の当事者事情。 -/
structure TaxableTransferFacts where
  /-- 消費税額・地方消費税額を含まない対価の額。 -/
  consideration : Money
  /-- 法人が第四条第五項第二号に規定する役員に譲渡した場合か（caller-established）。 -/
  isOfficerTransfer : Bool
  /-- 対価の額が譲渡時の資産の価額に比し著しく低いか（caller-established）。 -/
  markedlyLow : Bool
  /-- 当該譲渡の時における当該資産の価額（caller-established）。 -/
  assetValue : Money
  deriving DecidableEq, Repr

/-- art. 28(1) 本体 — ただし書（著しく低い役員譲渡）のときだけ資産の価額に置き換える。 -/
def taxableTransferBase (f : TaxableTransferFacts) : Money :=
  if f.isOfficerTransfer && f.markedlyLow then f.assetValue else f.consideration

/-- art. 28(2) — 特定課税仕入れの課税標準は支払対価の額そのもの。 -/
def specifiedPurchaseBase (paidConsideration : Money) : Money := paidConsideration

/-- art. 28(3) — 第四条第五項各号に掲げる行為。 -/
inductive DeemedSupplyAct where
  | consumptionOrUse  -- 第一号: 消費又は使用
  | gift              -- 第二号: 贈与
  deriving DecidableEq, Repr

/-- art. 28(3) 一号・二号 — いずれも当該資産の価額に相当する金額を対価の額とみなす。 -/
def deemedSupplyBase (_act : DeemedSupplyAct) (assetValue : Money) : Money := assetValue

-- ==== verified facts ====

theorem taxableTransferBase_of_not_officer (f : TaxableTransferFacts)
    (h : f.isOfficerTransfer = false) :
    taxableTransferBase f = f.consideration := by
  unfold taxableTransferBase
  rw [h]
  rfl

theorem taxableTransferBase_of_not_markedly_low (f : TaxableTransferFacts)
    (h : f.markedlyLow = false) :
    taxableTransferBase f = f.consideration := by
  unfold taxableTransferBase
  cases h1 : f.isOfficerTransfer
  · rw [h]
    rfl
  · rw [h]
    rfl

theorem taxableTransferBase_of_officer_markedly_low (f : TaxableTransferFacts)
    (h1 : f.isOfficerTransfer = true) (h2 : f.markedlyLow = true) :
    taxableTransferBase f = f.assetValue := by
  unfold taxableTransferBase
  rw [h1, h2]
  rfl

/-- art. 28(1) ただし書が適用されるとき、対価は資産の価額に置き換わるので
    caller が提供する assetValue と一致する。 -/
theorem taxableTransferBase_le_max (f : TaxableTransferFacts) :
    taxableTransferBase f ≤ max f.consideration f.assetValue := by
  unfold taxableTransferBase
  cases h1 : f.isOfficerTransfer <;> cases h2 : f.markedlyLow
  · change f.consideration ≤ max f.consideration f.assetValue
    exact Nat.le_max_left _ _
  · change f.consideration ≤ max f.consideration f.assetValue
    exact Nat.le_max_left _ _
  · change f.consideration ≤ max f.consideration f.assetValue
    exact Nat.le_max_left _ _
  · change f.assetValue ≤ max f.consideration f.assetValue
    exact Nat.le_max_right _ _

theorem specifiedPurchaseBase_eq (paid : Money) : specifiedPurchaseBase paid = paid := rfl

theorem deemedSupplyBase_consumption_eq (v : Money) :
    deemedSupplyBase DeemedSupplyAct.consumptionOrUse v = v := rfl

theorem deemedSupplyBase_gift_eq (v : Money) :
    deemedSupplyBase DeemedSupplyAct.gift v = v := rfl

-- ==== kernel-decided smoke checks ====

example : taxableTransferBase ⟨100_000, false, false, 1_000_000⟩ = 100_000 := by decide
example : taxableTransferBase ⟨100_000, true, false, 1_000_000⟩ = 100_000 := by decide
example : taxableTransferBase ⟨100_000, false, true, 1_000_000⟩ = 100_000 := by decide
example : taxableTransferBase ⟨100_000, true, true, 1_000_000⟩ = 1_000_000 := by decide
example : taxableTransferBase ⟨0, true, true, 0⟩ = 0 := by decide
example : specifiedPurchaseBase 50_000 = 50_000 := by decide
example : deemedSupplyBase DeemedSupplyAct.consumptionOrUse 300_000 = 300_000 := by decide
example : deemedSupplyBase DeemedSupplyAct.gift 300_000 = 300_000 := by decide

end JapanTaxLaw
