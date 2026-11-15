import JapanTaxLaw.RegistrationTax

/-!
# RegistrationTax spec — independent statement of 登録免許税法 別表第一（一）

Source (pinned):
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot sha256: 95240C3D9B384E58834CB30A3BEE32470BE86D7295D9544FE141F327F8ADFA15

Independent restatement of 登録免許税法 art. 9/15/18/19 と別表第一（一）の定率項目
(所有権保存/移転・地上権等設定・移転・配偶者居住権・抵当権設定/移転・信託) from the statutory
text itself. Where the implementation reduces `price * mille / 1000` directly, this spec
applies `TaxRate ⟨mille, 1000⟩` via `applyFloor` and holds the rate in a structure —
different code paths for the same law.

Scope boundaries are identical to the implementation (see RegistrationTax.lean):
別表第一の固定金額項目・商業登記以下の号・art. 10-14 の課税標準の特例はモデル化しない。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 15 — 課税標準の全額が千円に満たないときは千円とする. -/
def specTaxableBase (price : Money) : Money :=
  if price ≥ 1_000 then price else 1_000

/-- Spec: 各区分の税率を構造体として持つ（実装の Nat 直接返却とは別経路）. -/
def specMilleRate (kind : RealEstateRegKind) : TaxRate :=
  match kind with
  | .saveOwnership => ⟨4, 1000, by decide⟩
  | .transferByInheritance => ⟨4, 1000, by decide⟩
  | .transferByPartition => ⟨4, 1000, by decide⟩
  | .transferOther => ⟨20, 1000, by decide⟩
  | .leaseholdSetup => ⟨10, 1000, by decide⟩
  | .leaseholdTransferByInheritance => ⟨2, 1000, by decide⟩
  | .leaseholdTransferByPartition => ⟨2, 1000, by decide⟩
  | .leaseholdTransferOther => ⟨10, 1000, by decide⟩
  | .spouseResidenceSetup => ⟨2, 1000, by decide⟩
  | .mortgageSetup => ⟨4, 1000, by decide⟩
  | .mortgageTransferByInheritance => ⟨1, 1000, by decide⟩
  | .mortgageTransferOther => ⟨2, 1000, by decide⟩
  | .trustOwnership => ⟨4, 1000, by decide⟩
  | .trustMortgage => ⟨2, 1000, by decide⟩
  | .trustOtherRights => ⟨2, 1000, by decide⟩

/-- Spec: art. 9 + 別表第一 — 適用する税率を構造化した TaxRate として組み立て、
    `applyFloor` で計算する（実装の `price * mille / 1000` とは別経路）. -/
def specRegistrationTax (kind : RealEstateRegKind) (price : Money) : Money :=
  (specMilleRate kind).applyFloor (specTaxableBase price)

/-- Spec: art. 19 — 計算した金額が千円に満たない場合には千円とする. -/
def specRegistrationTaxWithMinimum (kind : RealEstateRegKind) (price : Money) : Money :=
  let t := specRegistrationTax kind price
  if t ≥ 1_000 then t else 1_000

/-- Spec: art. 18 — 各登記につき税率を適用して計算した金額の合計額. -/
def specSumRegistrationTaxes (registrations : List (RealEstateRegKind × Money)) : Money :=
  (registrations.map (fun (kind, price) => specRegistrationTaxWithMinimum kind price)).sum

-- ==== points, all kernel-checked ====

-- (一）所有権の保存: 100,000,000 × 4/1000 = 400,000
example : specRegistrationTax .saveOwnership 100_000_000 = 400_000 := by decide
-- (二）ハ その他の原因による移転: 50,000,000 × 20/1000 = 1,000,000
example : specRegistrationTax .transferOther 50_000_000 = 1_000_000 := by decide
-- art. 15: 全額が千円に満たないときは千円 — 30,000 → 30,000 × 4/1000 = 120
example : specTaxableBase 30_000 = 30_000 := by decide
example : specRegistrationTax .transferByInheritance 30_000 = 120 := by decide
-- art. 19: 120 < 1,000 → 1,000
example : specRegistrationTaxWithMinimum .transferByInheritance 30_000 = 1_000 := by decide
-- art. 15: 0 → 1,000; 1,000 × 20/1000 = 20 → art. 19 → 1,000
example : specTaxableBase 0 = 1_000 := by decide
example : specRegistrationTaxWithMinimum .transferOther 0 = 1_000 := by decide
-- (十）イ 所有権の信託: 100,000,000 × 4/1000 = 400,000
example : specRegistrationTax .trustOwnership 100_000_000 = 400_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering every modelled kind and both art. 15 / art. 19 boundaries.
    Points are sample points, not a proof of universal equivalence. -/
def agreeRegistrationTaxPoints : Bool :=
  let kinds : List RealEstateRegKind :=
    [.saveOwnership, .transferByInheritance, .transferByPartition, .transferOther,
     .leaseholdSetup, .leaseholdTransferByInheritance, .leaseholdTransferByPartition,
     .leaseholdTransferOther, .spouseResidenceSetup, .mortgageSetup,
     .mortgageTransferByInheritance, .mortgageTransferOther,
     .trustOwnership, .trustMortgage, .trustOtherRights]
  let prices : List Money := [0, 500, 1_000, 30_000, 800_000, 100_000_000, 2_000_000_000]
  kinds.all fun kind =>
    prices.all fun price =>
      (registrationTax kind price == specRegistrationTax kind price) &&
      (registrationTaxWithMinimum kind price == specRegistrationTaxWithMinimum kind price) &&
      (taxableBase price == specTaxableBase price)

example : agreeRegistrationTaxPoints = true := by decide

/-- Sum path: spec and implementation agree on the composed example. -/
example : specSumRegistrationTaxes
    [(.saveOwnership, 100_000_000), (.transferOther, 50_000_000),
     (.transferByInheritance, 30_000)] = 1_401_000 := by decide

example : sumRegistrationTaxes
    [(.saveOwnership, 100_000_000), (.transferOther, 50_000_000),
     (.transferByInheritance, 30_000)] = 1_401_000 := by decide

end JapanTaxLaw
