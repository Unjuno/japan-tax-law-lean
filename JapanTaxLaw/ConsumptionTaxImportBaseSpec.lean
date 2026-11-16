import JapanTaxLaw.ConsumptionTaxImportBase

/-!
# ConsumptionTaxImportBase spec — independent statement of 消費税法 art. 28(4)

Source (pinned; identical to ConsumptionTaxImportBase.lean):

  Law id: 363AC0000000108
  Revision: 363AC0000000108_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 25DCCEBFFB6690902C117A4AB9C16E4D64DB087BBA6D184A10EA6AEB58AB4A82

Independent restatement of the computable part of 消費税法 art. 28(4):

  「保税地域から引き取られる課税貨物に係る消費税の課税標準は、…算出した価格に…
    消費税以外の消費税等…の額…及び…関税の額…に相当する金額を加算した金額とする。」

The definition below is written independently of the implementation module:
instead of the impl's left-associated `a + b + c`, the spec sums the three
caller-established components through a list fold, with no reference to
`importTaxableBase` in its body. `agreeImportTaxableBase` is therefore a
genuine cross-check, not a restatement of the same term.

Scope boundaries identical to the implementation (関税定率法の価格算定・附帯税控除・
art. 29 の税率・art. 28(5) の政令細目は射程外; 転記監査は fidelity-only)。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Independent form of art. 28(4) — sum of the three components via a list fold. -/
def specImportTaxableBase (f : ImportGoodsFacts) : Money :=
  List.foldl (fun acc x => acc + x) 0
    [f.customsValue, f.otherConsumptionTax, f.customsDuty]

-- ==== kernel-decided spec examples ====

example : specImportTaxableBase ⟨true, 10_000_000, 200_000, 300_000⟩ = 10_500_000 := by decide
example : specImportTaxableBase ⟨false, 10_000_000, 200_000, 300_000⟩ = 10_500_000 := by decide
example : specImportTaxableBase ⟨true, 0, 0, 0⟩ = 0 := by decide
example : specImportTaxableBase ⟨false, 1, 2, 3⟩ = 6 := by decide

/-- Spec ≡ impl over a representative sample grid, decided by the kernel. -/
def agreeImportTaxableBase : Bool :=
  let facts : List ImportGoodsFacts :=
    [ ⟨true, 0, 0, 0⟩
    , ⟨false, 0, 0, 0⟩
    , ⟨true, 10_000_000, 200_000, 300_000⟩
    , ⟨false, 10_000_000, 200_000, 300_000⟩
    , ⟨true, 1, 2, 3⟩
    , ⟨false, 9_999_999, 1, 0⟩
    , ⟨true, 0, 7, 9⟩
    ]
  facts.all fun f => specImportTaxableBase f == importTaxableBase f

example : agreeImportTaxableBase = true := by decide

end JapanTaxLaw
