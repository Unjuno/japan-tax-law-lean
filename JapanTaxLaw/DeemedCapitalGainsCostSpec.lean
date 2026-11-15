import JapanTaxLaw.DeemedCapitalGainsCost

/-!
# DeemedCapitalGainsCost spec — independent statement of 租税特別措置法 art. 31の4

Source (pinned):
  Law id: 332AC0000000026
  Revision: 332AC0000000026_20261101_507AC0000000013
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE

Independent restatement of 租税特別措置法 art. 31の4(1)（長期譲渡所得の金額の計算上、
収入金額から控除する取得費は、収入金額の百分の五に相当する金額。ただし、当該金額が
次の各号に掲げる金額に満たないことが証明された場合には、当該各号に掲げる金額とする。）
from the statutory text itself.

Scope boundaries are identical to the implementation (see DeemedCapitalGainsCost.lean).

- 個人が昭和二十七年十二月三十一日以前から引き続き所有していた土地等又は建物等の譲渡
  に限り適用（柱書の要件）。
- 二号の「所得税法第三十八条第二項の規定を適用した場合に同項の規定により取得費と
  される金額」（建物等に係る設備費等の按分処理）は §38(2) そのものの実装が
  未モデル化のため、`provenDocumentedCost` にこの「適用後の金額」を caller が
  供給することとしている。
- 当該百分の五の金額が証明された金額に満たないことが証明された場合に限り、
  証明された金額を採用 — 以下、spec は同一分岐による独立定式化。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 31の4(1) — 適格なら max(5%, proven), そうでなければ 0. -/
def specDeemedCost (f : DeemedCapitalGainsFacts) : Money :=
  if f.isIndividual && f.heldSince1952OrEarlier then
    let pct5 := f.transferPrice * 5 / 100
    if f.canProveDocumentedCost then
      if f.provenDocumentedCost ≤ pct5 then pct5 else f.provenDocumentedCost
    else pct5
  else 0

-- ==== points, all kernel-decided ====

-- 適格・百分の五が証明額より大きい
example : specDeemedCost ⟨true, true, 100_000_000, 1_000_000, true⟩ = 5_000_000 := by decide
-- 適格・証明額が百分の五より大きい
example : specDeemedCost ⟨true, true, 100_000_000, 20_000_000, true⟩ = 20_000_000 := by decide
-- 証明がない（但書不適用）
example : specDeemedCost ⟨true, true, 100_000_000, 50_000_000, false⟩ = 5_000_000 := by decide
-- 個人ではない
example : specDeemedCost ⟨false, true, 100_000_000, 20_000_000, true⟩ = 0 := by decide
-- 昭和二十七年十二月三十一日以前から引き続き所有していない
example : specDeemedCost ⟨true, false, 100_000_000, 20_000_000, true⟩ = 0 := by decide
-- 百分の五の金額に端数が出る境界
example : specDeemedCost ⟨true, true, 101, 0, false⟩ = 5 := by decide
example : specDeemedCost ⟨true, true, 1_000_000, 0, true⟩ = 50_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points.
    Points are sample points, not a proof of universal equivalence. -/
def agreeDeemedCapitalGainsCostPoints : Bool :=
  let inputs :=
    [ ⟨true,  true, 100_000_000, 1_000_000, true⟩,
      ⟨true,  true, 100_000_000, 20_000_000, true⟩,
      ⟨true,  true, 0, 0, false⟩,
      ⟨false, true, 100_000_000, 20_000_000, true⟩,
      ⟨true,  false, 100_000_000, 20_000_000, true⟩,
      ⟨true,  true, 50_000_000, 0, true⟩,
      ⟨true,  true, 999, 0, false⟩,
      ⟨true,  true, 1_000_000_000, 30_000_000, true⟩ ]
  inputs.all fun f => deemedCost f == specDeemedCost f

example : agreeDeemedCapitalGainsCostPoints = true := by decide

end JapanTaxLaw
