import JapanTaxLaw.ConsumptionTaxableBase

/-!
# ConsumptionTaxableBase spec — independent statement of 消費税法 art. 28

Source (pinned):
  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82

Independent restatement of the computable parts of 消費税法 art. 28 (課税標準):

  1項 課税資産の譲渡等の対価の額。ただし役員への譲渡で対価が著しく低いときは
       資産の価額に相当する金額（ここでは flagship 二条件を入れ子 if で定式化）。
  2項 特定課税仕入れの支払対価の額。
  3項 第四条第五項各号に掲げる行為（消費又は使用／贈与）は資産の価額に相当する金額。

The definitions below are written independently of the implementation module
(e.g. art. 28(1) uses a nested `if` rather than the impl's `&&` guard) so that
`agreeConsumptionTaxableBase` is a genuine cross-check, not a restatement of
the same term.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Independent form of art. 28(1) — nested-guard restatement. -/
def specTaxableTransferBase (f : TaxableTransferFacts) : Money :=
  if f.isOfficerTransfer then
    if f.markedlyLow then f.assetValue else f.consideration
  else f.consideration

/-- Independent form of art. 28(2). -/
def specSpecifiedPurchaseBase (paidConsideration : Money) : Money :=
  paidConsideration

/-- Independent form of art. 28(3) 一号・二号 — both use the asset value. -/
def specDeemedSupplyBase (act : DeemedSupplyAct) (assetValue : Money) : Money :=
  match act with
  | DeemedSupplyAct.consumptionOrUse => assetValue
  | DeemedSupplyAct.gift => assetValue

-- ==== kernel-decided spec examples ====

example : specTaxableTransferBase ⟨100_000, false, false, 1_000_000⟩ = 100_000 := by decide
example : specTaxableTransferBase ⟨100_000, true, false, 1_000_000⟩ = 100_000 := by decide
example : specTaxableTransferBase ⟨100_000, false, true, 1_000_000⟩ = 100_000 := by decide
example : specTaxableTransferBase ⟨100_000, true, true, 1_000_000⟩ = 1_000_000 := by decide
example : specTaxableTransferBase ⟨0, true, true, 0⟩ = 0 := by decide
example : specSpecifiedPurchaseBase 50_000 = 50_000 := by decide
example : specDeemedSupplyBase DeemedSupplyAct.consumptionOrUse 300_000 = 300_000 := by decide
example : specDeemedSupplyBase DeemedSupplyAct.gift 300_000 = 300_000 := by decide

/-- Spec ≡ impl over a representative sample grid, decided by the kernel. -/
def agreeConsumptionTaxableBase : Bool :=
  let transfers : List TaxableTransferFacts :=
    [ ⟨0, false, false, 0⟩
    , ⟨0, true, true, 0⟩
    , ⟨100_000, false, false, 1_000_000⟩
    , ⟨100_000, true, false, 1_000_000⟩
    , ⟨100_000, false, true, 1_000_000⟩
    , ⟨100_000, true, true, 1_000_000⟩
    , ⟨1, true, true, 9_999_999⟩
    ]
  let paids : List Money := [0, 1, 50_000, 1_000_000]
  let acts : List DeemedSupplyAct :=
    [DeemedSupplyAct.consumptionOrUse, DeemedSupplyAct.gift]
  let vals : List Money := [0, 1, 300_000]
  (transfers.all fun f => specTaxableTransferBase f == taxableTransferBase f) &&
  (paids.all fun p => specSpecifiedPurchaseBase p == specifiedPurchaseBase p) &&
  (acts.all fun a => vals.all fun v =>
    specDeemedSupplyBase a v == deemedSupplyBase a v)

example : agreeConsumptionTaxableBase = true := by decide

end JapanTaxLaw
